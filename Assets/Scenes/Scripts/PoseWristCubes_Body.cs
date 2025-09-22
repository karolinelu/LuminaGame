using UnityEngine;
using Mediapipe; // for NormalizedLandmarkList

public class PoseWristCubes_Body : MonoBehaviour
{
    public Transform leftWristCube;
    public Transform rightWristCube;
    public Camera targetCamera;
    public float depthFromCamera = 6f;

    const int LEFT_WRIST = 15;
    const int RIGHT_WRIST = 16;

    void Awake() { if (!targetCamera) targetCamera = Camera.main; }

    public void ReceivePose(NormalizedLandmarkList lm)
    {
        if (lm == null || lm.Landmark == null || lm.Landmark.Count <= RIGHT_WRIST) return;

        var L = lm.Landmark[LEFT_WRIST];
        var R = lm.Landmark[RIGHT_WRIST];

        Vector3 lPos = targetCamera.ViewportToWorldPoint(new Vector3(L.X, 1f - L.Y, depthFromCamera));
        Vector3 rPos = targetCamera.ViewportToWorldPoint(new Vector3(R.X, 1f - R.Y, depthFromCamera));

        if (leftWristCube)  leftWristCube.position  = lPos;
        if (rightWristCube) rightWristCube.position = rPos;
    }
}
