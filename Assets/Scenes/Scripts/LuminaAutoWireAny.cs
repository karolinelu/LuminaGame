// Assets/Scenes/Scripts/LuminaAutoWireAny.cs
using UnityEngine;
using System;
using System.Reflection;
using System.Linq;
using UnityEngine.Events;
using Mediapipe; // for NormalizedLandmarkList

public class LuminaAutoWireAny : MonoBehaviour
{
    [Tooltip("Drag the GameObject that has LuminaSimple on it")]
    public LuminaSimple lumina;   // assign in Inspector

    [Tooltip("How many seconds to keep scanning after Play (in case the graph spawns late)")]
    public float scanForSeconds = 10f;

    bool wired;
    float timeLeft;

    void OnEnable() { timeLeft = scanForSeconds; }

    void Update()
    {
        if (wired) return;
        timeLeft -= Time.deltaTime;
        if (timeLeft <= 0f) return;

        // Look through every component in the scene,
        // find public fields or properties of type UnityEvent<NormalizedLandmarkList>,
        // and hook them up.
        foreach (var comp in FindObjectsOfType<Component>(true))
        {
            var t = comp.GetType();
            // fields
            var fields = t.GetFields(BindingFlags.Instance | BindingFlags.Public);
            foreach (var f in fields)
            {
                if (IsPoseEventType(f.FieldType))
                {
                    var evt = f.GetValue(comp) as UnityEvent<NormalizedLandmarkList>;
                    if (TryWire(evt)) { LogWired(comp, f.Name); return; }
                }
            }
            // properties with public getter
            var props = t.GetProperties(BindingFlags.Instance | BindingFlags.Public);
            foreach (var p in props)
            {
                if (!p.CanRead) continue;
                if (IsPoseEventType(p.PropertyType))
                {
                    var evt = p.GetValue(comp) as UnityEvent<NormalizedLandmarkList>;
                    if (TryWire(evt)) { LogWired(comp, p.Name); return; }
                }
            }
        }
    }

    static bool IsPoseEventType(Type type)
    {
        if (type == null) return false;
        if (!type.IsGenericType) return false;
        if (type.GetGenericTypeDefinition() != typeof(UnityEvent<>)) return false;
        var arg = type.GetGenericArguments()[0];
        return arg == typeof(NormalizedLandmarkList);
    }

    bool TryWire(UnityEvent<NormalizedLandmarkList> evt)
    {
        if (evt == null || lumina == null) return false;
        // Avoid duplicate listeners
        if (evt.GetPersistentEventCount() > 0)
        {
            for (int i=0;i<evt.GetPersistentEventCount();i++)
            {
                if (evt.GetPersistentTarget(i) == lumina &&
                    evt.GetPersistentMethodName(i) == nameof(LuminaSimple.ReceivePoseLandmarks))
                    return true; // already wired
            }
        }
        evt.AddListener(lumina.ReceivePoseLandmarks);
        wired = true;
        return true;
    }

    void LogWired(Component comp, string member)
    {
        Debug.Log($"[LuminaAutoWireAny] Connected {comp.GetType().Name}.{member} → LuminaSimple.ReceivePoseLandmarks");
    }
}
