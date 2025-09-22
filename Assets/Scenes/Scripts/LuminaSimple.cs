using UnityEngine;
using System.Collections.Generic;
using Mediapipe;            // for NormalizedLandmarkList
using Mediapipe.Unity;      // ok to include; you already have the plugin

public class LuminaSimple : MonoBehaviour
{
    [Header("Scene hookups")]
    public Transform stage;               // your big plane (centered, scaled)
    public GameObject trailPrefab;        // TrailRenderer + Solaris material

    [Header("Solaris property names (edit to match your material)")]
    public string intensityProp = "_Intensity";
    public string glowProp      = "_Glow";
    public string distortProp   = "_Distortion";
    public string flowProp      = "_Speed";

    [Header("Smoothing / behavior")]
    public float oneEuroMinCutoff = 1.2f;
    public float oneEuroBeta      = 0.02f;
    public float oneEuroDCutoff   = 1.0f;
    public float velocityK        = 8f;     // bigger = stricter steadiness
    public Vector2 trailTimeRange = new Vector2(0.5f, 2.2f); // min..max seconds

    // runtime
    TrailController _left, _right;
    Vector2 _latestL01, _latestR01;  bool _hasWrists;
    OneEuro2 _fL, _fR;

    void Awake()
    {
        _fL = new OneEuro2(oneEuroMinCutoff, oneEuroBeta, oneEuroDCutoff);
        _fR = new OneEuro2(oneEuroMinCutoff, oneEuroBeta, oneEuroDCutoff);

        // spawn two trails (left/right)
        _left  = SpawnTrail("Trail_Left");
        _right = SpawnTrail("Trail_Right");
    }

    TrailController SpawnTrail(string name)
    {
        var go = Instantiate(trailPrefab, transform);
        go.name = name;
        var tr = go.GetComponent<TrailRenderer>();
        var tc = new TrailController(tr, intensityProp, glowProp, distortProp, flowProp, velocityK, trailTimeRange);
        return tc;
    }

    void Update()
    {
        if (!_hasWrists || stage == null) return;
        float dt = Mathf.Max(1e-4f, Time.deltaTime);

        // filter in 0..1
        var wl01 = _fL.Filter(_latestL01, dt);
        var wr01 = _fR.Filter(_latestR01, dt);

        // map to world on your Stage plane
        var wlW = Map01ToWorld(wl01);
        var wrW = Map01ToWorld(wr01);

        // update both trails (returns steadiness 0..1)
        _left.Update(wlW, dt);
        _right.Update(wrW, dt);
    }

    // ---------- UnityEvent entry point ----------
    // Hook your homuler prefab's UnityEvent<NormalizedLandmarkList> here.
    public void ReceivePoseLandmarks(NormalizedLandmarkList lm)
    {
        const int LEFT_WRIST = 15, RIGHT_WRIST = 16;
        if (lm == null || lm.Landmark.Count <= RIGHT_WRIST) return;

        var L = lm.Landmark[LEFT_WRIST];
        var R = lm.Landmark[RIGHT_WRIST];

        _latestL01 = new Vector2(L.X, L.Y);
        _latestR01 = new Vector2(R.X, R.Y);
        _hasWrists = true;
    }

    // ---------- mapping 0..1 → stage plane ----------
    Vector3 Map01ToWorld(Vector2 uv01)
    {
        // plane local space: (-0.5..0.5) scaled by stage.localScale
        Vector3 local = new Vector3(uv01.x - 0.5f, uv01.y - 0.5f, 0f);
        local.x *= stage.localScale.x; local.y *= stage.localScale.y;
        return stage.TransformPoint(local);
    }

    // ---------- small helpers (kept inline to stay single-file) ----------
    class OneEuro2 {
        float minCutoff, beta, dCutoff;
        Vector2 prevRaw, prevFilt, prevDeriv; bool hasPrev;
        public OneEuro2(float minCutoff, float beta, float dCutoff){ this.minCutoff=minCutoff; this.beta=beta; this.dCutoff=dCutoff; }
        float Alpha(float cutoff, float dt){ float tau=1f/(2f*Mathf.PI*cutoff); return 1f/(1f + tau/dt); }
        public Vector2 Filter(Vector2 x, float dt){
            if(!hasPrev){ prevRaw=x; prevFilt=x; prevDeriv=Vector2.zero; hasPrev=true; return x; }
            var dx = (x - prevRaw)/dt; var aD = Alpha(dCutoff, dt);
            var deriv = Vector2.Lerp(prevDeriv, dx, aD);
            float cutoff = minCutoff + beta * deriv.magnitude;
            float a = Alpha(cutoff, dt);
            var y = Vector2.Lerp(prevFilt, x, a);
            prevRaw=x; prevFilt=y; prevDeriv=deriv; return y;
        }
    }

    class TrailController {
        readonly TrailRenderer tr;
        readonly int _Intensity, _Glow, _Distort, _Flow;
        readonly float k;
        readonly Vector2 timeRange;
        Vector3 prev; bool hasPrev; float vEMA; const float ema = 0.85f;
        MaterialPropertyBlock mpb = new MaterialPropertyBlock();

        public TrailController(TrailRenderer tr, string intensity, string glow, string distort, string flow, float k, Vector2 timeRange){
            this.tr = tr; this.k = k; this.timeRange=timeRange;
            _Intensity = Shader.PropertyToID(intensity);
            _Glow      = Shader.PropertyToID(glow);
            _Distort   = Shader.PropertyToID(distort);
            _Flow      = Shader.PropertyToID(flow);
            tr.Clear();
        }

        public float Update(Vector3 worldPos, float dt){
            if(!hasPrev){ prev=worldPos; hasPrev=true; tr.AddPosition(worldPos); return 0.5f; }

            float v = (worldPos - prev).magnitude / dt;
            vEMA = Mathf.Lerp(vEMA, v, 1f-ema);
            float S = 1f/(1f + k*vEMA); // 0..1 steadiness

            if (Vector3.Distance(prev, worldPos) > 0.01f) tr.AddPosition(worldPos);

            tr.time = Mathf.Lerp(timeRange.x, timeRange.y, S); // steadier → longer

            tr.GetPropertyBlock(mpb);
            if (_Intensity!=0) mpb.SetFloat(_Intensity, Mathf.Lerp(0.4f, 2.5f, S));
            if (_Glow!=0)      mpb.SetFloat(_Glow,      Mathf.Lerp(0.3f, 1.0f, S));
            if (_Distort!=0)   mpb.SetFloat(_Distort,   Mathf.Lerp(0.25f, 0.05f, S));
            if (_Flow!=0)      mpb.SetFloat(_Flow,      Mathf.Lerp(1.8f, 0.6f, S));
            tr.SetPropertyBlock(mpb);

            prev = worldPos;
            return S;
        }
    }
}
