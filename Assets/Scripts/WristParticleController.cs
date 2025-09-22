using UnityEngine;

/// <summary>
/// Helper script to create and configure particle systems for wrist tracking
/// </summary>
public class WristParticleController : MonoBehaviour
{
    [Header("Particle System Settings")]
    [SerializeField] private Color leftWristColor = Color.blue;
    [SerializeField] private Color rightWristColor = Color.red;
    [SerializeField] private float particleSize = 0.1f;
    [SerializeField] private int maxParticles = 100;
    [SerializeField] private float emissionRate = 50f;
    
    [Header("Auto Setup")]
    [SerializeField] private bool autoSetupOnStart = true;
    
    private ParticleSystem leftWristParticles;
    private ParticleSystem rightWristParticles;
    
    void Start()
    {
        if (autoSetupOnStart)
        {
            SetupParticleSystems();
        }
    }
    
    /// <summary>
    /// Creates and configures particle systems for both wrists
    /// </summary>
    public void SetupParticleSystems()
    {
        // Create left wrist particle system
        GameObject leftWristGO = new GameObject("LeftWristParticles");
        leftWristGO.transform.SetParent(transform);
        leftWristParticles = leftWristGO.AddComponent<ParticleSystem>();
        ConfigureParticleSystem(leftWristParticles, leftWristColor);
        
        // Create right wrist particle system
        GameObject rightWristGO = new GameObject("RightWristParticles");
        rightWristGO.transform.SetParent(transform);
        rightWristParticles = rightWristGO.AddComponent<ParticleSystem>();
        ConfigureParticleSystem(rightWristParticles, rightWristColor);
        
        Debug.Log("Particle systems created for wrist tracking");
    }
    
    /// <summary>
    /// Configures a particle system with the specified color
    /// </summary>
    private void ConfigureParticleSystem(ParticleSystem ps, Color color)
    {
        var main = ps.main;
        main.startColor = color;
        main.startSize = particleSize;
        main.maxParticles = maxParticles;
        
        var emission = ps.emission;
        emission.rateOverTime = emissionRate;
        
        var shape = ps.shape;
        shape.enabled = true;
        shape.shapeType = ParticleSystemShapeType.Circle;
        shape.radius = 0.1f;
        
        var velocityOverLifetime = ps.velocityOverLifetime;
        velocityOverLifetime.enabled = true;
        velocityOverLifetime.space = ParticleSystemSimulationSpace.Local;
        velocityOverLifetime.y = new ParticleSystem.MinMaxCurve(-1f, 1f);
        
        // Start with particles stopped
        ps.Stop();
    }
    
    /// <summary>
    /// Gets the left wrist particle system
    /// </summary>
    public ParticleSystem GetLeftWristParticles()
    {
        return leftWristParticles;
    }
    
    /// <summary>
    /// Gets the right wrist particle system
    /// </summary>
    public ParticleSystem GetRightWristParticles()
    {
        return rightWristParticles;
    }
    
    /// <summary>
    /// Updates particle system colors
    /// </summary>
    public void UpdateColors(Color leftColor, Color rightColor)
    {
        if (leftWristParticles != null)
        {
            var main = leftWristParticles.main;
            main.startColor = leftColor;
        }
        
        if (rightWristParticles != null)
        {
            var main = rightWristParticles.main;
            main.startColor = rightColor;
        }
    }
}
