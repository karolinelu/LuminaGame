using UnityEngine;
using System.Collections.Generic;

public class MediaPipeMotionBridge : MonoBehaviour
{
    [Header("Virtual Keypoints - These will be created automatically")]
    public Transform leftHandPoint;
    public Transform rightHandPoint;
    public Transform leftWristPoint;
    public Transform rightWristPoint;
    public Transform nosePoint;
    public Transform leftShoulderPoint;
    public Transform rightShoulderPoint;
    
    [Header("Settings")]
    public float coordinateScale = 10f;
    public bool showDebugSpheres = true;
    
    [Header("Manual Testing (for now)")]
    public bool enableManualTesting = true;
    public KeyCode testKey = KeyCode.Space;
    
    private MotionDetectionManager motionManager;
    
    void Start()
    {
        // Find the motion detection manager
        motionManager = FindObjectOfType<MotionDetectionManager>();
        
        if (motionManager == null)
        {
            Debug.LogError("MotionDetectionManager not found! Please add it to your scene.");
            return;
        }
        
        // Create virtual keypoint GameObjects (only if not manually assigned)
        if (leftHandPoint == null || rightHandPoint == null)
        {
            CreateVirtualKeypoints();
        }
        
        Debug.Log("MediaPipe Motion Bridge created virtual keypoints!");
        Debug.Log("Next step: Assign these to your MotionDetectionManager in the Inspector:");
        Debug.Log("- LeftHandPoint, RightHandPoint, LeftWristPoint, RightWristPoint (Hand Transforms)");
        Debug.Log("- NosePoint, LeftShoulderPoint, RightShoulderPoint (Body Keypoints)");
        
        if (enableManualTesting)
        {
            Debug.Log($"Manual testing enabled! Press {testKey} to simulate motion.");
        }
    }
    
    void CreateVirtualKeypoints()
    {
        if (leftHandPoint == null)
        {
            GameObject go = new GameObject("LeftHandPoint");
            leftHandPoint = go.transform;
            leftHandPoint.parent = this.transform;
            leftHandPoint.position = new Vector3(-2, 0, 0);
        }
        
        if (rightHandPoint == null)
        {
            GameObject go = new GameObject("RightHandPoint");
            rightHandPoint = go.transform;
            rightHandPoint.parent = this.transform;
            rightHandPoint.position = new Vector3(2, 0, 0);
        }
        
        if (leftWristPoint == null)
        {
            GameObject go = new GameObject("LeftWristPoint");
            leftWristPoint = go.transform;
            leftWristPoint.parent = this.transform;
            leftWristPoint.position = new Vector3(-1.5f, -0.5f, 0);
        }
        
        if (rightWristPoint == null)
        {
            GameObject go = new GameObject("RightWristPoint");
            rightWristPoint = go.transform;
            rightWristPoint.parent = this.transform;
            rightWristPoint.position = new Vector3(1.5f, -0.5f, 0);
        }
        
        if (nosePoint == null)
        {
            GameObject go = new GameObject("NosePoint");
            nosePoint = go.transform;
            nosePoint.parent = this.transform;
            nosePoint.position = new Vector3(0, 2, 0);
        }
        
        if (leftShoulderPoint == null)
        {
            GameObject go = new GameObject("LeftShoulderPoint");
            leftShoulderPoint = go.transform;
            leftShoulderPoint.parent = this.transform;
            leftShoulderPoint.position = new Vector3(-1, 1, 0);
        }
        
        if (rightShoulderPoint == null)
        {
            GameObject go = new GameObject("RightShoulderPoint");
            rightShoulderPoint = go.transform;
            rightShoulderPoint.parent = this.transform;
            rightShoulderPoint.position = new Vector3(1, 1, 0);
        }
    }
    
    void Update()
    {
        // Manual testing for now
        if (enableManualTesting && Input.GetKey(testKey))
        {
            SimulateMotion();
        }
        
        // TODO: This is where we'll add real MediaPipe data when we figure out the correct API
        // UpdateWithMediaPipeData();
    }
    
    void SimulateMotion()
    {
        // Simulate hand movement for testing
        float time = Time.time;
        float speed = 2f;
        float amplitude = 1f;
        
        if (leftHandPoint != null)
        {
            Vector3 basePos = new Vector3(-2, 0, 0);
            leftHandPoint.position = basePos + new Vector3(
                Mathf.Sin(time * speed) * amplitude,
                Mathf.Cos(time * speed * 1.3f) * amplitude * 0.5f,
                0
            );
        }
        
        if (rightHandPoint != null)
        {
            Vector3 basePos = new Vector3(2, 0, 0);
            rightHandPoint.position = basePos + new Vector3(
                Mathf.Sin(time * speed + 1f) * amplitude,
                Mathf.Cos(time * speed * 1.1f) * amplitude * 0.5f,
                0
            );
        }
        
        if (nosePoint != null)
        {
            Vector3 basePos = new Vector3(0, 2, 0);
            nosePoint.position = basePos + new Vector3(
                Mathf.Sin(time * speed * 0.5f) * amplitude * 0.3f,
                Mathf.Cos(time * speed * 0.7f) * amplitude * 0.2f,
                0
            );
        }
    }
    
    // Call this method from your MediaPipe script to update positions
    public void UpdateHandPosition(int handIndex, Vector3 wristPos, Vector3 handCenterPos)
    {
        // Convert normalized coordinates to world positions
        Vector3 scaledWrist = new Vector3(
            (wristPos.x - 0.5f) * coordinateScale,
            (0.5f - wristPos.y) * coordinateScale,  // Flip Y
            wristPos.z * coordinateScale
        );
        
        Vector3 scaledHand = new Vector3(
            (handCenterPos.x - 0.5f) * coordinateScale,
            (0.5f - handCenterPos.y) * coordinateScale,  // Flip Y
            handCenterPos.z * coordinateScale
        );
        
        if (handIndex == 0) // Left hand
        {
            if (leftWristPoint != null) leftWristPoint.position = scaledWrist;
            if (leftHandPoint != null) leftHandPoint.position = scaledHand;
        }
        else if (handIndex == 1) // Right hand
        {
            if (rightWristPoint != null) rightWristPoint.position = scaledWrist;
            if (rightHandPoint != null) rightHandPoint.position = scaledHand;
        }
    }
    
    // Call this method from your MediaPipe script to update pose
    public void UpdatePosePosition(Vector3 nosePos, Vector3 leftShoulderPos, Vector3 rightShoulderPos)
    {
        if (nosePoint != null)
        {
            nosePoint.position = new Vector3(
                (nosePos.x - 0.5f) * coordinateScale,
                (0.5f - nosePos.y) * coordinateScale,
                nosePos.z * coordinateScale
            );
        }
        
        if (leftShoulderPoint != null)
        {
            leftShoulderPoint.position = new Vector3(
                (leftShoulderPos.x - 0.5f) * coordinateScale,
                (0.5f - leftShoulderPos.y) * coordinateScale,
                leftShoulderPos.z * coordinateScale
            );
        }
        
        if (rightShoulderPoint != null)
        {
            rightShoulderPoint.position = new Vector3(
                (rightShoulderPos.x - 0.5f) * coordinateScale,
                (0.5f - rightShoulderPos.y) * coordinateScale,
                rightShoulderPos.z * coordinateScale
            );
        }
    }
    
    // Debug visualization
    void OnDrawGizmos()
    {
        if (!showDebugSpheres) return;
        
        if (leftHandPoint != null)
        {
            Gizmos.color = Color.red;
            Gizmos.DrawWireSphere(leftHandPoint.position, 0.2f);
        }
        
        if (rightHandPoint != null)
        {
            Gizmos.color = Color.blue;
            Gizmos.DrawWireSphere(rightHandPoint.position, 0.2f);
        }
        
        if (leftWristPoint != null)
        {
            Gizmos.color = Color.red * 0.7f;
            Gizmos.DrawWireSphere(leftWristPoint.position, 0.15f);
        }
        
        if (rightWristPoint != null)
        {
            Gizmos.color = Color.blue * 0.7f;
            Gizmos.DrawWireSphere(rightWristPoint.position, 0.15f);
        }
        
        if (nosePoint != null)
        {
            Gizmos.color = Color.green;
            Gizmos.DrawWireSphere(nosePoint.position, 0.1f);
        }
        
        if (leftShoulderPoint != null)
        {
            Gizmos.color = Color.yellow;
            Gizmos.DrawWireSphere(leftShoulderPoint.position, 0.15f);
        }
        
        if (rightShoulderPoint != null)
        {
            Gizmos.color = Color.cyan;
            Gizmos.DrawWireSphere(rightShoulderPoint.position, 0.15f);
        }
    }
}