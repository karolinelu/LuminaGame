﻿#ifndef MATH_HLSL
#define MATH_HLSL

#define PI 3.14159265359
#define TAU 6.2831853071795862

#define DEG2RAD PI / 180.0

// Alternative to smoothstep.

float InverseLerpUnclamped(float min, float max, float value)
{
    return (value - min) / (max - min);
}
float InverseLerp(float min, float max, float value)
{
    return saturate(InverseLerpUnclamped(min, max, value));
}

// Get rotation matrix from Euler angle(s) in RADIANS.
// Use DEG2RAD to convert degrees if using them for easy reading.

float2x2 GetRotationMatrix(float angle)
{
    float s = sin(angle);
    float c = cos(angle);
    
    return float2x2(c, -s, s, c);
}
float3x3 GetRotationMatrix(float3 angles)
{
    float3 c = cos(angles);
    float3 s = sin(angles);
    
    float3x3 rotX = float3x3(
        1.0, 0.0, 0.0,
        0.0, c.x, -s.x,
        0.0, s.x, c.x
    );

    float3x3 rotY = float3x3(
         c.y, 0.0, -s.y,
         0.0, 1.0, 0.0,
         s.y, 0.0, c.y
    );

    float3x3 rotZ = float3x3(
         c.z, -s.z, 0.0,
         s.z, c.z, 0.0,
         0.0, 0.0, 1.0
    );
    
    return mul(rotZ, mul(rotY, rotX));
}

float2 RotatePoint(float2 p, float angle)
{
    return mul(GetRotationMatrix(angle), p);
}
float3 RotatePoint(float3 p, float3 rotation)
{
    return mul(GetRotationMatrix(rotation), p);
}

// Twist around Y axis (2D).

void TwistY_float(float2 position, float2 center, float angle, out float2 output)
{
    // Translate position to the center.
    
    position -= center;
    
    // Calculate the twist angle based on the distance from the center.
    
    float distance = length(position);
    float twistAngle = angle * distance;

    // Apply twist transformation.
    
    float sinAngle = sin(twistAngle);
    float cosAngle = cos(twistAngle);
    
    float2 twistedPosition = float2(
    
        position.x * cosAngle - position.y * sinAngle,
        position.x * sinAngle + position.y * cosAngle
    
    );
    
    // Translate position back (prev. centered).
    
    twistedPosition += center;
    
    output = twistedPosition;
}

// Twist around Y axis (3D).

//void TwistY_float(float3 position, float3 offset, float angle, out float3 output)
//{
//    position -= offset;
    
//    // Calculate the twist angle based on the distance from the Y axis.
    
//    float distance = length(position.xz);
//    float twistAngle = angle * distance;

//    // Apply twist transformation.
    
//    float sinAngle = sin(twistAngle);
//    float cosAngle = cos(twistAngle);
    
//    float3 twistedPosition = float3(
    
//        position.x * cosAngle - position.z * sinAngle,
//        position.y,
//        position.x * sinAngle + position.z * cosAngle
    
//    );
    
//    twistedPosition += offset;

//    output = twistedPosition;
//}

void TwistXZ_float(float3 position, float angle, out float3 output)
{
    angle = position.y * angle;
    
    float cosAngle = cos(angle);
    float sinAngle = sin(angle);
    
    float3 twistedPosition;
        
    /*

    Input: position = (1, 0, 0), angle = π/2.
    Expected output: (0, 0, 1) after a 90° twist.

    */
    
    twistedPosition.x = (position.x * cosAngle) - (position.z * sinAngle);
    twistedPosition.y = position.y;
    twistedPosition.z = (position.x * sinAngle) + (position.z * cosAngle);

    output = twistedPosition;
}

// Simple polar coordinates.

void PolarCoordinates_float(float2 position, out float2 output)
{
    // Distance, angle.
    
    float x = length(position);
    float y = atan2(position.y, position.x);
    
    output = float2(x, y);
}

// Unity-like polar coordinates.

void PolarCoordinates2_float(float2 position, out float2 output)
{
    // Distance, angle.
    
    float x = length(position) * 2.0;
    float y = atan2(position.x, position.y) * (1.0 / TAU);
    
    output = float2(x, y);
}

// Straightforward spherical coordinates.

void SphericalCoordinates_float(float3 position, out float3 output)
{
    // Distance, elevation, azimuth.
    
    float x = length(position);
    float y = acos(position.z / x);
    
    // 2D atan2(y, z) -> 3D atan2(z, x).
    
    float z = atan2(position.z, position.x);
    
    output = float3(x, y, z);
}

// Spherize/bulge/pinch UVs.
// https://docs.unity3d.com/Packages/com.unity.shadergraph@17.0/manual/Spherize-Node.html

void SpherizeUnity_float(float2 uv, float2 center, float radius, float strength, out float2 output)
{
    float2 offset = 0.0;

    float2 delta = uv - center;
    float delta2 = dot(delta.xy, delta.xy);
    float delta4 = delta2 * delta2;
    
    float2 delta_offset = delta4 * strength;
    
    output = uv + delta * delta_offset + offset;
}

void Spherize_float(float2 uv, float2 center, float radius, float strength, out float2 output)
{
    float2 offset = uv - center;
    float distance = length(offset);

    if (distance < radius)
    {
        // Normalized distance.
        // Apply 'bulge' strength.
        
        float bulge = 1.0 - (distance / radius); 
        bulge = pow(bulge, -strength);
        
        // Expand UVs.
        
        offset *= 1.0 + bulge;
    }

    output = center + offset;
}

#endif