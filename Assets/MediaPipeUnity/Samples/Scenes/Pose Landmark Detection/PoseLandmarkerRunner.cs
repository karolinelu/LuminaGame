// Copyright (c) 2023 homuler
// MIT License

using System.Collections;
using Mediapipe.Tasks.Vision.PoseLandmarker;
using UnityEngine;
using UnityEngine.Rendering;
using System.Collections.Generic;
using System.Collections.Concurrent;

namespace Mediapipe.Unity.Sample.PoseLandmarkDetection
{
  public class PoseLandmarkerRunner : VisionTaskApiRunner<PoseLandmarker>
  {
    [SerializeField] private PoseLandmarkerResultAnnotationController _poseLandmarkerResultAnnotationController;
    
    // Multi-player support - arrays for 3 players
    [SerializeField] private GameObject[] leftWristObjects = new GameObject[3]; // Left wrist GameObjects for each player
    [SerializeField] private GameObject[] rightWristObjects = new GameObject[3]; // Right wrist GameObjects for each player
    
    // Single cylinder for collective movement-based alpha effects
    [SerializeField] private GameObject cylinderObject; // Single cylinder GameObject
    [SerializeField] private Renderer cylinderRenderer; // Single cylinder renderer

    private Experimental.TextureFramePool _textureFramePool;
    public readonly PoseLandmarkDetectionConfig config = new PoseLandmarkDetectionConfig();
    
    // Camera reference cached on main thread
    private Camera mainCamera;
    
    // Thread-safe queues for position updates - multi-player support
    private ConcurrentQueue<Vector3>[] leftWristPositions = new ConcurrentQueue<Vector3>[3];
    private ConcurrentQueue<Vector3>[] rightWristPositions = new ConcurrentQueue<Vector3>[3];
    private bool[] hasNewLeftWristPosition = new bool[3];
    private bool[] hasNewRightWristPosition = new bool[3];
    
    // Smoothing/filtering for stable movement - multi-player support
    private Vector3[] leftWristSmoothedPositions = new Vector3[3];
    private Vector3[] rightWristSmoothedPositions = new Vector3[3];
    private float smoothingFactor = 0.1f; // Lower = more smoothing, Higher = more responsive
    
    // Sensitivity control
    private float sensitivityMultiplier = 6f; // Current scaling factor
    private float xAxisMultiplier = 6f; // Separate X-axis scaling
    private float yAxisMultiplier = 6f; // Separate Y-axis scaling
    
    // Movement tracking for collective cylinder alpha effects
    private Vector3[] previousLeftWristPositions = new Vector3[3];
    private Vector3[] previousRightWristPositions = new Vector3[3];
    private float currentCollectiveAlpha = 0f; // Collective alpha value based on all players' movement
    private float maxBurnerAlpha = 1f; // Maximum alpha value
    private float alphaIncreaseRate = 0.8f; // How fast alpha increases with movement
    private float movementThreshold = 0.6f; // Minimum movement to trigger alpha increase
    
    // Color animation for cylinders
    private float colorAnimationSpeed = 0.3f; // Speed of color animation (slower for more gentle wave movement)
    private float colorTime = 0f; // Time accumulator for color animation
    private float colorUpdateInterval = 0.15f; // Update colors every 0.15 seconds (~6.7 FPS) for smoother, slower waves
    private float lastColorUpdateTime = 0f; // Last time colors were updated
    
    // Performance scaling when cylinder is visible
    private float performanceScaleFactor = 2f; // How much to reduce update frequency when cylinder is visible

    void Awake()
    {
        // Cache camera reference on main thread
        mainCamera = Camera.main;
        
        // Initialize arrays for multi-player support
        for (int i = 0; i < 3; i++)
        {
            leftWristPositions[i] = new ConcurrentQueue<Vector3>();
            rightWristPositions[i] = new ConcurrentQueue<Vector3>();
            leftWristSmoothedPositions[i] = Vector3.zero;
            rightWristSmoothedPositions[i] = Vector3.zero;
            previousLeftWristPositions[i] = Vector3.zero;
            previousRightWristPositions[i] = Vector3.zero;
        }
        
        // Initialize collective alpha
        currentCollectiveAlpha = 0f;
        
        // Set up camera for optimal viewing
        SetupCameraForViewing();
    }
    
    void SetupCameraForViewing()
    {
        if (mainCamera != null)
        {
            // Position camera to see the MediaPipe canvas/UI
            mainCamera.transform.position = new Vector3(0, 0, -10);
            mainCamera.transform.LookAt(Vector3.zero); // Look at the origin where UI typically is
            
            // Set appropriate field of view for UI viewing
            mainCamera.fieldOfView = 60f;
            
            // Set clipping planes
            mainCamera.nearClipPlane = 0.1f;
            mainCamera.farClipPlane = 20f;
            
            Debug.Log("Camera configured for viewing");
        }
    }

    void Update()
    {
        // Process queued wrist positions on main thread
        ProcessQueuedWristPositions();
        
        // Update burner alpha based on movement
        UpdateBurnerAlpha();
        
        // Temporary: Position camera to see canvas
        if (Input.GetKeyDown(KeyCode.C))
        {
            if (Camera.main != null)
            {
                Camera.main.transform.position = new Vector3(0, 0, -10);
                Camera.main.transform.LookAt(Vector3.zero);
                Debug.Log("Camera positioned to look at canvas");
            }
        }
        
        // Temporary: Increase sensitivity
        if (Input.GetKeyDown(KeyCode.Plus) || Input.GetKeyDown(KeyCode.Equals))
        {
            IncreaseSensitivity();
        }
        
        // Temporary: Decrease sensitivity
        if (Input.GetKeyDown(KeyCode.Minus))
        {
            DecreaseSensitivity();
        }
        
        // Temporary: Adjust smoothing
        if (Input.GetKeyDown(KeyCode.S))
        {
            IncreaseSmoothing();
        }
        
        if (Input.GetKeyDown(KeyCode.A))
        {
            DecreaseSmoothing();
        }
        
        // Temporary: Adjust X-axis scaling
        if (Input.GetKeyDown(KeyCode.X))
        {
            IncreaseXAxisScaling();
        }
        
        if (Input.GetKeyDown(KeyCode.Z))
        {
            DecreaseXAxisScaling();
        }
        
        // Temporary: Adjust Y-axis scaling
        if (Input.GetKeyDown(KeyCode.Y))
        {
            IncreaseYAxisScaling();
        }
        
        if (Input.GetKeyDown(KeyCode.H))
        {
            DecreaseYAxisScaling();
        }
        
        // Cylinder controls
        if (Input.GetKeyDown(KeyCode.C))
        {
            PositionCylinder();
        }
        
        if (Input.GetKeyDown(KeyCode.O))
        {
            ToggleCylinderOrientation();
        }
        
        // Manual alpha controls for testing
        if (Input.GetKeyDown(KeyCode.M))
        {
            currentCollectiveAlpha = Mathf.Min(1f, currentCollectiveAlpha + 0.2f);
            SetCylinderAlpha(currentCollectiveAlpha);
            Debug.Log($"Collective cylinder alpha increased to: {currentCollectiveAlpha:F2}");
        }
        
        // Debug movement values
        if (Input.GetKeyDown(KeyCode.V))
        {
            Debug.Log($"=== Movement Debug ===");
            Debug.Log($"Movement Threshold: {movementThreshold:F2}");
            Debug.Log($"Alpha Increase Rate: {alphaIncreaseRate:F2}");
            Debug.Log($"Color Animation Speed: {colorAnimationSpeed:F2}");
            Debug.Log($"Color Time: {colorTime:F2}");
            Debug.Log($"Color Update Interval: {colorUpdateInterval:F2}s ({(1f/colorUpdateInterval):F1} FPS)");
            Debug.Log($"Performance Scale Factor: {performanceScaleFactor:F2} (when cylinder visible)");
            
            // Debug collective movement and alpha
            float totalCollectiveMovement = 0f;
            for (int i = 0; i < 3; i++)
            {
                float leftMovement = Vector3.Distance(leftWristSmoothedPositions[i], previousLeftWristPositions[i]);
                float rightMovement = Vector3.Distance(rightWristSmoothedPositions[i], previousRightWristPositions[i]);
                float playerMovement = leftMovement + rightMovement;
                totalCollectiveMovement += playerMovement;
                
                Debug.Log($"Player {i + 1} Movement: {playerMovement:F3} (L:{leftMovement:F3}, R:{rightMovement:F3})");
            }
            
            Debug.Log($"Collective Alpha: {currentCollectiveAlpha:F2}");
            Debug.Log($"Total Collective Movement: {totalCollectiveMovement:F3}");
            Debug.Log($"Movement Above Threshold: {totalCollectiveMovement > movementThreshold}");
        }
        
        if (Input.GetKeyDown(KeyCode.Comma))
        {
            ResetCylinderAlpha();
            Debug.Log("Cylinder alpha reset to 0");
        }
        
        // Debug shader properties at runtime
        if (Input.GetKeyDown(KeyCode.D))
        {
            DebugSolarisShaderProperties();
        }
        
        // Cylinder positioning controls
        if (Input.GetKeyDown(KeyCode.F))
        {
            PositionCylinder();
        }
        
        // Movement threshold controls for cylinder visibility
        if (Input.GetKeyDown(KeyCode.T))
        {
            movementThreshold += 0.1f;
            Debug.Log($"Movement threshold increased to: {movementThreshold:F2}");
        }
        
        if (Input.GetKeyDown(KeyCode.R))
        {
            movementThreshold = Mathf.Max(0.05f, movementThreshold - 0.1f);
            Debug.Log($"Movement threshold decreased to: {movementThreshold:F2}");
        }
        
        // Alpha increase rate controls
        if (Input.GetKeyDown(KeyCode.A))
        {
            alphaIncreaseRate += 0.2f;
            Debug.Log($"Alpha increase rate increased to: {alphaIncreaseRate:F2}");
        }
        
        if (Input.GetKeyDown(KeyCode.S))
        {
            alphaIncreaseRate = Mathf.Max(0.1f, alphaIncreaseRate - 0.2f);
            Debug.Log($"Alpha increase rate decreased to: {alphaIncreaseRate:F2}");
        }
        
        // Color animation speed controls
        if (Input.GetKeyDown(KeyCode.Q))
        {
            colorAnimationSpeed += 0.5f;
            Debug.Log($"Color animation speed increased to: {colorAnimationSpeed:F2}");
        }
        
        if (Input.GetKeyDown(KeyCode.W))
        {
            colorAnimationSpeed = Mathf.Max(0.1f, colorAnimationSpeed - 0.5f);
            Debug.Log($"Color animation speed decreased to: {colorAnimationSpeed:F2}");
        }
        
        // Color update interval controls for performance
        if (Input.GetKeyDown(KeyCode.E))
        {
            colorUpdateInterval += 0.05f;
            Debug.Log($"Color update interval increased to: {colorUpdateInterval:F2}s (lower FPS)");
        }
        
        if (Input.GetKeyDown(KeyCode.D))
        {
            colorUpdateInterval = Mathf.Max(0.02f, colorUpdateInterval - 0.05f);
            Debug.Log($"Color update interval decreased to: {colorUpdateInterval:F2}s (higher FPS)");
        }
        
        // Performance scaling controls when cylinder is visible
        if (Input.GetKeyDown(KeyCode.B))
        {
            performanceScaleFactor += 0.5f;
            Debug.Log($"Performance scale factor increased to: {performanceScaleFactor:F2} (more aggressive scaling)");
        }
        
        if (Input.GetKeyDown(KeyCode.N))
        {
            performanceScaleFactor = Mathf.Max(1f, performanceScaleFactor - 0.5f);
            Debug.Log($"Performance scale factor decreased to: {performanceScaleFactor:F2} (less aggressive scaling)");
        }
    }
    
    void IncreaseSensitivity()
    {
        sensitivityMultiplier += 2f;
        Debug.Log($"Sensitivity increased to {sensitivityMultiplier}");
    }
    
    void DecreaseSensitivity()
    {
        sensitivityMultiplier = Mathf.Max(1f, sensitivityMultiplier - 2f);
        Debug.Log($"Sensitivity decreased to {sensitivityMultiplier}");
    }
    
    void IncreaseSmoothing()
    {
        smoothingFactor = Mathf.Max(0.01f, smoothingFactor - 0.02f);
        Debug.Log($"Smoothing increased to {smoothingFactor:F3} (more stable)");
    }
    
    void DecreaseSmoothing()
    {
        smoothingFactor = Mathf.Min(0.5f, smoothingFactor + 0.02f);
        Debug.Log($"Smoothing decreased to {smoothingFactor:F3} (more responsive)");
    }
    
    void IncreaseXAxisScaling()
    {
        xAxisMultiplier += 2f;
        Debug.Log($"X-axis scaling increased to {xAxisMultiplier} (more horizontal movement)");
    }
    
    void DecreaseXAxisScaling()
    {
        xAxisMultiplier = Mathf.Max(1f, xAxisMultiplier - 2f);
        Debug.Log($"X-axis scaling decreased to {xAxisMultiplier} (less horizontal movement)");
    }
    
    void IncreaseYAxisScaling()
    {
        yAxisMultiplier += 2f;
        Debug.Log($"Y-axis scaling increased to {yAxisMultiplier} (more vertical movement)");
    }
    
    void DecreaseYAxisScaling()
    {
        yAxisMultiplier = Mathf.Max(1f, yAxisMultiplier - 2f);
        Debug.Log($"Y-axis scaling decreased to {yAxisMultiplier} (less vertical movement)");
    }

    public override void Stop()
    {
      base.Stop();
      _textureFramePool?.Dispose();
      _textureFramePool = null;
    }

    protected override IEnumerator Run()
    {
      Debug.Log($"Delegate = {config.Delegate}");
      Debug.Log($"Image Read Mode = {config.ImageReadMode}");
      Debug.Log($"Model = {config.ModelName}");
      Debug.Log($"Running Mode = {config.RunningMode}");
      Debug.Log($"NumPoses = {config.NumPoses}");
      Debug.Log($"MinPoseDetectionConfidence = {config.MinPoseDetectionConfidence}");
      Debug.Log($"MinPosePresenceConfidence = {config.MinPosePresenceConfidence}");
      Debug.Log($"MinTrackingConfidence = {config.MinTrackingConfidence}");
      Debug.Log($"OutputSegmentationMasks = {config.OutputSegmentationMasks}");

      // Load model
      yield return AssetLoader.PrepareAssetAsync(config.ModelPath);

      // Create task
      var options = config.GetPoseLandmarkerOptions(
        config.RunningMode == Tasks.Vision.Core.RunningMode.LIVE_STREAM ? OnPoseLandmarkDetectionOutput : null);
      taskApi = PoseLandmarker.CreateFromOptions(options, GpuManager.GpuResources);

      // Start image source
      var imageSource = ImageSourceProvider.ImageSource;
      yield return imageSource.Play();
      if (!imageSource.isPrepared)
      {
        Logger.LogError(TAG, "Failed to start ImageSource, exiting...");
        yield break;
      }

      // Use RGBA32 input (CPU path uses Async readback by default)
      _textureFramePool = new Experimental.TextureFramePool(
        imageSource.textureWidth, imageSource.textureHeight, TextureFormat.RGBA32, 10);

      // Screen / annotation setup
      screen.Initialize(imageSource);
      SetupAnnotationController(_poseLandmarkerResultAnnotationController, imageSource);
      _poseLandmarkerResultAnnotationController.InitScreen(imageSource.textureWidth, imageSource.textureHeight);

      // Transform options from source
      var transformationOptions = imageSource.GetTransformationOptions();
      var flipHorizontally = transformationOptions.flipHorizontally;
      var flipVertically   = transformationOptions.flipVertically;

      // Keep rotation at 0 (stability workaround)
      var imageProcessingOptions = new Tasks.Vision.Core.ImageProcessingOptions(rotationDegrees: 0);

      AsyncGPUReadbackRequest req = default;
      var waitUntilReqDone = new WaitUntil(() => req.done);
      var waitForEndOfFrame = new WaitForEndOfFrame();

      var result = PoseLandmarkerResult.Alloc(options.numPoses, options.outputSegmentationMasks);

      // Android GPU path supported (shared GL context)
      var canUseGpuImage = SystemInfo.graphicsDeviceType == GraphicsDeviceType.OpenGLES3 &&
                           GpuManager.GpuResources != null;
      using var glContext = canUseGpuImage ? GpuManager.GetGlContext() : null;

      while (true)
      {
        if (isPaused) yield return new WaitWhile(() => isPaused);

        if (!_textureFramePool.TryGetTextureFrame(out var textureFrame))
        {
          yield return waitForEndOfFrame;
          continue;
        }

        // Build input Image
        Image image;
        switch (config.ImageReadMode)
        {
          case ImageReadMode.GPU:
            if (!canUseGpuImage) throw new System.Exception("ImageReadMode.GPU is not supported on this platform.");
            textureFrame.ReadTextureOnGPU(imageSource.GetCurrentTexture(), flipHorizontally, flipVertically);
            image = textureFrame.BuildGPUImage(glContext);
            // Allow copy to complete this frame
            yield return waitForEndOfFrame;
            break;

          case ImageReadMode.CPU:
            yield return waitForEndOfFrame;
            textureFrame.ReadTextureOnCPU(imageSource.GetCurrentTexture(), flipHorizontally, flipVertically);
            image = textureFrame.BuildCPUImage();
            textureFrame.Release();
            break;

          case ImageReadMode.CPUAsync:
          default:
            req = textureFrame.ReadTextureAsync(imageSource.GetCurrentTexture(), flipHorizontally, flipVertically);
            yield return waitUntilReqDone;
            if (req.hasError)
            {
              Debug.LogWarning("Failed to read texture from the image source");
              continue;
            }
            image = textureFrame.BuildCPUImage();
            textureFrame.Release();
            break;
        }

        // Run according to mode
        switch (taskApi.runningMode)
        {
          case Tasks.Vision.Core.RunningMode.IMAGE:
            if (taskApi.TryDetect(image, imageProcessingOptions, ref result))
              _poseLandmarkerResultAnnotationController.DrawNow(result);
            else
              _poseLandmarkerResultAnnotationController.DrawNow(default);
            DisposeAllMasks(result);
            break;

          case Tasks.Vision.Core.RunningMode.VIDEO:
            if (taskApi.TryDetectForVideo(image, GetCurrentTimestampMillisec(), imageProcessingOptions, ref result))
              _poseLandmarkerResultAnnotationController.DrawNow(result);
            else
              _poseLandmarkerResultAnnotationController.DrawNow(default);
            DisposeAllMasks(result);
            break;

          case Tasks.Vision.Core.RunningMode.LIVE_STREAM:
            taskApi.DetectAsync(image, GetCurrentTimestampMillisec(), imageProcessingOptions);
            // NOTE: Annotation updates happen in OnPoseLandmarkDetectionOutput via DrawLater
            break;
        }
      }
    }

    // LIVE_STREAM callback
    // In your OnPoseLandmarkDetectionOutput method or wherever you process results
private void OnPoseLandmarkDetectionOutput(PoseLandmarkerResult result, Image image, long timestamp)
{
    // Process wrist landmarks
    ProcessWristLandmarks(result);
    
    _poseLandmarkerResultAnnotationController.DrawLater(result);
    DisposeAllMasks(result);
}

private void ProcessWristLandmarks(PoseLandmarkerResult result)
{
    if (result.poseLandmarks != null && result.poseLandmarks.Count > 0)
    {
        var pose = result.poseLandmarks[0];
        Debug.Log($"Processing pose with {pose.landmarks.Count} landmarks");
        
        // Left wrist (index 15) - queue position for main thread processing
        if (pose.landmarks.Count > 15)
        {
            var leftWrist = pose.landmarks[15];
            Vector3 leftWristPosition = ConvertNormalizedToWorldPosition(leftWrist);
            
            Debug.Log($"Left wrist raw: ({leftWrist.x:F3}, {leftWrist.y:F3}, {leftWrist.z:F3}) -> World: {leftWristPosition}");
            
            // Queue position for main thread processing (player 0)
            leftWristPositions[0].Enqueue(leftWristPosition);
            hasNewLeftWristPosition[0] = true;
        }
        else
        {
            Debug.Log("Not enough landmarks for left wrist (need >15, got " + pose.landmarks.Count + ")");
        }
        
        // Right wrist (index 16) - queue position for main thread processing
        if (pose.landmarks.Count > 16)
        {
            var rightWrist = pose.landmarks[16];
            Vector3 rightWristPosition = ConvertNormalizedToWorldPosition(rightWrist);
            
            Debug.Log($"Right wrist raw: ({rightWrist.x:F3}, {rightWrist.y:F3}, {rightWrist.z:F3}) -> World: {rightWristPosition}");
            
            // Queue position for main thread processing (player 0)
            rightWristPositions[0].Enqueue(rightWristPosition);
            hasNewRightWristPosition[0] = true;
        }
        else
        {
            Debug.Log("Not enough landmarks for right wrist (need >16, got " + pose.landmarks.Count + ")");
        }
    }
    else
    {
        Debug.Log("No pose landmarks detected");
        // Queue null positions to indicate no pose detected (player 0)
        leftWristPositions[0].Enqueue(Vector3.zero);
        rightWristPositions[0].Enqueue(Vector3.zero);
        hasNewLeftWristPosition[0] = true;
        hasNewRightWristPosition[0] = true;
    }
}

/// <summary>
    /// Processes queued wrist positions on the main thread for all players
/// </summary>
private void ProcessQueuedWristPositions()
{
        // Process all players
        for (int playerIndex = 0; playerIndex < 3; playerIndex++)
    {
            // Process left wrist positions for this player
            if (hasNewLeftWristPosition[playerIndex] && leftWristPositions[playerIndex].TryDequeue(out Vector3 leftPosition))
            {
                hasNewLeftWristPosition[playerIndex] = false;
        
        // Apply smoothing to reduce flickering
        if (leftPosition != Vector3.zero)
        {
                    leftWristSmoothedPositions[playerIndex] = Vector3.Lerp(leftWristSmoothedPositions[playerIndex], leftPosition, smoothingFactor);
        }
        else
        {
                    leftWristSmoothedPositions[playerIndex] = Vector3.Lerp(leftWristSmoothedPositions[playerIndex], Vector3.zero, smoothingFactor * 2f);
                }
                
                // Update left wrist GameObject for this player
                if (leftWristObjects[playerIndex] != null)
                {
                    leftWristObjects[playerIndex].transform.position = leftWristSmoothedPositions[playerIndex];
                }
                
                Debug.Log($"Player {playerIndex + 1} Left wrist position: {leftPosition} | GameObject: {(leftWristObjects[playerIndex] != null ? "Assigned" : "NULL")}");
            }
            
            // Process right wrist positions for this player
            if (hasNewRightWristPosition[playerIndex] && rightWristPositions[playerIndex].TryDequeue(out Vector3 rightPosition))
            {
                hasNewRightWristPosition[playerIndex] = false;
        
        // Apply smoothing to reduce flickering
        if (rightPosition != Vector3.zero)
        {
                    rightWristSmoothedPositions[playerIndex] = Vector3.Lerp(rightWristSmoothedPositions[playerIndex], rightPosition, smoothingFactor);
        }
        else
        {
                    rightWristSmoothedPositions[playerIndex] = Vector3.Lerp(rightWristSmoothedPositions[playerIndex], Vector3.zero, smoothingFactor * 2f);
                }
                
                // Update right wrist GameObject for this player
                if (rightWristObjects[playerIndex] != null)
                {
                    rightWristObjects[playerIndex].transform.position = rightWristSmoothedPositions[playerIndex];
                }
                
                Debug.Log($"Player {playerIndex + 1} Right wrist position: {rightPosition} | GameObject: {(rightWristObjects[playerIndex] != null ? "Assigned" : "NULL")}");
            }
    }
}

/// <summary>
/// Converts normalized landmark coordinates (0-1) to world space coordinates
/// </summary>
private Vector3 ConvertNormalizedToWorldPosition(Mediapipe.Tasks.Components.Containers.NormalizedLandmark landmark)
{
    // Use separate X and Y scaling for better control
    // This maps normalized coordinates (0-1) to a responsive space visible in canvas view
    Vector3 worldPosition = new Vector3(
        (landmark.x - 0.5f) * xAxisMultiplier,   // Scale and center X with separate multiplier
        (0.5f - landmark.y) * yAxisMultiplier,   // Scale and center Y with separate multiplier (flip Y)
        1f + landmark.z * 1f                     // Use Z depth (1 to 2) - closer to camera for canvas view
    );
    
    // Clamp coordinates to camera view bounds
    float maxRangeX = xAxisMultiplier + 1f;
    float maxRangeY = yAxisMultiplier + 1f;
    worldPosition.x = Mathf.Clamp(worldPosition.x, -maxRangeX, maxRangeX);
    worldPosition.y = Mathf.Clamp(worldPosition.y, -maxRangeY, maxRangeY);
    worldPosition.z = Mathf.Clamp(worldPosition.z, 0.5f, 5f);
    
    return worldPosition;
}

    /// <summary>
    /// Updates cylinder alpha based on collective movement from all players - only increases, never decays
    /// </summary>
    private void UpdateBurnerAlpha()
    {
        // Update color animation time
        colorTime += Time.deltaTime * colorAnimationSpeed;
        
        // Calculate collective movement from all players
        float totalCollectiveMovement = 0f;
        
        for (int playerIndex = 0; playerIndex < 3; playerIndex++)
        {
            // Calculate movement from both wrists for this player
            float leftMovement = Vector3.Distance(leftWristSmoothedPositions[playerIndex], previousLeftWristPositions[playerIndex]);
            float rightMovement = Vector3.Distance(rightWristSmoothedPositions[playerIndex], previousRightWristPositions[playerIndex]);
            float playerMovement = leftMovement + rightMovement;
            
            // Add this player's movement to the collective total
            totalCollectiveMovement += playerMovement;
            
            // Update previous positions for next frame
            previousLeftWristPositions[playerIndex] = leftWristSmoothedPositions[playerIndex];
            previousRightWristPositions[playerIndex] = rightWristSmoothedPositions[playerIndex];
        }
        
        // Update alpha based on collective movement - only increase, never decrease
        if (totalCollectiveMovement > movementThreshold)
        {
            // Increase alpha when collective movement is detected - accumulates over time
            currentCollectiveAlpha = Mathf.Min(maxBurnerAlpha, currentCollectiveAlpha + alphaIncreaseRate * Time.deltaTime);
        }
        // Removed decay logic - alpha never decreases, only accumulates brightness
        
        // Apply alpha to the single cylinder material
        SetCylinderAlpha(currentCollectiveAlpha);
        
        // Only update colors at intervals to improve performance
        // Reduce frequency when cylinder is visible to prevent lag
        float currentColorInterval = colorUpdateInterval;
        if (currentCollectiveAlpha > 0.3f) // When cylinder is becoming visible
        {
            currentColorInterval *= (performanceScaleFactor * 0.75f); // Update colors less frequently
        }
        
        if (Time.time - lastColorUpdateTime >= currentColorInterval)
        {
            UpdateCylinderColors();
            lastColorUpdateTime = Time.time;
        }
    }
    
    /// <summary>
    /// Updates cylinder colors at intervals for better performance
    /// </summary>
    private void UpdateCylinderColors()
    {
        if (cylinderRenderer != null && cylinderRenderer.material != null)
        {
            Material mat = cylinderRenderer.material;
            if (mat != null)
            {
                SetAnimatedColors(mat);
            }
        }
    }
    
    /// <summary>
    /// Safely checks if a material is valid and has the required properties
    /// </summary>
    private bool IsMaterialValid(Material material)
    {
        if (material == null)
        {
            Debug.LogWarning("Material is null");
            return false;
        }
        
        if (material.shader == null)
        {
            Debug.LogWarning($"Material '{material.name}' has null shader");
            return false;
        }
        
        return true;
    }
    
    /// <summary>
    /// Sets the alpha value for the single cylinder material
    /// </summary>
    private void SetCylinderAlpha(float alpha)
    {
        if (cylinderRenderer != null && cylinderRenderer.material != null)
        {
            Material mat = cylinderRenderer.material;
            
            // Use safer material validation
            if (!IsMaterialValid(mat))
            {
                Debug.LogWarning("SetCylinderAlpha: Material validation failed");
                return;
            }
            
            // Try different alpha properties for different shaders
            if (mat.HasProperty("_Color"))
            {
                UnityEngine.Color color = mat.color;
                color.a = alpha;
                mat.color = color;
            }
            else if (mat.HasProperty("_Alpha"))
            {
                mat.SetFloat("_Alpha", alpha);
            }
            else if (mat.HasProperty("_Transparency"))
            {
                mat.SetFloat("_Transparency", alpha);
            }
            else if (mat.HasProperty("_Opacity"))
            {
                mat.SetFloat("_Opacity", alpha);
            }
            else if (mat.HasProperty("_TintColor"))
            {
                UnityEngine.Color tintColor = mat.GetColor("_TintColor");
                tintColor.a = alpha;
                mat.SetColor("_TintColor", tintColor);
            }
            else if (mat.HasProperty("_MainColor"))
            {
                UnityEngine.Color mainColor = mat.GetColor("_MainColor");
                mainColor.a = alpha;
                mat.SetColor("_MainColor", mainColor);
            }
            else if (mat.HasProperty("_BaseColor"))
            {
                UnityEngine.Color baseColor = mat.GetColor("_BaseColor");
                baseColor.a = alpha;
                mat.SetColor("_BaseColor", baseColor);
            }
            else if (mat.HasProperty("_EmissionColor"))
            {
                UnityEngine.Color emissionColor = mat.GetColor("_EmissionColor");
                emissionColor.a = alpha;
                mat.SetColor("_EmissionColor", emissionColor);
            }
            else
            {
                Debug.LogWarning($"Material '{mat.name}' doesn't have a recognizable alpha property. Available properties: {GetMaterialProperties(mat)}");
            }
        }
        else
        {
            Debug.LogWarning("SetCylinderAlpha: cylinderRenderer or material is null");
        }
    }
    
    /// <summary>
    /// Sets animated colors for cylinder materials based on time - cycles between pink, purple, orange, and blue
    /// </summary>
    private void SetAnimatedColors(Material material)
    {
        // Use safer material validation
        if (!IsMaterialValid(material))
        {
            Debug.LogWarning("SetAnimatedColors: Material validation failed");
            return;
        }
        
        // Define the four colors to cycle between
        UnityEngine.Color[] colors = {
            new UnityEngine.Color(1f, 0.4f, 0.8f, 1f),  // Pink
            new UnityEngine.Color(0.6f, 0.2f, 1f, 1f),   // Purple
            new UnityEngine.Color(1f, 0.5f, 0f, 1f),     // Orange
            new UnityEngine.Color(0f, 0.4f, 1f, 1f)      // Blue
        };
        
        // Calculate which color to use for Colour A based on time
        float time = colorTime;
        float cycleDuration = 4f; // How long each full cycle takes (4 colors)
        float normalizedTime = (time % cycleDuration) / cycleDuration; // 0 to 1
        
        // Only Colour A changes - cycle through the colors
        float colorIndexA = normalizedTime * colors.Length;
        UnityEngine.Color colorA = InterpolateColors(colors, colorIndexA);
        
        // Keep original colors for B and vertical colors (don't modify them)
        // We'll only apply Colour A and leave the others unchanged
        
        // Apply only Colour A - leave other colors unchanged
        if (material.HasProperty("_ColorA"))
        {
            material.SetColor("_ColorA", colorA);
        }
        if (material.HasProperty("_ColourA"))
        {
            material.SetColor("_ColourA", colorA);
        }
        if (material.HasProperty("_TopColor"))
        {
            material.SetColor("_TopColor", colorA);
        }
    }
    
    /// <summary>
    /// Interpolates between colors in an array for smooth transitions
    /// </summary>
    private UnityEngine.Color InterpolateColors(UnityEngine.Color[] colors, float index)
    {
        // Handle edge cases
        if (colors.Length == 0) return UnityEngine.Color.white;
        if (colors.Length == 1) return colors[0];
        
        // Wrap index to stay within bounds
        index = index % colors.Length;
        
        // Get the two colors to interpolate between
        int index1 = Mathf.FloorToInt(index);
        int index2 = (index1 + 1) % colors.Length;
        
        // Calculate interpolation factor
        float t = index - index1;
        
        // Interpolate between the two colors
        return UnityEngine.Color.Lerp(colors[index1], colors[index2], t);
    }
    
    /// <summary>
    /// Helper method to get all material properties for debugging
    /// </summary>
    private string GetMaterialProperties(Material material)
    {
        var properties = new System.Collections.Generic.List<string>();
        var shader = material.shader;
        
        for (int i = 0; i < shader.GetPropertyCount(); i++)
        {
            string propertyName = shader.GetPropertyName(i);
            properties.Add(propertyName);
        }
        
        return string.Join(", ", properties);
    }
    
    /// <summary>
    /// Debug method to check Solaris shader properties
    /// </summary>
    [ContextMenu("Debug Solaris Shader Properties")]
    private void DebugSolarisShaderProperties()
    {
        if (cylinderRenderer != null && cylinderRenderer.material != null)
        {
            Material mat = cylinderRenderer.material;
            
            // Use safer material validation
            if (!IsMaterialValid(mat))
            {
                Debug.LogWarning("DebugSolarisShaderProperties: Material validation failed");
                return;
            }
            
            Debug.Log($"Collective Cylinder Material: {mat.name}");
            Debug.Log($"Shader: {mat.shader.name}");
            Debug.Log($"Properties: {GetMaterialProperties(mat)}");
            
            // Check for common alpha-related properties
            string[] alphaProperties = {"_Alpha", "_Transparency", "_Opacity", "_TintColor", "_Color", "_MainColor", "_BaseColor"};
            foreach (string prop in alphaProperties)
            {
                if (mat.HasProperty(prop))
                {
                    Debug.Log($"✓ Found property: {prop}");
                }
            }
        }
        else
        {
            Debug.LogWarning("Cylinder renderer or material not assigned!");
        }
    }
    
    /// <summary>
    /// Creates a safe material for testing if Solaris shader is causing issues
    /// </summary>
    [ContextMenu("Create Safe Test Material")]
    private void CreateSafeTestMaterial()
    {
        if (cylinderRenderer != null)
        {
            // Create a simple standard material as a fallback
            Material safeMaterial = new Material(Shader.Find("Standard"));
            safeMaterial.SetFloat("_Mode", 3); // Transparent mode
            safeMaterial.SetInt("_SrcBlend", (int)UnityEngine.Rendering.BlendMode.SrcAlpha);
            safeMaterial.SetInt("_DstBlend", (int)UnityEngine.Rendering.BlendMode.OneMinusSrcAlpha);
            safeMaterial.SetInt("_ZWrite", 0);
            safeMaterial.DisableKeyword("_ALPHATEST_ON");
            safeMaterial.EnableKeyword("_ALPHABLEND_ON");
            safeMaterial.DisableKeyword("_ALPHAPREMULTIPLY_ON");
            safeMaterial.renderQueue = 3000;
            
            // Set initial color with alpha 0
            safeMaterial.color = new UnityEngine.Color(1f, 0.5f, 0f, 0f); // Orange color, fully transparent
            
            cylinderRenderer.material = safeMaterial;
            
            Debug.Log("Safe test material created and assigned to collective cylinder");
        }
        else
        {
            Debug.LogWarning("Cylinder renderer not assigned!");
        }
    }
    
    /// <summary>
    /// Positions the single cylinder in front of the camera
    /// </summary>
    [ContextMenu("Position Cylinder")]
    private void PositionCylinder()
    {
        if (cylinderObject != null && mainCamera != null)
        {
            // Position cylinder in front of camera at a fixed distance
            Vector3 cameraPosition = mainCamera.transform.position;
            Vector3 cameraForward = mainCamera.transform.forward;
            
            // Position cylinder closer to camera (same distance as wrist trails)
            Vector3 cylinderPosition = cameraPosition + cameraForward * 1f; // Same Z as wrist trails
            cylinderObject.transform.position = cylinderPosition;
            
            // Make cylinder face the camera
            cylinderObject.transform.LookAt(cameraPosition);
            
            // Rotate cylinder to be horizontal (rotate 90 degrees around X-axis)
            cylinderObject.transform.Rotate(90f, 90f, 0f);
            
            // Set appropriate scale
            cylinderObject.transform.localScale = new Vector3(1f, 1f, 1f);
            
            Debug.Log($"Collective cylinder positioned at: {cylinderPosition}");
            Debug.Log($"Camera position: {cameraPosition}, Camera forward: {cameraForward}");
        }
        else
        {
            Debug.LogWarning("Cylinder object or camera not assigned!");
        }
    }
    
    /// <summary>
    /// Toggles cylinder orientation between horizontal and vertical
    /// </summary>
    [ContextMenu("Toggle Cylinder Orientation")]
    private void ToggleCylinderOrientation()
    {
        if (cylinderObject != null)
        {
            // Check current rotation to determine current orientation
            Vector3 currentRotation = cylinderObject.transform.eulerAngles;
            
            // If close to (90, 90, 0) degrees (your horizontal), make it vertical (0, 0, 0)
            // If close to (0, 0, 0) degrees (vertical), make it horizontal (90, 90, 0)
            if (Mathf.Abs(currentRotation.x - 90f) < 10f && Mathf.Abs(currentRotation.y - 90f) < 10f)
            {
                // Currently horizontal (90, 90, 0), make it vertical
                cylinderObject.transform.rotation = Quaternion.identity;
                Debug.Log("Collective cylinder orientation changed to VERTICAL");
        }
        else
        {
                // Currently vertical, make it horizontal with your preferred rotation
                cylinderObject.transform.rotation = Quaternion.Euler(90f, 90f, 0f);
                Debug.Log("Collective cylinder orientation changed to HORIZONTAL (90, 90, 0)");
            }
        }
        else
        {
            Debug.LogWarning("Cylinder object not assigned!");
        }
    }

    private void DisposeAllMasks(PoseLandmarkerResult result)
    {
      if (result.segmentationMasks == null) return;
      foreach (var mask in result.segmentationMasks) mask.Dispose();
    }

    static List<PoseLandmarkerResult> landmarkList = new List<PoseLandmarkerResult>();

    public static void outputCallback(List<PoseLandmarkerResult> landmark)
    {
      landmarkList = landmark;
      Debug.Log(landmarkList);

    }
    
    /// <summary>
    /// Resets the collective cylinder alpha to 0 - useful for testing or restarting the brightness accumulation
    /// </summary>
    [ContextMenu("Reset Collective Cylinder Alpha")]
    private void ResetCylinderAlpha()
    {
        currentCollectiveAlpha = 0f;
        SetCylinderAlpha(currentCollectiveAlpha);
        Debug.Log("Collective cylinder alpha reset to 0");
    }


  }
}
