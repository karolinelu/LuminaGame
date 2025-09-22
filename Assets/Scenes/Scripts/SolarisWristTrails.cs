using UnityEngine;

public class SolarisWristTrails : MonoBehaviour
{
    public enum Mapping { StagePlane, CameraViewport }

    [Header("Scene")]
    public Mapping mapping = Mapping.CameraViewport;
    public Transform stage;                 // used if Mapping = StagePlane
    public Camera targetCamera;             // used if Mapping = CameraViewport
    public float viewportDepth = 5f;        // distance in front of camera
    public GameObject trailPrefab;          // TrailRenderer + Solaris mat

    [Header("Solaris material props")]
    public string intensityProp = "_Intensity";
    public string glowProp      = "_Glow";
    public string distortProp   = "_Distortion";
    public string flowProp      = "_Speed";

    [Header("Behavior")]
    public bool demoMode = false;
    public Vector2 trailTimeRange = new Vector2(0.5f, 2.2f);
    public float velocityK = 8f;
    [Range(0f,1f)] public float smoothing = 0.85f;

    [Header("Debug")]
    public int setCalls;
    public bool logEveryCall = false;

    // runtime
    TrailCtrl L, R;
    bool haveWorldWrists; Vector3 wlW, wrW;
    bool have01Wrists;    Vector2 wl01, wr01;
    float tDemo;

    void Awake()
    {
        if (!trailPrefab) { Debug.LogError("[SolarisWristTrails] Assign Trail Prefab."); enabled=false; return; }
        if (!targetCamera) targetCamera = Camera.main;
        L = Spawn("Trail_Left");
        R = Spawn("Trail_Right");
    }

    TrailCtrl Spawn(string name)
    {
        var go = Instantiate(trailPrefab, transform);
        go.name = name;
        var tr = go.GetComponent<TrailRenderer>();
        if (!tr) Debug.LogError("[SolarisWristTrails] Prefab needs TrailRenderer.");
        return new TrailCtrl(tr, intensityProp, glowProp, distortProp, flowProp, velocityK, trailTimeRange, smoothing);
    }

    void Update()
    {
        float dt = Mathf.Max(Time.deltaTime, 1e-4f);

        // demo path
        if (demoMode)
        {
            tDemo += dt;
            wl01 = new Vector2(0.35f + 0.15f*Mathf.Cos(tDemo*1.3f), 0.60f + 0.10f*Mathf.Sin(tDemo*1.7f));
            wr01 = new Vector2(0.65f + 0.15f*Mathf.Sin(tDemo*1.1f), 0.60f + 0.10f*Mathf.Cos(tDemo*1.9f));
            have01Wrists = true;
        }

        // map 0..1 → world
        if (!demoMode && have01Wrists)
        {
            if (mapping == Mapping.CameraViewport && targetCamera)
            {
                wlW = targetCamera.ViewportToWorldPoint(new Vector3(wl01.x, wl01.y, viewportDepth));
                wrW = targetCamera.ViewportToWorldPoint(new Vector3(wr01.x, wr01.y, viewportDepth));
                haveWorldWrists = true;
            }
            else if (mapping == Mapping.StagePlane && stage)
            {
                wlW = StageMap(wl01);
                wrW = StageMap(wr01);
                haveWorldWrists = true;
            }
            else
            {
                Debug.LogWarning("[SolarisWristTrails] Mapping requires a Camera (CameraViewport) or Stage (StagePlane).");
            }
            have01Wrists = false; // consume
        }

        if (haveWorldWrists)
        {
            L.Update(wlW, dt);
            R.Update(wrW, dt);
        }
    }

    // ---------- PUBLIC API (single definition) ----------
    public void SetWrists01(Vector2 left01, Vector2 right01, bool flipY = true)
    {
        if (flipY) { left01.y = 1f - left01.y; right01.y = 1f - right01.y; }
        wl01 = left01; wr01 = right01; have01Wrists = true;
        setCalls++;
        if (logEveryCall) Debug.Log($"[SolarisWristTrails] SetWrists01 #{setCalls}  L({left01.x:F2},{left01.y:F2}) R({right01.x:F2},{right01.y:F2})");
    }

    public void SetWristsWorld(Vector3 leftWorld, Vector3 rightWorld)
    {
        wlW = leftWorld; wrW = rightWorld; haveWorldWrists = true;
    }

    // ---------- helpers ----------
    Vector3 StageMap(Vector2 uv)
    {
        var local = new Vector3(uv.x - 0.5f, uv.y - 0.5f, 0f);
        local.x *= stage.localScale.x;
        local.y *= stage.localScale.y;
        return stage.TransformPoint(local);
    }

    class TrailCtrl
    {
        readonly TrailRenderer tr;
        readonly int _Intensity,_Glow,_Distort,_Flow;
        readonly float k, ema;
        readonly Vector2 timeRange;
        Vector3 prev; bool hasPrev; float vEMA;
        readonly MaterialPropertyBlock mpb = new MaterialPropertyBlock();

        public TrailCtrl(TrailRenderer tr, string intensity, string glow, string distort, string flow,
                         float k, Vector2 timeRange, float ema)
        {
            this.tr = tr; this.k=k; this.timeRange=timeRange; this.ema=Mathf.Clamp01(ema);
            _Intensity = Shader.PropertyToID(intensity);
            _Glow      = Shader.PropertyToID(glow);
            _Distort   = Shader.PropertyToID(distort);
            _Flow      = Shader.PropertyToID(flow);
            tr.Clear();
        }

        public float Update(Vector3 pos, float dt)
        {
            if(!hasPrev){ prev=pos; hasPrev=true; tr.AddPosition(pos); return 0.5f; }
            float v = (pos - prev).magnitude / dt;
            vEMA = Mathf.Lerp(vEMA, v, 1f-ema);
            float S = 1f/(1f + k*vEMA);

            if (Vector3.Distance(prev, pos) > 0.01f) tr.AddPosition(pos);
            tr.time = Mathf.Lerp(timeRange.x, timeRange.y, S);

            tr.GetPropertyBlock(mpb);
            if (_Intensity!=0) mpb.SetFloat(_Intensity, Mathf.Lerp(0.4f, 2.5f, S));
            if (_Glow!=0)      mpb.SetFloat(_Glow,      Mathf.Lerp(0.3f, 1.0f, S));
            if (_Distort!=0)   mpb.SetFloat(_Distort,   Mathf.Lerp(0.25f, 0.05f, S));
            if (_Flow!=0)      mpb.SetFloat(_Flow,      Mathf.Lerp(1.8f, 0.6f, S));
            tr.SetPropertyBlock(mpb);

            prev = pos;
            return S;
        }
    }
}
