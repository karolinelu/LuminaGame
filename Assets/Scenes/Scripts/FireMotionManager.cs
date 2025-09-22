using UnityEngine;

public class FireMotionController : MonoBehaviour
{
    [Header("Fire Components")]
    public ParticleSystem fireParticles;
    public Light fireLight;
    public AudioSource fireAudio;
    
    [Header("Motion Response Settings")]
    public float minIntensity = 0.1f;
    public float maxIntensity = 3f;
    public float intensityMultiplier = 2f;
    
    [Header("Particle Settings")]
    public float baseEmissionRate = 10f;
    public float maxEmissionRate = 100f;
    public float baseStartSpeed = 1f;
    public float maxStartSpeed = 5f;
    
    [Header("Light Settings")]
    public float baseLightIntensity = 1f;
    public float maxLightIntensity = 3f;
    public Color baseColor = Color.red;
    public Color intenseColor = Color.white;
    
    [Header("Audio Settings")]
    public float baseVolume = 0.3f;
    public float maxVolume = 0.8f;
    public float basePitch = 1f;
    public float maxPitch = 1.5f;
    
    private MotionDetectionManager motionManager;
    private ParticleSystem.EmissionModule emissionModule;
    private ParticleSystem.MainModule mainModule;
    
    void Start()
    {
        // Find the motion detection manager
        motionManager = FindObjectOfType<MotionDetectionManager>();
        
        if (motionManager == null)
        {
            Debug.LogError("MotionDetectionManager not found! Please add it to your scene.");
            return;
        }
        
        // Subscribe to motion events
        motionManager.OnMotionIntensityChanged += OnMotionDetected;
        
        // Get particle system modules
        if (fireParticles != null)
        {
            emissionModule = fireParticles.emission;
            mainModule = fireParticles.main;
        }
        
        // Set initial values
        SetFireIntensity(0f);
    }
    
    void OnDestroy()
    {
        // Unsubscribe from events
        if (motionManager != null)
        {
            motionManager.OnMotionIntensityChanged -= OnMotionDetected;
        }
    }
    
    void OnMotionDetected(float motionIntensity)
    {
        // Normalize the intensity
        float normalizedIntensity = Mathf.Clamp(motionIntensity * intensityMultiplier, minIntensity, maxIntensity) / maxIntensity;
        
        SetFireIntensity(normalizedIntensity);
    }
    
    void SetFireIntensity(float intensity)
    {
        // Update particle system
        if (fireParticles != null)
        {
            // Emission rate
            float emissionRate = Mathf.Lerp(baseEmissionRate, maxEmissionRate, intensity);
            emissionModule.rateOverTime = emissionRate;
            
            // Particle speed
            float startSpeed = Mathf.Lerp(baseStartSpeed, maxStartSpeed, intensity);
            mainModule.startSpeed = startSpeed;
            
            // Particle color (optional)
            Color currentColor = Color.Lerp(baseColor, intenseColor, intensity);
            mainModule.startColor = currentColor;
        }
        
        // Update light
        if (fireLight != null)
        {
            float lightIntensity = Mathf.Lerp(baseLightIntensity, maxLightIntensity, intensity);
            fireLight.intensity = lightIntensity;
            
            Color lightColor = Color.Lerp(baseColor, intenseColor, intensity);
            fireLight.color = lightColor;
        }
        
        // Update audio
        if (fireAudio != null)
        {
            float volume = Mathf.Lerp(baseVolume, maxVolume, intensity);
            float pitch = Mathf.Lerp(basePitch, maxPitch, intensity);
            
            fireAudio.volume = volume;
            fireAudio.pitch = pitch;
            
            // Start audio if there's motion, stop if no motion
            if (intensity > 0.1f && !fireAudio.isPlaying)
            {
                fireAudio.Play();
            }
            else if (intensity <= 0.1f && fireAudio.isPlaying)
            {
                fireAudio.Stop();
            }
        }
    }
    
    // Manual testing method - you can call this from inspector or other scripts
    [ContextMenu("Test Fire Intensity")]
    public void TestFireIntensity()
    {
        float testIntensity = Random.Range(0f, 1f);
        SetFireIntensity(testIntensity);
        Debug.Log($"Testing fire with intensity: {testIntensity}");
    }
}