using UnityEngine;
using System.Collections.Generic;

public class MotionDetectionManager : MonoBehaviour
{
    [Header("MediaPipe Integration")]
    public Transform[] handTransforms; // Assign your MediaPipe hand tracking transforms
    public Transform[] bodyKeypoints;  // Other keypoints you want to track
    
    [Header("Motion Settings")]
    public float motionSensitivity = 1f;
    public float smoothingFactor = 0.1f;
    public float decayRate = 0.95f; // How quickly motion energy decays
    
    [Header("Debug")]
    public bool showDebugInfo = true;
    
    // Motion tracking variables
    private Vector3[] previousPositions;
    private float currentMotionIntensity = 0f;
    private float smoothedMotionIntensity = 0f;
    
    // Events for other scripts to listen to
    public System.Action<float> OnMotionIntensityChanged;
    
    void Start()
    {
        // Initialize arrays based on total keypoints
        int totalKeypoints = (handTransforms?.Length ?? 0) + (bodyKeypoints?.Length ?? 0);
        previousPositions = new Vector3[totalKeypoints];
        
        // Store initial positions
        UpdatePreviousPositions();
    }
    
    void Update()
    {
        CalculateMotionIntensity();
        UpdateMotionEffects();
        
        if (showDebugInfo)
        {
            DisplayDebugInfo();
        }
    }
    
    void CalculateMotionIntensity()
    {
        float totalMotion = 0f;
        int keypointIndex = 0;
        
        // Calculate motion from hand transforms
        if (handTransforms != null)
        {
            foreach (Transform hand in handTransforms)
            {
                if (hand != null && keypointIndex < previousPositions.Length)
                {
                    float distance = Vector3.Distance(hand.position, previousPositions[keypointIndex]);
                    totalMotion += distance * motionSensitivity;
                    previousPositions[keypointIndex] = hand.position;
                }
                keypointIndex++;
            }
        }
        
        // Calculate motion from body keypoints
        if (bodyKeypoints != null)
        {
            foreach (Transform keypoint in bodyKeypoints)
            {
                if (keypoint != null && keypointIndex < previousPositions.Length)
                {
                    float distance = Vector3.Distance(keypoint.position, previousPositions[keypointIndex]);
                    totalMotion += distance * motionSensitivity;
                    previousPositions[keypointIndex] = keypoint.position;
                }
                keypointIndex++;
            }
        }
        
        // Update motion intensity
        currentMotionIntensity = totalMotion;
        
        // Apply decay to create smoother transitions
        currentMotionIntensity *= decayRate;
        
        // Smooth the motion intensity
        smoothedMotionIntensity = Mathf.Lerp(smoothedMotionIntensity, currentMotionIntensity, smoothingFactor);
    }
    
    void UpdateMotionEffects()
    {
        // Trigger event for other scripts to respond to motion
        OnMotionIntensityChanged?.Invoke(smoothedMotionIntensity);
    }
    
    void UpdatePreviousPositions()
    {
        int keypointIndex = 0;
        
        if (handTransforms != null)
        {
            foreach (Transform hand in handTransforms)
            {
                if (hand != null && keypointIndex < previousPositions.Length)
                {
                    previousPositions[keypointIndex] = hand.position;
                }
                keypointIndex++;
            }
        }
        
        if (bodyKeypoints != null)
        {
            foreach (Transform keypoint in bodyKeypoints)
            {
                if (keypoint != null && keypointIndex < previousPositions.Length)
                {
                    previousPositions[keypointIndex] = keypoint.position;
                }
                keypointIndex++;
            }
        }
    }
    
    void DisplayDebugInfo()
    {
        Debug.Log($"Motion Intensity: {smoothedMotionIntensity:F3}");
        
        // Optional: Draw debug rays in Scene view
        if (handTransforms != null)
        {
            foreach (Transform hand in handTransforms)
            {
                if (hand != null)
                {
                    Debug.DrawRay(hand.position, Vector3.up * smoothedMotionIntensity, Color.red);
                }
            }
        }
    }
    
    // Public methods for other scripts
    public float GetMotionIntensity()
    {
        return smoothedMotionIntensity;
    }
    
    public float GetNormalizedMotionIntensity(float maxIntensity = 1f)
    {
        return Mathf.Clamp01(smoothedMotionIntensity / maxIntensity);
    }
}