using UnityEngine;
using Mediapipe; // for NormalizedLandmarkList

public class WristCubes : MonoBehaviour
{
    public Transform leftWristCube;
    public Transform rightWristCube;
    public Camera targetCamera;     // leave empty to use Camera.main
    public float depthFromCamera = 6f; // world units in front of camera

    const int LEFT_WRIST = 15;
    const int RIGHT_WRIST = 16;

    void Awake() { if (!targetCamera) targetCamera = Camera.main; }

    /// Call this once per frame with MediaPipe's landmarks (0..1 normalized).
    public void ReceivePose(NormalizedLandmarkList lm)
    {
        if (lm == null || lm.Landmark == null || lm.Landmark.Count <= RIGHT_WRIST) return;
        if (!leftWristCube || !rightWristCube || !targetCamera) return;

        var L = lm.Landmark[LEFT_WRIST];
        var R = lm.Landmark[RIGHT_WRIST];

        // MediaPipe uses y-down; flip Y for Unity viewport
        Vector3 lv = new Vector3(L.X, 1f - L.Y, depthFromCamera);
        Vector3 rv = new Vector3(R.X, 1f - R.Y, depthFromCamera);

        leftWristCube.position  = targetCamera.ViewportToWorldPoint(lv);
        rightWristCube.position = targetCamera.ViewportToWorldPoint(rv);
    }
}
