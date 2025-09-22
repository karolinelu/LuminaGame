using UnityEngine;

public class DebugTransforms : MonoBehaviour
{
    public Transform[] transformsToWatch;
    private Vector3[] lastPositions;
    
    void Start()
    {
        if (transformsToWatch != null)
        {
            lastPositions = new Vector3[transformsToWatch.Length];
            for (int i = 0; i < transformsToWatch.Length; i++)
            {
                if (transformsToWatch[i] != null)
                {
                    lastPositions[i] = transformsToWatch[i].position;
                }
            }
        }
    }
    
    void Update()
    {
        if (transformsToWatch == null) return;
        
        for (int i = 0; i < transformsToWatch.Length; i++)
        {
            if (transformsToWatch[i] != null)
            {
                Vector3 currentPos = transformsToWatch[i].position;
                float distance = Vector3.Distance(currentPos, lastPositions[i]);
                
                if (distance > 0.01f) // Only log if there's significant movement
                {
                    Debug.Log($"{transformsToWatch[i].name} moved {distance:F3} units");
                }
                
                lastPositions[i] = currentPos;
            }
        }
    }
}