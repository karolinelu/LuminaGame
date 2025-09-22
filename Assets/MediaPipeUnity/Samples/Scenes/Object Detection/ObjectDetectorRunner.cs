// Copyright (c) 2023 homuler
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

using System.Collections;
using Mediapipe.Tasks.Vision.ObjectDetector;
using UnityEngine;
using UnityEngine.Rendering;
using System.Collections.Generic;
using System.Collections.Concurrent;
using ObjectDetectionResult = Mediapipe.Tasks.Components.Containers.DetectionResult;

namespace Mediapipe.Unity.Sample.ObjectDetection
{
  public class ObjectDetectorRunner : VisionTaskApiRunner<ObjectDetector>
  {
    [SerializeField] private DetectionResultAnnotationController _detectionResultAnnotationController;
    
    // Cube tracking fields
    [SerializeField] private GameObject trackedCube;
    [SerializeField] private float objectDetectionThreshold = 0.5f; // Minimum confidence for tracking
    
    private Experimental.TextureFramePool _textureFramePool;
    public readonly ObjectDetectionConfig config = new ObjectDetectionConfig();
    
    // Thread-safe queues for object positions
    private ConcurrentQueue<Vector3> objectPositions = new ConcurrentQueue<Vector3>();
    private bool hasNewObjectPosition = false;
    
    // Smoothing for stable movement
    private Vector3 objectSmoothedPosition = Vector3.zero;
    private float smoothingFactor = 0.5f; // Increased smoothing to reduce glitching
    private Vector3 lastValidPosition = Vector3.zero;
    private float maxPositionJump = 3f; // Maximum distance object can jump in one frame
    
    // Scaling controls
    private float xAxisMultiplier = 6f;
    private float yAxisMultiplier = 6f;

    void Update()
    {
        // Process queued object positions on main thread
        ProcessQueuedObjectPositions();
        
        // Controls for adjusting scaling
        if (Input.GetKeyDown(KeyCode.X))
        {
            xAxisMultiplier += 2f;
            Debug.Log($"X-axis scaling increased to {xAxisMultiplier}");
        }
        
        if (Input.GetKeyDown(KeyCode.Z))
        {
            xAxisMultiplier = Mathf.Max(1f, xAxisMultiplier - 2f);
            Debug.Log($"X-axis scaling decreased to {xAxisMultiplier}");
        }
        
        if (Input.GetKeyDown(KeyCode.Y))
        {
            yAxisMultiplier += 2f;
            Debug.Log($"Y-axis scaling increased to {yAxisMultiplier}");
        }
        
        if (Input.GetKeyDown(KeyCode.H))
        {
            yAxisMultiplier = Mathf.Max(1f, yAxisMultiplier - 2f);
            Debug.Log($"Y-axis scaling decreased to {yAxisMultiplier}");
        }
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
      Debug.Log($"Score Threshold = {config.ScoreThreshold}");
      Debug.Log($"Max Results = {config.MaxResults}");

      yield return AssetLoader.PrepareAssetAsync(config.ModelPath);

      var options = config.GetObjectDetectorOptions(config.RunningMode == Tasks.Vision.Core.RunningMode.LIVE_STREAM ? OnObjectDetectionsOutput : null);
      taskApi = ObjectDetector.CreateFromOptions(options, GpuManager.GpuResources);
      var imageSource = ImageSourceProvider.ImageSource;

      yield return imageSource.Play();

      if (!imageSource.isPrepared)
      {
        Debug.LogError("Failed to start ImageSource, exiting...");
        yield break;
      }

      // Use RGBA32 as the input format.
      // TODO: When using GpuBuffer, MediaPipe assumes that the input format is BGRA, so maybe the following code needs to be fixed.
      _textureFramePool = new Experimental.TextureFramePool(imageSource.textureWidth, imageSource.textureHeight, TextureFormat.RGBA32, 10);

      // NOTE: The screen will be resized later, keeping the aspect ratio.
      screen.Initialize(imageSource);

      SetupAnnotationController(_detectionResultAnnotationController, imageSource);

      var transformationOptions = imageSource.GetTransformationOptions();
      var flipHorizontally = transformationOptions.flipHorizontally;
      var flipVertically = transformationOptions.flipVertically;
      var imageProcessingOptions = new Tasks.Vision.Core.ImageProcessingOptions(rotationDegrees: (int)transformationOptions.rotationAngle);

      AsyncGPUReadbackRequest req = default;
      var waitUntilReqDone = new WaitUntil(() => req.done);
      var waitForEndOfFrame = new WaitForEndOfFrame();
      var result = ObjectDetectionResult.Alloc(System.Math.Max(options.maxResults ?? 0, 0));

      // NOTE: we can share the GL context of the render thread with MediaPipe (for now, only on Android)
      var canUseGpuImage = SystemInfo.graphicsDeviceType == GraphicsDeviceType.OpenGLES3 && GpuManager.GpuResources != null;
      using var glContext = canUseGpuImage ? GpuManager.GetGlContext() : null;

      while (true)
      {
        if (isPaused)
        {
          yield return new WaitWhile(() => isPaused);
        }

        if (!_textureFramePool.TryGetTextureFrame(out var textureFrame))
        {
          yield return new WaitForEndOfFrame();
          continue;
        }

        // Build the input Image
        Image image;
        switch (config.ImageReadMode)
        {
          case ImageReadMode.GPU:
            if (!canUseGpuImage)
            {
              throw new System.Exception("ImageReadMode.GPU is not supported");
            }
            textureFrame.ReadTextureOnGPU(imageSource.GetCurrentTexture(), flipHorizontally, flipVertically);
            image = textureFrame.BuildGPUImage(glContext);
            // TODO: Currently we wait here for one frame to make sure the texture is fully copied to the TextureFrame before sending it to MediaPipe.
            // This usually works but is not guaranteed. Find a proper way to do this. See: https://github.com/homuler/MediaPipeUnityPlugin/pull/1311
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
              Debug.LogWarning($"Failed to read texture from the image source");
              continue;
            }
            image = textureFrame.BuildCPUImage();
            textureFrame.Release();
            break;
        }

        switch (taskApi.runningMode)
        {
          case Tasks.Vision.Core.RunningMode.IMAGE:
            if (taskApi.TryDetect(image, imageProcessingOptions, ref result))
            {
              _detectionResultAnnotationController.DrawNow(result);
            }
            else
            {
              // clear the annotation
              _detectionResultAnnotationController.DrawNow(default);
            }
            break;
          case Tasks.Vision.Core.RunningMode.VIDEO:
            if (taskApi.TryDetectForVideo(image, GetCurrentTimestampMillisec(), imageProcessingOptions, ref result))
            {
              _detectionResultAnnotationController.DrawNow(result);
            }
            else
            {
              // clear the annotation
              _detectionResultAnnotationController.DrawNow(default);
            }
            break;
          case Tasks.Vision.Core.RunningMode.LIVE_STREAM:
            taskApi.DetectAsync(image, GetCurrentTimestampMillisec(), imageProcessingOptions);
            break;
        }
      }
    }

    private void OnObjectDetectionsOutput(ObjectDetectionResult result, Image image, long timestamp)
    {
      // Process detected objects for cube tracking
      ProcessDetectedObjects(result);
      
      _detectionResultAnnotationController.DrawLater(result);
    }
    
    /// <summary>
    /// Processes detected objects and queues positions for cube tracking
    /// </summary>
    private void ProcessDetectedObjects(ObjectDetectionResult result)
    {
        if (result.detections != null && result.detections.Count > 0)
        {
            // Find the best detected object (highest confidence, non-person)
            var bestDetection = FindBestObjectDetection(result.detections);
            
            if (bestDetection.categories != null)
            {
                // Convert bounding box center to world position
                Vector3 objectPosition = ConvertBoundingBoxToWorldPosition(bestDetection.boundingBox);
                
                Debug.Log($"Detected object: {bestDetection.categories[0].categoryName} " +
                         $"confidence: {bestDetection.categories[0].score:F3} " +
                         $"position: {objectPosition}");
                
                // Queue position for main thread processing
                objectPositions.Enqueue(objectPosition);
                hasNewObjectPosition = true;
            }
            else
            {
                // No suitable object detected
                objectPositions.Enqueue(Vector3.zero);
                hasNewObjectPosition = true;
            }
        }
        else
        {
            Debug.Log("No objects detected");
            objectPositions.Enqueue(Vector3.zero);
            hasNewObjectPosition = true;
        }
    }
    
    /// <summary>
    /// Finds the best object detection (highest confidence, non-person)
    /// </summary>
    private Mediapipe.Tasks.Components.Containers.Detection FindBestObjectDetection(List<Mediapipe.Tasks.Components.Containers.Detection> detections)
    {
        Mediapipe.Tasks.Components.Containers.Detection bestDetection = default;
        float bestScore = 0f;
        bool foundValidDetection = false;
        
        foreach (var detection in detections)
        {
            if (detection.categories != null && detection.categories.Count > 0)
            {
                var category = detection.categories[0];
                float confidence = category.score;
                
                // Filter out persons and low confidence detections
                if (confidence >= objectDetectionThreshold && 
                    !category.categoryName.ToLower().Contains("person") &&
                    confidence > bestScore)
                {
                    bestDetection = detection;
                    bestScore = confidence;
                    foundValidDetection = true;
                }
            }
        }
        
        return foundValidDetection ? bestDetection : default;
    }
    
    /// <summary>
    /// Converts bounding box center to world position
    /// </summary>
    private Vector3 ConvertBoundingBoxToWorldPosition(Mediapipe.Tasks.Components.Containers.Rect boundingBox)
    {
        // Calculate center of bounding box using left, top, right, bottom
        float centerX = (boundingBox.left + boundingBox.right) / 2f;
        float centerY = (boundingBox.top + boundingBox.bottom) / 2f;
        
        // Convert to normalized coordinates (0-1)
        float normalizedX = centerX;
        float normalizedY = centerY;
        
        // Convert to world coordinates using separate X/Y scaling
        Vector3 worldPosition = new Vector3(
            (normalizedX - 0.5f) * xAxisMultiplier,   // Scale and center X
            (0.5f - normalizedY) * yAxisMultiplier,   // Scale and center Y (flip Y)
            1.5f                                       // Fixed Z depth for objects
        );
        
        // Clamp coordinates
        float maxRangeX = xAxisMultiplier + 1f;
        float maxRangeY = yAxisMultiplier + 1f;
        worldPosition.x = Mathf.Clamp(worldPosition.x, -maxRangeX, maxRangeX);
        worldPosition.y = Mathf.Clamp(worldPosition.y, -maxRangeY, maxRangeY);
        worldPosition.z = Mathf.Clamp(worldPosition.z, 0.5f, 5f);
        
        return worldPosition;
    }
    
    /// <summary>
    /// Processes queued object positions on the main thread
    /// </summary>
    private void ProcessQueuedObjectPositions()
    {
        if (hasNewObjectPosition && objectPositions.TryDequeue(out Vector3 objectPosition))
        {
            hasNewObjectPosition = false;
            
            // Validate position to prevent extreme jumps
            if (lastValidPosition != Vector3.zero && Vector3.Distance(objectPosition, lastValidPosition) > maxPositionJump)
            {
                // Position jump too large, use smoothed position instead
                objectPosition = objectSmoothedPosition;
            }
            
            // Apply smoothing to reduce flickering
            if (objectPosition != Vector3.zero)
            {
                objectSmoothedPosition = Vector3.Lerp(objectSmoothedPosition, objectPosition, smoothingFactor);
                lastValidPosition = objectPosition;
            }
            else
            {
                objectSmoothedPosition = Vector3.Lerp(objectSmoothedPosition, Vector3.zero, smoothingFactor * 2f);
            }
            
            // Update tracked cube
            if (trackedCube != null)
            {
                trackedCube.transform.position = objectSmoothedPosition;
            }
            else
            {
                Debug.LogWarning("Tracked cube not assigned! Please assign a cube in the Inspector.");
            }
        }
    }
    
    [ContextMenu("Create Test Cube")]
    void CreateTestCube()
    {
        if (trackedCube == null)
        {
            GameObject cube = GameObject.CreatePrimitive(PrimitiveType.Cube);
            cube.name = "TrackedCube";
            cube.transform.position = Vector3.zero;
            
            // Make it colorful and visible
            var renderer = cube.GetComponent<Renderer>();
            renderer.material.color = UnityEngine.Color.green;
            
            trackedCube = cube;
            Debug.Log("Test cube created and assigned for tracking!");
        }
        else
        {
            Debug.Log("Tracked cube already exists!");
        }
    }
  }
}
