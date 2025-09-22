using UnityEngine;

/// <summary>
/// Simple test script to verify particle system setup and positioning
/// </summary>
public class WristParticleTester : MonoBehaviour
{
    [Header("Test Settings")]
    [SerializeField] private bool enableTestMode = false;
    [SerializeField] private float testRadius = 2f;
    [SerializeField] private float testSpeed = 1f;
    
    [Header("Particle Systems to Test")]
    [SerializeField] private ParticleSystem leftWristParticles;
    [SerializeField] private ParticleSystem rightWristParticles;
    
    private float time = 0f;
    
    void Update()
    {
        if (enableTestMode)
        {
            TestParticleMovement();
        }
    }
    
    void TestParticleMovement()
    {
        time += Time.deltaTime * testSpeed;
        
        // Create circular test movement
        Vector3 leftTestPos = new Vector3(
            Mathf.Sin(time) * testRadius,
            Mathf.Cos(time) * testRadius,
            0f
        );
        
        Vector3 rightTestPos = new Vector3(
            Mathf.Sin(time + Mathf.PI) * testRadius,
            Mathf.Cos(time + Mathf.PI) * testRadius,
            0f
        );
        
        // Update particle positions
        if (leftWristParticles != null)
        {
            leftWristParticles.transform.position = leftTestPos;
            if (!leftWristParticles.isPlaying)
            {
                leftWristParticles.Play();
            }
        }
        
        if (rightWristParticles != null)
        {
            rightWristParticles.transform.position = rightTestPos;
            if (!rightWristParticles.isPlaying)
            {
                rightWristParticles.Play();
            }
        }
        
        // Debug output
        if (Time.frameCount % 60 == 0) // Every second at 60fps
        {
            Debug.Log($"Test - Left: {leftTestPos}, Right: {rightTestPos}");
        }
    }
    
    [ContextMenu("Test Particle Systems")]
    public void TestParticleSystems()
    {
        Debug.Log("=== Particle System Test ===");
        
        if (leftWristParticles == null)
        {
            Debug.LogError("Left wrist particles not assigned!");
        }
        else
        {
            Debug.Log($"Left particles: {leftWristParticles.name} at {leftWristParticles.transform.position}");
            Debug.Log($"Left particles playing: {leftWristParticles.isPlaying}");
        }
        
        if (rightWristParticles == null)
        {
            Debug.LogError("Right wrist particles not assigned!");
        }
        else
        {
            Debug.Log($"Right particles: {rightWristParticles.name} at {rightWristParticles.transform.position}");
            Debug.Log($"Right particles playing: {rightWristParticles.isPlaying}");
        }
    }
    
    [ContextMenu("Create Test Particles")]
    public void CreateTestParticles()
    {
        // Create left test particles
        GameObject leftGO = new GameObject("LeftTestParticles");
        leftGO.transform.SetParent(transform);
        leftWristParticles = leftGO.AddComponent<ParticleSystem>();
        ConfigureTestParticles(leftWristParticles, Color.blue);
        
        // Create right test particles
        GameObject rightGO = new GameObject("RightTestParticles");
        rightGO.transform.SetParent(transform);
        rightWristParticles = rightGO.AddComponent<ParticleSystem>();
        ConfigureTestParticles(rightWristParticles, Color.red);
        
        Debug.Log("Test particle systems created!");
    }
    
    void ConfigureTestParticles(ParticleSystem ps, Color color)
    {
        var main = ps.main;
        main.startColor = color;
        main.startSize = 0.2f;
        main.maxParticles = 50;
        
        var emission = ps.emission;
        emission.rateOverTime = 20f;
        
        var shape = ps.shape;
        shape.enabled = true;
        shape.shapeType = ParticleSystemShapeType.Circle;
        shape.radius = 0.1f;
        
        ps.Play();
    }
}
