// Made with Amplify Shader Editor v1.9.7.1
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Mirza/Solaris"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[Tooltip(Allow lighting to affect the surface, from a single directional light and any number of additional lights.)]_StartFoldoutLighting("Start Foldout Lighting", Float) = 0
		[Space(5)]_LambertLightingNormalfromHeight("Lambert Lighting Normal from Height", Float) = 1
		[Header(Main Light)][Space(5)][Toggle(_MAINLIGHTENABLED_ON)] _MainLightEnabled("Main Light Enabled", Float) = 0
		[Space(5)]_MainLight("Main Light", Range( 0 , 1)) = 1
		[Toggle(_MAINLIGHTFLATENABLED_ON)] _MainLightFlatEnabled("Main Light Flat Enabled", Float) = 1
		[Toggle(_MAINLIGHTLAMBERTENABLED_ON)] _MainLightLambertEnabled("Main Light Lambert Enabled", Float) = 0
		_MainLightFlatLambertBlend("Main Light Flat-Lambert Blend", Range( 0 , 1)) = 0.5
		_MainLightLambertTranslucency("Main Light Lambert Translucency", Range( 0 , 1)) = 1
		_MainLightLambertTranslucencyMask("Main Light Lambert Translucency Mask", Range( 0 , 10)) = 0
		_MainLightAnisotropy("Main Light Anisotropy", Range( 0 , 1)) = 0.8
		_MainLightAnisotropyBlend("Main Light Anisotropy Blend", Range( 0 , 1)) = 0
		[Space(5)]_MainLightShadow("Main Light Shadow", Range( 0 , 1)) = 1
		_MainLightShadowWorldNoise("Main Light Shadow World Noise", Range( 0 , 1)) = 0
		_MainLightShadowDirectionalNoise("Main Light Shadow Directional Noise", Range( 0 , 1)) = 0
		_MainLightShadowOrthogonalAlignmentWorldNoise("Main Light Shadow Orthogonal Alignment World Noise", Range( 0 , 1)) = 0
		_MainLightShadowDirectionalAlignmentNoise("Main Light Shadow Directional Alignment Noise", Range( 0 , 1)) = 0
		[Toggle(_MAINLIGHTTRANSPARENCYSHADOWENABLED_ON)] _MainLightTransparencyShadowEnabled("Main Light Transparency Shadow Enabled", Float) = 0
		_MainLightTransparencyShadow("Main Light Transparency Shadow", Range( 0 , 1)) = 1
		[Header(Additional Lights)][Space(5)][Toggle(_ADDITIONALLIGHTSENABLED_ON)] _AdditionalLightsEnabled("Additional Lights Enabled", Float) = 0
		[Space(5)]_AdditionalLights("Additional Lights", Range( 0 , 1)) = 1
		[Toggle(_ADDITIONALLIGHTSFLATENABLED_ON)] _AdditionalLightsFlatEnabled("Additional Lights Flat Enabled", Float) = 1
		[Toggle(_ADDITIONALLIGHTSLAMBERTENABLED_ON)] _AdditionalLightsLambertEnabled("Additional Lights Lambert Enabled", Float) = 0
		[Space(5)]_AdditionalLightsFlatLambertBlend("Additional Lights Flat-Lambert Blend", Range( 0 , 1)) = 0.5
		_AdditionalLightsLambertTranslucency("Additional Lights Lambert Translucency", Range( 0 , 1)) = 1
		_AdditionalLightsLambertTranslucencyMask("Additional Lights Lambert Translucency Mask", Range( 0 , 10)) = 0
		[Header(Additional Lights Shadow)][Space(5)]_AdditionalLightsShadow("Additional Lights Shadow", Range( 0 , 1)) = 1
		_AdditionalLightsShadowWorldNoise("Additional Lights Shadow World Noise", Range( 0 , 1)) = 0
		_AdditionalLightsShadowDirectionalNoise("Additional Lights Shadow Directional Noise", Range( 0 , 1)) = 0
		_AdditionalLightsShadowOrthogonalAlignmentWorldNoise("Additional Lights Shadow Orthogonal Alignment World Noise", Range( 0 , 1)) = 0
		_AdditionalLightsShadowDirectionalAlignmentNoise("Additional Lights Shadow Directional Alignment Noise", Range( 0 , 1)) = 0
		[Toggle(_ADDITIONALLIGHTSTRANSPARENCYSHADOWENABLED_ON)] _AdditionalLightsTransparencyShadowEnabled("Additional Lights Transparency Shadow Enabled", Float) = 0
		_AdditionalLightsTransparencyShadow("Additional Lights Transparency Shadow", Range( 0 , 1)) = 1
		_EndFoldoutLighting("End Foldout Lighting", Float) = 0
		_StartFoldoutBaseUVs("Start Foldout Base UVs", Float) = 0
		[Header(Base UVs)][Space(5)][Toggle(_SWAPUVXY_ON)] _SwapUVXY("Swap UV XY", Float) = 0
		[Toggle(_WORLDSPACEUVS_ON)] _WorldSpaceUVs("World Space UVs", Float) = 0
		[Toggle(_OBJECTSPACEUVS_ON)] _ObjectSpaceUVs("Object Space UVs", Float) = 0
		[Space(5)]_UVSampleNoise("UV Sample Noise", Range( 0 , 1)) = 0
		_EndFoldoutBaseUVs("End Foldout Base UVs", Float) = 0
		_StartFoldoutParticleSettings("Start Foldout Particle Settings", Float) = 0
		[Header(Particle Settings)][Space(5)]_ParticleRandomization("Particle Randomization", Range( 0 , 1)) = 1
		_ParticleSubtractNoiseoverLifetime("Particle Subtract Noise over Lifetime", Range( 0 , 1)) = 0
		_EndFoldoutParticleSettings("End Foldout Particle Settings", Float) = 0
		[HideInInspector]_StartFoldoutColour("Start Foldout Colour", Float) = 0
		[HDR][Header(Colour)][Space(5)]_ColourA("Colour A", Color) = (1,0.1254902,0,1)
		[HDR]_ColourB("Colour B", Color) = (1,0.02745098,0,1)
		_ColourPower("Colour Power", Float) = 1
		_ColourHueShift("Colour Hue Shift", Range( -1 , 1)) = 0
		_ColourSaturationShift("Colour Saturation Shift", Range( -1 , 1)) = 0
		_ColourValueMultiplier("Colour Value Multiplier", Float) = 5
		_Alpha("Alpha", Range( 0 , 1)) = 1
		[HideInInspector]_EndFoldoutColour("End Foldout Colour", Float) = 0
		[HideInInspector]_StartFoldoutVerticalColour("Start Foldout Vertical Colour", Float) = 0
		[Header(Vertical Colour)][Space(5)][Toggle(_VERTICALCOLOUR_ON)] _VerticalColour("Vertical Colour", Float) = 0
		[HDR]_VerticalColourA("Vertical Colour A", Color) = (0,0.5019608,1,1)
		[HDR]_VerticalColourB("Vertical Colour B", Color) = (0,0,1,1)
		_VerticalColourHueShift("Vertical Colour Hue Shift", Range( -1 , 1)) = 0
		_VerticalColourSaturationShift("Vertical Colour Saturation Shift", Range( -1 , 1)) = 0
		_VerticalColourValueMultiplier("Vertical Colour Value Multiplier", Float) = 5
		[Header(Vertical Colour Mask)][Space(5)]_VerticalColourMaskPower("Vertical Colour Mask Power", Float) = 1
		_VerticalColourMaskRemapMin("Vertical Colour Mask Remap Min", Range( 0 , 1)) = 0.5
		_VerticalColourMaskRemapMax("Vertical Colour Mask Remap Max", Range( 0 , 1)) = 0.1
		[HideInInspector]_EndFoldoutVerticalColour("End Foldout Vertical Colour", Float) = 0
		[HideInInspector]_StartFoldoutNoise("Start Foldout Noise", Float) = 0
		[Header(Noise)][Space(5)]_Noise("Noise", Range( 0 , 1)) = 1
		_NoiseScale("Noise Scale", Float) = 2
		_NoiseTiling("Noise Tiling", Vector) = (1.5,1,1,0)
		_NoiseAnimation("Noise Animation", Vector) = (0,4,1,0)
		_NoiseParticleAnimation("Noise Particle Animation", Vector) = (0,0,0,0)
		_NoiseOffset("Noise Offset", Vector) = (0,0,0,0)
		[IntRange]_NoiseOctaves("Noise Octaves", Range( 1 , 8)) = 1
		_NoiseDilation("Noise Dilation", Range( 0 , 0.1)) = 0.004
		[Toggle(_NOISEDILATIONENABLED_ON)] _NoiseDilationEnabled("Noise Dilation Enabled", Float) = 0
		_NoisePower("Noise Power", Float) = 0.5
		_NoiseRemapMin("Noise Remap Min", Range( 0 , 1)) = 0
		_NoiseRemapMax("Noise Remap Max", Range( 0 , 1)) = 1
		[Space(5)]_NoiseParallaxOffset("Noise Parallax Offset", Float) = 0
		[Space(5)]_NoiseXZTwist("Noise XZ Twist", Range( -360 , 360)) = 0
		[Toggle(_NOISEXZTWISTENABLED_ON)] _NoiseXZTwistEnabled("Noise XZ Twist Enabled", Float) = 0
		[Space(5)]_NoiseUVYPreOffset("Noise UV Y Pre-Offset", Float) = 0
		_NoiseUVYPreScale("Noise UV Y Pre-Scale", Float) = 1
		_NoiseUVYPrePower("Noise UV Y Pre-Power", Float) = 1
		[HideInInspector]_EndFoldoutNoise("End Foldout Noise", Float) = 0
		[HideInInspector]_StartFoldoutNoiseDistortion("Start Foldout Noise Distortion", Float) = 0
		[Header(Noise Distortion)][Space(5)]_NoiseDistortion("Noise Distortion", Range( 0 , 1)) = 0.05
		[Toggle(_NOISEDISTORTIONENABLED_ON)] _NoiseDistortionEnabled("Noise Distortion Enabled", Float) = 0
		_NoiseDistortionScale("Noise Distortion Scale", Float) = 1
		_NoiseDistortionTiling("Noise Distortion Tiling", Vector) = (1.5,1,1,0)
		_NoiseDistortionAnimation("Noise Distortion Animation", Vector) = (0,1,0,0)
		_NoiseDistortionParticleAnimation("Noise Distortion Particle Animation", Vector) = (0,0,0,0)
		_NoiseDistortionOffset("Noise Distortion Offset", Vector) = (0,0,0,0)
		[IntRange]_NoiseDistortionOctaves("Noise Distortion Octaves", Range( 1 , 8)) = 1
		_NoiseDistortionDilation("Noise Distortion Dilation", Range( 0 , 0.1)) = 0.004
		[Toggle(_NOISEDISTORTIONDILATIONENABLED_ON)] _NoiseDistortionDilationEnabled("Noise Distortion Dilation Enabled", Float) = 0
		_NoiseDistortionPower("Noise Distortion Power", Float) = 1
		[HideInInspector]_EndFoldoutNoiseDistortion("End Foldout Noise Distortion", Float) = 0
		[HideInInspector]_StartFoldoutRadialMask("Start Foldout Radial Mask", Float) = 0
		[Header(Radial Mask)][Space(5)][Toggle(_RADIALMASK_ON)] _RadialMask("Radial Mask", Float) = 1
		[Toggle(_RADIALMASKSUBTRACTIVE_ON)] _RadialMaskSubtractive("Radial Mask Subtractive", Float) = 1
		[Space(10)]_RadialMaskRadius("Radial Mask Radius", Range( 0 , 1)) = 1
		_RadialMaskRadiusOverParticleLifetime("Radial Mask Radius over Particle Lifetime", Range( 0 , 1)) = 0
		_RadialMaskFeather("Radial Mask Feather", Range( 0 , 2)) = 1
		_RadialMaskPower("Radial Mask Power", Float) = 1
		_RadialMaskTiling("Radial Mask Tiling", Vector) = (1.5,1,0,0)
		_RadialMaskOffset("Radial Mask Offset", Vector) = (0,0,0,0)
		[HideInInspector]_EndFoldoutRadialMask("End Foldout Radial Mask", Float) = 0
		[HideInInspector]_StartFoldoutRadialMaskDistortion("Start Foldout Radial Mask Distortion", Float) = 0
		[Header(Radial Mask Distortion)][Space(5)]_RadialMaskDistortion("Radial Mask Distortion", Range( 0 , 1)) = 0.05
		[Toggle(_RADIALMASKDISTORTIONENABLED_ON)] _RadialMaskDistortionEnabled("Radial Mask Distortion Enabled", Float) = 0
		_RadialMaskDistortionScale("Radial Mask Distortion Scale", Float) = 2
		_RadialMaskDistortionTiling("Radial Mask Distortion Tiling", Vector) = (1.5,1,1,0)
		_RadialMaskDistortionAnimation("Radial Mask Distortion Animation", Vector) = (0,2,0,0)
		_RadialMaskDistortionParticleAnimation("Radial Mask Distortion Particle Animation", Vector) = (0,0,0,0)
		_RadialMaskDistortionOffset("Radial Mask Distortion Offset", Vector) = (0,0,0,0)
		[IntRange]_RadialMaskDistortionOctaves("Radial Mask Distortion Octaves", Range( 1 , 8)) = 1
		_RadialMaskDistortionDilation("Radial Mask Distortion Dilation", Range( 0 , 0.1)) = 0.004
		[Toggle(_RADIALMASKDISTORTIONDILATIONENABLED_ON)] _RadialMaskDistortionDilationEnabled("Radial Mask Distortion Dilation Enabled", Float) = 0
		_RadialMaskDistortionPower("Radial Mask Distortion Power", Float) = 1
		[HideInInspector]_EndFoldoutRadialMaskDistortion("End Foldout Radial Mask Distortion", Float) = 0
		[HideInInspector]_StartFoldoutVerticalMasks("Start Foldout Vertical Masks", Float) = 0
		[Header(Vertical Masks)][Space(5)][Toggle(_VERTICALMASKSOBJECTSPACE_ON)] _VerticalMasksObjectSpace("Vertical Masks Object Space", Float) = 1
		[Header(Vertical Mask 1)][Space(5)][Toggle(_VERTICALMASK1_ON)] _VerticalMask1("Vertical Mask 1", Float) = 0
		[Toggle(_VERTICALMASK1SUBTRACTIVE_ON)] _VerticalMask1Subtractive("Vertical Mask 1 Subtractive", Float) = 0
		[Space(5)]_VerticalMask1Power("Vertical Mask 1 Power", Float) = 1
		_VerticalMask1RemapMin("Vertical Mask 1 Remap Min", Range( 0 , 1)) = 0
		_VerticalMask1RemapMax("Vertical Mask 1 Remap Max", Range( 0 , 1)) = 1
		_VerticalMask1ObjectSpaceScale("Vertical Mask 1 Object Space Scale", Float) = 2
		_VerticalMask1ObjectSpaceOffset("Vertical Mask 1 Object Space Offset", Float) = -1
		[Header(Vertical Mask 2)][Space(5)][Toggle(_VERTICALMASK2_ON)] _VerticalMask2("Vertical Mask 2", Float) = 0
		[Toggle(_VERTICALMASK2SUBTRACTIVE_ON)] _VerticalMask2Subtractive("Vertical Mask 2 Subtractive", Float) = 0
		[Space(5)]_VerticalMask2Power("Vertical Mask 2 Power", Float) = 1
		_VerticalMask2RemapMin("Vertical Mask 2 Remap Min", Range( 0 , 1)) = 0
		_VerticalMask2RemapMax("Vertical Mask 2 Remap Max", Range( 0 , 1)) = 1
		_VerticalMask2ObjectSpaceScale("Vertical Mask 2 Object Space Scale", Float) = 2
		_VerticalMask2ObjectSpaceOffset("Vertical Mask 2 Object Space Offset", Float) = -1
		[HideInInspector]_EndFoldoutVerticalMasks("End Foldout Vertical Masks", Float) = 0
		[HideInInspector]_StartFoldoutSpherizeNoise("Start Foldout Spherize Noise", Float) = 0
		[Header(Spherize Noise)][Space(5)][Toggle(_SPHERIZENOISE_ON)] _SpherizeNoise("Spherize Noise", Float) = 0
		_SpherizeNoiseRadius("Spherize Noise Radius", Float) = 0.5
		_SpherizeNoiseStrength("Spherize Noise Strength", Float) = 1
		_SpherizeNoiseOffset("Spherize Noise Offset", Vector) = (0,0,0,0)
		[HideInInspector]_EndFoldoutSpherizeNoise("End Foldout Spherize Noise", Float) = 0
		[HideInInspector]_StartFoldoutFresnelMask("Start Foldout Fresnel Mask", Float) = 0
		[Header(Fresnel Mask)][Space(5)]_FresnelMask("Fresnel Mask", Range( 0 , 1)) = 0
		_FresnelMaskPower("Fresnel Mask Power", Float) = 2
		_FresnelMaskRemapMin("Fresnel Mask Remap Min", Range( 0 , 1)) = 0
		_FresnelMaskRemapMax("Fresnel Mask Remap Max", Range( 0 , 1)) = 1
		[HideInInspector]_EndFoldoutFresnelMask("End Foldout Fresnel Mask", Float) = 0
		[HideInInspector]_StartFoldoutDepthFade("Start Foldout Depth Fade", Float) = 0
		[Header(Depth Fade)][Space(5)]_DepthFade("Depth Fade", Float) = 0
		_DepthFadePower("Depth Fade Power", Float) = 1
		[Toggle(_INVERTDEPTHFADE_ON)] _InvertDepthFade("Invert Depth Fade", Float) = 0
		[Space(5)]_SubtractiveDepthFade("Subtractive Depth Fade", Float) = 0
		_SubtractiveDepthFadePower("Subtractive Depth Fade Power", Float) = 1
		[Header(Camera Depth Fade)][Space(5)]_CameraDepthFadeLength("Camera Depth Fade Length", Float) = 0
		_CameraDepthFadeOffset("Camera Depth Fade Offset", Float) = 0
		_CameraDepthFadePower("Camera Depth Fade Power", Float) = 1
		[HideInInspector]_EndFoldoutDepthFade("End Foldout Depth Fade", Float) = 0
		[HideInInspector]_StartFoldoutIntersectionHighlight("Start Foldout Intersection Highlight", Float) = 0
		[Header(Intersection Highlight)][Space(5)]_IntersectionHighlight("Intersection Highlight", Float) = 0
		_IntersectionHighlightPower("Intersection Highlight Power", Float) = 1
		_IntersectionHighlightRemapMin("Intersection Highlight Remap Min", Range( 0 , 1)) = 0
		_IntersectionHighlightRemapMax("Intersection Highlight Remap Max", Range( 0 , 1)) = 1
		_IntersectionHighlightShadowMaskPower("Intersection Highlight Shadow Mask Power", Range( 0.01 , 4)) = 1
		[Header(Intersection Highlight Colour)][Space(5)]_IntersectionHighlightColour("Intersection Highlight Colour", Color) = (1,1,1,1)
		_IntersectionHighlightColourHueShift("Intersection Highlight Colour Hue Shift", Range( -1 , 1)) = 0
		_IntersectionHighlightColourSaturationShift("Intersection Highlight Colour Saturation Shift", Range( -1 , 1)) = 0
		_IntersectionHighlightColourValueMultiplier("Intersection Highlight Colour Value Multiplier", Float) = 5
		[HideInInspector]_EndFoldoutIntersectionHighlight("End Foldout Intersection Highlight", Float) = 0
		[HideInInspector]_StartFoldoutVertexUVOffset("Start Foldout Vertex UV Offset", Float) = 0
		[Header(Vertex UV Offset)][Space(5)]_VertexUVOffsetTop("Vertex UV Offset Top", Range( -1 , 1)) = 0
		_VertexUVOffsetTopPower("Vertex UV Offset Top Power", Float) = 1
		[Space(5)]_VertexUVOffsetBottom("Vertex UV Offset Bottom", Range( -1 , 1)) = 0
		_VertexUVOffsetBottomPower("Vertex UV Offset Bottom Power", Float) = 1
		[HideInInspector]_EndFoldoutVertexUVOffset("End Foldout Vertex UV Offset", Float) = 0
		[HideInInspector]_StartFoldoutVertexNormalOffset("Start Foldout Vertex Normal Offset", Float) = 0
		[Header(Vertex Normal Offset)][Space(5)]_VertexNormalOffset("Vertex Normal Offset", Float) = 0
		[Space(5)]_VertexNormalOffsetTop("Vertex Normal Offset Top", Float) = 0
		_VertexNormalOffsetTopPower("Vertex Normal Offset Top Power", Float) = 1
		[Space(5)]_VertexNormalOffsetBottom("Vertex Normal Offset Bottom", Float) = 0
		_VertexNormalOffsetBottomPower("Vertex Normal Offset Bottom Power", Float) = 1
		[HideInInspector]_EndFoldoutVertexNormalOffset("End Foldout Vertex Normal Offset", Float) = 0
		[Header(Vertex Twist)][Space(5)]_VertexTwist("Vertex Twist", Float) = 0
		[HideInInspector]_StartFoldoutVertexWave("Start Foldout Vertex Wave", Float) = 0
		[Header(Vertex Wave)][Space(5)]_VertexWave("Vertex Wave", Float) = 0.1
		[Toggle(_VERTEXWAVEENABLED_ON)] _VertexWaveEnabled("Vertex Wave Enabled", Float) = 0
		_VertexWaveScale("Vertex Wave Scale", Float) = 2
		_VertexWaveAnimation("Vertex Wave Animation", Float) = 4
		_VertexWaveOffset("Vertex Wave Offset", Range( -1 , 1)) = 0
		[HideInInspector]_EndFoldoutVertexWave("End Foldout Vertex Wave", Float) = 0
		[HideInInspector]_StartFoldoutVertexNoise("Start Foldout Vertex Noise", Float) = 0
		[Header(Vertex Noise)][Space(5)]_VertexNoise("Vertex Noise", Float) = 0.02
		[Toggle(_VERTEXNOISEENABLED_ON)] _VertexNoiseEnabled("Vertex Noise Enabled", Float) = 0
		[Space(5)]_VertexNoiseScale("Vertex Noise Scale", Float) = 2
		_VertexNoiseTiling("Vertex Noise Tiling", Vector) = (1,1,1,0)
		_VertexNoiseAnimation("Vertex Noise Animation", Vector) = (0,2,0,0)
		_VertexNoiseParticleAnimation("Vertex Noise Particle Animation", Vector) = (0,0,0,0)
		_VertexNoiseOffset("Vertex Noise Offset", Vector) = (0,0,0,0)
		[IntRange]_VertexNoiseOctaves("Vertex Noise Octaves", Range( 1 , 4)) = 1
		[Space(5)]_VertexNoiseDilation("Vertex Noise Dilation", Range( -0.2 , 0.2)) = 0
		[Toggle(_VERTEXNOISEDILATIONENABLED_ON)] _VertexNoiseDilationEnabled("Vertex Noise Dilation Enabled", Float) = 0
		[Space(5)]_VertexNoiseTwist("Vertex Noise Twist", Range( -180 , 180)) = 0
		[HideInInspector]_EndFoldoutVertexNoise("End Foldout Vertex Noise", Float) = 0
		[HideInInspector]_StartFoldoutVertexWaveNoiseVerticalMask("Start Foldout Vertex Wave-Noise Vertical Mask", Float) = 0
		[Header(Vertex Wave Noise Vertical Mask)][Space(5)]_VertexWaveNoiseVerticalMaskPower("Vertex Wave-Noise Vertical Mask Power", Float) = 1
		_VertexWaveNoiseVerticalMaskRemapMin("Vertex Wave-Noise Vertical Mask Remap Min", Range( 0 , 1)) = 0
		_VertexWaveNoiseVerticalMaskRemapMax("Vertex Wave-Noise Vertical Mask Remap Max", Range( 0 , 1)) = 1
		[HideInInspector]_EndFoldoutVertexWaveNoiseVerticalMask("End Foldout Vertex Wave-Noise Vertical Mask", Float) = 0
		[HideInInspector]_StartFoldoutVertexOffsetoverY("Start Foldout Vertex Offset over Y", Float) = 0
		[Header(Vertex Offset over Y)][Space(5)]_VertexOffsetOverY1("Vertex Offset over Y 1", Vector) = (0,0,0,0)
		_VertexOffsetOverY1Power("Vertex Offset over Y 1 Power", Float) = 2
		[Space(5)]_VertexOffsetOverY2("Vertex Offset over Y 2", Vector) = (0,0,0,0)
		_VertexOffsetOverY2Power("Vertex Offset over Y 2 Power", Float) = 2
		[Header(Vertex Offset over Circular Y)][Space(5)]_VertexOffsetOverCircularY("Vertex Offset over Circular Y", Vector) = (0,0,0,0)
		_VertexOffsetOverCircularYPower("Vertex Offset over Circular Y Power", Float) = 1
		[HideInInspector]_EndFoldoutVertexOffsetoverY("End Foldout Vertex Offset over Y", Float) = 0
		[Header(Tessellation)][Space(5)]_Tessellation("Tessellation", Range( 1 , 64)) = 1


		_TessPhongStrength( "Phong Tess Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Max Tessellation", Range( 1, 32 ) ) = 16
		//_TessMin( "Tess Min Distance", Float ) = 10
		//_TessMax( "Tess Max Distance", Float ) = 25
		//_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25

		[HideInInspector] _QueueOffset("_QueueOffset", Float) = 0
        [HideInInspector] _QueueControl("_QueueControl", Float) = -1

        [HideInInspector][NoScaleOffset] unity_Lightmaps("unity_Lightmaps", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_LightmapsInd("unity_LightmapsInd", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_ShadowMasks("unity_ShadowMasks", 2DArray) = "" {}

		[HideInInspector][ToggleUI] _AddPrecomputedVelocity("Add Precomputed Velocity", Float) = 1
		[HideInInspector][ToggleOff] _ReceiveShadows("Receive Shadows", Float) = 1.0
	}

	SubShader
	{
		LOD 0

		

		Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Transparent" "Queue"="Transparent" "UniversalMaterialType"="Unlit" }

		Cull Off
		AlphaToMask Off

		

		HLSLINCLUDE
		#pragma target 4.5
		#pragma prefer_hlslcc gles
		// ensure rendering platforms toggle list is visible

		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Filtering.hlsl"

		#ifndef ASE_TESS_FUNCS
		#define ASE_TESS_FUNCS
		float4 FixedTess( float tessValue )
		{
			return tessValue;
		}

		float CalcDistanceTessFactor (float4 vertex, float minDist, float maxDist, float tess, float4x4 o2w, float3 cameraPos )
		{
			float3 wpos = mul(o2w,vertex).xyz;
			float dist = distance (wpos, cameraPos);
			float f = clamp(1.0 - (dist - minDist) / (maxDist - minDist), 0.01, 1.0) * tess;
			return f;
		}

		float4 CalcTriEdgeTessFactors (float3 triVertexFactors)
		{
			float4 tess;
			tess.x = 0.5 * (triVertexFactors.y + triVertexFactors.z);
			tess.y = 0.5 * (triVertexFactors.x + triVertexFactors.z);
			tess.z = 0.5 * (triVertexFactors.x + triVertexFactors.y);
			tess.w = (triVertexFactors.x + triVertexFactors.y + triVertexFactors.z) / 3.0f;
			return tess;
		}

		float CalcEdgeTessFactor (float3 wpos0, float3 wpos1, float edgeLen, float3 cameraPos, float4 scParams )
		{
			float dist = distance (0.5 * (wpos0+wpos1), cameraPos);
			float len = distance(wpos0, wpos1);
			float f = max(len * scParams.y / (edgeLen * dist), 1.0);
			return f;
		}

		float DistanceFromPlane (float3 pos, float4 plane)
		{
			float d = dot (float4(pos,1.0f), plane);
			return d;
		}

		bool WorldViewFrustumCull (float3 wpos0, float3 wpos1, float3 wpos2, float cullEps, float4 planes[6] )
		{
			float4 planeTest;
			planeTest.x = (( DistanceFromPlane(wpos0, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[0]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.y = (( DistanceFromPlane(wpos0, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[1]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.z = (( DistanceFromPlane(wpos0, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[2]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.w = (( DistanceFromPlane(wpos0, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[3]) > -cullEps) ? 1.0f : 0.0f );
			return !all (planeTest);
		}

		float4 DistanceBasedTess( float4 v0, float4 v1, float4 v2, float tess, float minDist, float maxDist, float4x4 o2w, float3 cameraPos )
		{
			float3 f;
			f.x = CalcDistanceTessFactor (v0,minDist,maxDist,tess,o2w,cameraPos);
			f.y = CalcDistanceTessFactor (v1,minDist,maxDist,tess,o2w,cameraPos);
			f.z = CalcDistanceTessFactor (v2,minDist,maxDist,tess,o2w,cameraPos);

			return CalcTriEdgeTessFactors (f);
		}

		float4 EdgeLengthBasedTess( float4 v0, float4 v1, float4 v2, float edgeLength, float4x4 o2w, float3 cameraPos, float4 scParams )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;
			tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
			tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
			tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
			tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			return tess;
		}

		float4 EdgeLengthBasedTessCull( float4 v0, float4 v1, float4 v2, float edgeLength, float maxDisplacement, float4x4 o2w, float3 cameraPos, float4 scParams, float4 planes[6] )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;

			if (WorldViewFrustumCull(pos0, pos1, pos2, maxDisplacement, planes))
			{
				tess = 0.0f;
			}
			else
			{
				tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
				tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
				tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
				tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			}
			return tess;
		}
		#endif //ASE_TESS_FUNCS
		ENDHLSL

		
		Pass
		{
			
			Name "Forward"
			Tags { "LightMode"="UniversalForwardOnly" }

			Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha
			ZWrite Off
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			

			HLSLPROGRAM

			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define ASE_FIXED_TESSELLATION
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define ASE_PHONG_TESSELLATION
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define ASE_TESSELLATION 1
			#pragma require tessellation tessHW
			#pragma hull HullFunction
			#pragma domain DomainFunction
			#define ASE_VERSION 19701
			#define ASE_SRP_VERSION 170003
			#define REQUIRE_DEPTH_TEXTURE 1


			#pragma multi_compile_fragment _ _SCREEN_SPACE_OCCLUSION
			#pragma multi_compile_fragment _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3
			#pragma multi_compile_fragment _ _GBUFFER_NORMALS_OCT

			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
            #pragma multi_compile _ LIGHTMAP_ON
            #pragma multi_compile _ DYNAMICLIGHTMAP_ON
			#pragma multi_compile_fragment _ DEBUG_DISPLAY

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_UNLIT

			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Debug/Debugging3D.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/SurfaceData.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#include "../../VFXToolkit/Shaders/_Includes/Math.cginc"
			#include "../../VFXToolkit/Shaders/_Includes/Noise.cginc"
			#include "_Includes/Solaris.hlsl"
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_SCREEN_POSITION
			#define ASE_NEEDS_FRAG_COLOR
			#pragma shader_feature_local _SWAPUVXY_ON
			#pragma shader_feature_local _VERTEXWAVEENABLED_ON
			#pragma shader_feature_local _VERTEXNOISEENABLED_ON
			#pragma shader_feature_local _VERTEXNOISEDILATIONENABLED_ON
			#pragma shader_feature_local _WORLDSPACEUVS_ON
			#pragma shader_feature_local _VERTICALCOLOUR_ON
			#pragma shader_feature_local _NOISEDILATIONENABLED_ON
			#pragma shader_feature_local _NOISEXZTWISTENABLED_ON
			#pragma shader_feature_local _SPHERIZENOISE_ON
			#pragma shader_feature_local _OBJECTSPACEUVS_ON
			#pragma shader_feature_local _NOISEDISTORTIONENABLED_ON
			#pragma shader_feature_local _NOISEDISTORTIONDILATIONENABLED_ON
			#pragma shader_feature_local _MAINLIGHTENABLED_ON
			#pragma shader_feature_local _MAINLIGHTLAMBERTENABLED_ON
			#pragma shader_feature_local _MAINLIGHTFLATENABLED_ON
			#pragma shader_feature_local _ADDITIONALLIGHTSENABLED_ON
			#pragma shader_feature_local _ADDITIONALLIGHTSLAMBERTENABLED_ON
			#pragma shader_feature_local _ADDITIONALLIGHTSFLATENABLED_ON
			#pragma shader_feature_local _ADDITIONALLIGHTSTRANSPARENCYSHADOWENABLED_ON
			#pragma shader_feature_local _MAINLIGHTTRANSPARENCYSHADOWENABLED_ON
			#pragma shader_feature_local _VERTICALMASK2_ON
			#pragma shader_feature_local _VERTICALMASK1_ON
			#pragma shader_feature_local _RADIALMASKSUBTRACTIVE_ON
			#pragma shader_feature_local _RADIALMASK_ON
			#pragma shader_feature_local _RADIALMASKDISTORTIONENABLED_ON
			#pragma shader_feature_local _RADIALMASKDISTORTIONDILATIONENABLED_ON
			#pragma shader_feature_local _VERTICALMASK1SUBTRACTIVE_ON
			#pragma shader_feature_local _VERTICALMASKSOBJECTSPACE_ON
			#pragma shader_feature_local _VERTICALMASK2SUBTRACTIVE_ON
			#pragma shader_feature_local _INVERTDEPTHFADE_ON
			#pragma multi_compile _ _FORWARD_PLUS
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
			#pragma multi_compile _ _ADDITIONAL_LIGHTS
			 #pragma multi_compile _ _ADDITIONAL_LIGHT_SHADOWS


			struct Attributes
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				float4 positionCS : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 positionWS : TEXCOORD1;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD2;
				#endif
				#ifdef ASE_FOG
					float fogFactor : TEXCOORD3;
				#endif
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_color : COLOR;
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_texcoord9 : TEXCOORD9;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ColourA;
			float4 _RadialMaskDistortionAnimation;
			float4 _VerticalColourA;
			float4 _VerticalColourB;
			float4 _RadialMaskDistortionParticleAnimation;
			float4 _RadialMaskDistortionOffset;
			float4 _NoiseDistortionOffset;
			float4 _ColourB;
			float4 _NoiseDistortionAnimation;
			float4 _NoiseDistortionParticleAnimation;
			float4 _IntersectionHighlightColour;
			float4 _VertexNoiseAnimation;
			float4 _NoiseAnimation;
			float4 _VertexNoiseParticleAnimation;
			float4 _NoiseOffset;
			float4 _NoiseParticleAnimation;
			float4 _VertexNoiseOffset;
			float3 _VertexOffsetOverY1;
			float3 _RadialMaskDistortionTiling;
			float3 _VertexOffsetOverCircularY;
			float3 _VertexOffsetOverY2;
			float3 _VertexNoiseTiling;
			float3 _NoiseTiling;
			float3 _NoiseDistortionTiling;
			float2 _RadialMaskTiling;
			float2 _RadialMaskOffset;
			float2 _SpherizeNoiseOffset;
			float _VerticalColourMaskRemapMax;
			float _MainLightShadowOrthogonalAlignmentWorldNoise;
			float _MainLightShadowDirectionalAlignmentNoise;
			float _Noise;
			float _MainLightShadow;
			float _MainLightAnisotropyBlend;
			float _MainLightAnisotropy;
			float _AdditionalLightsFlatLambertBlend;
			float _ParticleSubtractNoiseoverLifetime;
			float _NoisePower;
			float _AdditionalLightsLambertTranslucencyMask;
			float _MainLight;
			float _MainLightShadowDirectionalNoise;
			float _ColourPower;
			float _MainLightLambertTranslucency;
			float _ColourHueShift;
			float _MainLightLambertTranslucencyMask;
			float _ColourSaturationShift;
			float _ColourValueMultiplier;
			float _VerticalColourHueShift;
			float _VerticalColourSaturationShift;
			float _MainLightFlatLambertBlend;
			float _VerticalColourValueMultiplier;
			float _VerticalColourMaskRemapMin;
			float _LambertLightingNormalfromHeight;
			float _VerticalColourMaskPower;
			float _MainLightShadowWorldNoise;
			float _Tessellation;
			float _AdditionalLightsShadowOrthogonalAlignmentWorldNoise;
			float _AdditionalLightsShadowWorldNoise;
			float _VerticalMask1Power;
			float _VerticalMask2RemapMin;
			float _VerticalMask2RemapMax;
			float _VerticalMask2ObjectSpaceOffset;
			float _VerticalMask2ObjectSpaceScale;
			float _VerticalMask2Power;
			float _FresnelMaskRemapMin;
			float _FresnelMaskRemapMax;
			float _FresnelMaskPower;
			float _FresnelMask;
			float _DepthFade;
			float _DepthFadePower;
			float _SubtractiveDepthFade;
			float _SubtractiveDepthFadePower;
			float _CameraDepthFadeLength;
			float _CameraDepthFadeOffset;
			float _CameraDepthFadePower;
			float _Alpha;
			float _MainLightTransparencyShadow;
			float _VerticalMask1ObjectSpaceScale;
			float _VerticalMask1ObjectSpaceOffset;
			float _VerticalMask1RemapMin;
			float _VerticalMask1RemapMax;
			float _AdditionalLightsShadowDirectionalNoise;
			float _AdditionalLightsShadowDirectionalAlignmentNoise;
			float _AdditionalLightsShadow;
			float _AdditionalLights;
			float _IntersectionHighlightColourHueShift;
			float _IntersectionHighlightColourSaturationShift;
			float _IntersectionHighlightColourValueMultiplier;
			float _IntersectionHighlightRemapMin;
			float _IntersectionHighlightRemapMax;
			float _AdditionalLightsLambertTranslucency;
			float _IntersectionHighlight;
			float _RadialMaskRadius;
			float _RadialMaskRadiusOverParticleLifetime;
			float _RadialMaskFeather;
			float _RadialMaskDistortionScale;
			float _RadialMaskDistortionOctaves;
			float _RadialMaskDistortionDilation;
			float _RadialMaskDistortionPower;
			float _RadialMaskDistortion;
			float _RadialMaskPower;
			float _IntersectionHighlightPower;
			float _NoiseDilation;
			float _NoiseDistortionDilation;
			float _NoiseScale;
			float _StartFoldoutBaseUVs;
			float _StartFoldoutParticleSettings;
			float _EndFoldoutParticleSettings;
			float _StartFoldoutDepthFade;
			float _EndFoldoutDepthFade;
			float _StartFoldoutIntersectionHighlight;
			float _EndFoldoutIntersectionHighlight;
			float _StartFoldoutVertexUVOffset;
			float _EndFoldoutVertexUVOffset;
			float _StartFoldoutVertexNormalOffset;
			float _EndFoldoutVertexNormalOffset;
			float _StartFoldoutVertexWave;
			float _EndFoldoutVertexWave;
			float _StartFoldoutVertexNoise;
			float _EndFoldoutVertexNoise;
			float _EndFoldoutVertexWaveNoiseVerticalMask;
			float _StartFoldoutVertexOffsetoverY;
			float _EndFoldoutLighting;
			float _EndFoldoutVertexOffsetoverY;
			float _StartFoldoutLighting;
			float _StartFoldoutVerticalColour;
			float _EndFoldoutBaseUVs;
			float _StartFoldoutColour;
			float _StartFoldoutNoise;
			float _EndFoldoutNoise;
			float _StartFoldoutNoiseDistortion;
			float _EndFoldoutNoiseDistortion;
			float _StartFoldoutRadialMask;
			float _EndFoldoutRadialMask;
			float _StartFoldoutRadialMaskDistortion;
			float _EndFoldoutRadialMaskDistortion;
			float _EndFoldoutVerticalMasks;
			float _StartFoldoutVerticalMasks;
			float _StartFoldoutSpherizeNoise;
			float _EndFoldoutSpherizeNoise;
			float _StartFoldoutFresnelMask;
			float _EndFoldoutFresnelMask;
			float _EndFoldoutColour;
			float _EndFoldoutVerticalColour;
			float _StartFoldoutVertexWaveNoiseVerticalMask;
			float _VertexNormalOffset;
			float _VertexNormalOffsetTopPower;
			float _VertexOffsetOverY2Power;
			float _VertexOffsetOverCircularYPower;
			float _NoiseRemapMin;
			float _NoiseRemapMax;
			float _UVSampleNoise;
			float _SpherizeNoiseRadius;
			float _SpherizeNoiseStrength;
			float _NoiseXZTwist;
			float _NoiseUVYPreOffset;
			float _NoiseUVYPreScale;
			float _NoiseUVYPrePower;
			float _NoiseParallaxOffset;
			float _NoiseDistortionScale;
			float _NoiseDistortionOctaves;
			float _AdditionalLightsTransparencyShadow;
			float _NoiseDistortionPower;
			float _NoiseDistortion;
			float _VertexOffsetOverY1Power;
			float _VertexTwist;
			float _VertexUVOffsetBottom;
			float _VertexUVOffsetBottomPower;
			float _VertexNormalOffsetTop;
			float _VertexNormalOffsetBottomPower;
			float _VertexNormalOffsetBottom;
			float _VertexWaveScale;
			float _VertexWaveAnimation;
			float _VertexWaveOffset;
			float _VertexWave;
			float _VertexWaveNoiseVerticalMaskRemapMin;
			float _NoiseOctaves;
			float _VertexWaveNoiseVerticalMaskRemapMax;
			float _VertexNoiseScale;
			float _ParticleRandomization;
			float _VertexNoiseOctaves;
			float _VertexNoiseDilation;
			float _VertexNoiseTwist;
			float _VertexNoise;
			float _VertexUVOffsetTopPower;
			float _VertexUVOffsetTop;
			float _VertexWaveNoiseVerticalMaskPower;
			float _IntersectionHighlightShadowMaskPower;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			

			float3 HSVToRGB( float3 c )
			{
				float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
				float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
				return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
			}
			
			float3 RGBToHSV(float3 c)
			{
				float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
				float4 p = lerp( float4( c.bg, K.wz ), float4( c.gb, K.xy ), step( c.b, c.g ) );
				float4 q = lerp( float4( p.xyw, c.r ), float4( c.r, p.yzx ), step( p.x, c.r ) );
				float d = q.x - min( q.w, q.y );
				float e = 1.0e-10;
				return float3( abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
			}
			float3 PerturbNormal107_g605( float3 surf_pos, float3 surf_norm, float height, float scale )
			{
				// "Bump Mapping Unparametrized Surfaces on the GPU" by Morten S. Mikkelsen
				float3 vSigmaS = ddx( surf_pos );
				float3 vSigmaT = ddy( surf_pos );
				float3 vN = surf_norm;
				float3 vR1 = cross( vSigmaT , vN );
				float3 vR2 = cross( vN , vSigmaS );
				float fDet = dot( vSigmaS , vR1 );
				float dBs = ddx( height );
				float dBt = ddy( height );
				float3 vSurfGrad = scale * 0.05 * sign( fDet ) * ( dBs * vR1 + dBt * vR2 );
				return normalize ( abs( fDet ) * vN - vSurfGrad );
			}
			
			float3 PerturbNormal107_g604( float3 surf_pos, float3 surf_norm, float height, float scale )
			{
				// "Bump Mapping Unparametrized Surfaces on the GPU" by Morten S. Mikkelsen
				float3 vSigmaS = ddx( surf_pos );
				float3 vSigmaT = ddy( surf_pos );
				float3 vN = surf_norm;
				float3 vR1 = cross( vSigmaT , vN );
				float3 vR2 = cross( vN , vSigmaS );
				float fDet = dot( vSigmaS , vR1 );
				float dBs = ddx( height );
				float dBt = ddy( height );
				float3 vSurfGrad = scale * 0.05 * sign( fDet ) * ( dBs * vR1 + dBt * vR2 );
				return normalize ( abs( fDet ) * vN - vSurfGrad );
			}
			
			float3 ASESafeNormalize(float3 inVec)
			{
				float dp3 = max(1.175494351e-38, dot(inVec, inVec));
				return inVec* rsqrt(dp3);
			}
			

			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				float localTwistXZ_float11_g586 = ( 0.0 );
				float2 texCoord322 = input.ase_texcoord * float2( 1,1 ) + float2( 0,0 );
				#ifdef _SWAPUVXY_ON
				float2 staticSwitch321 = (texCoord322).yx;
				#else
				float2 staticSwitch321 = texCoord322;
				#endif
				float UV_2D_Y691 = (staticSwitch321).y;
				float3 Vertex_Normal_Offset670 = ( ( input.normalOS * _VertexNormalOffset ) + ( pow( UV_2D_Y691 , _VertexNormalOffsetTopPower ) * input.normalOS * _VertexNormalOffsetTop ) + ( pow( ( 1.0 - UV_2D_Y691 ) , _VertexNormalOffsetBottomPower ) * input.normalOS * _VertexNormalOffsetBottom ) );
				float2 UV_2D327 = staticSwitch321;
				float mulTime258 = _TimeParameters.x * _VertexWaveAnimation;
				float temp_output_7_0_g581 = _VertexWaveNoiseVerticalMaskRemapMin;
				float temp_output_23_0_g581 = _VertexWaveNoiseVerticalMaskRemapMax;
				float temp_output_20_0_g581 = UV_2D_Y691;
				float temp_output_4_0_g581 = _VertexWaveNoiseVerticalMaskPower;
				float smoothstepResult22_g581 = smoothstep( temp_output_7_0_g581 , temp_output_23_0_g581 , pow( temp_output_20_0_g581 , temp_output_4_0_g581 ));
				float Vertex_WaveNoise_Vertical_Mask280 = smoothstepResult22_g581;
				#ifdef _VERTEXWAVEENABLED_ON
				float3 staticSwitch448 = ( ( sin( ( ( UV_2D327.y * TWO_PI * _VertexWaveScale ) - ( mulTime258 + ( _VertexWaveOffset * TWO_PI ) ) ) ) * _VertexWave * Vertex_WaveNoise_Vertical_Mask280 ) * input.normalOS );
				#else
				float3 staticSwitch448 = float3( 0,0,0 );
				#endif
				float3 Vertex_Sine265 = staticSwitch448;
				float localTwistXZ_float11_g584 = ( 0.0 );
				float localSimplexNoise_float2_g583 = ( 0.0 );
				#ifdef _SWAPUVXY_ON
				float3 staticSwitch339 = (input.positionOS.xyz).yxz;
				#else
				float3 staticSwitch339 = input.positionOS.xyz;
				#endif
				float3 UV_3D340 = staticSwitch339;
				float3 ase_worldPos = TransformObjectToWorld( (input.positionOS).xyz );
				#ifdef _SWAPUVXY_ON
				float3 staticSwitch621 = (ase_worldPos).yxz;
				#else
				float3 staticSwitch621 = ase_worldPos;
				#endif
				float3 UV_3D_World622 = staticSwitch621;
				#ifdef _WORLDSPACEUVS_ON
				float3 staticSwitch605 = UV_3D_World622;
				#else
				float3 staticSwitch605 = UV_3D340;
				#endif
				float Particle_Stable_Random_X147 = ( ( input.ase_texcoord.w - 0.5 ) * 100.0 * _ParticleRandomization );
				float Particle_Age_Percent146 = input.ase_texcoord.z;
				float4 Vertex_Noise_Offset311 = ( _VertexNoiseOffset + Particle_Stable_Random_X147 + ( _VertexNoiseParticleAnimation * Particle_Age_Percent146 ) );
				float4 temp_output_10_0_g579 = ( float4( ( staticSwitch605 * _VertexNoiseScale * _VertexNoiseTiling ) , 0.0 ) - ( Vertex_Noise_Offset311 + ( _VertexNoiseAnimation * _TimeParameters.x ) ) );
				float3 temp_output_292_0 = (temp_output_10_0_g579).xyz;
				float3 position2_g583 = temp_output_292_0;
				float temp_output_292_15 = (temp_output_10_0_g579).w;
				float angle2_g583 = temp_output_292_15;
				float octaves2_g583 = _VertexNoiseOctaves;
				float noise2_g583 = 0.0;
				float3 gradient2_g583 = float3( 0,0,0 );
				SimplexNoise_float( position2_g583 , angle2_g583 , octaves2_g583 , noise2_g583 , gradient2_g583 );
				float localSimplexNoise_Caustics_float2_g582 = ( 0.0 );
				float3 position2_g582 = temp_output_292_0;
				float angle2_g582 = temp_output_292_15;
				float octaves2_g582 = _VertexNoiseOctaves;
				float gradientStrength2_g582 = _VertexNoiseDilation;
				float noise2_g582 = 0.0;
				float3 gradient2_g582 = float3( 0,0,0 );
				SimplexNoise_Caustics_float( position2_g582 , angle2_g582 , octaves2_g582 , gradientStrength2_g582 , noise2_g582 , gradient2_g582 );
				#ifdef _VERTEXNOISEDILATIONENABLED_ON
				float3 staticSwitch490 = gradient2_g582;
				#else
				float3 staticSwitch490 = gradient2_g583;
				#endif
				float3 temp_output_10_0_g584 = staticSwitch490;
				float3 position11_g584 = temp_output_10_0_g584;
				float temp_output_9_0_g584 = _VertexNoiseTwist;
				float angle11_g584 = radians( temp_output_9_0_g584 );
				float3 output11_g584 = float3( 0,0,0 );
				TwistXZ_float( position11_g584 , angle11_g584 , output11_g584 );
				float3 temp_output_852_0 = output11_g584;
				#ifdef _VERTEXNOISEENABLED_ON
				float3 staticSwitch450 = ( temp_output_852_0 * _VertexNoise * Vertex_WaveNoise_Vertical_Mask280 );
				#else
				float3 staticSwitch450 = float3( 0,0,0 );
				#endif
				float3 Vertex_Noise298 = staticSwitch450;
				float2 break587 = ( ( UV_2D327 * float2( 2,1 ) ) - float2( 1,0 ) );
				float temp_output_576_0 = ( ( break587.x * pow( break587.y , _VertexUVOffsetTopPower ) ) * ( _VertexUVOffsetTop * 0.5 ) );
				float3 appendResult575 = (float3(temp_output_576_0 , 0.0 , 0.0));
				float3 appendResult594 = (float3(0.0 , temp_output_576_0 , 0.0));
				#ifdef _SWAPUVXY_ON
				float3 staticSwitch593 = appendResult594;
				#else
				float3 staticSwitch593 = appendResult575;
				#endif
				float3 Vertex_Offset_Top579 = staticSwitch593;
				float2 break644 = ( ( UV_2D327 * float2( 2,1 ) ) - float2( 1,0 ) );
				float temp_output_650_0 = ( ( break644.x * pow( ( 1.0 - break644.y ) , _VertexUVOffsetBottomPower ) ) * ( _VertexUVOffsetBottom * 0.5 ) );
				float3 appendResult653 = (float3(temp_output_650_0 , 0.0 , 0.0));
				float3 appendResult652 = (float3(0.0 , temp_output_650_0 , 0.0));
				#ifdef _SWAPUVXY_ON
				float3 staticSwitch654 = appendResult652;
				#else
				float3 staticSwitch654 = appendResult653;
				#endif
				float3 Vertex_Offset_Bottom655 = staticSwitch654;
				float3 temp_output_10_0_g586 = ( ( Vertex_Normal_Offset670 + Vertex_Sine265 + Vertex_Noise298 + Vertex_Offset_Top579 + Vertex_Offset_Bottom655 ) + input.positionOS.xyz );
				float3 position11_g586 = temp_output_10_0_g586;
				float temp_output_9_0_g586 = -_VertexTwist;
				float angle11_g586 = radians( temp_output_9_0_g586 );
				float3 output11_g586 = float3( 0,0,0 );
				TwistXZ_float( position11_g586 , angle11_g586 , output11_g586 );
				float3 worldToObjDir636 = mul( GetWorldToObjectMatrix(), float4( _VertexOffsetOverY1, 0 ) ).xyz;
				float3 worldToObjDir780 = mul( GetWorldToObjectMatrix(), float4( _VertexOffsetOverY2, 0 ) ).xyz;
				float UV_2D_Circular_Y897 = sin( ( UV_2D_Y691 * PI ) );
				float3 Vertex_Offset_over_Y639 = ( ( worldToObjDir636 * pow( UV_2D_Y691 , _VertexOffsetOverY1Power ) ) + ( worldToObjDir780 * pow( UV_2D_Y691 , _VertexOffsetOverY2Power ) ) + ( _VertexOffsetOverCircularY * pow( UV_2D_Circular_Y897 , _VertexOffsetOverCircularYPower ) ) );
				float3 Vertex_Offset247 = ( output11_g586 + Vertex_Offset_over_Y639 );
				
				float3 ase_worldNormal = TransformObjectToWorldNormal(input.normalOS);
				output.ase_texcoord7.xyz = ase_worldNormal;
				float3 ase_worldTangent = TransformObjectToWorldDir(input.ase_tangent.xyz);
				output.ase_texcoord8.xyz = ase_worldTangent;
				float ase_vertexTangentSign = input.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				output.ase_texcoord9.xyz = ase_worldBitangent;
				
				float3 objectToViewPos = TransformWorldToView(TransformObjectToWorld(input.positionOS.xyz));
				float eyeDepth = -objectToViewPos.z;
				output.ase_texcoord7.w = eyeDepth;
				
				output.ase_texcoord4 = input.ase_texcoord;
				output.ase_texcoord5 = input.positionOS;
				output.ase_texcoord6 = input.ase_texcoord1;
				output.ase_color = input.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord8.w = 0;
				output.ase_texcoord9.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = Vertex_Offset247;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					input.positionOS.xyz = vertexValue;
				#else
					input.positionOS.xyz += vertexValue;
				#endif

				input.normalOS = input.normalOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( input.positionOS.xyz );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					output.positionWS = vertexInput.positionWS;
				#endif

				#ifdef ASE_FOG
					output.fogFactor = ComputeFogFactor( vertexInput.positionCS.z );
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					output.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				output.positionCS = vertexInput.positionCS;
				output.clipPosV = vertexInput.positionCS;
				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( Attributes input )
			{
				VertexControl output;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				output.vertex = input.positionOS;
				output.normalOS = input.normalOS;
				output.ase_texcoord = input.ase_texcoord;
				output.ase_texcoord1 = input.ase_texcoord1;
				output.ase_color = input.ase_color;
				output.ase_tangent = input.ase_tangent;
				return output;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> input)
			{
				TessellationFactors output;
				float4 tf = 1;
				float tessValue = _Tessellation; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(input[0].vertex, input[1].vertex, input[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(input[0].vertex, input[1].vertex, input[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(input[0].vertex, input[1].vertex, input[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				output.edge[0] = tf.x; output.edge[1] = tf.y; output.edge[2] = tf.z; output.inside = tf.w;
				return output;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			PackedVaryings DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				Attributes output = (Attributes) 0;
				output.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				output.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				output.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				output.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				output.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				output.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = output.positionOS.xyz - patch[i].normalOS * (dot(output.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				output.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * output.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], output);
				return VertexFunction(output);
			}
			#else
			PackedVaryings vert ( Attributes input )
			{
				return VertexFunction( input );
			}
			#endif

			half4 frag ( PackedVaryings input
				#ifdef _WRITE_RENDERING_LAYERS
				, out float4 outRenderingLayers : SV_Target1
				#endif
				 ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( input );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( input );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = input.positionWS;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				float4 ClipPos = input.clipPosV;
				float4 ScreenPos = ComputeScreenPos( input.clipPosV );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = input.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float4 temp_output_22_0_g589 = _ColourB;
				float4 temp_output_22_0_g590 = _ColourA;
				float temp_output_7_0_g574 = _NoiseRemapMin;
				float temp_output_23_0_g574 = _NoiseRemapMax;
				float localSimplexNoise_float2_g504 = ( 0.0 );
				float2 texCoord322 = input.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _SWAPUVXY_ON
				float2 staticSwitch321 = (texCoord322).yx;
				#else
				float2 staticSwitch321 = texCoord322;
				#endif
				float2 UV_2D327 = staticSwitch321;
				#ifdef _SWAPUVXY_ON
				float3 staticSwitch339 = (input.ase_texcoord5.xyz).yxz;
				#else
				float3 staticSwitch339 = input.ase_texcoord5.xyz;
				#endif
				float3 UV_3D340 = staticSwitch339;
				#ifdef _OBJECTSPACEUVS_ON
				float3 staticSwitch223 = UV_3D340;
				#else
				float3 staticSwitch223 = float3( UV_2D327 ,  0.0 );
				#endif
				#ifdef _SWAPUVXY_ON
				float3 staticSwitch621 = (WorldPosition).yxz;
				#else
				float3 staticSwitch621 = WorldPosition;
				#endif
				float3 UV_3D_World622 = staticSwitch621;
				#ifdef _WORLDSPACEUVS_ON
				float3 staticSwitch356 = UV_3D_World622;
				#else
				float3 staticSwitch356 = staticSwitch223;
				#endif
				float4 ase_screenPosNorm = ScreenPos / ScreenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float2 appendResult1146 = (float2(ase_screenPosNorm.x , ase_screenPosNorm.y));
				float2 Screen_UV1145 = appendResult1146;
				float2 appendResult1112 = (float2(_ScreenParams.x , _ScreenParams.y));
				float2 Screen_Resolution1113 = appendResult1112;
				float2 Screen_Position1254 = ( Screen_UV1145 * Screen_Resolution1113 );
				float2 screenPosition1243 = Screen_Position1254;
				float mulTime1247 = _TimeParameters.x * 60.0;
				float time1243 = mulTime1247;
				float3 localHash331243 = Hash33( screenPosition1243 , time1243 );
				float3 Sample_Noise1248 = ( (localHash331243*2.0 + -1.0) * _UVSampleNoise );
				float3 Noise_Base_UV220 = ( staticSwitch356 + Sample_Noise1248 );
				float localSpherize_float5_g487 = ( 0.0 );
				float2 uv5_g487 = (Noise_Base_UV220).xy;
				float2 center5_g487 = ( _SpherizeNoiseOffset + float2( 0.5,0.5 ) );
				float radius5_g487 = _SpherizeNoiseRadius;
				float strength5_g487 = _SpherizeNoiseStrength;
				float2 output5_g487 = float2( 0,0 );
				Spherize_float( uv5_g487 , center5_g487 , radius5_g487 , strength5_g487 , output5_g487 );
				float3 appendResult611 = (float3(output5_g487 , (Noise_Base_UV220).z));
				#ifdef _SPHERIZENOISE_ON
				float3 staticSwitch625 = appendResult611;
				#else
				float3 staticSwitch625 = Noise_Base_UV220;
				#endif
				float localTwistXZ_float11_g493 = ( 0.0 );
				float3 temp_output_10_0_g493 = staticSwitch625;
				float3 position11_g493 = temp_output_10_0_g493;
				float temp_output_9_0_g493 = _NoiseXZTwist;
				float angle11_g493 = radians( temp_output_9_0_g493 );
				float3 output11_g493 = float3( 0,0,0 );
				TwistXZ_float( position11_g493 , angle11_g493 , output11_g493 );
				#ifdef _NOISEXZTWISTENABLED_ON
				float3 staticSwitch801 = output11_g493;
				#else
				float3 staticSwitch801 = staticSwitch625;
				#endif
				float3 break728 = staticSwitch801;
				float temp_output_738_0 = ( ( break728.y - _NoiseUVYPreOffset ) * _NoiseUVYPreScale );
				float temp_output_7_0_g496 = abs( temp_output_738_0 );
				float temp_output_733_14 = ( pow( temp_output_7_0_g496 , _NoiseUVYPrePower ) * sign( temp_output_738_0 ) );
				float3 appendResult732 = (float3(break728.x , temp_output_733_14 , break728.z));
				float3 ase_viewVectorWS = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				float3 ase_viewDirWS = normalize( ase_viewVectorWS );
				float3 temp_output_872_0 = ( -ase_viewDirWS * _NoiseParallaxOffset );
				#ifdef _SWAPUVXY_ON
				float3 staticSwitch464 = (temp_output_872_0).yxz;
				#else
				float3 staticSwitch464 = temp_output_872_0;
				#endif
				float3 Parallax_Offset465 = staticSwitch464;
				float localSimplexNoise_float2_g492 = ( 0.0 );
				float Particle_Stable_Random_X147 = ( ( input.ase_texcoord4.w - 0.5 ) * 100.0 * _ParticleRandomization );
				float Particle_Age_Percent146 = input.ase_texcoord4.z;
				float4 Distortion_Noise_Offset163 = ( _NoiseDistortionOffset + Particle_Stable_Random_X147 + ( _NoiseDistortionParticleAnimation * Particle_Age_Percent146 ) );
				float4 temp_output_10_0_g489 = ( float4( ( ( Noise_Base_UV220 + Parallax_Offset465 ) * _NoiseDistortionScale * _NoiseDistortionTiling ) , 0.0 ) - ( Distortion_Noise_Offset163 + ( _NoiseDistortionAnimation * _TimeParameters.x ) ) );
				float3 temp_output_160_0 = (temp_output_10_0_g489).xyz;
				float3 position2_g492 = temp_output_160_0;
				float temp_output_160_15 = (temp_output_10_0_g489).w;
				float angle2_g492 = temp_output_160_15;
				float octaves2_g492 = _NoiseDistortionOctaves;
				float noise2_g492 = 0.0;
				float3 gradient2_g492 = float3( 0,0,0 );
				SimplexNoise_float( position2_g492 , angle2_g492 , octaves2_g492 , noise2_g492 , gradient2_g492 );
				float localSimplexNoise_Caustics_float2_g491 = ( 0.0 );
				float3 position2_g491 = temp_output_160_0;
				float angle2_g491 = temp_output_160_15;
				float octaves2_g491 = _NoiseDistortionOctaves;
				float gradientStrength2_g491 = _NoiseDistortionDilation;
				float noise2_g491 = 0.0;
				float3 gradient2_g491 = float3( 0,0,0 );
				SimplexNoise_Caustics_float( position2_g491 , angle2_g491 , octaves2_g491 , gradientStrength2_g491 , noise2_g491 , gradient2_g491 );
				#ifdef _NOISEDISTORTIONDILATIONENABLED_ON
				float3 staticSwitch440 = gradient2_g491;
				#else
				float3 staticSwitch440 = gradient2_g492;
				#endif
				float3 temp_output_7_0_g495 = abs( staticSwitch440 );
				float3 temp_cast_3 = (_NoiseDistortionPower).xxx;
				#ifdef _NOISEDISTORTIONENABLED_ON
				float3 staticSwitch442 = ( ( pow( temp_output_7_0_g495 , temp_cast_3 ) * sign( staticSwitch440 ) ) * _NoiseDistortion );
				#else
				float3 staticSwitch442 = float3( 0,0,0 );
				#endif
				float3 Noise_Distortion73 = staticSwitch442;
				float3 Noise_UV173 = ( appendResult732 + Parallax_Offset465 + Noise_Distortion73 );
				float4 Noise_Offset175 = ( _NoiseOffset + Particle_Stable_Random_X147 + ( _NoiseParticleAnimation * Particle_Age_Percent146 ) );
				float4 temp_output_10_0_g501 = ( float4( ( Noise_UV173 * _NoiseScale * _NoiseTiling ) , 0.0 ) - ( Noise_Offset175 + ( _NoiseAnimation * _TimeParameters.x ) ) );
				float3 temp_output_159_0 = (temp_output_10_0_g501).xyz;
				float3 position2_g504 = temp_output_159_0;
				float temp_output_159_15 = (temp_output_10_0_g501).w;
				float angle2_g504 = temp_output_159_15;
				float octaves2_g504 = _NoiseOctaves;
				float noise2_g504 = 0.0;
				float3 gradient2_g504 = float3( 0,0,0 );
				SimplexNoise_float( position2_g504 , angle2_g504 , octaves2_g504 , noise2_g504 , gradient2_g504 );
				float localSimplexNoise_Caustics_float2_g503 = ( 0.0 );
				float3 position2_g503 = temp_output_159_0;
				float angle2_g503 = temp_output_159_15;
				float octaves2_g503 = _NoiseOctaves;
				float gradientStrength2_g503 = _NoiseDilation;
				float noise2_g503 = 0.0;
				float3 gradient2_g503 = float3( 0,0,0 );
				SimplexNoise_Caustics_float( position2_g503 , angle2_g503 , octaves2_g503 , gradientStrength2_g503 , noise2_g503 , gradient2_g503 );
				#ifdef _NOISEDILATIONENABLED_ON
				float staticSwitch444 = noise2_g503;
				#else
				float staticSwitch444 = noise2_g504;
				#endif
				float temp_output_20_0_g574 = staticSwitch444;
				float temp_output_4_0_g574 = _NoisePower;
				float smoothstepResult22_g574 = smoothstep( temp_output_7_0_g574 , temp_output_23_0_g574 , pow( temp_output_20_0_g574 , temp_output_4_0_g574 ));
				float Particle_Subtract_Noise_over_Lifetime480 = ( input.ase_texcoord6.y * _ParticleSubtractNoiseoverLifetime );
				float temp_output_478_0 = ( smoothstepResult22_g574 - Particle_Subtract_Noise_over_Lifetime480 );
				float lerpResult569 = lerp( 1.0 , temp_output_478_0 , _Noise);
				float Noise11 = lerpResult569;
				float Colour_Power42 = pow( Noise11 , _ColourPower );
				float3 lerpResult31 = lerp( ( (temp_output_22_0_g589).rgb * (temp_output_22_0_g589).a ) , ( (temp_output_22_0_g590).rgb * (temp_output_22_0_g590).a ) , Colour_Power42);
				float3 hsvTorgb129 = RGBToHSV( lerpResult31 );
				float3 hsvTorgb132 = HSVToRGB( float3(( hsvTorgb129.x + _ColourHueShift ),( hsvTorgb129.y + _ColourSaturationShift ),( hsvTorgb129.z * _ColourValueMultiplier )) );
				float4 temp_output_22_0_g591 = _VerticalColourB;
				float4 temp_output_22_0_g592 = _VerticalColourA;
				float3 lerpResult387 = lerp( ( (temp_output_22_0_g591).rgb * (temp_output_22_0_g591).a ) , ( (temp_output_22_0_g592).rgb * (temp_output_22_0_g592).a ) , Colour_Power42);
				float3 hsvTorgb402 = RGBToHSV( lerpResult387 );
				float3 hsvTorgb401 = HSVToRGB( float3(( hsvTorgb402.x + _VerticalColourHueShift ),( hsvTorgb402.y + _VerticalColourSaturationShift ),( hsvTorgb402.z * _VerticalColourValueMultiplier )) );
				float temp_output_7_0_g598 = _VerticalColourMaskRemapMin;
				float temp_output_23_0_g598 = _VerticalColourMaskRemapMax;
				float UV_2D_Y691 = (staticSwitch321).y;
				float temp_output_20_0_g598 = UV_2D_Y691;
				float temp_output_4_0_g598 = _VerticalColourMaskPower;
				float smoothstepResult22_g598 = smoothstep( temp_output_7_0_g598 , temp_output_23_0_g598 , pow( temp_output_20_0_g598 , temp_output_4_0_g598 ));
				float Vertical_Colour_Mask369 = smoothstepResult22_g598;
				float3 lerpResult370 = lerp( hsvTorgb132 , hsvTorgb401 , Vertical_Colour_Mask369);
				#ifdef _VERTICALCOLOUR_ON
				float3 staticSwitch392 = lerpResult370;
				#else
				float3 staticSwitch392 = hsvTorgb132;
				#endif
				float3 Colour_Input393 = staticSwitch392;
				float4 Vertex_Colour951 = input.ase_color;
				float3 localGetMainLightColourFlat_float1118 = ( float3( 0,0,0 ) );
				float3 viewDirection1118 = ase_viewDirWS;
				float3 output1118 = float3( 0,0,0 );
				GetMainLightColourFlat_float( viewDirection1118 , output1118 );
				#ifdef _MAINLIGHTFLATENABLED_ON
				float3 staticSwitch1207 = output1118;
				#else
				float3 staticSwitch1207 = float3( 0,0,0 );
				#endif
				float3 localGetMainLightColourLambert_float1197 = ( float3( 0,0,0 ) );
				float3 viewDirection1197 = ase_viewDirWS;
				float3 surf_pos107_g605 = WorldPosition;
				float3 ase_worldNormal = input.ase_texcoord7.xyz;
				float3 surf_norm107_g605 = ase_worldNormal;
				float height107_g605 = Noise11;
				float scale107_g605 = _LambertLightingNormalfromHeight;
				float3 localPerturbNormal107_g605 = PerturbNormal107_g605( surf_pos107_g605 , surf_norm107_g605 , height107_g605 , scale107_g605 );
				float3 Normal_from_Height_Front1171 = localPerturbNormal107_g605;
				float3 normal1197 = Normal_from_Height_Front1171;
				float3 output1197 = float3( 0,0,0 );
				GetMainLightColourLambert_float( viewDirection1197 , normal1197 , output1197 );
				#ifdef _MAINLIGHTLAMBERTENABLED_ON
				float3 staticSwitch1208 = output1197;
				#else
				float3 staticSwitch1208 = float3( 0,0,0 );
				#endif
				float3 lerpResult1214 = lerp( staticSwitch1207 , staticSwitch1208 , _MainLightFlatLambertBlend);
				#ifdef _MAINLIGHTFLATENABLED_ON
				float3 staticSwitch1223 = lerpResult1214;
				#else
				float3 staticSwitch1223 = staticSwitch1208;
				#endif
				#ifdef _MAINLIGHTLAMBERTENABLED_ON
				float3 staticSwitch1215 = staticSwitch1223;
				#else
				float3 staticSwitch1215 = staticSwitch1207;
				#endif
				float3 Main_Light_Front1216 = staticSwitch1215;
				float3 localGetMainLightColourLambert_float1218 = ( float3( 0,0,0 ) );
				float3 viewDirection1218 = ase_viewDirWS;
				float3 surf_pos107_g604 = WorldPosition;
				float3 surf_norm107_g604 = ase_worldNormal;
				float height107_g604 = ( ( 1.0 - Noise11 ) * 0.5 );
				float scale107_g604 = _LambertLightingNormalfromHeight;
				float3 localPerturbNormal107_g604 = PerturbNormal107_g604( surf_pos107_g604 , surf_norm107_g604 , height107_g604 , scale107_g604 );
				float3 Normal_from_Height_Back1172 = -localPerturbNormal107_g604;
				float3 normal1218 = Normal_from_Height_Back1172;
				float3 output1218 = float3( 0,0,0 );
				GetMainLightColourLambert_float( viewDirection1218 , normal1218 , output1218 );
				#ifdef _MAINLIGHTLAMBERTENABLED_ON
				float3 staticSwitch1206 = output1218;
				#else
				float3 staticSwitch1206 = float3( 0,0,0 );
				#endif
				float3 lerpResult1213 = lerp( float3( 0,0,0 ) , staticSwitch1206 , _MainLightFlatLambertBlend);
				#ifdef _MAINLIGHTFLATENABLED_ON
				float3 staticSwitch1220 = lerpResult1213;
				#else
				float3 staticSwitch1220 = staticSwitch1206;
				#endif
				float3 Main_Light_Back1217 = staticSwitch1220;
				float3 normalizeResult1228 = ASESafeNormalize( Main_Light_Back1217 );
				float lerpResult1230 = lerp( 1.0 , Noise11 , _MainLightLambertTranslucencyMask);
				#ifdef _MAINLIGHTLAMBERTENABLED_ON
				float3 staticSwitch1225 = ( Main_Light_Front1216 + ( normalizeResult1228 * length( Main_Light_Back1217 ) * ( lerpResult1230 * _MainLightLambertTranslucency ) ) );
				#else
				float3 staticSwitch1225 = Main_Light_Front1216;
				#endif
				float localGetMainLightShadow_float1080 = ( 0.0 );
				float3 position1080 = WorldPosition;
				float2 screenPosition1080 = Screen_Position1254;
				float worldNoise1080 = _MainLightShadowWorldNoise;
				float lightDirectionNoise1080 = _MainLightShadowDirectionalNoise;
				float lightDirectionOrthogonalAlignmentNoise1080 = _MainLightShadowOrthogonalAlignmentWorldNoise;
				float lightDirectionAlignmentNoise1080 = _MainLightShadowDirectionalAlignmentNoise;
				float3 normal1080 = ase_worldNormal;
				float3 ase_worldTangent = input.ase_texcoord8.xyz;
				float3 ase_worldBitangent = input.ase_texcoord9.xyz;
				float3x3 ase_worldToTangent = float3x3(ase_worldTangent,ase_worldBitangent,ase_worldNormal);
				float3x3 worldToTangentMatrix1080 = ase_worldToTangent;
				float output1080 = 0.0;
				GetMainLightShadow_float( position1080 , screenPosition1080 , worldNoise1080 , lightDirectionNoise1080 , lightDirectionOrthogonalAlignmentNoise1080 , lightDirectionAlignmentNoise1080 , normal1080 , worldToTangentMatrix1080 , output1080 );
				float lerpResult963 = lerp( 1.0 , output1080 , _MainLightShadow);
				float Main_Light_Shadow1116 = lerpResult963;
				float3 localGetMainLightAnisotropy_float1203 = ( float3( 0,0,0 ) );
				float anisotropy1203 = _MainLightAnisotropy;
				float3 viewDirection1203 = ase_viewDirWS;
				float output1203 = 0.0;
				GetMainLightAnisotropy_float( anisotropy1203 , viewDirection1203 , output1203 );
				float lerpResult1205 = lerp( 1.0 , output1203 , _MainLightAnisotropyBlend);
				float3 Main_Light988 = ( staticSwitch1225 * Main_Light_Shadow1116 * _MainLight * lerpResult1205 );
				#ifdef _MAINLIGHTENABLED_ON
				float3 staticSwitch494 = Main_Light988;
				#else
				float3 staticSwitch494 = float3( 0,0,0 );
				#endif
				float localGetAdditionalLightsColourFlat_float1167 = ( 0.0 );
				float3 position1167 = WorldPosition;
				float2 screenUV1167 = Screen_UV1145;
				float3 output1167 = float3( 0,0,0 );
				GetAdditionalLightsColourFlat_float( position1167 , screenUV1167 , output1167 );
				#ifdef _ADDITIONALLIGHTSFLATENABLED_ON
				float3 staticSwitch1179 = output1167;
				#else
				float3 staticSwitch1179 = float3( 0,0,0 );
				#endif
				float localGetAdditionalLightsColourLambert_float1135 = ( 0.0 );
				float3 position1135 = WorldPosition;
				float2 screenUV1135 = Screen_UV1145;
				float3 normal1135 = Normal_from_Height_Front1171;
				float3 output1135 = float3( 0,0,0 );
				GetAdditionalLightsColourLambert_float( position1135 , screenUV1135 , normal1135 , output1135 );
				#ifdef _ADDITIONALLIGHTSLAMBERTENABLED_ON
				float3 staticSwitch1182 = output1135;
				#else
				float3 staticSwitch1182 = float3( 0,0,0 );
				#endif
				float3 lerpResult1176 = lerp( staticSwitch1179 , staticSwitch1182 , _AdditionalLightsFlatLambertBlend);
				#ifdef _ADDITIONALLIGHTSFLATENABLED_ON
				float3 staticSwitch1222 = lerpResult1176;
				#else
				float3 staticSwitch1222 = staticSwitch1182;
				#endif
				#ifdef _ADDITIONALLIGHTSLAMBERTENABLED_ON
				float3 staticSwitch1198 = staticSwitch1222;
				#else
				float3 staticSwitch1198 = staticSwitch1179;
				#endif
				float3 Additional_Lights_Front1175 = staticSwitch1198;
				float localGetAdditionalLightsColourLambert_float1137 = ( 0.0 );
				float3 position1137 = WorldPosition;
				float2 screenUV1137 = Screen_UV1145;
				float3 normal1137 = Normal_from_Height_Back1172;
				float3 output1137 = float3( 0,0,0 );
				GetAdditionalLightsColourLambert_float( position1137 , screenUV1137 , normal1137 , output1137 );
				#ifdef _ADDITIONALLIGHTSLAMBERTENABLED_ON
				float3 staticSwitch1183 = output1137;
				#else
				float3 staticSwitch1183 = float3( 0,0,0 );
				#endif
				float3 lerpResult1199 = lerp( float3( 0,0,0 ) , staticSwitch1183 , _AdditionalLightsFlatLambertBlend);
				#ifdef _ADDITIONALLIGHTSFLATENABLED_ON
				float3 staticSwitch1221 = lerpResult1199;
				#else
				float3 staticSwitch1221 = staticSwitch1183;
				#endif
				float3 Additional_Lights_Back1180 = staticSwitch1221;
				float3 normalizeResult540 = ASESafeNormalize( Additional_Lights_Back1180 );
				float lerpResult1141 = lerp( 1.0 , Noise11 , _AdditionalLightsLambertTranslucencyMask);
				#ifdef _ADDITIONALLIGHTSLAMBERTENABLED_ON
				float3 staticSwitch1200 = ( Additional_Lights_Front1175 + ( normalizeResult540 * length( Additional_Lights_Back1180 ) * ( lerpResult1141 * _AdditionalLightsLambertTranslucency ) ) );
				#else
				float3 staticSwitch1200 = Additional_Lights_Front1175;
				#endif
				float localGetAdditionalLightsShadow_float1125 = ( 0.0 );
				float3 position1125 = WorldPosition;
				float2 screenPosition1125 = Screen_Position1254;
				float2 screenUV1125 = Screen_UV1145;
				float worldNoise1125 = _AdditionalLightsShadowWorldNoise;
				float lightDirectionNoise1125 = _AdditionalLightsShadowDirectionalNoise;
				float lightDirectionOrthogonalAlignmentNoise1125 = _AdditionalLightsShadowOrthogonalAlignmentWorldNoise;
				float lightDirectionAlignmentNoise1125 = _AdditionalLightsShadowDirectionalAlignmentNoise;
				float3 normal1125 = ase_worldNormal;
				float3x3 worldToTangentMatrix1125 = ase_worldToTangent;
				float output1125 = 0.0;
				GetAdditionalLightsShadow_float( position1125 , screenPosition1125 , screenUV1125 , worldNoise1125 , lightDirectionNoise1125 , lightDirectionOrthogonalAlignmentNoise1125 , lightDirectionAlignmentNoise1125 , normal1125 , worldToTangentMatrix1125 , output1125 );
				float lerpResult1241 = lerp( 1.0 , output1125 , _AdditionalLightsShadow);
				float Additional_Lights_Shadow1153 = lerpResult1241;
				float3 Additional_Lights552 = ( staticSwitch1200 * Additional_Lights_Shadow1153 * _AdditionalLights );
				#ifdef _ADDITIONALLIGHTSENABLED_ON
				float3 staticSwitch1079 = Additional_Lights552;
				#else
				float3 staticSwitch1079 = float3( 0,0,0 );
				#endif
				float3 Lighting495 = ( staticSwitch494 + staticSwitch1079 );
				float3 hsvTorgb1067 = RGBToHSV( Colour_Input393 );
				float3 hsvTorgb1073 = HSVToRGB( float3(( hsvTorgb1067.x + _IntersectionHighlightColourHueShift ),( hsvTorgb1067.y + _IntersectionHighlightColourSaturationShift ),( hsvTorgb1067.z * _IntersectionHighlightColourValueMultiplier )) );
				float temp_output_7_0_g578 = _IntersectionHighlightRemapMin;
				float temp_output_23_0_g578 = _IntersectionHighlightRemapMax;
				float screenDepth1005 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth1005 = saturate( abs( ( screenDepth1005 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _IntersectionHighlight ) ) );
				float temp_output_20_0_g578 = ( 1.0 - distanceDepth1005 );
				float temp_output_4_0_g578 = _IntersectionHighlightPower;
				float smoothstepResult22_g578 = smoothstep( temp_output_7_0_g578 , temp_output_23_0_g578 , pow( temp_output_20_0_g578 , temp_output_4_0_g578 ));
				float Intersection_Highlight1011 = smoothstepResult22_g578;
				float4 lerpResult1018 = lerp( ( ( float4( Colour_Input393 , 0.0 ) * Vertex_Colour951 ) + float4( Lighting495 , 0.0 ) ) , float4( ( hsvTorgb1073 * _IntersectionHighlightColour.rgb ) , 0.0 ) , pow( Intersection_Highlight1011 , 0.0001 ));
				float4 Colour50 = lerpResult1018;
				
				float Particle_Mask_Radius_over_Lifetime161 = input.ase_texcoord6.x;
				float lerpResult183 = lerp( 1.0 , Particle_Mask_Radius_over_Lifetime161 , _RadialMaskRadiusOverParticleLifetime);
				float temp_output_6_0_g497 = ( 1.0 - ( _RadialMaskRadius * lerpResult183 ) );
				float lerpResult5_g497 = lerp( temp_output_6_0_g497 , 1.0 , _RadialMaskFeather);
				float2 texCoord330 = input.ase_texcoord4.xy * float2( 2,2 ) + float2( -1,-1 );
				#ifdef _SWAPUVXY_ON
				float2 staticSwitch329 = (texCoord330).yx;
				#else
				float2 staticSwitch329 = texCoord330;
				#endif
				float2 UV_2D_Centered328 = staticSwitch329;
				float localSimplexNoise_float2_g486 = ( 0.0 );
				float4 Mask_Distortion_Noise_Offset171 = ( _RadialMaskDistortionOffset + Particle_Stable_Random_X147 + ( _RadialMaskDistortionParticleAnimation * Particle_Age_Percent146 ) );
				float4 temp_output_10_0_g483 = ( float4( ( Noise_Base_UV220 * _RadialMaskDistortionScale * _RadialMaskDistortionTiling ) , 0.0 ) - ( Mask_Distortion_Noise_Offset171 + ( _RadialMaskDistortionAnimation * _TimeParameters.x ) ) );
				float3 temp_output_158_0 = (temp_output_10_0_g483).xyz;
				float3 position2_g486 = temp_output_158_0;
				float temp_output_158_15 = (temp_output_10_0_g483).w;
				float angle2_g486 = temp_output_158_15;
				float octaves2_g486 = _RadialMaskDistortionOctaves;
				float noise2_g486 = 0.0;
				float3 gradient2_g486 = float3( 0,0,0 );
				SimplexNoise_float( position2_g486 , angle2_g486 , octaves2_g486 , noise2_g486 , gradient2_g486 );
				float localSimplexNoise_Caustics_float2_g485 = ( 0.0 );
				float3 position2_g485 = temp_output_158_0;
				float angle2_g485 = temp_output_158_15;
				float octaves2_g485 = _RadialMaskDistortionOctaves;
				float gradientStrength2_g485 = _RadialMaskDistortionDilation;
				float noise2_g485 = 0.0;
				float3 gradient2_g485 = float3( 0,0,0 );
				SimplexNoise_Caustics_float( position2_g485 , angle2_g485 , octaves2_g485 , gradientStrength2_g485 , noise2_g485 , gradient2_g485 );
				#ifdef _RADIALMASKDISTORTIONDILATIONENABLED_ON
				float3 staticSwitch441 = gradient2_g485;
				#else
				float3 staticSwitch441 = gradient2_g486;
				#endif
				float3 temp_output_7_0_g488 = abs( staticSwitch441 );
				float3 temp_cast_12 = (_RadialMaskDistortionPower).xxx;
				#ifdef _RADIALMASKDISTORTIONENABLED_ON
				float3 staticSwitch451 = ( ( pow( temp_output_7_0_g488 , temp_cast_12 ) * sign( staticSwitch441 ) ) * _RadialMaskDistortion );
				#else
				float3 staticSwitch451 = float3( 0,0,0 );
				#endif
				float3 Mask_Distortion117 = staticSwitch451;
				float temp_output_7_0_g497 = ( 1.0 - length( ( ( ( UV_2D_Centered328 + (Mask_Distortion117).xy ) - _RadialMaskOffset ) * _RadialMaskTiling ) ) );
				float smoothstepResult4_g497 = smoothstep( temp_output_6_0_g497 , lerpResult5_g497 , temp_output_7_0_g497);
				#ifdef _RADIALMASK_ON
				float staticSwitch601 = ( 1.0 - pow( smoothstepResult4_g497 , _RadialMaskPower ) );
				#else
				float staticSwitch601 = 0.0;
				#endif
				float Radial_Mask227 = staticSwitch601;
				#ifdef _RADIALMASKSUBTRACTIVE_ON
				float staticSwitch942 = Radial_Mask227;
				#else
				float staticSwitch942 = 0.0;
				#endif
				float temp_output_7_0_g500 = _VerticalMask1RemapMax;
				float temp_output_23_0_g500 = _VerticalMask1RemapMin;
				float UV_3D_Y719 = (staticSwitch339).y;
				#ifdef _VERTICALMASKSOBJECTSPACE_ON
				float staticSwitch716 = ( ( UV_3D_Y719 - _VerticalMask1ObjectSpaceOffset ) / _VerticalMask1ObjectSpaceScale );
				#else
				float staticSwitch716 = UV_2D_Y691;
				#endif
				float temp_output_20_0_g500 = staticSwitch716;
				float smoothstepResult25_g500 = smoothstep( temp_output_7_0_g500 , temp_output_23_0_g500 , temp_output_20_0_g500);
				float temp_output_4_0_g500 = _VerticalMask1Power;
				float temp_output_862_0 = pow( smoothstepResult25_g500 , temp_output_4_0_g500 );
				#ifdef _VERTICALMASK1SUBTRACTIVE_ON
				float staticSwitch713 = ( 1.0 - temp_output_862_0 );
				#else
				float staticSwitch713 = temp_output_862_0;
				#endif
				float Vertical_Mask_1350 = staticSwitch713;
				#ifdef _VERTICALMASK1SUBTRACTIVE_ON
				float staticSwitch709 = ( staticSwitch942 + Vertical_Mask_1350 );
				#else
				float staticSwitch709 = staticSwitch942;
				#endif
				#ifdef _VERTICALMASK1_ON
				float staticSwitch741 = staticSwitch709;
				#else
				float staticSwitch741 = staticSwitch942;
				#endif
				float temp_output_7_0_g505 = _VerticalMask2RemapMin;
				float temp_output_23_0_g505 = _VerticalMask2RemapMax;
				#ifdef _VERTICALMASKSOBJECTSPACE_ON
				float staticSwitch767 = ( ( UV_3D_Y719 - _VerticalMask2ObjectSpaceOffset ) / _VerticalMask2ObjectSpaceScale );
				#else
				float staticSwitch767 = UV_2D_Y691;
				#endif
				float temp_output_20_0_g505 = staticSwitch767;
				float smoothstepResult25_g505 = smoothstep( temp_output_7_0_g505 , temp_output_23_0_g505 , temp_output_20_0_g505);
				float temp_output_4_0_g505 = _VerticalMask2Power;
				float temp_output_863_0 = pow( smoothstepResult25_g505 , temp_output_4_0_g505 );
				#ifdef _VERTICALMASK2SUBTRACTIVE_ON
				float staticSwitch758 = ( 1.0 - temp_output_863_0 );
				#else
				float staticSwitch758 = temp_output_863_0;
				#endif
				float Vertical_Mask_2759 = staticSwitch758;
				#ifdef _VERTICALMASK2SUBTRACTIVE_ON
				float staticSwitch760 = ( staticSwitch741 + Vertical_Mask_2759 );
				#else
				float staticSwitch760 = staticSwitch741;
				#endif
				#ifdef _VERTICALMASK2_ON
				float staticSwitch766 = staticSwitch760;
				#else
				float staticSwitch766 = staticSwitch741;
				#endif
				float fresnelNdotV232 = dot( ase_worldNormal, ase_viewDirWS );
				float fresnelNode232 = ( 0.0 + 1.0 * pow( 1.0 - fresnelNdotV232, _FresnelMaskPower ) );
				float smoothstepResult234 = smoothstep( _FresnelMaskRemapMin , _FresnelMaskRemapMax , fresnelNode232);
				float lerpResult242 = lerp( 1.0 , smoothstepResult234 , _FresnelMask);
				float Fresnel_Mask233 = lerpResult242;
				float temp_output_7_0_g576 = 0.0;
				float temp_output_23_0_g576 = 1.0;
				float screenDepth186 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth186 = saturate( abs( ( screenDepth186 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _DepthFade ) ) );
				#ifdef _INVERTDEPTHFADE_ON
				float staticSwitch218 = ( 1.0 - distanceDepth186 );
				#else
				float staticSwitch218 = distanceDepth186;
				#endif
				float temp_output_20_0_g576 = staticSwitch218;
				float temp_output_4_0_g576 = _DepthFadePower;
				float smoothstepResult22_g576 = smoothstep( temp_output_7_0_g576 , temp_output_23_0_g576 , pow( temp_output_20_0_g576 , temp_output_4_0_g576 ));
				float temp_output_7_0_g575 = 0.0;
				float temp_output_23_0_g575 = 1.0;
				float screenDepth208 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth208 = saturate( abs( ( screenDepth208 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _SubtractiveDepthFade ) ) );
				float temp_output_20_0_g575 = ( 1.0 - distanceDepth208 );
				float temp_output_4_0_g575 = _SubtractiveDepthFadePower;
				float smoothstepResult22_g575 = smoothstep( temp_output_7_0_g575 , temp_output_23_0_g575 , pow( temp_output_20_0_g575 , temp_output_4_0_g575 ));
				float Depth_Fade188 = saturate( ( smoothstepResult22_g576 - smoothstepResult22_g575 ) );
				float temp_output_7_0_g577 = 0.0;
				float temp_output_23_0_g577 = 1.0;
				float eyeDepth = input.ase_texcoord7.w;
				float cameraDepthFade191 = (( eyeDepth -_ProjectionParams.y - _CameraDepthFadeOffset ) / _CameraDepthFadeLength);
				float temp_output_20_0_g577 = saturate( cameraDepthFade191 );
				float temp_output_4_0_g577 = _CameraDepthFadePower;
				float smoothstepResult22_g577 = smoothstep( temp_output_7_0_g577 , temp_output_23_0_g577 , pow( temp_output_20_0_g577 , temp_output_4_0_g577 ));
				float Camera_Depth_Fade195 = smoothstepResult22_g577;
				float Intersection_Highlight_Alpha1024 = _IntersectionHighlightColour.a;
				float lerpResult984 = lerp( 1.0 , output1080 , _MainLightTransparencyShadow);
				float Main_Light_Transparency_Shadow981 = lerpResult984;
				#ifdef _MAINLIGHTTRANSPARENCYSHADOWENABLED_ON
				float staticSwitch1076 = Main_Light_Transparency_Shadow981;
				#else
				float staticSwitch1076 = 1.0;
				#endif
				float lerpResult993 = lerp( 1.0 , output1125 , _AdditionalLightsTransparencyShadow);
				float Additional_Lights_Transparency_Shadow994 = lerpResult993;
				#ifdef _ADDITIONALLIGHTSTRANSPARENCYSHADOWENABLED_ON
				float staticSwitch1077 = Additional_Lights_Transparency_Shadow994;
				#else
				float staticSwitch1077 = 1.0;
				#endif
				float temp_output_1030_0 = saturate( ( ( saturate( ( Noise11 - staticSwitch766 ) ) * Fresnel_Mask233 * (input.ase_color).a * Depth_Fade188 * Camera_Depth_Fade195 * _Alpha ) + ( Intersection_Highlight1011 * Intersection_Highlight_Alpha1024 * pow( ( staticSwitch1076 * staticSwitch1077 ) , _IntersectionHighlightShadowMaskPower ) ) ) );
				#ifdef _RADIALMASKSUBTRACTIVE_ON
				float staticSwitch943 = temp_output_1030_0;
				#else
				float staticSwitch943 = ( temp_output_1030_0 * ( 1.0 - Radial_Mask227 ) );
				#endif
				#ifdef _VERTICALMASK1SUBTRACTIVE_ON
				float staticSwitch711 = staticSwitch943;
				#else
				float staticSwitch711 = ( staticSwitch943 * Vertical_Mask_1350 );
				#endif
				#ifdef _VERTICALMASK1_ON
				float staticSwitch744 = staticSwitch711;
				#else
				float staticSwitch744 = staticSwitch943;
				#endif
				#ifdef _VERTICALMASK2SUBTRACTIVE_ON
				float staticSwitch763 = staticSwitch744;
				#else
				float staticSwitch763 = ( staticSwitch744 * Vertical_Mask_2759 );
				#endif
				#ifdef _VERTICALMASK2_ON
				float staticSwitch768 = staticSwitch763;
				#else
				float staticSwitch768 = staticSwitch744;
				#endif
				#ifdef _MAINLIGHTTRANSPARENCYSHADOWENABLED_ON
				float staticSwitch985 = ( staticSwitch768 * Main_Light_Transparency_Shadow981 );
				#else
				float staticSwitch985 = staticSwitch768;
				#endif
				#ifdef _ADDITIONALLIGHTSTRANSPARENCYSHADOWENABLED_ON
				float staticSwitch998 = ( staticSwitch985 * Additional_Lights_Transparency_Shadow994 );
				#else
				float staticSwitch998 = staticSwitch985;
				#endif
				float Alpha49 = staticSwitch998;
				
				float3 BakedAlbedo = 0;
				float3 BakedEmission = 0;
				float3 Color = Colour50.rgb;
				float Alpha = Alpha49;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;

				#ifdef _ALPHATEST_ON
					clip( Alpha - AlphaClipThreshold );
				#endif

				#if defined(_DBUFFER)
					ApplyDecalToBaseColor(input.positionCS, Color);
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( input.positionCS );
				#endif

				#ifdef ASE_FOG
					Color = MixFog( Color, input.fogFactor );
				#endif

				#ifdef _WRITE_RENDERING_LAYERS
					uint renderingLayers = GetMeshRenderingLayer();
					outRenderingLayers = float4( EncodeMeshRenderingLayer( renderingLayers ), 0, 0, 0 );
				#endif

				return half4( Color, Alpha );
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthOnly"
			Tags { "LightMode"="DepthOnly" }

			ZWrite On
			ColorMask R
			AlphaToMask Off

			HLSLPROGRAM

			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define ASE_FIXED_TESSELLATION
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define ASE_PHONG_TESSELLATION
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define ASE_TESSELLATION 1
			#pragma require tessellation tessHW
			#pragma hull HullFunction
			#pragma domain DomainFunction
			#define ASE_VERSION 19701
			#define ASE_SRP_VERSION 170003
			#define REQUIRE_DEPTH_TEXTURE 1


			#pragma vertex vert
			#pragma fragment frag

			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#include "../../VFXToolkit/Shaders/_Includes/Math.cginc"
			#include "../../VFXToolkit/Shaders/_Includes/Noise.cginc"
			#include "_Includes/Solaris.hlsl"
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_SCREEN_POSITION
			#pragma shader_feature_local _SWAPUVXY_ON
			#pragma shader_feature_local _VERTEXWAVEENABLED_ON
			#pragma shader_feature_local _VERTEXNOISEENABLED_ON
			#pragma shader_feature_local _VERTEXNOISEDILATIONENABLED_ON
			#pragma shader_feature_local _WORLDSPACEUVS_ON
			#pragma shader_feature_local _ADDITIONALLIGHTSTRANSPARENCYSHADOWENABLED_ON
			#pragma shader_feature_local _MAINLIGHTTRANSPARENCYSHADOWENABLED_ON
			#pragma shader_feature_local _VERTICALMASK2_ON
			#pragma shader_feature_local _VERTICALMASK1_ON
			#pragma shader_feature_local _RADIALMASKSUBTRACTIVE_ON
			#pragma shader_feature_local _NOISEDILATIONENABLED_ON
			#pragma shader_feature_local _NOISEXZTWISTENABLED_ON
			#pragma shader_feature_local _SPHERIZENOISE_ON
			#pragma shader_feature_local _OBJECTSPACEUVS_ON
			#pragma shader_feature_local _NOISEDISTORTIONENABLED_ON
			#pragma shader_feature_local _NOISEDISTORTIONDILATIONENABLED_ON
			#pragma shader_feature_local _RADIALMASK_ON
			#pragma shader_feature_local _RADIALMASKDISTORTIONENABLED_ON
			#pragma shader_feature_local _RADIALMASKDISTORTIONDILATIONENABLED_ON
			#pragma shader_feature_local _VERTICALMASK1SUBTRACTIVE_ON
			#pragma shader_feature_local _VERTICALMASKSOBJECTSPACE_ON
			#pragma shader_feature_local _VERTICALMASK2SUBTRACTIVE_ON
			#pragma shader_feature_local _INVERTDEPTHFADE_ON
			#pragma multi_compile _ _FORWARD_PLUS
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
			#pragma multi_compile _ _ADDITIONAL_LIGHTS
			 #pragma multi_compile _ _ADDITIONAL_LIGHT_SHADOWS


			struct Attributes
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				float4 positionCS : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 positionWS : TEXCOORD1;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD2;
				#endif
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_color : COLOR;
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ColourA;
			float4 _RadialMaskDistortionAnimation;
			float4 _VerticalColourA;
			float4 _VerticalColourB;
			float4 _RadialMaskDistortionParticleAnimation;
			float4 _RadialMaskDistortionOffset;
			float4 _NoiseDistortionOffset;
			float4 _ColourB;
			float4 _NoiseDistortionAnimation;
			float4 _NoiseDistortionParticleAnimation;
			float4 _IntersectionHighlightColour;
			float4 _VertexNoiseAnimation;
			float4 _NoiseAnimation;
			float4 _VertexNoiseParticleAnimation;
			float4 _NoiseOffset;
			float4 _NoiseParticleAnimation;
			float4 _VertexNoiseOffset;
			float3 _VertexOffsetOverY1;
			float3 _RadialMaskDistortionTiling;
			float3 _VertexOffsetOverCircularY;
			float3 _VertexOffsetOverY2;
			float3 _VertexNoiseTiling;
			float3 _NoiseTiling;
			float3 _NoiseDistortionTiling;
			float2 _RadialMaskTiling;
			float2 _RadialMaskOffset;
			float2 _SpherizeNoiseOffset;
			float _VerticalColourMaskRemapMax;
			float _MainLightShadowOrthogonalAlignmentWorldNoise;
			float _MainLightShadowDirectionalAlignmentNoise;
			float _Noise;
			float _MainLightShadow;
			float _MainLightAnisotropyBlend;
			float _MainLightAnisotropy;
			float _AdditionalLightsFlatLambertBlend;
			float _ParticleSubtractNoiseoverLifetime;
			float _NoisePower;
			float _AdditionalLightsLambertTranslucencyMask;
			float _MainLight;
			float _MainLightShadowDirectionalNoise;
			float _ColourPower;
			float _MainLightLambertTranslucency;
			float _ColourHueShift;
			float _MainLightLambertTranslucencyMask;
			float _ColourSaturationShift;
			float _ColourValueMultiplier;
			float _VerticalColourHueShift;
			float _VerticalColourSaturationShift;
			float _MainLightFlatLambertBlend;
			float _VerticalColourValueMultiplier;
			float _VerticalColourMaskRemapMin;
			float _LambertLightingNormalfromHeight;
			float _VerticalColourMaskPower;
			float _MainLightShadowWorldNoise;
			float _Tessellation;
			float _AdditionalLightsShadowOrthogonalAlignmentWorldNoise;
			float _AdditionalLightsShadowWorldNoise;
			float _VerticalMask1Power;
			float _VerticalMask2RemapMin;
			float _VerticalMask2RemapMax;
			float _VerticalMask2ObjectSpaceOffset;
			float _VerticalMask2ObjectSpaceScale;
			float _VerticalMask2Power;
			float _FresnelMaskRemapMin;
			float _FresnelMaskRemapMax;
			float _FresnelMaskPower;
			float _FresnelMask;
			float _DepthFade;
			float _DepthFadePower;
			float _SubtractiveDepthFade;
			float _SubtractiveDepthFadePower;
			float _CameraDepthFadeLength;
			float _CameraDepthFadeOffset;
			float _CameraDepthFadePower;
			float _Alpha;
			float _MainLightTransparencyShadow;
			float _VerticalMask1ObjectSpaceScale;
			float _VerticalMask1ObjectSpaceOffset;
			float _VerticalMask1RemapMin;
			float _VerticalMask1RemapMax;
			float _AdditionalLightsShadowDirectionalNoise;
			float _AdditionalLightsShadowDirectionalAlignmentNoise;
			float _AdditionalLightsShadow;
			float _AdditionalLights;
			float _IntersectionHighlightColourHueShift;
			float _IntersectionHighlightColourSaturationShift;
			float _IntersectionHighlightColourValueMultiplier;
			float _IntersectionHighlightRemapMin;
			float _IntersectionHighlightRemapMax;
			float _AdditionalLightsLambertTranslucency;
			float _IntersectionHighlight;
			float _RadialMaskRadius;
			float _RadialMaskRadiusOverParticleLifetime;
			float _RadialMaskFeather;
			float _RadialMaskDistortionScale;
			float _RadialMaskDistortionOctaves;
			float _RadialMaskDistortionDilation;
			float _RadialMaskDistortionPower;
			float _RadialMaskDistortion;
			float _RadialMaskPower;
			float _IntersectionHighlightPower;
			float _NoiseDilation;
			float _NoiseDistortionDilation;
			float _NoiseScale;
			float _StartFoldoutBaseUVs;
			float _StartFoldoutParticleSettings;
			float _EndFoldoutParticleSettings;
			float _StartFoldoutDepthFade;
			float _EndFoldoutDepthFade;
			float _StartFoldoutIntersectionHighlight;
			float _EndFoldoutIntersectionHighlight;
			float _StartFoldoutVertexUVOffset;
			float _EndFoldoutVertexUVOffset;
			float _StartFoldoutVertexNormalOffset;
			float _EndFoldoutVertexNormalOffset;
			float _StartFoldoutVertexWave;
			float _EndFoldoutVertexWave;
			float _StartFoldoutVertexNoise;
			float _EndFoldoutVertexNoise;
			float _EndFoldoutVertexWaveNoiseVerticalMask;
			float _StartFoldoutVertexOffsetoverY;
			float _EndFoldoutLighting;
			float _EndFoldoutVertexOffsetoverY;
			float _StartFoldoutLighting;
			float _StartFoldoutVerticalColour;
			float _EndFoldoutBaseUVs;
			float _StartFoldoutColour;
			float _StartFoldoutNoise;
			float _EndFoldoutNoise;
			float _StartFoldoutNoiseDistortion;
			float _EndFoldoutNoiseDistortion;
			float _StartFoldoutRadialMask;
			float _EndFoldoutRadialMask;
			float _StartFoldoutRadialMaskDistortion;
			float _EndFoldoutRadialMaskDistortion;
			float _EndFoldoutVerticalMasks;
			float _StartFoldoutVerticalMasks;
			float _StartFoldoutSpherizeNoise;
			float _EndFoldoutSpherizeNoise;
			float _StartFoldoutFresnelMask;
			float _EndFoldoutFresnelMask;
			float _EndFoldoutColour;
			float _EndFoldoutVerticalColour;
			float _StartFoldoutVertexWaveNoiseVerticalMask;
			float _VertexNormalOffset;
			float _VertexNormalOffsetTopPower;
			float _VertexOffsetOverY2Power;
			float _VertexOffsetOverCircularYPower;
			float _NoiseRemapMin;
			float _NoiseRemapMax;
			float _UVSampleNoise;
			float _SpherizeNoiseRadius;
			float _SpherizeNoiseStrength;
			float _NoiseXZTwist;
			float _NoiseUVYPreOffset;
			float _NoiseUVYPreScale;
			float _NoiseUVYPrePower;
			float _NoiseParallaxOffset;
			float _NoiseDistortionScale;
			float _NoiseDistortionOctaves;
			float _AdditionalLightsTransparencyShadow;
			float _NoiseDistortionPower;
			float _NoiseDistortion;
			float _VertexOffsetOverY1Power;
			float _VertexTwist;
			float _VertexUVOffsetBottom;
			float _VertexUVOffsetBottomPower;
			float _VertexNormalOffsetTop;
			float _VertexNormalOffsetBottomPower;
			float _VertexNormalOffsetBottom;
			float _VertexWaveScale;
			float _VertexWaveAnimation;
			float _VertexWaveOffset;
			float _VertexWave;
			float _VertexWaveNoiseVerticalMaskRemapMin;
			float _NoiseOctaves;
			float _VertexWaveNoiseVerticalMaskRemapMax;
			float _VertexNoiseScale;
			float _ParticleRandomization;
			float _VertexNoiseOctaves;
			float _VertexNoiseDilation;
			float _VertexNoiseTwist;
			float _VertexNoise;
			float _VertexUVOffsetTopPower;
			float _VertexUVOffsetTop;
			float _VertexWaveNoiseVerticalMaskPower;
			float _IntersectionHighlightShadowMaskPower;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			

			
			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				float localTwistXZ_float11_g586 = ( 0.0 );
				float2 texCoord322 = input.ase_texcoord * float2( 1,1 ) + float2( 0,0 );
				#ifdef _SWAPUVXY_ON
				float2 staticSwitch321 = (texCoord322).yx;
				#else
				float2 staticSwitch321 = texCoord322;
				#endif
				float UV_2D_Y691 = (staticSwitch321).y;
				float3 Vertex_Normal_Offset670 = ( ( input.normalOS * _VertexNormalOffset ) + ( pow( UV_2D_Y691 , _VertexNormalOffsetTopPower ) * input.normalOS * _VertexNormalOffsetTop ) + ( pow( ( 1.0 - UV_2D_Y691 ) , _VertexNormalOffsetBottomPower ) * input.normalOS * _VertexNormalOffsetBottom ) );
				float2 UV_2D327 = staticSwitch321;
				float mulTime258 = _TimeParameters.x * _VertexWaveAnimation;
				float temp_output_7_0_g581 = _VertexWaveNoiseVerticalMaskRemapMin;
				float temp_output_23_0_g581 = _VertexWaveNoiseVerticalMaskRemapMax;
				float temp_output_20_0_g581 = UV_2D_Y691;
				float temp_output_4_0_g581 = _VertexWaveNoiseVerticalMaskPower;
				float smoothstepResult22_g581 = smoothstep( temp_output_7_0_g581 , temp_output_23_0_g581 , pow( temp_output_20_0_g581 , temp_output_4_0_g581 ));
				float Vertex_WaveNoise_Vertical_Mask280 = smoothstepResult22_g581;
				#ifdef _VERTEXWAVEENABLED_ON
				float3 staticSwitch448 = ( ( sin( ( ( UV_2D327.y * TWO_PI * _VertexWaveScale ) - ( mulTime258 + ( _VertexWaveOffset * TWO_PI ) ) ) ) * _VertexWave * Vertex_WaveNoise_Vertical_Mask280 ) * input.normalOS );
				#else
				float3 staticSwitch448 = float3( 0,0,0 );
				#endif
				float3 Vertex_Sine265 = staticSwitch448;
				float localTwistXZ_float11_g584 = ( 0.0 );
				float localSimplexNoise_float2_g583 = ( 0.0 );
				#ifdef _SWAPUVXY_ON
				float3 staticSwitch339 = (input.positionOS.xyz).yxz;
				#else
				float3 staticSwitch339 = input.positionOS.xyz;
				#endif
				float3 UV_3D340 = staticSwitch339;
				float3 ase_worldPos = TransformObjectToWorld( (input.positionOS).xyz );
				#ifdef _SWAPUVXY_ON
				float3 staticSwitch621 = (ase_worldPos).yxz;
				#else
				float3 staticSwitch621 = ase_worldPos;
				#endif
				float3 UV_3D_World622 = staticSwitch621;
				#ifdef _WORLDSPACEUVS_ON
				float3 staticSwitch605 = UV_3D_World622;
				#else
				float3 staticSwitch605 = UV_3D340;
				#endif
				float Particle_Stable_Random_X147 = ( ( input.ase_texcoord.w - 0.5 ) * 100.0 * _ParticleRandomization );
				float Particle_Age_Percent146 = input.ase_texcoord.z;
				float4 Vertex_Noise_Offset311 = ( _VertexNoiseOffset + Particle_Stable_Random_X147 + ( _VertexNoiseParticleAnimation * Particle_Age_Percent146 ) );
				float4 temp_output_10_0_g579 = ( float4( ( staticSwitch605 * _VertexNoiseScale * _VertexNoiseTiling ) , 0.0 ) - ( Vertex_Noise_Offset311 + ( _VertexNoiseAnimation * _TimeParameters.x ) ) );
				float3 temp_output_292_0 = (temp_output_10_0_g579).xyz;
				float3 position2_g583 = temp_output_292_0;
				float temp_output_292_15 = (temp_output_10_0_g579).w;
				float angle2_g583 = temp_output_292_15;
				float octaves2_g583 = _VertexNoiseOctaves;
				float noise2_g583 = 0.0;
				float3 gradient2_g583 = float3( 0,0,0 );
				SimplexNoise_float( position2_g583 , angle2_g583 , octaves2_g583 , noise2_g583 , gradient2_g583 );
				float localSimplexNoise_Caustics_float2_g582 = ( 0.0 );
				float3 position2_g582 = temp_output_292_0;
				float angle2_g582 = temp_output_292_15;
				float octaves2_g582 = _VertexNoiseOctaves;
				float gradientStrength2_g582 = _VertexNoiseDilation;
				float noise2_g582 = 0.0;
				float3 gradient2_g582 = float3( 0,0,0 );
				SimplexNoise_Caustics_float( position2_g582 , angle2_g582 , octaves2_g582 , gradientStrength2_g582 , noise2_g582 , gradient2_g582 );
				#ifdef _VERTEXNOISEDILATIONENABLED_ON
				float3 staticSwitch490 = gradient2_g582;
				#else
				float3 staticSwitch490 = gradient2_g583;
				#endif
				float3 temp_output_10_0_g584 = staticSwitch490;
				float3 position11_g584 = temp_output_10_0_g584;
				float temp_output_9_0_g584 = _VertexNoiseTwist;
				float angle11_g584 = radians( temp_output_9_0_g584 );
				float3 output11_g584 = float3( 0,0,0 );
				TwistXZ_float( position11_g584 , angle11_g584 , output11_g584 );
				float3 temp_output_852_0 = output11_g584;
				#ifdef _VERTEXNOISEENABLED_ON
				float3 staticSwitch450 = ( temp_output_852_0 * _VertexNoise * Vertex_WaveNoise_Vertical_Mask280 );
				#else
				float3 staticSwitch450 = float3( 0,0,0 );
				#endif
				float3 Vertex_Noise298 = staticSwitch450;
				float2 break587 = ( ( UV_2D327 * float2( 2,1 ) ) - float2( 1,0 ) );
				float temp_output_576_0 = ( ( break587.x * pow( break587.y , _VertexUVOffsetTopPower ) ) * ( _VertexUVOffsetTop * 0.5 ) );
				float3 appendResult575 = (float3(temp_output_576_0 , 0.0 , 0.0));
				float3 appendResult594 = (float3(0.0 , temp_output_576_0 , 0.0));
				#ifdef _SWAPUVXY_ON
				float3 staticSwitch593 = appendResult594;
				#else
				float3 staticSwitch593 = appendResult575;
				#endif
				float3 Vertex_Offset_Top579 = staticSwitch593;
				float2 break644 = ( ( UV_2D327 * float2( 2,1 ) ) - float2( 1,0 ) );
				float temp_output_650_0 = ( ( break644.x * pow( ( 1.0 - break644.y ) , _VertexUVOffsetBottomPower ) ) * ( _VertexUVOffsetBottom * 0.5 ) );
				float3 appendResult653 = (float3(temp_output_650_0 , 0.0 , 0.0));
				float3 appendResult652 = (float3(0.0 , temp_output_650_0 , 0.0));
				#ifdef _SWAPUVXY_ON
				float3 staticSwitch654 = appendResult652;
				#else
				float3 staticSwitch654 = appendResult653;
				#endif
				float3 Vertex_Offset_Bottom655 = staticSwitch654;
				float3 temp_output_10_0_g586 = ( ( Vertex_Normal_Offset670 + Vertex_Sine265 + Vertex_Noise298 + Vertex_Offset_Top579 + Vertex_Offset_Bottom655 ) + input.positionOS.xyz );
				float3 position11_g586 = temp_output_10_0_g586;
				float temp_output_9_0_g586 = -_VertexTwist;
				float angle11_g586 = radians( temp_output_9_0_g586 );
				float3 output11_g586 = float3( 0,0,0 );
				TwistXZ_float( position11_g586 , angle11_g586 , output11_g586 );
				float3 worldToObjDir636 = mul( GetWorldToObjectMatrix(), float4( _VertexOffsetOverY1, 0 ) ).xyz;
				float3 worldToObjDir780 = mul( GetWorldToObjectMatrix(), float4( _VertexOffsetOverY2, 0 ) ).xyz;
				float UV_2D_Circular_Y897 = sin( ( UV_2D_Y691 * PI ) );
				float3 Vertex_Offset_over_Y639 = ( ( worldToObjDir636 * pow( UV_2D_Y691 , _VertexOffsetOverY1Power ) ) + ( worldToObjDir780 * pow( UV_2D_Y691 , _VertexOffsetOverY2Power ) ) + ( _VertexOffsetOverCircularY * pow( UV_2D_Circular_Y897 , _VertexOffsetOverCircularYPower ) ) );
				float3 Vertex_Offset247 = ( output11_g586 + Vertex_Offset_over_Y639 );
				
				float3 ase_worldNormal = TransformObjectToWorldNormal(input.normalOS);
				output.ase_texcoord6.xyz = ase_worldNormal;
				float3 objectToViewPos = TransformWorldToView(TransformObjectToWorld(input.positionOS.xyz));
				float eyeDepth = -objectToViewPos.z;
				output.ase_texcoord6.w = eyeDepth;
				float3 ase_worldTangent = TransformObjectToWorldDir(input.ase_tangent.xyz);
				output.ase_texcoord7.xyz = ase_worldTangent;
				float ase_vertexTangentSign = input.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				output.ase_texcoord8.xyz = ase_worldBitangent;
				
				output.ase_texcoord3 = input.ase_texcoord;
				output.ase_texcoord4 = input.positionOS;
				output.ase_texcoord5 = input.ase_texcoord1;
				output.ase_color = input.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord7.w = 0;
				output.ase_texcoord8.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = Vertex_Offset247;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					input.positionOS.xyz = vertexValue;
				#else
					input.positionOS.xyz += vertexValue;
				#endif

				input.normalOS = input.normalOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( input.positionOS.xyz );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					output.positionWS = vertexInput.positionWS;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					output.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				output.positionCS = vertexInput.positionCS;
				output.clipPosV = vertexInput.positionCS;
				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( Attributes input )
			{
				VertexControl output;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				output.vertex = input.positionOS;
				output.normalOS = input.normalOS;
				output.ase_texcoord = input.ase_texcoord;
				output.ase_texcoord1 = input.ase_texcoord1;
				output.ase_color = input.ase_color;
				output.ase_tangent = input.ase_tangent;
				return output;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> input)
			{
				TessellationFactors output;
				float4 tf = 1;
				float tessValue = _Tessellation; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(input[0].vertex, input[1].vertex, input[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(input[0].vertex, input[1].vertex, input[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(input[0].vertex, input[1].vertex, input[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				output.edge[0] = tf.x; output.edge[1] = tf.y; output.edge[2] = tf.z; output.inside = tf.w;
				return output;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			PackedVaryings DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				Attributes output = (Attributes) 0;
				output.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				output.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				output.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				output.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				output.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				output.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = output.positionOS.xyz - patch[i].normalOS * (dot(output.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				output.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * output.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], output);
				return VertexFunction(output);
			}
			#else
			PackedVaryings vert ( Attributes input )
			{
				return VertexFunction( input );
			}
			#endif

			half4 frag(PackedVaryings input  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( input );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = input.positionWS;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				float4 ClipPos = input.clipPosV;
				float4 ScreenPos = ComputeScreenPos( input.clipPosV );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = input.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float temp_output_7_0_g574 = _NoiseRemapMin;
				float temp_output_23_0_g574 = _NoiseRemapMax;
				float localSimplexNoise_float2_g504 = ( 0.0 );
				float2 texCoord322 = input.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _SWAPUVXY_ON
				float2 staticSwitch321 = (texCoord322).yx;
				#else
				float2 staticSwitch321 = texCoord322;
				#endif
				float2 UV_2D327 = staticSwitch321;
				#ifdef _SWAPUVXY_ON
				float3 staticSwitch339 = (input.ase_texcoord4.xyz).yxz;
				#else
				float3 staticSwitch339 = input.ase_texcoord4.xyz;
				#endif
				float3 UV_3D340 = staticSwitch339;
				#ifdef _OBJECTSPACEUVS_ON
				float3 staticSwitch223 = UV_3D340;
				#else
				float3 staticSwitch223 = float3( UV_2D327 ,  0.0 );
				#endif
				#ifdef _SWAPUVXY_ON
				float3 staticSwitch621 = (WorldPosition).yxz;
				#else
				float3 staticSwitch621 = WorldPosition;
				#endif
				float3 UV_3D_World622 = staticSwitch621;
				#ifdef _WORLDSPACEUVS_ON
				float3 staticSwitch356 = UV_3D_World622;
				#else
				float3 staticSwitch356 = staticSwitch223;
				#endif
				float4 ase_screenPosNorm = ScreenPos / ScreenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float2 appendResult1146 = (float2(ase_screenPosNorm.x , ase_screenPosNorm.y));
				float2 Screen_UV1145 = appendResult1146;
				float2 appendResult1112 = (float2(_ScreenParams.x , _ScreenParams.y));
				float2 Screen_Resolution1113 = appendResult1112;
				float2 Screen_Position1254 = ( Screen_UV1145 * Screen_Resolution1113 );
				float2 screenPosition1243 = Screen_Position1254;
				float mulTime1247 = _TimeParameters.x * 60.0;
				float time1243 = mulTime1247;
				float3 localHash331243 = Hash33( screenPosition1243 , time1243 );
				float3 Sample_Noise1248 = ( (localHash331243*2.0 + -1.0) * _UVSampleNoise );
				float3 Noise_Base_UV220 = ( staticSwitch356 + Sample_Noise1248 );
				float localSpherize_float5_g487 = ( 0.0 );
				float2 uv5_g487 = (Noise_Base_UV220).xy;
				float2 center5_g487 = ( _SpherizeNoiseOffset + float2( 0.5,0.5 ) );
				float radius5_g487 = _SpherizeNoiseRadius;
				float strength5_g487 = _SpherizeNoiseStrength;
				float2 output5_g487 = float2( 0,0 );
				Spherize_float( uv5_g487 , center5_g487 , radius5_g487 , strength5_g487 , output5_g487 );
				float3 appendResult611 = (float3(output5_g487 , (Noise_Base_UV220).z));
				#ifdef _SPHERIZENOISE_ON
				float3 staticSwitch625 = appendResult611;
				#else
				float3 staticSwitch625 = Noise_Base_UV220;
				#endif
				float localTwistXZ_float11_g493 = ( 0.0 );
				float3 temp_output_10_0_g493 = staticSwitch625;
				float3 position11_g493 = temp_output_10_0_g493;
				float temp_output_9_0_g493 = _NoiseXZTwist;
				float angle11_g493 = radians( temp_output_9_0_g493 );
				float3 output11_g493 = float3( 0,0,0 );
				TwistXZ_float( position11_g493 , angle11_g493 , output11_g493 );
				#ifdef _NOISEXZTWISTENABLED_ON
				float3 staticSwitch801 = output11_g493;
				#else
				float3 staticSwitch801 = staticSwitch625;
				#endif
				float3 break728 = staticSwitch801;
				float temp_output_738_0 = ( ( break728.y - _NoiseUVYPreOffset ) * _NoiseUVYPreScale );
				float temp_output_7_0_g496 = abs( temp_output_738_0 );
				float temp_output_733_14 = ( pow( temp_output_7_0_g496 , _NoiseUVYPrePower ) * sign( temp_output_738_0 ) );
				float3 appendResult732 = (float3(break728.x , temp_output_733_14 , break728.z));
				float3 ase_viewVectorWS = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				float3 ase_viewDirWS = normalize( ase_viewVectorWS );
				float3 temp_output_872_0 = ( -ase_viewDirWS * _NoiseParallaxOffset );
				#ifdef _SWAPUVXY_ON
				float3 staticSwitch464 = (temp_output_872_0).yxz;
				#else
				float3 staticSwitch464 = temp_output_872_0;
				#endif
				float3 Parallax_Offset465 = staticSwitch464;
				float localSimplexNoise_float2_g492 = ( 0.0 );
				float Particle_Stable_Random_X147 = ( ( input.ase_texcoord3.w - 0.5 ) * 100.0 * _ParticleRandomization );
				float Particle_Age_Percent146 = input.ase_texcoord3.z;
				float4 Distortion_Noise_Offset163 = ( _NoiseDistortionOffset + Particle_Stable_Random_X147 + ( _NoiseDistortionParticleAnimation * Particle_Age_Percent146 ) );
				float4 temp_output_10_0_g489 = ( float4( ( ( Noise_Base_UV220 + Parallax_Offset465 ) * _NoiseDistortionScale * _NoiseDistortionTiling ) , 0.0 ) - ( Distortion_Noise_Offset163 + ( _NoiseDistortionAnimation * _TimeParameters.x ) ) );
				float3 temp_output_160_0 = (temp_output_10_0_g489).xyz;
				float3 position2_g492 = temp_output_160_0;
				float temp_output_160_15 = (temp_output_10_0_g489).w;
				float angle2_g492 = temp_output_160_15;
				float octaves2_g492 = _NoiseDistortionOctaves;
				float noise2_g492 = 0.0;
				float3 gradient2_g492 = float3( 0,0,0 );
				SimplexNoise_float( position2_g492 , angle2_g492 , octaves2_g492 , noise2_g492 , gradient2_g492 );
				float localSimplexNoise_Caustics_float2_g491 = ( 0.0 );
				float3 position2_g491 = temp_output_160_0;
				float angle2_g491 = temp_output_160_15;
				float octaves2_g491 = _NoiseDistortionOctaves;
				float gradientStrength2_g491 = _NoiseDistortionDilation;
				float noise2_g491 = 0.0;
				float3 gradient2_g491 = float3( 0,0,0 );
				SimplexNoise_Caustics_float( position2_g491 , angle2_g491 , octaves2_g491 , gradientStrength2_g491 , noise2_g491 , gradient2_g491 );
				#ifdef _NOISEDISTORTIONDILATIONENABLED_ON
				float3 staticSwitch440 = gradient2_g491;
				#else
				float3 staticSwitch440 = gradient2_g492;
				#endif
				float3 temp_output_7_0_g495 = abs( staticSwitch440 );
				float3 temp_cast_3 = (_NoiseDistortionPower).xxx;
				#ifdef _NOISEDISTORTIONENABLED_ON
				float3 staticSwitch442 = ( ( pow( temp_output_7_0_g495 , temp_cast_3 ) * sign( staticSwitch440 ) ) * _NoiseDistortion );
				#else
				float3 staticSwitch442 = float3( 0,0,0 );
				#endif
				float3 Noise_Distortion73 = staticSwitch442;
				float3 Noise_UV173 = ( appendResult732 + Parallax_Offset465 + Noise_Distortion73 );
				float4 Noise_Offset175 = ( _NoiseOffset + Particle_Stable_Random_X147 + ( _NoiseParticleAnimation * Particle_Age_Percent146 ) );
				float4 temp_output_10_0_g501 = ( float4( ( Noise_UV173 * _NoiseScale * _NoiseTiling ) , 0.0 ) - ( Noise_Offset175 + ( _NoiseAnimation * _TimeParameters.x ) ) );
				float3 temp_output_159_0 = (temp_output_10_0_g501).xyz;
				float3 position2_g504 = temp_output_159_0;
				float temp_output_159_15 = (temp_output_10_0_g501).w;
				float angle2_g504 = temp_output_159_15;
				float octaves2_g504 = _NoiseOctaves;
				float noise2_g504 = 0.0;
				float3 gradient2_g504 = float3( 0,0,0 );
				SimplexNoise_float( position2_g504 , angle2_g504 , octaves2_g504 , noise2_g504 , gradient2_g504 );
				float localSimplexNoise_Caustics_float2_g503 = ( 0.0 );
				float3 position2_g503 = temp_output_159_0;
				float angle2_g503 = temp_output_159_15;
				float octaves2_g503 = _NoiseOctaves;
				float gradientStrength2_g503 = _NoiseDilation;
				float noise2_g503 = 0.0;
				float3 gradient2_g503 = float3( 0,0,0 );
				SimplexNoise_Caustics_float( position2_g503 , angle2_g503 , octaves2_g503 , gradientStrength2_g503 , noise2_g503 , gradient2_g503 );
				#ifdef _NOISEDILATIONENABLED_ON
				float staticSwitch444 = noise2_g503;
				#else
				float staticSwitch444 = noise2_g504;
				#endif
				float temp_output_20_0_g574 = staticSwitch444;
				float temp_output_4_0_g574 = _NoisePower;
				float smoothstepResult22_g574 = smoothstep( temp_output_7_0_g574 , temp_output_23_0_g574 , pow( temp_output_20_0_g574 , temp_output_4_0_g574 ));
				float Particle_Subtract_Noise_over_Lifetime480 = ( input.ase_texcoord5.y * _ParticleSubtractNoiseoverLifetime );
				float temp_output_478_0 = ( smoothstepResult22_g574 - Particle_Subtract_Noise_over_Lifetime480 );
				float lerpResult569 = lerp( 1.0 , temp_output_478_0 , _Noise);
				float Noise11 = lerpResult569;
				float Particle_Mask_Radius_over_Lifetime161 = input.ase_texcoord5.x;
				float lerpResult183 = lerp( 1.0 , Particle_Mask_Radius_over_Lifetime161 , _RadialMaskRadiusOverParticleLifetime);
				float temp_output_6_0_g497 = ( 1.0 - ( _RadialMaskRadius * lerpResult183 ) );
				float lerpResult5_g497 = lerp( temp_output_6_0_g497 , 1.0 , _RadialMaskFeather);
				float2 texCoord330 = input.ase_texcoord3.xy * float2( 2,2 ) + float2( -1,-1 );
				#ifdef _SWAPUVXY_ON
				float2 staticSwitch329 = (texCoord330).yx;
				#else
				float2 staticSwitch329 = texCoord330;
				#endif
				float2 UV_2D_Centered328 = staticSwitch329;
				float localSimplexNoise_float2_g486 = ( 0.0 );
				float4 Mask_Distortion_Noise_Offset171 = ( _RadialMaskDistortionOffset + Particle_Stable_Random_X147 + ( _RadialMaskDistortionParticleAnimation * Particle_Age_Percent146 ) );
				float4 temp_output_10_0_g483 = ( float4( ( Noise_Base_UV220 * _RadialMaskDistortionScale * _RadialMaskDistortionTiling ) , 0.0 ) - ( Mask_Distortion_Noise_Offset171 + ( _RadialMaskDistortionAnimation * _TimeParameters.x ) ) );
				float3 temp_output_158_0 = (temp_output_10_0_g483).xyz;
				float3 position2_g486 = temp_output_158_0;
				float temp_output_158_15 = (temp_output_10_0_g483).w;
				float angle2_g486 = temp_output_158_15;
				float octaves2_g486 = _RadialMaskDistortionOctaves;
				float noise2_g486 = 0.0;
				float3 gradient2_g486 = float3( 0,0,0 );
				SimplexNoise_float( position2_g486 , angle2_g486 , octaves2_g486 , noise2_g486 , gradient2_g486 );
				float localSimplexNoise_Caustics_float2_g485 = ( 0.0 );
				float3 position2_g485 = temp_output_158_0;
				float angle2_g485 = temp_output_158_15;
				float octaves2_g485 = _RadialMaskDistortionOctaves;
				float gradientStrength2_g485 = _RadialMaskDistortionDilation;
				float noise2_g485 = 0.0;
				float3 gradient2_g485 = float3( 0,0,0 );
				SimplexNoise_Caustics_float( position2_g485 , angle2_g485 , octaves2_g485 , gradientStrength2_g485 , noise2_g485 , gradient2_g485 );
				#ifdef _RADIALMASKDISTORTIONDILATIONENABLED_ON
				float3 staticSwitch441 = gradient2_g485;
				#else
				float3 staticSwitch441 = gradient2_g486;
				#endif
				float3 temp_output_7_0_g488 = abs( staticSwitch441 );
				float3 temp_cast_8 = (_RadialMaskDistortionPower).xxx;
				#ifdef _RADIALMASKDISTORTIONENABLED_ON
				float3 staticSwitch451 = ( ( pow( temp_output_7_0_g488 , temp_cast_8 ) * sign( staticSwitch441 ) ) * _RadialMaskDistortion );
				#else
				float3 staticSwitch451 = float3( 0,0,0 );
				#endif
				float3 Mask_Distortion117 = staticSwitch451;
				float temp_output_7_0_g497 = ( 1.0 - length( ( ( ( UV_2D_Centered328 + (Mask_Distortion117).xy ) - _RadialMaskOffset ) * _RadialMaskTiling ) ) );
				float smoothstepResult4_g497 = smoothstep( temp_output_6_0_g497 , lerpResult5_g497 , temp_output_7_0_g497);
				#ifdef _RADIALMASK_ON
				float staticSwitch601 = ( 1.0 - pow( smoothstepResult4_g497 , _RadialMaskPower ) );
				#else
				float staticSwitch601 = 0.0;
				#endif
				float Radial_Mask227 = staticSwitch601;
				#ifdef _RADIALMASKSUBTRACTIVE_ON
				float staticSwitch942 = Radial_Mask227;
				#else
				float staticSwitch942 = 0.0;
				#endif
				float temp_output_7_0_g500 = _VerticalMask1RemapMax;
				float temp_output_23_0_g500 = _VerticalMask1RemapMin;
				float UV_2D_Y691 = (staticSwitch321).y;
				float UV_3D_Y719 = (staticSwitch339).y;
				#ifdef _VERTICALMASKSOBJECTSPACE_ON
				float staticSwitch716 = ( ( UV_3D_Y719 - _VerticalMask1ObjectSpaceOffset ) / _VerticalMask1ObjectSpaceScale );
				#else
				float staticSwitch716 = UV_2D_Y691;
				#endif
				float temp_output_20_0_g500 = staticSwitch716;
				float smoothstepResult25_g500 = smoothstep( temp_output_7_0_g500 , temp_output_23_0_g500 , temp_output_20_0_g500);
				float temp_output_4_0_g500 = _VerticalMask1Power;
				float temp_output_862_0 = pow( smoothstepResult25_g500 , temp_output_4_0_g500 );
				#ifdef _VERTICALMASK1SUBTRACTIVE_ON
				float staticSwitch713 = ( 1.0 - temp_output_862_0 );
				#else
				float staticSwitch713 = temp_output_862_0;
				#endif
				float Vertical_Mask_1350 = staticSwitch713;
				#ifdef _VERTICALMASK1SUBTRACTIVE_ON
				float staticSwitch709 = ( staticSwitch942 + Vertical_Mask_1350 );
				#else
				float staticSwitch709 = staticSwitch942;
				#endif
				#ifdef _VERTICALMASK1_ON
				float staticSwitch741 = staticSwitch709;
				#else
				float staticSwitch741 = staticSwitch942;
				#endif
				float temp_output_7_0_g505 = _VerticalMask2RemapMin;
				float temp_output_23_0_g505 = _VerticalMask2RemapMax;
				#ifdef _VERTICALMASKSOBJECTSPACE_ON
				float staticSwitch767 = ( ( UV_3D_Y719 - _VerticalMask2ObjectSpaceOffset ) / _VerticalMask2ObjectSpaceScale );
				#else
				float staticSwitch767 = UV_2D_Y691;
				#endif
				float temp_output_20_0_g505 = staticSwitch767;
				float smoothstepResult25_g505 = smoothstep( temp_output_7_0_g505 , temp_output_23_0_g505 , temp_output_20_0_g505);
				float temp_output_4_0_g505 = _VerticalMask2Power;
				float temp_output_863_0 = pow( smoothstepResult25_g505 , temp_output_4_0_g505 );
				#ifdef _VERTICALMASK2SUBTRACTIVE_ON
				float staticSwitch758 = ( 1.0 - temp_output_863_0 );
				#else
				float staticSwitch758 = temp_output_863_0;
				#endif
				float Vertical_Mask_2759 = staticSwitch758;
				#ifdef _VERTICALMASK2SUBTRACTIVE_ON
				float staticSwitch760 = ( staticSwitch741 + Vertical_Mask_2759 );
				#else
				float staticSwitch760 = staticSwitch741;
				#endif
				#ifdef _VERTICALMASK2_ON
				float staticSwitch766 = staticSwitch760;
				#else
				float staticSwitch766 = staticSwitch741;
				#endif
				float3 ase_worldNormal = input.ase_texcoord6.xyz;
				float fresnelNdotV232 = dot( ase_worldNormal, ase_viewDirWS );
				float fresnelNode232 = ( 0.0 + 1.0 * pow( 1.0 - fresnelNdotV232, _FresnelMaskPower ) );
				float smoothstepResult234 = smoothstep( _FresnelMaskRemapMin , _FresnelMaskRemapMax , fresnelNode232);
				float lerpResult242 = lerp( 1.0 , smoothstepResult234 , _FresnelMask);
				float Fresnel_Mask233 = lerpResult242;
				float temp_output_7_0_g576 = 0.0;
				float temp_output_23_0_g576 = 1.0;
				float screenDepth186 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth186 = saturate( abs( ( screenDepth186 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _DepthFade ) ) );
				#ifdef _INVERTDEPTHFADE_ON
				float staticSwitch218 = ( 1.0 - distanceDepth186 );
				#else
				float staticSwitch218 = distanceDepth186;
				#endif
				float temp_output_20_0_g576 = staticSwitch218;
				float temp_output_4_0_g576 = _DepthFadePower;
				float smoothstepResult22_g576 = smoothstep( temp_output_7_0_g576 , temp_output_23_0_g576 , pow( temp_output_20_0_g576 , temp_output_4_0_g576 ));
				float temp_output_7_0_g575 = 0.0;
				float temp_output_23_0_g575 = 1.0;
				float screenDepth208 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth208 = saturate( abs( ( screenDepth208 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _SubtractiveDepthFade ) ) );
				float temp_output_20_0_g575 = ( 1.0 - distanceDepth208 );
				float temp_output_4_0_g575 = _SubtractiveDepthFadePower;
				float smoothstepResult22_g575 = smoothstep( temp_output_7_0_g575 , temp_output_23_0_g575 , pow( temp_output_20_0_g575 , temp_output_4_0_g575 ));
				float Depth_Fade188 = saturate( ( smoothstepResult22_g576 - smoothstepResult22_g575 ) );
				float temp_output_7_0_g577 = 0.0;
				float temp_output_23_0_g577 = 1.0;
				float eyeDepth = input.ase_texcoord6.w;
				float cameraDepthFade191 = (( eyeDepth -_ProjectionParams.y - _CameraDepthFadeOffset ) / _CameraDepthFadeLength);
				float temp_output_20_0_g577 = saturate( cameraDepthFade191 );
				float temp_output_4_0_g577 = _CameraDepthFadePower;
				float smoothstepResult22_g577 = smoothstep( temp_output_7_0_g577 , temp_output_23_0_g577 , pow( temp_output_20_0_g577 , temp_output_4_0_g577 ));
				float Camera_Depth_Fade195 = smoothstepResult22_g577;
				float temp_output_7_0_g578 = _IntersectionHighlightRemapMin;
				float temp_output_23_0_g578 = _IntersectionHighlightRemapMax;
				float screenDepth1005 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth1005 = saturate( abs( ( screenDepth1005 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _IntersectionHighlight ) ) );
				float temp_output_20_0_g578 = ( 1.0 - distanceDepth1005 );
				float temp_output_4_0_g578 = _IntersectionHighlightPower;
				float smoothstepResult22_g578 = smoothstep( temp_output_7_0_g578 , temp_output_23_0_g578 , pow( temp_output_20_0_g578 , temp_output_4_0_g578 ));
				float Intersection_Highlight1011 = smoothstepResult22_g578;
				float Intersection_Highlight_Alpha1024 = _IntersectionHighlightColour.a;
				float localGetMainLightShadow_float1080 = ( 0.0 );
				float3 position1080 = WorldPosition;
				float2 screenPosition1080 = Screen_Position1254;
				float worldNoise1080 = _MainLightShadowWorldNoise;
				float lightDirectionNoise1080 = _MainLightShadowDirectionalNoise;
				float lightDirectionOrthogonalAlignmentNoise1080 = _MainLightShadowOrthogonalAlignmentWorldNoise;
				float lightDirectionAlignmentNoise1080 = _MainLightShadowDirectionalAlignmentNoise;
				float3 normal1080 = ase_worldNormal;
				float3 ase_worldTangent = input.ase_texcoord7.xyz;
				float3 ase_worldBitangent = input.ase_texcoord8.xyz;
				float3x3 ase_worldToTangent = float3x3(ase_worldTangent,ase_worldBitangent,ase_worldNormal);
				float3x3 worldToTangentMatrix1080 = ase_worldToTangent;
				float output1080 = 0.0;
				GetMainLightShadow_float( position1080 , screenPosition1080 , worldNoise1080 , lightDirectionNoise1080 , lightDirectionOrthogonalAlignmentNoise1080 , lightDirectionAlignmentNoise1080 , normal1080 , worldToTangentMatrix1080 , output1080 );
				float lerpResult984 = lerp( 1.0 , output1080 , _MainLightTransparencyShadow);
				float Main_Light_Transparency_Shadow981 = lerpResult984;
				#ifdef _MAINLIGHTTRANSPARENCYSHADOWENABLED_ON
				float staticSwitch1076 = Main_Light_Transparency_Shadow981;
				#else
				float staticSwitch1076 = 1.0;
				#endif
				float localGetAdditionalLightsShadow_float1125 = ( 0.0 );
				float3 position1125 = WorldPosition;
				float2 screenPosition1125 = Screen_Position1254;
				float2 screenUV1125 = Screen_UV1145;
				float worldNoise1125 = _AdditionalLightsShadowWorldNoise;
				float lightDirectionNoise1125 = _AdditionalLightsShadowDirectionalNoise;
				float lightDirectionOrthogonalAlignmentNoise1125 = _AdditionalLightsShadowOrthogonalAlignmentWorldNoise;
				float lightDirectionAlignmentNoise1125 = _AdditionalLightsShadowDirectionalAlignmentNoise;
				float3 normal1125 = ase_worldNormal;
				float3x3 worldToTangentMatrix1125 = ase_worldToTangent;
				float output1125 = 0.0;
				GetAdditionalLightsShadow_float( position1125 , screenPosition1125 , screenUV1125 , worldNoise1125 , lightDirectionNoise1125 , lightDirectionOrthogonalAlignmentNoise1125 , lightDirectionAlignmentNoise1125 , normal1125 , worldToTangentMatrix1125 , output1125 );
				float lerpResult993 = lerp( 1.0 , output1125 , _AdditionalLightsTransparencyShadow);
				float Additional_Lights_Transparency_Shadow994 = lerpResult993;
				#ifdef _ADDITIONALLIGHTSTRANSPARENCYSHADOWENABLED_ON
				float staticSwitch1077 = Additional_Lights_Transparency_Shadow994;
				#else
				float staticSwitch1077 = 1.0;
				#endif
				float temp_output_1030_0 = saturate( ( ( saturate( ( Noise11 - staticSwitch766 ) ) * Fresnel_Mask233 * (input.ase_color).a * Depth_Fade188 * Camera_Depth_Fade195 * _Alpha ) + ( Intersection_Highlight1011 * Intersection_Highlight_Alpha1024 * pow( ( staticSwitch1076 * staticSwitch1077 ) , _IntersectionHighlightShadowMaskPower ) ) ) );
				#ifdef _RADIALMASKSUBTRACTIVE_ON
				float staticSwitch943 = temp_output_1030_0;
				#else
				float staticSwitch943 = ( temp_output_1030_0 * ( 1.0 - Radial_Mask227 ) );
				#endif
				#ifdef _VERTICALMASK1SUBTRACTIVE_ON
				float staticSwitch711 = staticSwitch943;
				#else
				float staticSwitch711 = ( staticSwitch943 * Vertical_Mask_1350 );
				#endif
				#ifdef _VERTICALMASK1_ON
				float staticSwitch744 = staticSwitch711;
				#else
				float staticSwitch744 = staticSwitch943;
				#endif
				#ifdef _VERTICALMASK2SUBTRACTIVE_ON
				float staticSwitch763 = staticSwitch744;
				#else
				float staticSwitch763 = ( staticSwitch744 * Vertical_Mask_2759 );
				#endif
				#ifdef _VERTICALMASK2_ON
				float staticSwitch768 = staticSwitch763;
				#else
				float staticSwitch768 = staticSwitch744;
				#endif
				#ifdef _MAINLIGHTTRANSPARENCYSHADOWENABLED_ON
				float staticSwitch985 = ( staticSwitch768 * Main_Light_Transparency_Shadow981 );
				#else
				float staticSwitch985 = staticSwitch768;
				#endif
				#ifdef _ADDITIONALLIGHTSTRANSPARENCYSHADOWENABLED_ON
				float staticSwitch998 = ( staticSwitch985 * Additional_Lights_Transparency_Shadow994 );
				#else
				float staticSwitch998 = staticSwitch985;
				#endif
				float Alpha49 = staticSwitch998;
				

				float Alpha = Alpha49;
				float AlphaClipThreshold = 0.5;

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( input.positionCS );
				#endif
				return 0;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "SceneSelectionPass"
			Tags { "LightMode"="SceneSelectionPass" }

			Cull Off
			AlphaToMask Off

			HLSLPROGRAM

			#define ASE_FOG 1
			#define ASE_FIXED_TESSELLATION
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define ASE_PHONG_TESSELLATION
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define ASE_TESSELLATION 1
			#pragma require tessellation tessHW
			#pragma hull HullFunction
			#pragma domain DomainFunction
			#define ASE_VERSION 19701
			#define ASE_SRP_VERSION 170003
			#define REQUIRE_DEPTH_TEXTURE 1


			#pragma vertex vert
			#pragma fragment frag

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#include "../../VFXToolkit/Shaders/_Includes/Math.cginc"
			#include "../../VFXToolkit/Shaders/_Includes/Noise.cginc"
			#include "_Includes/Solaris.hlsl"
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_POSITION
			#pragma shader_feature_local _SWAPUVXY_ON
			#pragma shader_feature_local _VERTEXWAVEENABLED_ON
			#pragma shader_feature_local _VERTEXNOISEENABLED_ON
			#pragma shader_feature_local _VERTEXNOISEDILATIONENABLED_ON
			#pragma shader_feature_local _WORLDSPACEUVS_ON
			#pragma shader_feature_local _ADDITIONALLIGHTSTRANSPARENCYSHADOWENABLED_ON
			#pragma shader_feature_local _MAINLIGHTTRANSPARENCYSHADOWENABLED_ON
			#pragma shader_feature_local _VERTICALMASK2_ON
			#pragma shader_feature_local _VERTICALMASK1_ON
			#pragma shader_feature_local _RADIALMASKSUBTRACTIVE_ON
			#pragma shader_feature_local _NOISEDILATIONENABLED_ON
			#pragma shader_feature_local _NOISEXZTWISTENABLED_ON
			#pragma shader_feature_local _SPHERIZENOISE_ON
			#pragma shader_feature_local _OBJECTSPACEUVS_ON
			#pragma shader_feature_local _NOISEDISTORTIONENABLED_ON
			#pragma shader_feature_local _NOISEDISTORTIONDILATIONENABLED_ON
			#pragma shader_feature_local _RADIALMASK_ON
			#pragma shader_feature_local _RADIALMASKDISTORTIONENABLED_ON
			#pragma shader_feature_local _RADIALMASKDISTORTIONDILATIONENABLED_ON
			#pragma shader_feature_local _VERTICALMASK1SUBTRACTIVE_ON
			#pragma shader_feature_local _VERTICALMASKSOBJECTSPACE_ON
			#pragma shader_feature_local _VERTICALMASK2SUBTRACTIVE_ON
			#pragma shader_feature_local _INVERTDEPTHFADE_ON
			#pragma multi_compile _ _FORWARD_PLUS
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
			#pragma multi_compile _ _ADDITIONAL_LIGHTS
			 #pragma multi_compile _ _ADDITIONAL_LIGHT_SHADOWS


			struct Attributes
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				float4 positionCS : SV_POSITION;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_color : COLOR;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ColourA;
			float4 _RadialMaskDistortionAnimation;
			float4 _VerticalColourA;
			float4 _VerticalColourB;
			float4 _RadialMaskDistortionParticleAnimation;
			float4 _RadialMaskDistortionOffset;
			float4 _NoiseDistortionOffset;
			float4 _ColourB;
			float4 _NoiseDistortionAnimation;
			float4 _NoiseDistortionParticleAnimation;
			float4 _IntersectionHighlightColour;
			float4 _VertexNoiseAnimation;
			float4 _NoiseAnimation;
			float4 _VertexNoiseParticleAnimation;
			float4 _NoiseOffset;
			float4 _NoiseParticleAnimation;
			float4 _VertexNoiseOffset;
			float3 _VertexOffsetOverY1;
			float3 _RadialMaskDistortionTiling;
			float3 _VertexOffsetOverCircularY;
			float3 _VertexOffsetOverY2;
			float3 _VertexNoiseTiling;
			float3 _NoiseTiling;
			float3 _NoiseDistortionTiling;
			float2 _RadialMaskTiling;
			float2 _RadialMaskOffset;
			float2 _SpherizeNoiseOffset;
			float _VerticalColourMaskRemapMax;
			float _MainLightShadowOrthogonalAlignmentWorldNoise;
			float _MainLightShadowDirectionalAlignmentNoise;
			float _Noise;
			float _MainLightShadow;
			float _MainLightAnisotropyBlend;
			float _MainLightAnisotropy;
			float _AdditionalLightsFlatLambertBlend;
			float _ParticleSubtractNoiseoverLifetime;
			float _NoisePower;
			float _AdditionalLightsLambertTranslucencyMask;
			float _MainLight;
			float _MainLightShadowDirectionalNoise;
			float _ColourPower;
			float _MainLightLambertTranslucency;
			float _ColourHueShift;
			float _MainLightLambertTranslucencyMask;
			float _ColourSaturationShift;
			float _ColourValueMultiplier;
			float _VerticalColourHueShift;
			float _VerticalColourSaturationShift;
			float _MainLightFlatLambertBlend;
			float _VerticalColourValueMultiplier;
			float _VerticalColourMaskRemapMin;
			float _LambertLightingNormalfromHeight;
			float _VerticalColourMaskPower;
			float _MainLightShadowWorldNoise;
			float _Tessellation;
			float _AdditionalLightsShadowOrthogonalAlignmentWorldNoise;
			float _AdditionalLightsShadowWorldNoise;
			float _VerticalMask1Power;
			float _VerticalMask2RemapMin;
			float _VerticalMask2RemapMax;
			float _VerticalMask2ObjectSpaceOffset;
			float _VerticalMask2ObjectSpaceScale;
			float _VerticalMask2Power;
			float _FresnelMaskRemapMin;
			float _FresnelMaskRemapMax;
			float _FresnelMaskPower;
			float _FresnelMask;
			float _DepthFade;
			float _DepthFadePower;
			float _SubtractiveDepthFade;
			float _SubtractiveDepthFadePower;
			float _CameraDepthFadeLength;
			float _CameraDepthFadeOffset;
			float _CameraDepthFadePower;
			float _Alpha;
			float _MainLightTransparencyShadow;
			float _VerticalMask1ObjectSpaceScale;
			float _VerticalMask1ObjectSpaceOffset;
			float _VerticalMask1RemapMin;
			float _VerticalMask1RemapMax;
			float _AdditionalLightsShadowDirectionalNoise;
			float _AdditionalLightsShadowDirectionalAlignmentNoise;
			float _AdditionalLightsShadow;
			float _AdditionalLights;
			float _IntersectionHighlightColourHueShift;
			float _IntersectionHighlightColourSaturationShift;
			float _IntersectionHighlightColourValueMultiplier;
			float _IntersectionHighlightRemapMin;
			float _IntersectionHighlightRemapMax;
			float _AdditionalLightsLambertTranslucency;
			float _IntersectionHighlight;
			float _RadialMaskRadius;
			float _RadialMaskRadiusOverParticleLifetime;
			float _RadialMaskFeather;
			float _RadialMaskDistortionScale;
			float _RadialMaskDistortionOctaves;
			float _RadialMaskDistortionDilation;
			float _RadialMaskDistortionPower;
			float _RadialMaskDistortion;
			float _RadialMaskPower;
			float _IntersectionHighlightPower;
			float _NoiseDilation;
			float _NoiseDistortionDilation;
			float _NoiseScale;
			float _StartFoldoutBaseUVs;
			float _StartFoldoutParticleSettings;
			float _EndFoldoutParticleSettings;
			float _StartFoldoutDepthFade;
			float _EndFoldoutDepthFade;
			float _StartFoldoutIntersectionHighlight;
			float _EndFoldoutIntersectionHighlight;
			float _StartFoldoutVertexUVOffset;
			float _EndFoldoutVertexUVOffset;
			float _StartFoldoutVertexNormalOffset;
			float _EndFoldoutVertexNormalOffset;
			float _StartFoldoutVertexWave;
			float _EndFoldoutVertexWave;
			float _StartFoldoutVertexNoise;
			float _EndFoldoutVertexNoise;
			float _EndFoldoutVertexWaveNoiseVerticalMask;
			float _StartFoldoutVertexOffsetoverY;
			float _EndFoldoutLighting;
			float _EndFoldoutVertexOffsetoverY;
			float _StartFoldoutLighting;
			float _StartFoldoutVerticalColour;
			float _EndFoldoutBaseUVs;
			float _StartFoldoutColour;
			float _StartFoldoutNoise;
			float _EndFoldoutNoise;
			float _StartFoldoutNoiseDistortion;
			float _EndFoldoutNoiseDistortion;
			float _StartFoldoutRadialMask;
			float _EndFoldoutRadialMask;
			float _StartFoldoutRadialMaskDistortion;
			float _EndFoldoutRadialMaskDistortion;
			float _EndFoldoutVerticalMasks;
			float _StartFoldoutVerticalMasks;
			float _StartFoldoutSpherizeNoise;
			float _EndFoldoutSpherizeNoise;
			float _StartFoldoutFresnelMask;
			float _EndFoldoutFresnelMask;
			float _EndFoldoutColour;
			float _EndFoldoutVerticalColour;
			float _StartFoldoutVertexWaveNoiseVerticalMask;
			float _VertexNormalOffset;
			float _VertexNormalOffsetTopPower;
			float _VertexOffsetOverY2Power;
			float _VertexOffsetOverCircularYPower;
			float _NoiseRemapMin;
			float _NoiseRemapMax;
			float _UVSampleNoise;
			float _SpherizeNoiseRadius;
			float _SpherizeNoiseStrength;
			float _NoiseXZTwist;
			float _NoiseUVYPreOffset;
			float _NoiseUVYPreScale;
			float _NoiseUVYPrePower;
			float _NoiseParallaxOffset;
			float _NoiseDistortionScale;
			float _NoiseDistortionOctaves;
			float _AdditionalLightsTransparencyShadow;
			float _NoiseDistortionPower;
			float _NoiseDistortion;
			float _VertexOffsetOverY1Power;
			float _VertexTwist;
			float _VertexUVOffsetBottom;
			float _VertexUVOffsetBottomPower;
			float _VertexNormalOffsetTop;
			float _VertexNormalOffsetBottomPower;
			float _VertexNormalOffsetBottom;
			float _VertexWaveScale;
			float _VertexWaveAnimation;
			float _VertexWaveOffset;
			float _VertexWave;
			float _VertexWaveNoiseVerticalMaskRemapMin;
			float _NoiseOctaves;
			float _VertexWaveNoiseVerticalMaskRemapMax;
			float _VertexNoiseScale;
			float _ParticleRandomization;
			float _VertexNoiseOctaves;
			float _VertexNoiseDilation;
			float _VertexNoiseTwist;
			float _VertexNoise;
			float _VertexUVOffsetTopPower;
			float _VertexUVOffsetTop;
			float _VertexWaveNoiseVerticalMaskPower;
			float _IntersectionHighlightShadowMaskPower;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			

			
			int _ObjectId;
			int _PassValue;

			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			PackedVaryings VertexFunction(Attributes input  )
			{
				PackedVaryings output;
				ZERO_INITIALIZE(PackedVaryings, output);

				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				float localTwistXZ_float11_g586 = ( 0.0 );
				float2 texCoord322 = input.ase_texcoord * float2( 1,1 ) + float2( 0,0 );
				#ifdef _SWAPUVXY_ON
				float2 staticSwitch321 = (texCoord322).yx;
				#else
				float2 staticSwitch321 = texCoord322;
				#endif
				float UV_2D_Y691 = (staticSwitch321).y;
				float3 Vertex_Normal_Offset670 = ( ( input.normalOS * _VertexNormalOffset ) + ( pow( UV_2D_Y691 , _VertexNormalOffsetTopPower ) * input.normalOS * _VertexNormalOffsetTop ) + ( pow( ( 1.0 - UV_2D_Y691 ) , _VertexNormalOffsetBottomPower ) * input.normalOS * _VertexNormalOffsetBottom ) );
				float2 UV_2D327 = staticSwitch321;
				float mulTime258 = _TimeParameters.x * _VertexWaveAnimation;
				float temp_output_7_0_g581 = _VertexWaveNoiseVerticalMaskRemapMin;
				float temp_output_23_0_g581 = _VertexWaveNoiseVerticalMaskRemapMax;
				float temp_output_20_0_g581 = UV_2D_Y691;
				float temp_output_4_0_g581 = _VertexWaveNoiseVerticalMaskPower;
				float smoothstepResult22_g581 = smoothstep( temp_output_7_0_g581 , temp_output_23_0_g581 , pow( temp_output_20_0_g581 , temp_output_4_0_g581 ));
				float Vertex_WaveNoise_Vertical_Mask280 = smoothstepResult22_g581;
				#ifdef _VERTEXWAVEENABLED_ON
				float3 staticSwitch448 = ( ( sin( ( ( UV_2D327.y * TWO_PI * _VertexWaveScale ) - ( mulTime258 + ( _VertexWaveOffset * TWO_PI ) ) ) ) * _VertexWave * Vertex_WaveNoise_Vertical_Mask280 ) * input.normalOS );
				#else
				float3 staticSwitch448 = float3( 0,0,0 );
				#endif
				float3 Vertex_Sine265 = staticSwitch448;
				float localTwistXZ_float11_g584 = ( 0.0 );
				float localSimplexNoise_float2_g583 = ( 0.0 );
				#ifdef _SWAPUVXY_ON
				float3 staticSwitch339 = (input.positionOS.xyz).yxz;
				#else
				float3 staticSwitch339 = input.positionOS.xyz;
				#endif
				float3 UV_3D340 = staticSwitch339;
				float3 ase_worldPos = TransformObjectToWorld( (input.positionOS).xyz );
				#ifdef _SWAPUVXY_ON
				float3 staticSwitch621 = (ase_worldPos).yxz;
				#else
				float3 staticSwitch621 = ase_worldPos;
				#endif
				float3 UV_3D_World622 = staticSwitch621;
				#ifdef _WORLDSPACEUVS_ON
				float3 staticSwitch605 = UV_3D_World622;
				#else
				float3 staticSwitch605 = UV_3D340;
				#endif
				float Particle_Stable_Random_X147 = ( ( input.ase_texcoord.w - 0.5 ) * 100.0 * _ParticleRandomization );
				float Particle_Age_Percent146 = input.ase_texcoord.z;
				float4 Vertex_Noise_Offset311 = ( _VertexNoiseOffset + Particle_Stable_Random_X147 + ( _VertexNoiseParticleAnimation * Particle_Age_Percent146 ) );
				float4 temp_output_10_0_g579 = ( float4( ( staticSwitch605 * _VertexNoiseScale * _VertexNoiseTiling ) , 0.0 ) - ( Vertex_Noise_Offset311 + ( _VertexNoiseAnimation * _TimeParameters.x ) ) );
				float3 temp_output_292_0 = (temp_output_10_0_g579).xyz;
				float3 position2_g583 = temp_output_292_0;
				float temp_output_292_15 = (temp_output_10_0_g579).w;
				float angle2_g583 = temp_output_292_15;
				float octaves2_g583 = _VertexNoiseOctaves;
				float noise2_g583 = 0.0;
				float3 gradient2_g583 = float3( 0,0,0 );
				SimplexNoise_float( position2_g583 , angle2_g583 , octaves2_g583 , noise2_g583 , gradient2_g583 );
				float localSimplexNoise_Caustics_float2_g582 = ( 0.0 );
				float3 position2_g582 = temp_output_292_0;
				float angle2_g582 = temp_output_292_15;
				float octaves2_g582 = _VertexNoiseOctaves;
				float gradientStrength2_g582 = _VertexNoiseDilation;
				float noise2_g582 = 0.0;
				float3 gradient2_g582 = float3( 0,0,0 );
				SimplexNoise_Caustics_float( position2_g582 , angle2_g582 , octaves2_g582 , gradientStrength2_g582 , noise2_g582 , gradient2_g582 );
				#ifdef _VERTEXNOISEDILATIONENABLED_ON
				float3 staticSwitch490 = gradient2_g582;
				#else
				float3 staticSwitch490 = gradient2_g583;
				#endif
				float3 temp_output_10_0_g584 = staticSwitch490;
				float3 position11_g584 = temp_output_10_0_g584;
				float temp_output_9_0_g584 = _VertexNoiseTwist;
				float angle11_g584 = radians( temp_output_9_0_g584 );
				float3 output11_g584 = float3( 0,0,0 );
				TwistXZ_float( position11_g584 , angle11_g584 , output11_g584 );
				float3 temp_output_852_0 = output11_g584;
				#ifdef _VERTEXNOISEENABLED_ON
				float3 staticSwitch450 = ( temp_output_852_0 * _VertexNoise * Vertex_WaveNoise_Vertical_Mask280 );
				#else
				float3 staticSwitch450 = float3( 0,0,0 );
				#endif
				float3 Vertex_Noise298 = staticSwitch450;
				float2 break587 = ( ( UV_2D327 * float2( 2,1 ) ) - float2( 1,0 ) );
				float temp_output_576_0 = ( ( break587.x * pow( break587.y , _VertexUVOffsetTopPower ) ) * ( _VertexUVOffsetTop * 0.5 ) );
				float3 appendResult575 = (float3(temp_output_576_0 , 0.0 , 0.0));
				float3 appendResult594 = (float3(0.0 , temp_output_576_0 , 0.0));
				#ifdef _SWAPUVXY_ON
				float3 staticSwitch593 = appendResult594;
				#else
				float3 staticSwitch593 = appendResult575;
				#endif
				float3 Vertex_Offset_Top579 = staticSwitch593;
				float2 break644 = ( ( UV_2D327 * float2( 2,1 ) ) - float2( 1,0 ) );
				float temp_output_650_0 = ( ( break644.x * pow( ( 1.0 - break644.y ) , _VertexUVOffsetBottomPower ) ) * ( _VertexUVOffsetBottom * 0.5 ) );
				float3 appendResult653 = (float3(temp_output_650_0 , 0.0 , 0.0));
				float3 appendResult652 = (float3(0.0 , temp_output_650_0 , 0.0));
				#ifdef _SWAPUVXY_ON
				float3 staticSwitch654 = appendResult652;
				#else
				float3 staticSwitch654 = appendResult653;
				#endif
				float3 Vertex_Offset_Bottom655 = staticSwitch654;
				float3 temp_output_10_0_g586 = ( ( Vertex_Normal_Offset670 + Vertex_Sine265 + Vertex_Noise298 + Vertex_Offset_Top579 + Vertex_Offset_Bottom655 ) + input.positionOS.xyz );
				float3 position11_g586 = temp_output_10_0_g586;
				float temp_output_9_0_g586 = -_VertexTwist;
				float angle11_g586 = radians( temp_output_9_0_g586 );
				float3 output11_g586 = float3( 0,0,0 );
				TwistXZ_float( position11_g586 , angle11_g586 , output11_g586 );
				float3 worldToObjDir636 = mul( GetWorldToObjectMatrix(), float4( _VertexOffsetOverY1, 0 ) ).xyz;
				float3 worldToObjDir780 = mul( GetWorldToObjectMatrix(), float4( _VertexOffsetOverY2, 0 ) ).xyz;
				float UV_2D_Circular_Y897 = sin( ( UV_2D_Y691 * PI ) );
				float3 Vertex_Offset_over_Y639 = ( ( worldToObjDir636 * pow( UV_2D_Y691 , _VertexOffsetOverY1Power ) ) + ( worldToObjDir780 * pow( UV_2D_Y691 , _VertexOffsetOverY2Power ) ) + ( _VertexOffsetOverCircularY * pow( UV_2D_Circular_Y897 , _VertexOffsetOverCircularYPower ) ) );
				float3 Vertex_Offset247 = ( output11_g586 + Vertex_Offset_over_Y639 );
				
				output.ase_texcoord2.xyz = ase_worldPos;
				float4 ase_clipPos = TransformObjectToHClip((input.positionOS).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				output.ase_texcoord3 = screenPos;
				float3 ase_worldNormal = TransformObjectToWorldNormal(input.normalOS);
				output.ase_texcoord5.xyz = ase_worldNormal;
				float3 objectToViewPos = TransformWorldToView(TransformObjectToWorld(input.positionOS.xyz));
				float eyeDepth = -objectToViewPos.z;
				output.ase_texcoord2.w = eyeDepth;
				float3 ase_worldTangent = TransformObjectToWorldDir(input.ase_tangent.xyz);
				output.ase_texcoord6.xyz = ase_worldTangent;
				float ase_vertexTangentSign = input.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				output.ase_texcoord7.xyz = ase_worldBitangent;
				
				output.ase_texcoord = input.ase_texcoord;
				output.ase_texcoord1 = input.positionOS;
				output.ase_texcoord4 = input.ase_texcoord1;
				output.ase_color = input.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord5.w = 0;
				output.ase_texcoord6.w = 0;
				output.ase_texcoord7.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = Vertex_Offset247;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					input.positionOS.xyz = vertexValue;
				#else
					input.positionOS.xyz += vertexValue;
				#endif

				input.normalOS = input.normalOS;

				float3 positionWS = TransformObjectToWorld( input.positionOS.xyz );

				output.positionCS = TransformWorldToHClip(positionWS);

				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( Attributes input )
			{
				VertexControl output;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				output.vertex = input.positionOS;
				output.normalOS = input.normalOS;
				output.ase_texcoord = input.ase_texcoord;
				output.ase_texcoord1 = input.ase_texcoord1;
				output.ase_color = input.ase_color;
				output.ase_tangent = input.ase_tangent;
				return output;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> input)
			{
				TessellationFactors output;
				float4 tf = 1;
				float tessValue = _Tessellation; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(input[0].vertex, input[1].vertex, input[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(input[0].vertex, input[1].vertex, input[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(input[0].vertex, input[1].vertex, input[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				output.edge[0] = tf.x; output.edge[1] = tf.y; output.edge[2] = tf.z; output.inside = tf.w;
				return output;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			PackedVaryings DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				Attributes output = (Attributes) 0;
				output.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				output.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				output.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				output.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				output.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				output.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = output.positionOS.xyz - patch[i].normalOS * (dot(output.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				output.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * output.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], output);
				return VertexFunction(output);
			}
			#else
			PackedVaryings vert ( Attributes input )
			{
				return VertexFunction( input );
			}
			#endif

			half4 frag(PackedVaryings input ) : SV_TARGET
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				float temp_output_7_0_g574 = _NoiseRemapMin;
				float temp_output_23_0_g574 = _NoiseRemapMax;
				float localSimplexNoise_float2_g504 = ( 0.0 );
				float2 texCoord322 = input.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _SWAPUVXY_ON
				float2 staticSwitch321 = (texCoord322).yx;
				#else
				float2 staticSwitch321 = texCoord322;
				#endif
				float2 UV_2D327 = staticSwitch321;
				#ifdef _SWAPUVXY_ON
				float3 staticSwitch339 = (input.ase_texcoord1.xyz).yxz;
				#else
				float3 staticSwitch339 = input.ase_texcoord1.xyz;
				#endif
				float3 UV_3D340 = staticSwitch339;
				#ifdef _OBJECTSPACEUVS_ON
				float3 staticSwitch223 = UV_3D340;
				#else
				float3 staticSwitch223 = float3( UV_2D327 ,  0.0 );
				#endif
				float3 ase_worldPos = input.ase_texcoord2.xyz;
				#ifdef _SWAPUVXY_ON
				float3 staticSwitch621 = (ase_worldPos).yxz;
				#else
				float3 staticSwitch621 = ase_worldPos;
				#endif
				float3 UV_3D_World622 = staticSwitch621;
				#ifdef _WORLDSPACEUVS_ON
				float3 staticSwitch356 = UV_3D_World622;
				#else
				float3 staticSwitch356 = staticSwitch223;
				#endif
				float4 screenPos = input.ase_texcoord3;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float2 appendResult1146 = (float2(ase_screenPosNorm.x , ase_screenPosNorm.y));
				float2 Screen_UV1145 = appendResult1146;
				float2 appendResult1112 = (float2(_ScreenParams.x , _ScreenParams.y));
				float2 Screen_Resolution1113 = appendResult1112;
				float2 Screen_Position1254 = ( Screen_UV1145 * Screen_Resolution1113 );
				float2 screenPosition1243 = Screen_Position1254;
				float mulTime1247 = _TimeParameters.x * 60.0;
				float time1243 = mulTime1247;
				float3 localHash331243 = Hash33( screenPosition1243 , time1243 );
				float3 Sample_Noise1248 = ( (localHash331243*2.0 + -1.0) * _UVSampleNoise );
				float3 Noise_Base_UV220 = ( staticSwitch356 + Sample_Noise1248 );
				float localSpherize_float5_g487 = ( 0.0 );
				float2 uv5_g487 = (Noise_Base_UV220).xy;
				float2 center5_g487 = ( _SpherizeNoiseOffset + float2( 0.5,0.5 ) );
				float radius5_g487 = _SpherizeNoiseRadius;
				float strength5_g487 = _SpherizeNoiseStrength;
				float2 output5_g487 = float2( 0,0 );
				Spherize_float( uv5_g487 , center5_g487 , radius5_g487 , strength5_g487 , output5_g487 );
				float3 appendResult611 = (float3(output5_g487 , (Noise_Base_UV220).z));
				#ifdef _SPHERIZENOISE_ON
				float3 staticSwitch625 = appendResult611;
				#else
				float3 staticSwitch625 = Noise_Base_UV220;
				#endif
				float localTwistXZ_float11_g493 = ( 0.0 );
				float3 temp_output_10_0_g493 = staticSwitch625;
				float3 position11_g493 = temp_output_10_0_g493;
				float temp_output_9_0_g493 = _NoiseXZTwist;
				float angle11_g493 = radians( temp_output_9_0_g493 );
				float3 output11_g493 = float3( 0,0,0 );
				TwistXZ_float( position11_g493 , angle11_g493 , output11_g493 );
				#ifdef _NOISEXZTWISTENABLED_ON
				float3 staticSwitch801 = output11_g493;
				#else
				float3 staticSwitch801 = staticSwitch625;
				#endif
				float3 break728 = staticSwitch801;
				float temp_output_738_0 = ( ( break728.y - _NoiseUVYPreOffset ) * _NoiseUVYPreScale );
				float temp_output_7_0_g496 = abs( temp_output_738_0 );
				float temp_output_733_14 = ( pow( temp_output_7_0_g496 , _NoiseUVYPrePower ) * sign( temp_output_738_0 ) );
				float3 appendResult732 = (float3(break728.x , temp_output_733_14 , break728.z));
				float3 ase_viewVectorWS = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				float3 ase_viewDirWS = normalize( ase_viewVectorWS );
				float3 temp_output_872_0 = ( -ase_viewDirWS * _NoiseParallaxOffset );
				#ifdef _SWAPUVXY_ON
				float3 staticSwitch464 = (temp_output_872_0).yxz;
				#else
				float3 staticSwitch464 = temp_output_872_0;
				#endif
				float3 Parallax_Offset465 = staticSwitch464;
				float localSimplexNoise_float2_g492 = ( 0.0 );
				float Particle_Stable_Random_X147 = ( ( input.ase_texcoord.w - 0.5 ) * 100.0 * _ParticleRandomization );
				float Particle_Age_Percent146 = input.ase_texcoord.z;
				float4 Distortion_Noise_Offset163 = ( _NoiseDistortionOffset + Particle_Stable_Random_X147 + ( _NoiseDistortionParticleAnimation * Particle_Age_Percent146 ) );
				float4 temp_output_10_0_g489 = ( float4( ( ( Noise_Base_UV220 + Parallax_Offset465 ) * _NoiseDistortionScale * _NoiseDistortionTiling ) , 0.0 ) - ( Distortion_Noise_Offset163 + ( _NoiseDistortionAnimation * _TimeParameters.x ) ) );
				float3 temp_output_160_0 = (temp_output_10_0_g489).xyz;
				float3 position2_g492 = temp_output_160_0;
				float temp_output_160_15 = (temp_output_10_0_g489).w;
				float angle2_g492 = temp_output_160_15;
				float octaves2_g492 = _NoiseDistortionOctaves;
				float noise2_g492 = 0.0;
				float3 gradient2_g492 = float3( 0,0,0 );
				SimplexNoise_float( position2_g492 , angle2_g492 , octaves2_g492 , noise2_g492 , gradient2_g492 );
				float localSimplexNoise_Caustics_float2_g491 = ( 0.0 );
				float3 position2_g491 = temp_output_160_0;
				float angle2_g491 = temp_output_160_15;
				float octaves2_g491 = _NoiseDistortionOctaves;
				float gradientStrength2_g491 = _NoiseDistortionDilation;
				float noise2_g491 = 0.0;
				float3 gradient2_g491 = float3( 0,0,0 );
				SimplexNoise_Caustics_float( position2_g491 , angle2_g491 , octaves2_g491 , gradientStrength2_g491 , noise2_g491 , gradient2_g491 );
				#ifdef _NOISEDISTORTIONDILATIONENABLED_ON
				float3 staticSwitch440 = gradient2_g491;
				#else
				float3 staticSwitch440 = gradient2_g492;
				#endif
				float3 temp_output_7_0_g495 = abs( staticSwitch440 );
				float3 temp_cast_3 = (_NoiseDistortionPower).xxx;
				#ifdef _NOISEDISTORTIONENABLED_ON
				float3 staticSwitch442 = ( ( pow( temp_output_7_0_g495 , temp_cast_3 ) * sign( staticSwitch440 ) ) * _NoiseDistortion );
				#else
				float3 staticSwitch442 = float3( 0,0,0 );
				#endif
				float3 Noise_Distortion73 = staticSwitch442;
				float3 Noise_UV173 = ( appendResult732 + Parallax_Offset465 + Noise_Distortion73 );
				float4 Noise_Offset175 = ( _NoiseOffset + Particle_Stable_Random_X147 + ( _NoiseParticleAnimation * Particle_Age_Percent146 ) );
				float4 temp_output_10_0_g501 = ( float4( ( Noise_UV173 * _NoiseScale * _NoiseTiling ) , 0.0 ) - ( Noise_Offset175 + ( _NoiseAnimation * _TimeParameters.x ) ) );
				float3 temp_output_159_0 = (temp_output_10_0_g501).xyz;
				float3 position2_g504 = temp_output_159_0;
				float temp_output_159_15 = (temp_output_10_0_g501).w;
				float angle2_g504 = temp_output_159_15;
				float octaves2_g504 = _NoiseOctaves;
				float noise2_g504 = 0.0;
				float3 gradient2_g504 = float3( 0,0,0 );
				SimplexNoise_float( position2_g504 , angle2_g504 , octaves2_g504 , noise2_g504 , gradient2_g504 );
				float localSimplexNoise_Caustics_float2_g503 = ( 0.0 );
				float3 position2_g503 = temp_output_159_0;
				float angle2_g503 = temp_output_159_15;
				float octaves2_g503 = _NoiseOctaves;
				float gradientStrength2_g503 = _NoiseDilation;
				float noise2_g503 = 0.0;
				float3 gradient2_g503 = float3( 0,0,0 );
				SimplexNoise_Caustics_float( position2_g503 , angle2_g503 , octaves2_g503 , gradientStrength2_g503 , noise2_g503 , gradient2_g503 );
				#ifdef _NOISEDILATIONENABLED_ON
				float staticSwitch444 = noise2_g503;
				#else
				float staticSwitch444 = noise2_g504;
				#endif
				float temp_output_20_0_g574 = staticSwitch444;
				float temp_output_4_0_g574 = _NoisePower;
				float smoothstepResult22_g574 = smoothstep( temp_output_7_0_g574 , temp_output_23_0_g574 , pow( temp_output_20_0_g574 , temp_output_4_0_g574 ));
				float Particle_Subtract_Noise_over_Lifetime480 = ( input.ase_texcoord4.y * _ParticleSubtractNoiseoverLifetime );
				float temp_output_478_0 = ( smoothstepResult22_g574 - Particle_Subtract_Noise_over_Lifetime480 );
				float lerpResult569 = lerp( 1.0 , temp_output_478_0 , _Noise);
				float Noise11 = lerpResult569;
				float Particle_Mask_Radius_over_Lifetime161 = input.ase_texcoord4.x;
				float lerpResult183 = lerp( 1.0 , Particle_Mask_Radius_over_Lifetime161 , _RadialMaskRadiusOverParticleLifetime);
				float temp_output_6_0_g497 = ( 1.0 - ( _RadialMaskRadius * lerpResult183 ) );
				float lerpResult5_g497 = lerp( temp_output_6_0_g497 , 1.0 , _RadialMaskFeather);
				float2 texCoord330 = input.ase_texcoord.xy * float2( 2,2 ) + float2( -1,-1 );
				#ifdef _SWAPUVXY_ON
				float2 staticSwitch329 = (texCoord330).yx;
				#else
				float2 staticSwitch329 = texCoord330;
				#endif
				float2 UV_2D_Centered328 = staticSwitch329;
				float localSimplexNoise_float2_g486 = ( 0.0 );
				float4 Mask_Distortion_Noise_Offset171 = ( _RadialMaskDistortionOffset + Particle_Stable_Random_X147 + ( _RadialMaskDistortionParticleAnimation * Particle_Age_Percent146 ) );
				float4 temp_output_10_0_g483 = ( float4( ( Noise_Base_UV220 * _RadialMaskDistortionScale * _RadialMaskDistortionTiling ) , 0.0 ) - ( Mask_Distortion_Noise_Offset171 + ( _RadialMaskDistortionAnimation * _TimeParameters.x ) ) );
				float3 temp_output_158_0 = (temp_output_10_0_g483).xyz;
				float3 position2_g486 = temp_output_158_0;
				float temp_output_158_15 = (temp_output_10_0_g483).w;
				float angle2_g486 = temp_output_158_15;
				float octaves2_g486 = _RadialMaskDistortionOctaves;
				float noise2_g486 = 0.0;
				float3 gradient2_g486 = float3( 0,0,0 );
				SimplexNoise_float( position2_g486 , angle2_g486 , octaves2_g486 , noise2_g486 , gradient2_g486 );
				float localSimplexNoise_Caustics_float2_g485 = ( 0.0 );
				float3 position2_g485 = temp_output_158_0;
				float angle2_g485 = temp_output_158_15;
				float octaves2_g485 = _RadialMaskDistortionOctaves;
				float gradientStrength2_g485 = _RadialMaskDistortionDilation;
				float noise2_g485 = 0.0;
				float3 gradient2_g485 = float3( 0,0,0 );
				SimplexNoise_Caustics_float( position2_g485 , angle2_g485 , octaves2_g485 , gradientStrength2_g485 , noise2_g485 , gradient2_g485 );
				#ifdef _RADIALMASKDISTORTIONDILATIONENABLED_ON
				float3 staticSwitch441 = gradient2_g485;
				#else
				float3 staticSwitch441 = gradient2_g486;
				#endif
				float3 temp_output_7_0_g488 = abs( staticSwitch441 );
				float3 temp_cast_8 = (_RadialMaskDistortionPower).xxx;
				#ifdef _RADIALMASKDISTORTIONENABLED_ON
				float3 staticSwitch451 = ( ( pow( temp_output_7_0_g488 , temp_cast_8 ) * sign( staticSwitch441 ) ) * _RadialMaskDistortion );
				#else
				float3 staticSwitch451 = float3( 0,0,0 );
				#endif
				float3 Mask_Distortion117 = staticSwitch451;
				float temp_output_7_0_g497 = ( 1.0 - length( ( ( ( UV_2D_Centered328 + (Mask_Distortion117).xy ) - _RadialMaskOffset ) * _RadialMaskTiling ) ) );
				float smoothstepResult4_g497 = smoothstep( temp_output_6_0_g497 , lerpResult5_g497 , temp_output_7_0_g497);
				#ifdef _RADIALMASK_ON
				float staticSwitch601 = ( 1.0 - pow( smoothstepResult4_g497 , _RadialMaskPower ) );
				#else
				float staticSwitch601 = 0.0;
				#endif
				float Radial_Mask227 = staticSwitch601;
				#ifdef _RADIALMASKSUBTRACTIVE_ON
				float staticSwitch942 = Radial_Mask227;
				#else
				float staticSwitch942 = 0.0;
				#endif
				float temp_output_7_0_g500 = _VerticalMask1RemapMax;
				float temp_output_23_0_g500 = _VerticalMask1RemapMin;
				float UV_2D_Y691 = (staticSwitch321).y;
				float UV_3D_Y719 = (staticSwitch339).y;
				#ifdef _VERTICALMASKSOBJECTSPACE_ON
				float staticSwitch716 = ( ( UV_3D_Y719 - _VerticalMask1ObjectSpaceOffset ) / _VerticalMask1ObjectSpaceScale );
				#else
				float staticSwitch716 = UV_2D_Y691;
				#endif
				float temp_output_20_0_g500 = staticSwitch716;
				float smoothstepResult25_g500 = smoothstep( temp_output_7_0_g500 , temp_output_23_0_g500 , temp_output_20_0_g500);
				float temp_output_4_0_g500 = _VerticalMask1Power;
				float temp_output_862_0 = pow( smoothstepResult25_g500 , temp_output_4_0_g500 );
				#ifdef _VERTICALMASK1SUBTRACTIVE_ON
				float staticSwitch713 = ( 1.0 - temp_output_862_0 );
				#else
				float staticSwitch713 = temp_output_862_0;
				#endif
				float Vertical_Mask_1350 = staticSwitch713;
				#ifdef _VERTICALMASK1SUBTRACTIVE_ON
				float staticSwitch709 = ( staticSwitch942 + Vertical_Mask_1350 );
				#else
				float staticSwitch709 = staticSwitch942;
				#endif
				#ifdef _VERTICALMASK1_ON
				float staticSwitch741 = staticSwitch709;
				#else
				float staticSwitch741 = staticSwitch942;
				#endif
				float temp_output_7_0_g505 = _VerticalMask2RemapMin;
				float temp_output_23_0_g505 = _VerticalMask2RemapMax;
				#ifdef _VERTICALMASKSOBJECTSPACE_ON
				float staticSwitch767 = ( ( UV_3D_Y719 - _VerticalMask2ObjectSpaceOffset ) / _VerticalMask2ObjectSpaceScale );
				#else
				float staticSwitch767 = UV_2D_Y691;
				#endif
				float temp_output_20_0_g505 = staticSwitch767;
				float smoothstepResult25_g505 = smoothstep( temp_output_7_0_g505 , temp_output_23_0_g505 , temp_output_20_0_g505);
				float temp_output_4_0_g505 = _VerticalMask2Power;
				float temp_output_863_0 = pow( smoothstepResult25_g505 , temp_output_4_0_g505 );
				#ifdef _VERTICALMASK2SUBTRACTIVE_ON
				float staticSwitch758 = ( 1.0 - temp_output_863_0 );
				#else
				float staticSwitch758 = temp_output_863_0;
				#endif
				float Vertical_Mask_2759 = staticSwitch758;
				#ifdef _VERTICALMASK2SUBTRACTIVE_ON
				float staticSwitch760 = ( staticSwitch741 + Vertical_Mask_2759 );
				#else
				float staticSwitch760 = staticSwitch741;
				#endif
				#ifdef _VERTICALMASK2_ON
				float staticSwitch766 = staticSwitch760;
				#else
				float staticSwitch766 = staticSwitch741;
				#endif
				float3 ase_worldNormal = input.ase_texcoord5.xyz;
				float fresnelNdotV232 = dot( ase_worldNormal, ase_viewDirWS );
				float fresnelNode232 = ( 0.0 + 1.0 * pow( 1.0 - fresnelNdotV232, _FresnelMaskPower ) );
				float smoothstepResult234 = smoothstep( _FresnelMaskRemapMin , _FresnelMaskRemapMax , fresnelNode232);
				float lerpResult242 = lerp( 1.0 , smoothstepResult234 , _FresnelMask);
				float Fresnel_Mask233 = lerpResult242;
				float temp_output_7_0_g576 = 0.0;
				float temp_output_23_0_g576 = 1.0;
				float screenDepth186 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth186 = saturate( abs( ( screenDepth186 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _DepthFade ) ) );
				#ifdef _INVERTDEPTHFADE_ON
				float staticSwitch218 = ( 1.0 - distanceDepth186 );
				#else
				float staticSwitch218 = distanceDepth186;
				#endif
				float temp_output_20_0_g576 = staticSwitch218;
				float temp_output_4_0_g576 = _DepthFadePower;
				float smoothstepResult22_g576 = smoothstep( temp_output_7_0_g576 , temp_output_23_0_g576 , pow( temp_output_20_0_g576 , temp_output_4_0_g576 ));
				float temp_output_7_0_g575 = 0.0;
				float temp_output_23_0_g575 = 1.0;
				float screenDepth208 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth208 = saturate( abs( ( screenDepth208 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _SubtractiveDepthFade ) ) );
				float temp_output_20_0_g575 = ( 1.0 - distanceDepth208 );
				float temp_output_4_0_g575 = _SubtractiveDepthFadePower;
				float smoothstepResult22_g575 = smoothstep( temp_output_7_0_g575 , temp_output_23_0_g575 , pow( temp_output_20_0_g575 , temp_output_4_0_g575 ));
				float Depth_Fade188 = saturate( ( smoothstepResult22_g576 - smoothstepResult22_g575 ) );
				float temp_output_7_0_g577 = 0.0;
				float temp_output_23_0_g577 = 1.0;
				float eyeDepth = input.ase_texcoord2.w;
				float cameraDepthFade191 = (( eyeDepth -_ProjectionParams.y - _CameraDepthFadeOffset ) / _CameraDepthFadeLength);
				float temp_output_20_0_g577 = saturate( cameraDepthFade191 );
				float temp_output_4_0_g577 = _CameraDepthFadePower;
				float smoothstepResult22_g577 = smoothstep( temp_output_7_0_g577 , temp_output_23_0_g577 , pow( temp_output_20_0_g577 , temp_output_4_0_g577 ));
				float Camera_Depth_Fade195 = smoothstepResult22_g577;
				float temp_output_7_0_g578 = _IntersectionHighlightRemapMin;
				float temp_output_23_0_g578 = _IntersectionHighlightRemapMax;
				float screenDepth1005 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth1005 = saturate( abs( ( screenDepth1005 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _IntersectionHighlight ) ) );
				float temp_output_20_0_g578 = ( 1.0 - distanceDepth1005 );
				float temp_output_4_0_g578 = _IntersectionHighlightPower;
				float smoothstepResult22_g578 = smoothstep( temp_output_7_0_g578 , temp_output_23_0_g578 , pow( temp_output_20_0_g578 , temp_output_4_0_g578 ));
				float Intersection_Highlight1011 = smoothstepResult22_g578;
				float Intersection_Highlight_Alpha1024 = _IntersectionHighlightColour.a;
				float localGetMainLightShadow_float1080 = ( 0.0 );
				float3 position1080 = ase_worldPos;
				float2 screenPosition1080 = Screen_Position1254;
				float worldNoise1080 = _MainLightShadowWorldNoise;
				float lightDirectionNoise1080 = _MainLightShadowDirectionalNoise;
				float lightDirectionOrthogonalAlignmentNoise1080 = _MainLightShadowOrthogonalAlignmentWorldNoise;
				float lightDirectionAlignmentNoise1080 = _MainLightShadowDirectionalAlignmentNoise;
				float3 normal1080 = ase_worldNormal;
				float3 ase_worldTangent = input.ase_texcoord6.xyz;
				float3 ase_worldBitangent = input.ase_texcoord7.xyz;
				float3x3 ase_worldToTangent = float3x3(ase_worldTangent,ase_worldBitangent,ase_worldNormal);
				float3x3 worldToTangentMatrix1080 = ase_worldToTangent;
				float output1080 = 0.0;
				GetMainLightShadow_float( position1080 , screenPosition1080 , worldNoise1080 , lightDirectionNoise1080 , lightDirectionOrthogonalAlignmentNoise1080 , lightDirectionAlignmentNoise1080 , normal1080 , worldToTangentMatrix1080 , output1080 );
				float lerpResult984 = lerp( 1.0 , output1080 , _MainLightTransparencyShadow);
				float Main_Light_Transparency_Shadow981 = lerpResult984;
				#ifdef _MAINLIGHTTRANSPARENCYSHADOWENABLED_ON
				float staticSwitch1076 = Main_Light_Transparency_Shadow981;
				#else
				float staticSwitch1076 = 1.0;
				#endif
				float localGetAdditionalLightsShadow_float1125 = ( 0.0 );
				float3 position1125 = ase_worldPos;
				float2 screenPosition1125 = Screen_Position1254;
				float2 screenUV1125 = Screen_UV1145;
				float worldNoise1125 = _AdditionalLightsShadowWorldNoise;
				float lightDirectionNoise1125 = _AdditionalLightsShadowDirectionalNoise;
				float lightDirectionOrthogonalAlignmentNoise1125 = _AdditionalLightsShadowOrthogonalAlignmentWorldNoise;
				float lightDirectionAlignmentNoise1125 = _AdditionalLightsShadowDirectionalAlignmentNoise;
				float3 normal1125 = ase_worldNormal;
				float3x3 worldToTangentMatrix1125 = ase_worldToTangent;
				float output1125 = 0.0;
				GetAdditionalLightsShadow_float( position1125 , screenPosition1125 , screenUV1125 , worldNoise1125 , lightDirectionNoise1125 , lightDirectionOrthogonalAlignmentNoise1125 , lightDirectionAlignmentNoise1125 , normal1125 , worldToTangentMatrix1125 , output1125 );
				float lerpResult993 = lerp( 1.0 , output1125 , _AdditionalLightsTransparencyShadow);
				float Additional_Lights_Transparency_Shadow994 = lerpResult993;
				#ifdef _ADDITIONALLIGHTSTRANSPARENCYSHADOWENABLED_ON
				float staticSwitch1077 = Additional_Lights_Transparency_Shadow994;
				#else
				float staticSwitch1077 = 1.0;
				#endif
				float temp_output_1030_0 = saturate( ( ( saturate( ( Noise11 - staticSwitch766 ) ) * Fresnel_Mask233 * (input.ase_color).a * Depth_Fade188 * Camera_Depth_Fade195 * _Alpha ) + ( Intersection_Highlight1011 * Intersection_Highlight_Alpha1024 * pow( ( staticSwitch1076 * staticSwitch1077 ) , _IntersectionHighlightShadowMaskPower ) ) ) );
				#ifdef _RADIALMASKSUBTRACTIVE_ON
				float staticSwitch943 = temp_output_1030_0;
				#else
				float staticSwitch943 = ( temp_output_1030_0 * ( 1.0 - Radial_Mask227 ) );
				#endif
				#ifdef _VERTICALMASK1SUBTRACTIVE_ON
				float staticSwitch711 = staticSwitch943;
				#else
				float staticSwitch711 = ( staticSwitch943 * Vertical_Mask_1350 );
				#endif
				#ifdef _VERTICALMASK1_ON
				float staticSwitch744 = staticSwitch711;
				#else
				float staticSwitch744 = staticSwitch943;
				#endif
				#ifdef _VERTICALMASK2SUBTRACTIVE_ON
				float staticSwitch763 = staticSwitch744;
				#else
				float staticSwitch763 = ( staticSwitch744 * Vertical_Mask_2759 );
				#endif
				#ifdef _VERTICALMASK2_ON
				float staticSwitch768 = staticSwitch763;
				#else
				float staticSwitch768 = staticSwitch744;
				#endif
				#ifdef _MAINLIGHTTRANSPARENCYSHADOWENABLED_ON
				float staticSwitch985 = ( staticSwitch768 * Main_Light_Transparency_Shadow981 );
				#else
				float staticSwitch985 = staticSwitch768;
				#endif
				#ifdef _ADDITIONALLIGHTSTRANSPARENCYSHADOWENABLED_ON
				float staticSwitch998 = ( staticSwitch985 * Additional_Lights_Transparency_Shadow994 );
				#else
				float staticSwitch998 = staticSwitch985;
				#endif
				float Alpha49 = staticSwitch998;
				

				surfaceDescription.Alpha = Alpha49;
				surfaceDescription.AlphaClipThreshold = 0.5;

				#if _ALPHATEST_ON
					float alphaClipThreshold = 0.01f;
					#if ALPHA_CLIP_THRESHOLD
						alphaClipThreshold = surfaceDescription.AlphaClipThreshold;
					#endif
					clip(surfaceDescription.Alpha - alphaClipThreshold);
				#endif

				half4 outColor = half4(_ObjectId, _PassValue, 1.0, 1.0);
				return outColor;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "ScenePickingPass"
			Tags { "LightMode"="Picking" }

			AlphaToMask Off

			HLSLPROGRAM

			#define ASE_FOG 1
			#define ASE_FIXED_TESSELLATION
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define ASE_PHONG_TESSELLATION
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define ASE_TESSELLATION 1
			#pragma require tessellation tessHW
			#pragma hull HullFunction
			#pragma domain DomainFunction
			#define ASE_VERSION 19701
			#define ASE_SRP_VERSION 170003
			#define REQUIRE_DEPTH_TEXTURE 1


			#pragma vertex vert
			#pragma fragment frag

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT

			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#include "../../VFXToolkit/Shaders/_Includes/Math.cginc"
			#include "../../VFXToolkit/Shaders/_Includes/Noise.cginc"
			#include "_Includes/Solaris.hlsl"
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_POSITION
			#pragma shader_feature_local _SWAPUVXY_ON
			#pragma shader_feature_local _VERTEXWAVEENABLED_ON
			#pragma shader_feature_local _VERTEXNOISEENABLED_ON
			#pragma shader_feature_local _VERTEXNOISEDILATIONENABLED_ON
			#pragma shader_feature_local _WORLDSPACEUVS_ON
			#pragma shader_feature_local _ADDITIONALLIGHTSTRANSPARENCYSHADOWENABLED_ON
			#pragma shader_feature_local _MAINLIGHTTRANSPARENCYSHADOWENABLED_ON
			#pragma shader_feature_local _VERTICALMASK2_ON
			#pragma shader_feature_local _VERTICALMASK1_ON
			#pragma shader_feature_local _RADIALMASKSUBTRACTIVE_ON
			#pragma shader_feature_local _NOISEDILATIONENABLED_ON
			#pragma shader_feature_local _NOISEXZTWISTENABLED_ON
			#pragma shader_feature_local _SPHERIZENOISE_ON
			#pragma shader_feature_local _OBJECTSPACEUVS_ON
			#pragma shader_feature_local _NOISEDISTORTIONENABLED_ON
			#pragma shader_feature_local _NOISEDISTORTIONDILATIONENABLED_ON
			#pragma shader_feature_local _RADIALMASK_ON
			#pragma shader_feature_local _RADIALMASKDISTORTIONENABLED_ON
			#pragma shader_feature_local _RADIALMASKDISTORTIONDILATIONENABLED_ON
			#pragma shader_feature_local _VERTICALMASK1SUBTRACTIVE_ON
			#pragma shader_feature_local _VERTICALMASKSOBJECTSPACE_ON
			#pragma shader_feature_local _VERTICALMASK2SUBTRACTIVE_ON
			#pragma shader_feature_local _INVERTDEPTHFADE_ON
			#pragma multi_compile _ _FORWARD_PLUS
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
			#pragma multi_compile _ _ADDITIONAL_LIGHTS
			 #pragma multi_compile _ _ADDITIONAL_LIGHT_SHADOWS


			struct Attributes
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				float4 positionCS : SV_POSITION;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_color : COLOR;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ColourA;
			float4 _RadialMaskDistortionAnimation;
			float4 _VerticalColourA;
			float4 _VerticalColourB;
			float4 _RadialMaskDistortionParticleAnimation;
			float4 _RadialMaskDistortionOffset;
			float4 _NoiseDistortionOffset;
			float4 _ColourB;
			float4 _NoiseDistortionAnimation;
			float4 _NoiseDistortionParticleAnimation;
			float4 _IntersectionHighlightColour;
			float4 _VertexNoiseAnimation;
			float4 _NoiseAnimation;
			float4 _VertexNoiseParticleAnimation;
			float4 _NoiseOffset;
			float4 _NoiseParticleAnimation;
			float4 _VertexNoiseOffset;
			float3 _VertexOffsetOverY1;
			float3 _RadialMaskDistortionTiling;
			float3 _VertexOffsetOverCircularY;
			float3 _VertexOffsetOverY2;
			float3 _VertexNoiseTiling;
			float3 _NoiseTiling;
			float3 _NoiseDistortionTiling;
			float2 _RadialMaskTiling;
			float2 _RadialMaskOffset;
			float2 _SpherizeNoiseOffset;
			float _VerticalColourMaskRemapMax;
			float _MainLightShadowOrthogonalAlignmentWorldNoise;
			float _MainLightShadowDirectionalAlignmentNoise;
			float _Noise;
			float _MainLightShadow;
			float _MainLightAnisotropyBlend;
			float _MainLightAnisotropy;
			float _AdditionalLightsFlatLambertBlend;
			float _ParticleSubtractNoiseoverLifetime;
			float _NoisePower;
			float _AdditionalLightsLambertTranslucencyMask;
			float _MainLight;
			float _MainLightShadowDirectionalNoise;
			float _ColourPower;
			float _MainLightLambertTranslucency;
			float _ColourHueShift;
			float _MainLightLambertTranslucencyMask;
			float _ColourSaturationShift;
			float _ColourValueMultiplier;
			float _VerticalColourHueShift;
			float _VerticalColourSaturationShift;
			float _MainLightFlatLambertBlend;
			float _VerticalColourValueMultiplier;
			float _VerticalColourMaskRemapMin;
			float _LambertLightingNormalfromHeight;
			float _VerticalColourMaskPower;
			float _MainLightShadowWorldNoise;
			float _Tessellation;
			float _AdditionalLightsShadowOrthogonalAlignmentWorldNoise;
			float _AdditionalLightsShadowWorldNoise;
			float _VerticalMask1Power;
			float _VerticalMask2RemapMin;
			float _VerticalMask2RemapMax;
			float _VerticalMask2ObjectSpaceOffset;
			float _VerticalMask2ObjectSpaceScale;
			float _VerticalMask2Power;
			float _FresnelMaskRemapMin;
			float _FresnelMaskRemapMax;
			float _FresnelMaskPower;
			float _FresnelMask;
			float _DepthFade;
			float _DepthFadePower;
			float _SubtractiveDepthFade;
			float _SubtractiveDepthFadePower;
			float _CameraDepthFadeLength;
			float _CameraDepthFadeOffset;
			float _CameraDepthFadePower;
			float _Alpha;
			float _MainLightTransparencyShadow;
			float _VerticalMask1ObjectSpaceScale;
			float _VerticalMask1ObjectSpaceOffset;
			float _VerticalMask1RemapMin;
			float _VerticalMask1RemapMax;
			float _AdditionalLightsShadowDirectionalNoise;
			float _AdditionalLightsShadowDirectionalAlignmentNoise;
			float _AdditionalLightsShadow;
			float _AdditionalLights;
			float _IntersectionHighlightColourHueShift;
			float _IntersectionHighlightColourSaturationShift;
			float _IntersectionHighlightColourValueMultiplier;
			float _IntersectionHighlightRemapMin;
			float _IntersectionHighlightRemapMax;
			float _AdditionalLightsLambertTranslucency;
			float _IntersectionHighlight;
			float _RadialMaskRadius;
			float _RadialMaskRadiusOverParticleLifetime;
			float _RadialMaskFeather;
			float _RadialMaskDistortionScale;
			float _RadialMaskDistortionOctaves;
			float _RadialMaskDistortionDilation;
			float _RadialMaskDistortionPower;
			float _RadialMaskDistortion;
			float _RadialMaskPower;
			float _IntersectionHighlightPower;
			float _NoiseDilation;
			float _NoiseDistortionDilation;
			float _NoiseScale;
			float _StartFoldoutBaseUVs;
			float _StartFoldoutParticleSettings;
			float _EndFoldoutParticleSettings;
			float _StartFoldoutDepthFade;
			float _EndFoldoutDepthFade;
			float _StartFoldoutIntersectionHighlight;
			float _EndFoldoutIntersectionHighlight;
			float _StartFoldoutVertexUVOffset;
			float _EndFoldoutVertexUVOffset;
			float _StartFoldoutVertexNormalOffset;
			float _EndFoldoutVertexNormalOffset;
			float _StartFoldoutVertexWave;
			float _EndFoldoutVertexWave;
			float _StartFoldoutVertexNoise;
			float _EndFoldoutVertexNoise;
			float _EndFoldoutVertexWaveNoiseVerticalMask;
			float _StartFoldoutVertexOffsetoverY;
			float _EndFoldoutLighting;
			float _EndFoldoutVertexOffsetoverY;
			float _StartFoldoutLighting;
			float _StartFoldoutVerticalColour;
			float _EndFoldoutBaseUVs;
			float _StartFoldoutColour;
			float _StartFoldoutNoise;
			float _EndFoldoutNoise;
			float _StartFoldoutNoiseDistortion;
			float _EndFoldoutNoiseDistortion;
			float _StartFoldoutRadialMask;
			float _EndFoldoutRadialMask;
			float _StartFoldoutRadialMaskDistortion;
			float _EndFoldoutRadialMaskDistortion;
			float _EndFoldoutVerticalMasks;
			float _StartFoldoutVerticalMasks;
			float _StartFoldoutSpherizeNoise;
			float _EndFoldoutSpherizeNoise;
			float _StartFoldoutFresnelMask;
			float _EndFoldoutFresnelMask;
			float _EndFoldoutColour;
			float _EndFoldoutVerticalColour;
			float _StartFoldoutVertexWaveNoiseVerticalMask;
			float _VertexNormalOffset;
			float _VertexNormalOffsetTopPower;
			float _VertexOffsetOverY2Power;
			float _VertexOffsetOverCircularYPower;
			float _NoiseRemapMin;
			float _NoiseRemapMax;
			float _UVSampleNoise;
			float _SpherizeNoiseRadius;
			float _SpherizeNoiseStrength;
			float _NoiseXZTwist;
			float _NoiseUVYPreOffset;
			float _NoiseUVYPreScale;
			float _NoiseUVYPrePower;
			float _NoiseParallaxOffset;
			float _NoiseDistortionScale;
			float _NoiseDistortionOctaves;
			float _AdditionalLightsTransparencyShadow;
			float _NoiseDistortionPower;
			float _NoiseDistortion;
			float _VertexOffsetOverY1Power;
			float _VertexTwist;
			float _VertexUVOffsetBottom;
			float _VertexUVOffsetBottomPower;
			float _VertexNormalOffsetTop;
			float _VertexNormalOffsetBottomPower;
			float _VertexNormalOffsetBottom;
			float _VertexWaveScale;
			float _VertexWaveAnimation;
			float _VertexWaveOffset;
			float _VertexWave;
			float _VertexWaveNoiseVerticalMaskRemapMin;
			float _NoiseOctaves;
			float _VertexWaveNoiseVerticalMaskRemapMax;
			float _VertexNoiseScale;
			float _ParticleRandomization;
			float _VertexNoiseOctaves;
			float _VertexNoiseDilation;
			float _VertexNoiseTwist;
			float _VertexNoise;
			float _VertexUVOffsetTopPower;
			float _VertexUVOffsetTop;
			float _VertexWaveNoiseVerticalMaskPower;
			float _IntersectionHighlightShadowMaskPower;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			

			
			float4 _SelectionID;

			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			PackedVaryings VertexFunction(Attributes input  )
			{
				PackedVaryings output;
				ZERO_INITIALIZE(PackedVaryings, output);

				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				float localTwistXZ_float11_g586 = ( 0.0 );
				float2 texCoord322 = input.ase_texcoord * float2( 1,1 ) + float2( 0,0 );
				#ifdef _SWAPUVXY_ON
				float2 staticSwitch321 = (texCoord322).yx;
				#else
				float2 staticSwitch321 = texCoord322;
				#endif
				float UV_2D_Y691 = (staticSwitch321).y;
				float3 Vertex_Normal_Offset670 = ( ( input.normalOS * _VertexNormalOffset ) + ( pow( UV_2D_Y691 , _VertexNormalOffsetTopPower ) * input.normalOS * _VertexNormalOffsetTop ) + ( pow( ( 1.0 - UV_2D_Y691 ) , _VertexNormalOffsetBottomPower ) * input.normalOS * _VertexNormalOffsetBottom ) );
				float2 UV_2D327 = staticSwitch321;
				float mulTime258 = _TimeParameters.x * _VertexWaveAnimation;
				float temp_output_7_0_g581 = _VertexWaveNoiseVerticalMaskRemapMin;
				float temp_output_23_0_g581 = _VertexWaveNoiseVerticalMaskRemapMax;
				float temp_output_20_0_g581 = UV_2D_Y691;
				float temp_output_4_0_g581 = _VertexWaveNoiseVerticalMaskPower;
				float smoothstepResult22_g581 = smoothstep( temp_output_7_0_g581 , temp_output_23_0_g581 , pow( temp_output_20_0_g581 , temp_output_4_0_g581 ));
				float Vertex_WaveNoise_Vertical_Mask280 = smoothstepResult22_g581;
				#ifdef _VERTEXWAVEENABLED_ON
				float3 staticSwitch448 = ( ( sin( ( ( UV_2D327.y * TWO_PI * _VertexWaveScale ) - ( mulTime258 + ( _VertexWaveOffset * TWO_PI ) ) ) ) * _VertexWave * Vertex_WaveNoise_Vertical_Mask280 ) * input.normalOS );
				#else
				float3 staticSwitch448 = float3( 0,0,0 );
				#endif
				float3 Vertex_Sine265 = staticSwitch448;
				float localTwistXZ_float11_g584 = ( 0.0 );
				float localSimplexNoise_float2_g583 = ( 0.0 );
				#ifdef _SWAPUVXY_ON
				float3 staticSwitch339 = (input.positionOS.xyz).yxz;
				#else
				float3 staticSwitch339 = input.positionOS.xyz;
				#endif
				float3 UV_3D340 = staticSwitch339;
				float3 ase_worldPos = TransformObjectToWorld( (input.positionOS).xyz );
				#ifdef _SWAPUVXY_ON
				float3 staticSwitch621 = (ase_worldPos).yxz;
				#else
				float3 staticSwitch621 = ase_worldPos;
				#endif
				float3 UV_3D_World622 = staticSwitch621;
				#ifdef _WORLDSPACEUVS_ON
				float3 staticSwitch605 = UV_3D_World622;
				#else
				float3 staticSwitch605 = UV_3D340;
				#endif
				float Particle_Stable_Random_X147 = ( ( input.ase_texcoord.w - 0.5 ) * 100.0 * _ParticleRandomization );
				float Particle_Age_Percent146 = input.ase_texcoord.z;
				float4 Vertex_Noise_Offset311 = ( _VertexNoiseOffset + Particle_Stable_Random_X147 + ( _VertexNoiseParticleAnimation * Particle_Age_Percent146 ) );
				float4 temp_output_10_0_g579 = ( float4( ( staticSwitch605 * _VertexNoiseScale * _VertexNoiseTiling ) , 0.0 ) - ( Vertex_Noise_Offset311 + ( _VertexNoiseAnimation * _TimeParameters.x ) ) );
				float3 temp_output_292_0 = (temp_output_10_0_g579).xyz;
				float3 position2_g583 = temp_output_292_0;
				float temp_output_292_15 = (temp_output_10_0_g579).w;
				float angle2_g583 = temp_output_292_15;
				float octaves2_g583 = _VertexNoiseOctaves;
				float noise2_g583 = 0.0;
				float3 gradient2_g583 = float3( 0,0,0 );
				SimplexNoise_float( position2_g583 , angle2_g583 , octaves2_g583 , noise2_g583 , gradient2_g583 );
				float localSimplexNoise_Caustics_float2_g582 = ( 0.0 );
				float3 position2_g582 = temp_output_292_0;
				float angle2_g582 = temp_output_292_15;
				float octaves2_g582 = _VertexNoiseOctaves;
				float gradientStrength2_g582 = _VertexNoiseDilation;
				float noise2_g582 = 0.0;
				float3 gradient2_g582 = float3( 0,0,0 );
				SimplexNoise_Caustics_float( position2_g582 , angle2_g582 , octaves2_g582 , gradientStrength2_g582 , noise2_g582 , gradient2_g582 );
				#ifdef _VERTEXNOISEDILATIONENABLED_ON
				float3 staticSwitch490 = gradient2_g582;
				#else
				float3 staticSwitch490 = gradient2_g583;
				#endif
				float3 temp_output_10_0_g584 = staticSwitch490;
				float3 position11_g584 = temp_output_10_0_g584;
				float temp_output_9_0_g584 = _VertexNoiseTwist;
				float angle11_g584 = radians( temp_output_9_0_g584 );
				float3 output11_g584 = float3( 0,0,0 );
				TwistXZ_float( position11_g584 , angle11_g584 , output11_g584 );
				float3 temp_output_852_0 = output11_g584;
				#ifdef _VERTEXNOISEENABLED_ON
				float3 staticSwitch450 = ( temp_output_852_0 * _VertexNoise * Vertex_WaveNoise_Vertical_Mask280 );
				#else
				float3 staticSwitch450 = float3( 0,0,0 );
				#endif
				float3 Vertex_Noise298 = staticSwitch450;
				float2 break587 = ( ( UV_2D327 * float2( 2,1 ) ) - float2( 1,0 ) );
				float temp_output_576_0 = ( ( break587.x * pow( break587.y , _VertexUVOffsetTopPower ) ) * ( _VertexUVOffsetTop * 0.5 ) );
				float3 appendResult575 = (float3(temp_output_576_0 , 0.0 , 0.0));
				float3 appendResult594 = (float3(0.0 , temp_output_576_0 , 0.0));
				#ifdef _SWAPUVXY_ON
				float3 staticSwitch593 = appendResult594;
				#else
				float3 staticSwitch593 = appendResult575;
				#endif
				float3 Vertex_Offset_Top579 = staticSwitch593;
				float2 break644 = ( ( UV_2D327 * float2( 2,1 ) ) - float2( 1,0 ) );
				float temp_output_650_0 = ( ( break644.x * pow( ( 1.0 - break644.y ) , _VertexUVOffsetBottomPower ) ) * ( _VertexUVOffsetBottom * 0.5 ) );
				float3 appendResult653 = (float3(temp_output_650_0 , 0.0 , 0.0));
				float3 appendResult652 = (float3(0.0 , temp_output_650_0 , 0.0));
				#ifdef _SWAPUVXY_ON
				float3 staticSwitch654 = appendResult652;
				#else
				float3 staticSwitch654 = appendResult653;
				#endif
				float3 Vertex_Offset_Bottom655 = staticSwitch654;
				float3 temp_output_10_0_g586 = ( ( Vertex_Normal_Offset670 + Vertex_Sine265 + Vertex_Noise298 + Vertex_Offset_Top579 + Vertex_Offset_Bottom655 ) + input.positionOS.xyz );
				float3 position11_g586 = temp_output_10_0_g586;
				float temp_output_9_0_g586 = -_VertexTwist;
				float angle11_g586 = radians( temp_output_9_0_g586 );
				float3 output11_g586 = float3( 0,0,0 );
				TwistXZ_float( position11_g586 , angle11_g586 , output11_g586 );
				float3 worldToObjDir636 = mul( GetWorldToObjectMatrix(), float4( _VertexOffsetOverY1, 0 ) ).xyz;
				float3 worldToObjDir780 = mul( GetWorldToObjectMatrix(), float4( _VertexOffsetOverY2, 0 ) ).xyz;
				float UV_2D_Circular_Y897 = sin( ( UV_2D_Y691 * PI ) );
				float3 Vertex_Offset_over_Y639 = ( ( worldToObjDir636 * pow( UV_2D_Y691 , _VertexOffsetOverY1Power ) ) + ( worldToObjDir780 * pow( UV_2D_Y691 , _VertexOffsetOverY2Power ) ) + ( _VertexOffsetOverCircularY * pow( UV_2D_Circular_Y897 , _VertexOffsetOverCircularYPower ) ) );
				float3 Vertex_Offset247 = ( output11_g586 + Vertex_Offset_over_Y639 );
				
				output.ase_texcoord2.xyz = ase_worldPos;
				float4 ase_clipPos = TransformObjectToHClip((input.positionOS).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				output.ase_texcoord3 = screenPos;
				float3 ase_worldNormal = TransformObjectToWorldNormal(input.normalOS);
				output.ase_texcoord5.xyz = ase_worldNormal;
				float3 objectToViewPos = TransformWorldToView(TransformObjectToWorld(input.positionOS.xyz));
				float eyeDepth = -objectToViewPos.z;
				output.ase_texcoord2.w = eyeDepth;
				float3 ase_worldTangent = TransformObjectToWorldDir(input.ase_tangent.xyz);
				output.ase_texcoord6.xyz = ase_worldTangent;
				float ase_vertexTangentSign = input.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				output.ase_texcoord7.xyz = ase_worldBitangent;
				
				output.ase_texcoord = input.ase_texcoord;
				output.ase_texcoord1 = input.positionOS;
				output.ase_texcoord4 = input.ase_texcoord1;
				output.ase_color = input.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord5.w = 0;
				output.ase_texcoord6.w = 0;
				output.ase_texcoord7.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = Vertex_Offset247;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					input.positionOS.xyz = vertexValue;
				#else
					input.positionOS.xyz += vertexValue;
				#endif

				input.normalOS = input.normalOS;

				float3 positionWS = TransformObjectToWorld( input.positionOS.xyz );
				output.positionCS = TransformWorldToHClip(positionWS);
				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( Attributes input )
			{
				VertexControl output;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				output.vertex = input.positionOS;
				output.normalOS = input.normalOS;
				output.ase_texcoord = input.ase_texcoord;
				output.ase_texcoord1 = input.ase_texcoord1;
				output.ase_color = input.ase_color;
				output.ase_tangent = input.ase_tangent;
				return output;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> input)
			{
				TessellationFactors output;
				float4 tf = 1;
				float tessValue = _Tessellation; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(input[0].vertex, input[1].vertex, input[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(input[0].vertex, input[1].vertex, input[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(input[0].vertex, input[1].vertex, input[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				output.edge[0] = tf.x; output.edge[1] = tf.y; output.edge[2] = tf.z; output.inside = tf.w;
				return output;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			PackedVaryings DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				Attributes output = (Attributes) 0;
				output.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				output.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				output.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				output.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				output.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				output.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = output.positionOS.xyz - patch[i].normalOS * (dot(output.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				output.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * output.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], output);
				return VertexFunction(output);
			}
			#else
			PackedVaryings vert ( Attributes input )
			{
				return VertexFunction( input );
			}
			#endif

			half4 frag(PackedVaryings input ) : SV_TARGET
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				float temp_output_7_0_g574 = _NoiseRemapMin;
				float temp_output_23_0_g574 = _NoiseRemapMax;
				float localSimplexNoise_float2_g504 = ( 0.0 );
				float2 texCoord322 = input.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _SWAPUVXY_ON
				float2 staticSwitch321 = (texCoord322).yx;
				#else
				float2 staticSwitch321 = texCoord322;
				#endif
				float2 UV_2D327 = staticSwitch321;
				#ifdef _SWAPUVXY_ON
				float3 staticSwitch339 = (input.ase_texcoord1.xyz).yxz;
				#else
				float3 staticSwitch339 = input.ase_texcoord1.xyz;
				#endif
				float3 UV_3D340 = staticSwitch339;
				#ifdef _OBJECTSPACEUVS_ON
				float3 staticSwitch223 = UV_3D340;
				#else
				float3 staticSwitch223 = float3( UV_2D327 ,  0.0 );
				#endif
				float3 ase_worldPos = input.ase_texcoord2.xyz;
				#ifdef _SWAPUVXY_ON
				float3 staticSwitch621 = (ase_worldPos).yxz;
				#else
				float3 staticSwitch621 = ase_worldPos;
				#endif
				float3 UV_3D_World622 = staticSwitch621;
				#ifdef _WORLDSPACEUVS_ON
				float3 staticSwitch356 = UV_3D_World622;
				#else
				float3 staticSwitch356 = staticSwitch223;
				#endif
				float4 screenPos = input.ase_texcoord3;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float2 appendResult1146 = (float2(ase_screenPosNorm.x , ase_screenPosNorm.y));
				float2 Screen_UV1145 = appendResult1146;
				float2 appendResult1112 = (float2(_ScreenParams.x , _ScreenParams.y));
				float2 Screen_Resolution1113 = appendResult1112;
				float2 Screen_Position1254 = ( Screen_UV1145 * Screen_Resolution1113 );
				float2 screenPosition1243 = Screen_Position1254;
				float mulTime1247 = _TimeParameters.x * 60.0;
				float time1243 = mulTime1247;
				float3 localHash331243 = Hash33( screenPosition1243 , time1243 );
				float3 Sample_Noise1248 = ( (localHash331243*2.0 + -1.0) * _UVSampleNoise );
				float3 Noise_Base_UV220 = ( staticSwitch356 + Sample_Noise1248 );
				float localSpherize_float5_g487 = ( 0.0 );
				float2 uv5_g487 = (Noise_Base_UV220).xy;
				float2 center5_g487 = ( _SpherizeNoiseOffset + float2( 0.5,0.5 ) );
				float radius5_g487 = _SpherizeNoiseRadius;
				float strength5_g487 = _SpherizeNoiseStrength;
				float2 output5_g487 = float2( 0,0 );
				Spherize_float( uv5_g487 , center5_g487 , radius5_g487 , strength5_g487 , output5_g487 );
				float3 appendResult611 = (float3(output5_g487 , (Noise_Base_UV220).z));
				#ifdef _SPHERIZENOISE_ON
				float3 staticSwitch625 = appendResult611;
				#else
				float3 staticSwitch625 = Noise_Base_UV220;
				#endif
				float localTwistXZ_float11_g493 = ( 0.0 );
				float3 temp_output_10_0_g493 = staticSwitch625;
				float3 position11_g493 = temp_output_10_0_g493;
				float temp_output_9_0_g493 = _NoiseXZTwist;
				float angle11_g493 = radians( temp_output_9_0_g493 );
				float3 output11_g493 = float3( 0,0,0 );
				TwistXZ_float( position11_g493 , angle11_g493 , output11_g493 );
				#ifdef _NOISEXZTWISTENABLED_ON
				float3 staticSwitch801 = output11_g493;
				#else
				float3 staticSwitch801 = staticSwitch625;
				#endif
				float3 break728 = staticSwitch801;
				float temp_output_738_0 = ( ( break728.y - _NoiseUVYPreOffset ) * _NoiseUVYPreScale );
				float temp_output_7_0_g496 = abs( temp_output_738_0 );
				float temp_output_733_14 = ( pow( temp_output_7_0_g496 , _NoiseUVYPrePower ) * sign( temp_output_738_0 ) );
				float3 appendResult732 = (float3(break728.x , temp_output_733_14 , break728.z));
				float3 ase_viewVectorWS = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				float3 ase_viewDirWS = normalize( ase_viewVectorWS );
				float3 temp_output_872_0 = ( -ase_viewDirWS * _NoiseParallaxOffset );
				#ifdef _SWAPUVXY_ON
				float3 staticSwitch464 = (temp_output_872_0).yxz;
				#else
				float3 staticSwitch464 = temp_output_872_0;
				#endif
				float3 Parallax_Offset465 = staticSwitch464;
				float localSimplexNoise_float2_g492 = ( 0.0 );
				float Particle_Stable_Random_X147 = ( ( input.ase_texcoord.w - 0.5 ) * 100.0 * _ParticleRandomization );
				float Particle_Age_Percent146 = input.ase_texcoord.z;
				float4 Distortion_Noise_Offset163 = ( _NoiseDistortionOffset + Particle_Stable_Random_X147 + ( _NoiseDistortionParticleAnimation * Particle_Age_Percent146 ) );
				float4 temp_output_10_0_g489 = ( float4( ( ( Noise_Base_UV220 + Parallax_Offset465 ) * _NoiseDistortionScale * _NoiseDistortionTiling ) , 0.0 ) - ( Distortion_Noise_Offset163 + ( _NoiseDistortionAnimation * _TimeParameters.x ) ) );
				float3 temp_output_160_0 = (temp_output_10_0_g489).xyz;
				float3 position2_g492 = temp_output_160_0;
				float temp_output_160_15 = (temp_output_10_0_g489).w;
				float angle2_g492 = temp_output_160_15;
				float octaves2_g492 = _NoiseDistortionOctaves;
				float noise2_g492 = 0.0;
				float3 gradient2_g492 = float3( 0,0,0 );
				SimplexNoise_float( position2_g492 , angle2_g492 , octaves2_g492 , noise2_g492 , gradient2_g492 );
				float localSimplexNoise_Caustics_float2_g491 = ( 0.0 );
				float3 position2_g491 = temp_output_160_0;
				float angle2_g491 = temp_output_160_15;
				float octaves2_g491 = _NoiseDistortionOctaves;
				float gradientStrength2_g491 = _NoiseDistortionDilation;
				float noise2_g491 = 0.0;
				float3 gradient2_g491 = float3( 0,0,0 );
				SimplexNoise_Caustics_float( position2_g491 , angle2_g491 , octaves2_g491 , gradientStrength2_g491 , noise2_g491 , gradient2_g491 );
				#ifdef _NOISEDISTORTIONDILATIONENABLED_ON
				float3 staticSwitch440 = gradient2_g491;
				#else
				float3 staticSwitch440 = gradient2_g492;
				#endif
				float3 temp_output_7_0_g495 = abs( staticSwitch440 );
				float3 temp_cast_3 = (_NoiseDistortionPower).xxx;
				#ifdef _NOISEDISTORTIONENABLED_ON
				float3 staticSwitch442 = ( ( pow( temp_output_7_0_g495 , temp_cast_3 ) * sign( staticSwitch440 ) ) * _NoiseDistortion );
				#else
				float3 staticSwitch442 = float3( 0,0,0 );
				#endif
				float3 Noise_Distortion73 = staticSwitch442;
				float3 Noise_UV173 = ( appendResult732 + Parallax_Offset465 + Noise_Distortion73 );
				float4 Noise_Offset175 = ( _NoiseOffset + Particle_Stable_Random_X147 + ( _NoiseParticleAnimation * Particle_Age_Percent146 ) );
				float4 temp_output_10_0_g501 = ( float4( ( Noise_UV173 * _NoiseScale * _NoiseTiling ) , 0.0 ) - ( Noise_Offset175 + ( _NoiseAnimation * _TimeParameters.x ) ) );
				float3 temp_output_159_0 = (temp_output_10_0_g501).xyz;
				float3 position2_g504 = temp_output_159_0;
				float temp_output_159_15 = (temp_output_10_0_g501).w;
				float angle2_g504 = temp_output_159_15;
				float octaves2_g504 = _NoiseOctaves;
				float noise2_g504 = 0.0;
				float3 gradient2_g504 = float3( 0,0,0 );
				SimplexNoise_float( position2_g504 , angle2_g504 , octaves2_g504 , noise2_g504 , gradient2_g504 );
				float localSimplexNoise_Caustics_float2_g503 = ( 0.0 );
				float3 position2_g503 = temp_output_159_0;
				float angle2_g503 = temp_output_159_15;
				float octaves2_g503 = _NoiseOctaves;
				float gradientStrength2_g503 = _NoiseDilation;
				float noise2_g503 = 0.0;
				float3 gradient2_g503 = float3( 0,0,0 );
				SimplexNoise_Caustics_float( position2_g503 , angle2_g503 , octaves2_g503 , gradientStrength2_g503 , noise2_g503 , gradient2_g503 );
				#ifdef _NOISEDILATIONENABLED_ON
				float staticSwitch444 = noise2_g503;
				#else
				float staticSwitch444 = noise2_g504;
				#endif
				float temp_output_20_0_g574 = staticSwitch444;
				float temp_output_4_0_g574 = _NoisePower;
				float smoothstepResult22_g574 = smoothstep( temp_output_7_0_g574 , temp_output_23_0_g574 , pow( temp_output_20_0_g574 , temp_output_4_0_g574 ));
				float Particle_Subtract_Noise_over_Lifetime480 = ( input.ase_texcoord4.y * _ParticleSubtractNoiseoverLifetime );
				float temp_output_478_0 = ( smoothstepResult22_g574 - Particle_Subtract_Noise_over_Lifetime480 );
				float lerpResult569 = lerp( 1.0 , temp_output_478_0 , _Noise);
				float Noise11 = lerpResult569;
				float Particle_Mask_Radius_over_Lifetime161 = input.ase_texcoord4.x;
				float lerpResult183 = lerp( 1.0 , Particle_Mask_Radius_over_Lifetime161 , _RadialMaskRadiusOverParticleLifetime);
				float temp_output_6_0_g497 = ( 1.0 - ( _RadialMaskRadius * lerpResult183 ) );
				float lerpResult5_g497 = lerp( temp_output_6_0_g497 , 1.0 , _RadialMaskFeather);
				float2 texCoord330 = input.ase_texcoord.xy * float2( 2,2 ) + float2( -1,-1 );
				#ifdef _SWAPUVXY_ON
				float2 staticSwitch329 = (texCoord330).yx;
				#else
				float2 staticSwitch329 = texCoord330;
				#endif
				float2 UV_2D_Centered328 = staticSwitch329;
				float localSimplexNoise_float2_g486 = ( 0.0 );
				float4 Mask_Distortion_Noise_Offset171 = ( _RadialMaskDistortionOffset + Particle_Stable_Random_X147 + ( _RadialMaskDistortionParticleAnimation * Particle_Age_Percent146 ) );
				float4 temp_output_10_0_g483 = ( float4( ( Noise_Base_UV220 * _RadialMaskDistortionScale * _RadialMaskDistortionTiling ) , 0.0 ) - ( Mask_Distortion_Noise_Offset171 + ( _RadialMaskDistortionAnimation * _TimeParameters.x ) ) );
				float3 temp_output_158_0 = (temp_output_10_0_g483).xyz;
				float3 position2_g486 = temp_output_158_0;
				float temp_output_158_15 = (temp_output_10_0_g483).w;
				float angle2_g486 = temp_output_158_15;
				float octaves2_g486 = _RadialMaskDistortionOctaves;
				float noise2_g486 = 0.0;
				float3 gradient2_g486 = float3( 0,0,0 );
				SimplexNoise_float( position2_g486 , angle2_g486 , octaves2_g486 , noise2_g486 , gradient2_g486 );
				float localSimplexNoise_Caustics_float2_g485 = ( 0.0 );
				float3 position2_g485 = temp_output_158_0;
				float angle2_g485 = temp_output_158_15;
				float octaves2_g485 = _RadialMaskDistortionOctaves;
				float gradientStrength2_g485 = _RadialMaskDistortionDilation;
				float noise2_g485 = 0.0;
				float3 gradient2_g485 = float3( 0,0,0 );
				SimplexNoise_Caustics_float( position2_g485 , angle2_g485 , octaves2_g485 , gradientStrength2_g485 , noise2_g485 , gradient2_g485 );
				#ifdef _RADIALMASKDISTORTIONDILATIONENABLED_ON
				float3 staticSwitch441 = gradient2_g485;
				#else
				float3 staticSwitch441 = gradient2_g486;
				#endif
				float3 temp_output_7_0_g488 = abs( staticSwitch441 );
				float3 temp_cast_8 = (_RadialMaskDistortionPower).xxx;
				#ifdef _RADIALMASKDISTORTIONENABLED_ON
				float3 staticSwitch451 = ( ( pow( temp_output_7_0_g488 , temp_cast_8 ) * sign( staticSwitch441 ) ) * _RadialMaskDistortion );
				#else
				float3 staticSwitch451 = float3( 0,0,0 );
				#endif
				float3 Mask_Distortion117 = staticSwitch451;
				float temp_output_7_0_g497 = ( 1.0 - length( ( ( ( UV_2D_Centered328 + (Mask_Distortion117).xy ) - _RadialMaskOffset ) * _RadialMaskTiling ) ) );
				float smoothstepResult4_g497 = smoothstep( temp_output_6_0_g497 , lerpResult5_g497 , temp_output_7_0_g497);
				#ifdef _RADIALMASK_ON
				float staticSwitch601 = ( 1.0 - pow( smoothstepResult4_g497 , _RadialMaskPower ) );
				#else
				float staticSwitch601 = 0.0;
				#endif
				float Radial_Mask227 = staticSwitch601;
				#ifdef _RADIALMASKSUBTRACTIVE_ON
				float staticSwitch942 = Radial_Mask227;
				#else
				float staticSwitch942 = 0.0;
				#endif
				float temp_output_7_0_g500 = _VerticalMask1RemapMax;
				float temp_output_23_0_g500 = _VerticalMask1RemapMin;
				float UV_2D_Y691 = (staticSwitch321).y;
				float UV_3D_Y719 = (staticSwitch339).y;
				#ifdef _VERTICALMASKSOBJECTSPACE_ON
				float staticSwitch716 = ( ( UV_3D_Y719 - _VerticalMask1ObjectSpaceOffset ) / _VerticalMask1ObjectSpaceScale );
				#else
				float staticSwitch716 = UV_2D_Y691;
				#endif
				float temp_output_20_0_g500 = staticSwitch716;
				float smoothstepResult25_g500 = smoothstep( temp_output_7_0_g500 , temp_output_23_0_g500 , temp_output_20_0_g500);
				float temp_output_4_0_g500 = _VerticalMask1Power;
				float temp_output_862_0 = pow( smoothstepResult25_g500 , temp_output_4_0_g500 );
				#ifdef _VERTICALMASK1SUBTRACTIVE_ON
				float staticSwitch713 = ( 1.0 - temp_output_862_0 );
				#else
				float staticSwitch713 = temp_output_862_0;
				#endif
				float Vertical_Mask_1350 = staticSwitch713;
				#ifdef _VERTICALMASK1SUBTRACTIVE_ON
				float staticSwitch709 = ( staticSwitch942 + Vertical_Mask_1350 );
				#else
				float staticSwitch709 = staticSwitch942;
				#endif
				#ifdef _VERTICALMASK1_ON
				float staticSwitch741 = staticSwitch709;
				#else
				float staticSwitch741 = staticSwitch942;
				#endif
				float temp_output_7_0_g505 = _VerticalMask2RemapMin;
				float temp_output_23_0_g505 = _VerticalMask2RemapMax;
				#ifdef _VERTICALMASKSOBJECTSPACE_ON
				float staticSwitch767 = ( ( UV_3D_Y719 - _VerticalMask2ObjectSpaceOffset ) / _VerticalMask2ObjectSpaceScale );
				#else
				float staticSwitch767 = UV_2D_Y691;
				#endif
				float temp_output_20_0_g505 = staticSwitch767;
				float smoothstepResult25_g505 = smoothstep( temp_output_7_0_g505 , temp_output_23_0_g505 , temp_output_20_0_g505);
				float temp_output_4_0_g505 = _VerticalMask2Power;
				float temp_output_863_0 = pow( smoothstepResult25_g505 , temp_output_4_0_g505 );
				#ifdef _VERTICALMASK2SUBTRACTIVE_ON
				float staticSwitch758 = ( 1.0 - temp_output_863_0 );
				#else
				float staticSwitch758 = temp_output_863_0;
				#endif
				float Vertical_Mask_2759 = staticSwitch758;
				#ifdef _VERTICALMASK2SUBTRACTIVE_ON
				float staticSwitch760 = ( staticSwitch741 + Vertical_Mask_2759 );
				#else
				float staticSwitch760 = staticSwitch741;
				#endif
				#ifdef _VERTICALMASK2_ON
				float staticSwitch766 = staticSwitch760;
				#else
				float staticSwitch766 = staticSwitch741;
				#endif
				float3 ase_worldNormal = input.ase_texcoord5.xyz;
				float fresnelNdotV232 = dot( ase_worldNormal, ase_viewDirWS );
				float fresnelNode232 = ( 0.0 + 1.0 * pow( 1.0 - fresnelNdotV232, _FresnelMaskPower ) );
				float smoothstepResult234 = smoothstep( _FresnelMaskRemapMin , _FresnelMaskRemapMax , fresnelNode232);
				float lerpResult242 = lerp( 1.0 , smoothstepResult234 , _FresnelMask);
				float Fresnel_Mask233 = lerpResult242;
				float temp_output_7_0_g576 = 0.0;
				float temp_output_23_0_g576 = 1.0;
				float screenDepth186 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth186 = saturate( abs( ( screenDepth186 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _DepthFade ) ) );
				#ifdef _INVERTDEPTHFADE_ON
				float staticSwitch218 = ( 1.0 - distanceDepth186 );
				#else
				float staticSwitch218 = distanceDepth186;
				#endif
				float temp_output_20_0_g576 = staticSwitch218;
				float temp_output_4_0_g576 = _DepthFadePower;
				float smoothstepResult22_g576 = smoothstep( temp_output_7_0_g576 , temp_output_23_0_g576 , pow( temp_output_20_0_g576 , temp_output_4_0_g576 ));
				float temp_output_7_0_g575 = 0.0;
				float temp_output_23_0_g575 = 1.0;
				float screenDepth208 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth208 = saturate( abs( ( screenDepth208 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _SubtractiveDepthFade ) ) );
				float temp_output_20_0_g575 = ( 1.0 - distanceDepth208 );
				float temp_output_4_0_g575 = _SubtractiveDepthFadePower;
				float smoothstepResult22_g575 = smoothstep( temp_output_7_0_g575 , temp_output_23_0_g575 , pow( temp_output_20_0_g575 , temp_output_4_0_g575 ));
				float Depth_Fade188 = saturate( ( smoothstepResult22_g576 - smoothstepResult22_g575 ) );
				float temp_output_7_0_g577 = 0.0;
				float temp_output_23_0_g577 = 1.0;
				float eyeDepth = input.ase_texcoord2.w;
				float cameraDepthFade191 = (( eyeDepth -_ProjectionParams.y - _CameraDepthFadeOffset ) / _CameraDepthFadeLength);
				float temp_output_20_0_g577 = saturate( cameraDepthFade191 );
				float temp_output_4_0_g577 = _CameraDepthFadePower;
				float smoothstepResult22_g577 = smoothstep( temp_output_7_0_g577 , temp_output_23_0_g577 , pow( temp_output_20_0_g577 , temp_output_4_0_g577 ));
				float Camera_Depth_Fade195 = smoothstepResult22_g577;
				float temp_output_7_0_g578 = _IntersectionHighlightRemapMin;
				float temp_output_23_0_g578 = _IntersectionHighlightRemapMax;
				float screenDepth1005 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth1005 = saturate( abs( ( screenDepth1005 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _IntersectionHighlight ) ) );
				float temp_output_20_0_g578 = ( 1.0 - distanceDepth1005 );
				float temp_output_4_0_g578 = _IntersectionHighlightPower;
				float smoothstepResult22_g578 = smoothstep( temp_output_7_0_g578 , temp_output_23_0_g578 , pow( temp_output_20_0_g578 , temp_output_4_0_g578 ));
				float Intersection_Highlight1011 = smoothstepResult22_g578;
				float Intersection_Highlight_Alpha1024 = _IntersectionHighlightColour.a;
				float localGetMainLightShadow_float1080 = ( 0.0 );
				float3 position1080 = ase_worldPos;
				float2 screenPosition1080 = Screen_Position1254;
				float worldNoise1080 = _MainLightShadowWorldNoise;
				float lightDirectionNoise1080 = _MainLightShadowDirectionalNoise;
				float lightDirectionOrthogonalAlignmentNoise1080 = _MainLightShadowOrthogonalAlignmentWorldNoise;
				float lightDirectionAlignmentNoise1080 = _MainLightShadowDirectionalAlignmentNoise;
				float3 normal1080 = ase_worldNormal;
				float3 ase_worldTangent = input.ase_texcoord6.xyz;
				float3 ase_worldBitangent = input.ase_texcoord7.xyz;
				float3x3 ase_worldToTangent = float3x3(ase_worldTangent,ase_worldBitangent,ase_worldNormal);
				float3x3 worldToTangentMatrix1080 = ase_worldToTangent;
				float output1080 = 0.0;
				GetMainLightShadow_float( position1080 , screenPosition1080 , worldNoise1080 , lightDirectionNoise1080 , lightDirectionOrthogonalAlignmentNoise1080 , lightDirectionAlignmentNoise1080 , normal1080 , worldToTangentMatrix1080 , output1080 );
				float lerpResult984 = lerp( 1.0 , output1080 , _MainLightTransparencyShadow);
				float Main_Light_Transparency_Shadow981 = lerpResult984;
				#ifdef _MAINLIGHTTRANSPARENCYSHADOWENABLED_ON
				float staticSwitch1076 = Main_Light_Transparency_Shadow981;
				#else
				float staticSwitch1076 = 1.0;
				#endif
				float localGetAdditionalLightsShadow_float1125 = ( 0.0 );
				float3 position1125 = ase_worldPos;
				float2 screenPosition1125 = Screen_Position1254;
				float2 screenUV1125 = Screen_UV1145;
				float worldNoise1125 = _AdditionalLightsShadowWorldNoise;
				float lightDirectionNoise1125 = _AdditionalLightsShadowDirectionalNoise;
				float lightDirectionOrthogonalAlignmentNoise1125 = _AdditionalLightsShadowOrthogonalAlignmentWorldNoise;
				float lightDirectionAlignmentNoise1125 = _AdditionalLightsShadowDirectionalAlignmentNoise;
				float3 normal1125 = ase_worldNormal;
				float3x3 worldToTangentMatrix1125 = ase_worldToTangent;
				float output1125 = 0.0;
				GetAdditionalLightsShadow_float( position1125 , screenPosition1125 , screenUV1125 , worldNoise1125 , lightDirectionNoise1125 , lightDirectionOrthogonalAlignmentNoise1125 , lightDirectionAlignmentNoise1125 , normal1125 , worldToTangentMatrix1125 , output1125 );
				float lerpResult993 = lerp( 1.0 , output1125 , _AdditionalLightsTransparencyShadow);
				float Additional_Lights_Transparency_Shadow994 = lerpResult993;
				#ifdef _ADDITIONALLIGHTSTRANSPARENCYSHADOWENABLED_ON
				float staticSwitch1077 = Additional_Lights_Transparency_Shadow994;
				#else
				float staticSwitch1077 = 1.0;
				#endif
				float temp_output_1030_0 = saturate( ( ( saturate( ( Noise11 - staticSwitch766 ) ) * Fresnel_Mask233 * (input.ase_color).a * Depth_Fade188 * Camera_Depth_Fade195 * _Alpha ) + ( Intersection_Highlight1011 * Intersection_Highlight_Alpha1024 * pow( ( staticSwitch1076 * staticSwitch1077 ) , _IntersectionHighlightShadowMaskPower ) ) ) );
				#ifdef _RADIALMASKSUBTRACTIVE_ON
				float staticSwitch943 = temp_output_1030_0;
				#else
				float staticSwitch943 = ( temp_output_1030_0 * ( 1.0 - Radial_Mask227 ) );
				#endif
				#ifdef _VERTICALMASK1SUBTRACTIVE_ON
				float staticSwitch711 = staticSwitch943;
				#else
				float staticSwitch711 = ( staticSwitch943 * Vertical_Mask_1350 );
				#endif
				#ifdef _VERTICALMASK1_ON
				float staticSwitch744 = staticSwitch711;
				#else
				float staticSwitch744 = staticSwitch943;
				#endif
				#ifdef _VERTICALMASK2SUBTRACTIVE_ON
				float staticSwitch763 = staticSwitch744;
				#else
				float staticSwitch763 = ( staticSwitch744 * Vertical_Mask_2759 );
				#endif
				#ifdef _VERTICALMASK2_ON
				float staticSwitch768 = staticSwitch763;
				#else
				float staticSwitch768 = staticSwitch744;
				#endif
				#ifdef _MAINLIGHTTRANSPARENCYSHADOWENABLED_ON
				float staticSwitch985 = ( staticSwitch768 * Main_Light_Transparency_Shadow981 );
				#else
				float staticSwitch985 = staticSwitch768;
				#endif
				#ifdef _ADDITIONALLIGHTSTRANSPARENCYSHADOWENABLED_ON
				float staticSwitch998 = ( staticSwitch985 * Additional_Lights_Transparency_Shadow994 );
				#else
				float staticSwitch998 = staticSwitch985;
				#endif
				float Alpha49 = staticSwitch998;
				

				surfaceDescription.Alpha = Alpha49;
				surfaceDescription.AlphaClipThreshold = 0.5;

				#if _ALPHATEST_ON
					float alphaClipThreshold = 0.01f;
					#if ALPHA_CLIP_THRESHOLD
						alphaClipThreshold = surfaceDescription.AlphaClipThreshold;
					#endif
					clip(surfaceDescription.Alpha - alphaClipThreshold);
				#endif

				half4 outColor = 0;
				outColor = _SelectionID;

				return outColor;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthNormals"
			Tags { "LightMode"="DepthNormalsOnly" }

			ZTest LEqual
			ZWrite On

			HLSLPROGRAM

        	#pragma multi_compile_instancing
        	#pragma multi_compile _ LOD_FADE_CROSSFADE
        	#define ASE_FOG 1
        	#define ASE_FIXED_TESSELLATION
        	#define _SURFACE_TYPE_TRANSPARENT 1
        	#define ASE_PHONG_TESSELLATION
        	#define ASE_ABSOLUTE_VERTEX_POS 1
        	#define ASE_TESSELLATION 1
        	#pragma require tessellation tessHW
        	#pragma hull HullFunction
        	#pragma domain DomainFunction
        	#define ASE_VERSION 19701
        	#define ASE_SRP_VERSION 170003
        	#define REQUIRE_DEPTH_TEXTURE 1


        	#pragma multi_compile_fragment _ _GBUFFER_NORMALS_OCT

			#pragma vertex vert
			#pragma fragment frag

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define VARYINGS_NEED_NORMAL_WS

			#define SHADERPASS SHADERPASS_DEPTHNORMALSONLY

			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

            #if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#include "../../VFXToolkit/Shaders/_Includes/Math.cginc"
			#include "../../VFXToolkit/Shaders/_Includes/Noise.cginc"
			#include "_Includes/Solaris.hlsl"
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_NEEDS_FRAG_SCREEN_POSITION
			#pragma shader_feature_local _SWAPUVXY_ON
			#pragma shader_feature_local _VERTEXWAVEENABLED_ON
			#pragma shader_feature_local _VERTEXNOISEENABLED_ON
			#pragma shader_feature_local _VERTEXNOISEDILATIONENABLED_ON
			#pragma shader_feature_local _WORLDSPACEUVS_ON
			#pragma shader_feature_local _ADDITIONALLIGHTSTRANSPARENCYSHADOWENABLED_ON
			#pragma shader_feature_local _MAINLIGHTTRANSPARENCYSHADOWENABLED_ON
			#pragma shader_feature_local _VERTICALMASK2_ON
			#pragma shader_feature_local _VERTICALMASK1_ON
			#pragma shader_feature_local _RADIALMASKSUBTRACTIVE_ON
			#pragma shader_feature_local _NOISEDILATIONENABLED_ON
			#pragma shader_feature_local _NOISEXZTWISTENABLED_ON
			#pragma shader_feature_local _SPHERIZENOISE_ON
			#pragma shader_feature_local _OBJECTSPACEUVS_ON
			#pragma shader_feature_local _NOISEDISTORTIONENABLED_ON
			#pragma shader_feature_local _NOISEDISTORTIONDILATIONENABLED_ON
			#pragma shader_feature_local _RADIALMASK_ON
			#pragma shader_feature_local _RADIALMASKDISTORTIONENABLED_ON
			#pragma shader_feature_local _RADIALMASKDISTORTIONDILATIONENABLED_ON
			#pragma shader_feature_local _VERTICALMASK1SUBTRACTIVE_ON
			#pragma shader_feature_local _VERTICALMASKSOBJECTSPACE_ON
			#pragma shader_feature_local _VERTICALMASK2SUBTRACTIVE_ON
			#pragma shader_feature_local _INVERTDEPTHFADE_ON
			#pragma multi_compile _ _FORWARD_PLUS
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
			#pragma multi_compile _ _ADDITIONAL_LIGHTS
			 #pragma multi_compile _ _ADDITIONAL_LIGHT_SHADOWS


			struct Attributes
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				float4 positionCS : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				float3 normalWS : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_color : COLOR;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ColourA;
			float4 _RadialMaskDistortionAnimation;
			float4 _VerticalColourA;
			float4 _VerticalColourB;
			float4 _RadialMaskDistortionParticleAnimation;
			float4 _RadialMaskDistortionOffset;
			float4 _NoiseDistortionOffset;
			float4 _ColourB;
			float4 _NoiseDistortionAnimation;
			float4 _NoiseDistortionParticleAnimation;
			float4 _IntersectionHighlightColour;
			float4 _VertexNoiseAnimation;
			float4 _NoiseAnimation;
			float4 _VertexNoiseParticleAnimation;
			float4 _NoiseOffset;
			float4 _NoiseParticleAnimation;
			float4 _VertexNoiseOffset;
			float3 _VertexOffsetOverY1;
			float3 _RadialMaskDistortionTiling;
			float3 _VertexOffsetOverCircularY;
			float3 _VertexOffsetOverY2;
			float3 _VertexNoiseTiling;
			float3 _NoiseTiling;
			float3 _NoiseDistortionTiling;
			float2 _RadialMaskTiling;
			float2 _RadialMaskOffset;
			float2 _SpherizeNoiseOffset;
			float _VerticalColourMaskRemapMax;
			float _MainLightShadowOrthogonalAlignmentWorldNoise;
			float _MainLightShadowDirectionalAlignmentNoise;
			float _Noise;
			float _MainLightShadow;
			float _MainLightAnisotropyBlend;
			float _MainLightAnisotropy;
			float _AdditionalLightsFlatLambertBlend;
			float _ParticleSubtractNoiseoverLifetime;
			float _NoisePower;
			float _AdditionalLightsLambertTranslucencyMask;
			float _MainLight;
			float _MainLightShadowDirectionalNoise;
			float _ColourPower;
			float _MainLightLambertTranslucency;
			float _ColourHueShift;
			float _MainLightLambertTranslucencyMask;
			float _ColourSaturationShift;
			float _ColourValueMultiplier;
			float _VerticalColourHueShift;
			float _VerticalColourSaturationShift;
			float _MainLightFlatLambertBlend;
			float _VerticalColourValueMultiplier;
			float _VerticalColourMaskRemapMin;
			float _LambertLightingNormalfromHeight;
			float _VerticalColourMaskPower;
			float _MainLightShadowWorldNoise;
			float _Tessellation;
			float _AdditionalLightsShadowOrthogonalAlignmentWorldNoise;
			float _AdditionalLightsShadowWorldNoise;
			float _VerticalMask1Power;
			float _VerticalMask2RemapMin;
			float _VerticalMask2RemapMax;
			float _VerticalMask2ObjectSpaceOffset;
			float _VerticalMask2ObjectSpaceScale;
			float _VerticalMask2Power;
			float _FresnelMaskRemapMin;
			float _FresnelMaskRemapMax;
			float _FresnelMaskPower;
			float _FresnelMask;
			float _DepthFade;
			float _DepthFadePower;
			float _SubtractiveDepthFade;
			float _SubtractiveDepthFadePower;
			float _CameraDepthFadeLength;
			float _CameraDepthFadeOffset;
			float _CameraDepthFadePower;
			float _Alpha;
			float _MainLightTransparencyShadow;
			float _VerticalMask1ObjectSpaceScale;
			float _VerticalMask1ObjectSpaceOffset;
			float _VerticalMask1RemapMin;
			float _VerticalMask1RemapMax;
			float _AdditionalLightsShadowDirectionalNoise;
			float _AdditionalLightsShadowDirectionalAlignmentNoise;
			float _AdditionalLightsShadow;
			float _AdditionalLights;
			float _IntersectionHighlightColourHueShift;
			float _IntersectionHighlightColourSaturationShift;
			float _IntersectionHighlightColourValueMultiplier;
			float _IntersectionHighlightRemapMin;
			float _IntersectionHighlightRemapMax;
			float _AdditionalLightsLambertTranslucency;
			float _IntersectionHighlight;
			float _RadialMaskRadius;
			float _RadialMaskRadiusOverParticleLifetime;
			float _RadialMaskFeather;
			float _RadialMaskDistortionScale;
			float _RadialMaskDistortionOctaves;
			float _RadialMaskDistortionDilation;
			float _RadialMaskDistortionPower;
			float _RadialMaskDistortion;
			float _RadialMaskPower;
			float _IntersectionHighlightPower;
			float _NoiseDilation;
			float _NoiseDistortionDilation;
			float _NoiseScale;
			float _StartFoldoutBaseUVs;
			float _StartFoldoutParticleSettings;
			float _EndFoldoutParticleSettings;
			float _StartFoldoutDepthFade;
			float _EndFoldoutDepthFade;
			float _StartFoldoutIntersectionHighlight;
			float _EndFoldoutIntersectionHighlight;
			float _StartFoldoutVertexUVOffset;
			float _EndFoldoutVertexUVOffset;
			float _StartFoldoutVertexNormalOffset;
			float _EndFoldoutVertexNormalOffset;
			float _StartFoldoutVertexWave;
			float _EndFoldoutVertexWave;
			float _StartFoldoutVertexNoise;
			float _EndFoldoutVertexNoise;
			float _EndFoldoutVertexWaveNoiseVerticalMask;
			float _StartFoldoutVertexOffsetoverY;
			float _EndFoldoutLighting;
			float _EndFoldoutVertexOffsetoverY;
			float _StartFoldoutLighting;
			float _StartFoldoutVerticalColour;
			float _EndFoldoutBaseUVs;
			float _StartFoldoutColour;
			float _StartFoldoutNoise;
			float _EndFoldoutNoise;
			float _StartFoldoutNoiseDistortion;
			float _EndFoldoutNoiseDistortion;
			float _StartFoldoutRadialMask;
			float _EndFoldoutRadialMask;
			float _StartFoldoutRadialMaskDistortion;
			float _EndFoldoutRadialMaskDistortion;
			float _EndFoldoutVerticalMasks;
			float _StartFoldoutVerticalMasks;
			float _StartFoldoutSpherizeNoise;
			float _EndFoldoutSpherizeNoise;
			float _StartFoldoutFresnelMask;
			float _EndFoldoutFresnelMask;
			float _EndFoldoutColour;
			float _EndFoldoutVerticalColour;
			float _StartFoldoutVertexWaveNoiseVerticalMask;
			float _VertexNormalOffset;
			float _VertexNormalOffsetTopPower;
			float _VertexOffsetOverY2Power;
			float _VertexOffsetOverCircularYPower;
			float _NoiseRemapMin;
			float _NoiseRemapMax;
			float _UVSampleNoise;
			float _SpherizeNoiseRadius;
			float _SpherizeNoiseStrength;
			float _NoiseXZTwist;
			float _NoiseUVYPreOffset;
			float _NoiseUVYPreScale;
			float _NoiseUVYPrePower;
			float _NoiseParallaxOffset;
			float _NoiseDistortionScale;
			float _NoiseDistortionOctaves;
			float _AdditionalLightsTransparencyShadow;
			float _NoiseDistortionPower;
			float _NoiseDistortion;
			float _VertexOffsetOverY1Power;
			float _VertexTwist;
			float _VertexUVOffsetBottom;
			float _VertexUVOffsetBottomPower;
			float _VertexNormalOffsetTop;
			float _VertexNormalOffsetBottomPower;
			float _VertexNormalOffsetBottom;
			float _VertexWaveScale;
			float _VertexWaveAnimation;
			float _VertexWaveOffset;
			float _VertexWave;
			float _VertexWaveNoiseVerticalMaskRemapMin;
			float _NoiseOctaves;
			float _VertexWaveNoiseVerticalMaskRemapMax;
			float _VertexNoiseScale;
			float _ParticleRandomization;
			float _VertexNoiseOctaves;
			float _VertexNoiseDilation;
			float _VertexNoiseTwist;
			float _VertexNoise;
			float _VertexUVOffsetTopPower;
			float _VertexUVOffsetTop;
			float _VertexWaveNoiseVerticalMaskPower;
			float _IntersectionHighlightShadowMaskPower;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			

			
			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			PackedVaryings VertexFunction(Attributes input  )
			{
				PackedVaryings output;
				ZERO_INITIALIZE(PackedVaryings, output);

				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				float localTwistXZ_float11_g586 = ( 0.0 );
				float2 texCoord322 = input.ase_texcoord * float2( 1,1 ) + float2( 0,0 );
				#ifdef _SWAPUVXY_ON
				float2 staticSwitch321 = (texCoord322).yx;
				#else
				float2 staticSwitch321 = texCoord322;
				#endif
				float UV_2D_Y691 = (staticSwitch321).y;
				float3 Vertex_Normal_Offset670 = ( ( input.normalOS * _VertexNormalOffset ) + ( pow( UV_2D_Y691 , _VertexNormalOffsetTopPower ) * input.normalOS * _VertexNormalOffsetTop ) + ( pow( ( 1.0 - UV_2D_Y691 ) , _VertexNormalOffsetBottomPower ) * input.normalOS * _VertexNormalOffsetBottom ) );
				float2 UV_2D327 = staticSwitch321;
				float mulTime258 = _TimeParameters.x * _VertexWaveAnimation;
				float temp_output_7_0_g581 = _VertexWaveNoiseVerticalMaskRemapMin;
				float temp_output_23_0_g581 = _VertexWaveNoiseVerticalMaskRemapMax;
				float temp_output_20_0_g581 = UV_2D_Y691;
				float temp_output_4_0_g581 = _VertexWaveNoiseVerticalMaskPower;
				float smoothstepResult22_g581 = smoothstep( temp_output_7_0_g581 , temp_output_23_0_g581 , pow( temp_output_20_0_g581 , temp_output_4_0_g581 ));
				float Vertex_WaveNoise_Vertical_Mask280 = smoothstepResult22_g581;
				#ifdef _VERTEXWAVEENABLED_ON
				float3 staticSwitch448 = ( ( sin( ( ( UV_2D327.y * TWO_PI * _VertexWaveScale ) - ( mulTime258 + ( _VertexWaveOffset * TWO_PI ) ) ) ) * _VertexWave * Vertex_WaveNoise_Vertical_Mask280 ) * input.normalOS );
				#else
				float3 staticSwitch448 = float3( 0,0,0 );
				#endif
				float3 Vertex_Sine265 = staticSwitch448;
				float localTwistXZ_float11_g584 = ( 0.0 );
				float localSimplexNoise_float2_g583 = ( 0.0 );
				#ifdef _SWAPUVXY_ON
				float3 staticSwitch339 = (input.positionOS.xyz).yxz;
				#else
				float3 staticSwitch339 = input.positionOS.xyz;
				#endif
				float3 UV_3D340 = staticSwitch339;
				float3 ase_worldPos = TransformObjectToWorld( (input.positionOS).xyz );
				#ifdef _SWAPUVXY_ON
				float3 staticSwitch621 = (ase_worldPos).yxz;
				#else
				float3 staticSwitch621 = ase_worldPos;
				#endif
				float3 UV_3D_World622 = staticSwitch621;
				#ifdef _WORLDSPACEUVS_ON
				float3 staticSwitch605 = UV_3D_World622;
				#else
				float3 staticSwitch605 = UV_3D340;
				#endif
				float Particle_Stable_Random_X147 = ( ( input.ase_texcoord.w - 0.5 ) * 100.0 * _ParticleRandomization );
				float Particle_Age_Percent146 = input.ase_texcoord.z;
				float4 Vertex_Noise_Offset311 = ( _VertexNoiseOffset + Particle_Stable_Random_X147 + ( _VertexNoiseParticleAnimation * Particle_Age_Percent146 ) );
				float4 temp_output_10_0_g579 = ( float4( ( staticSwitch605 * _VertexNoiseScale * _VertexNoiseTiling ) , 0.0 ) - ( Vertex_Noise_Offset311 + ( _VertexNoiseAnimation * _TimeParameters.x ) ) );
				float3 temp_output_292_0 = (temp_output_10_0_g579).xyz;
				float3 position2_g583 = temp_output_292_0;
				float temp_output_292_15 = (temp_output_10_0_g579).w;
				float angle2_g583 = temp_output_292_15;
				float octaves2_g583 = _VertexNoiseOctaves;
				float noise2_g583 = 0.0;
				float3 gradient2_g583 = float3( 0,0,0 );
				SimplexNoise_float( position2_g583 , angle2_g583 , octaves2_g583 , noise2_g583 , gradient2_g583 );
				float localSimplexNoise_Caustics_float2_g582 = ( 0.0 );
				float3 position2_g582 = temp_output_292_0;
				float angle2_g582 = temp_output_292_15;
				float octaves2_g582 = _VertexNoiseOctaves;
				float gradientStrength2_g582 = _VertexNoiseDilation;
				float noise2_g582 = 0.0;
				float3 gradient2_g582 = float3( 0,0,0 );
				SimplexNoise_Caustics_float( position2_g582 , angle2_g582 , octaves2_g582 , gradientStrength2_g582 , noise2_g582 , gradient2_g582 );
				#ifdef _VERTEXNOISEDILATIONENABLED_ON
				float3 staticSwitch490 = gradient2_g582;
				#else
				float3 staticSwitch490 = gradient2_g583;
				#endif
				float3 temp_output_10_0_g584 = staticSwitch490;
				float3 position11_g584 = temp_output_10_0_g584;
				float temp_output_9_0_g584 = _VertexNoiseTwist;
				float angle11_g584 = radians( temp_output_9_0_g584 );
				float3 output11_g584 = float3( 0,0,0 );
				TwistXZ_float( position11_g584 , angle11_g584 , output11_g584 );
				float3 temp_output_852_0 = output11_g584;
				#ifdef _VERTEXNOISEENABLED_ON
				float3 staticSwitch450 = ( temp_output_852_0 * _VertexNoise * Vertex_WaveNoise_Vertical_Mask280 );
				#else
				float3 staticSwitch450 = float3( 0,0,0 );
				#endif
				float3 Vertex_Noise298 = staticSwitch450;
				float2 break587 = ( ( UV_2D327 * float2( 2,1 ) ) - float2( 1,0 ) );
				float temp_output_576_0 = ( ( break587.x * pow( break587.y , _VertexUVOffsetTopPower ) ) * ( _VertexUVOffsetTop * 0.5 ) );
				float3 appendResult575 = (float3(temp_output_576_0 , 0.0 , 0.0));
				float3 appendResult594 = (float3(0.0 , temp_output_576_0 , 0.0));
				#ifdef _SWAPUVXY_ON
				float3 staticSwitch593 = appendResult594;
				#else
				float3 staticSwitch593 = appendResult575;
				#endif
				float3 Vertex_Offset_Top579 = staticSwitch593;
				float2 break644 = ( ( UV_2D327 * float2( 2,1 ) ) - float2( 1,0 ) );
				float temp_output_650_0 = ( ( break644.x * pow( ( 1.0 - break644.y ) , _VertexUVOffsetBottomPower ) ) * ( _VertexUVOffsetBottom * 0.5 ) );
				float3 appendResult653 = (float3(temp_output_650_0 , 0.0 , 0.0));
				float3 appendResult652 = (float3(0.0 , temp_output_650_0 , 0.0));
				#ifdef _SWAPUVXY_ON
				float3 staticSwitch654 = appendResult652;
				#else
				float3 staticSwitch654 = appendResult653;
				#endif
				float3 Vertex_Offset_Bottom655 = staticSwitch654;
				float3 temp_output_10_0_g586 = ( ( Vertex_Normal_Offset670 + Vertex_Sine265 + Vertex_Noise298 + Vertex_Offset_Top579 + Vertex_Offset_Bottom655 ) + input.positionOS.xyz );
				float3 position11_g586 = temp_output_10_0_g586;
				float temp_output_9_0_g586 = -_VertexTwist;
				float angle11_g586 = radians( temp_output_9_0_g586 );
				float3 output11_g586 = float3( 0,0,0 );
				TwistXZ_float( position11_g586 , angle11_g586 , output11_g586 );
				float3 worldToObjDir636 = mul( GetWorldToObjectMatrix(), float4( _VertexOffsetOverY1, 0 ) ).xyz;
				float3 worldToObjDir780 = mul( GetWorldToObjectMatrix(), float4( _VertexOffsetOverY2, 0 ) ).xyz;
				float UV_2D_Circular_Y897 = sin( ( UV_2D_Y691 * PI ) );
				float3 Vertex_Offset_over_Y639 = ( ( worldToObjDir636 * pow( UV_2D_Y691 , _VertexOffsetOverY1Power ) ) + ( worldToObjDir780 * pow( UV_2D_Y691 , _VertexOffsetOverY2Power ) ) + ( _VertexOffsetOverCircularY * pow( UV_2D_Circular_Y897 , _VertexOffsetOverCircularYPower ) ) );
				float3 Vertex_Offset247 = ( output11_g586 + Vertex_Offset_over_Y639 );
				
				output.ase_texcoord4.xyz = ase_worldPos;
				float3 objectToViewPos = TransformWorldToView(TransformObjectToWorld(input.positionOS.xyz));
				float eyeDepth = -objectToViewPos.z;
				output.ase_texcoord4.w = eyeDepth;
				float3 ase_worldTangent = TransformObjectToWorldDir(input.ase_tangent.xyz);
				output.ase_texcoord6.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(input.normalOS);
				float ase_vertexTangentSign = input.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				output.ase_texcoord7.xyz = ase_worldBitangent;
				
				output.ase_texcoord2 = input.ase_texcoord;
				output.ase_texcoord3 = input.positionOS;
				output.ase_texcoord5 = input.ase_texcoord1;
				output.ase_color = input.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord6.w = 0;
				output.ase_texcoord7.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = Vertex_Offset247;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					input.positionOS.xyz = vertexValue;
				#else
					input.positionOS.xyz += vertexValue;
				#endif

				input.normalOS = input.normalOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( input.positionOS.xyz );

				output.positionCS = vertexInput.positionCS;
				output.clipPosV = vertexInput.positionCS;
				output.normalWS = TransformObjectToWorldNormal( input.normalOS );
				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( Attributes input )
			{
				VertexControl output;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				output.vertex = input.positionOS;
				output.normalOS = input.normalOS;
				output.ase_texcoord = input.ase_texcoord;
				output.ase_texcoord1 = input.ase_texcoord1;
				output.ase_color = input.ase_color;
				output.ase_tangent = input.ase_tangent;
				return output;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> input)
			{
				TessellationFactors output;
				float4 tf = 1;
				float tessValue = _Tessellation; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(input[0].vertex, input[1].vertex, input[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(input[0].vertex, input[1].vertex, input[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(input[0].vertex, input[1].vertex, input[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				output.edge[0] = tf.x; output.edge[1] = tf.y; output.edge[2] = tf.z; output.inside = tf.w;
				return output;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			PackedVaryings DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				Attributes output = (Attributes) 0;
				output.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				output.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				output.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				output.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				output.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				output.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = output.positionOS.xyz - patch[i].normalOS * (dot(output.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				output.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * output.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], output);
				return VertexFunction(output);
			}
			#else
			PackedVaryings vert ( Attributes input )
			{
				return VertexFunction( input );
			}
			#endif

			void frag( PackedVaryings input
				, out half4 outNormalWS : SV_Target0
			#ifdef _WRITE_RENDERING_LAYERS
				, out float4 outRenderingLayers : SV_Target1
			#endif
				 )
			{
				float4 ClipPos = input.clipPosV;
				float4 ScreenPos = ComputeScreenPos( input.clipPosV );

				float temp_output_7_0_g574 = _NoiseRemapMin;
				float temp_output_23_0_g574 = _NoiseRemapMax;
				float localSimplexNoise_float2_g504 = ( 0.0 );
				float2 texCoord322 = input.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _SWAPUVXY_ON
				float2 staticSwitch321 = (texCoord322).yx;
				#else
				float2 staticSwitch321 = texCoord322;
				#endif
				float2 UV_2D327 = staticSwitch321;
				#ifdef _SWAPUVXY_ON
				float3 staticSwitch339 = (input.ase_texcoord3.xyz).yxz;
				#else
				float3 staticSwitch339 = input.ase_texcoord3.xyz;
				#endif
				float3 UV_3D340 = staticSwitch339;
				#ifdef _OBJECTSPACEUVS_ON
				float3 staticSwitch223 = UV_3D340;
				#else
				float3 staticSwitch223 = float3( UV_2D327 ,  0.0 );
				#endif
				float3 ase_worldPos = input.ase_texcoord4.xyz;
				#ifdef _SWAPUVXY_ON
				float3 staticSwitch621 = (ase_worldPos).yxz;
				#else
				float3 staticSwitch621 = ase_worldPos;
				#endif
				float3 UV_3D_World622 = staticSwitch621;
				#ifdef _WORLDSPACEUVS_ON
				float3 staticSwitch356 = UV_3D_World622;
				#else
				float3 staticSwitch356 = staticSwitch223;
				#endif
				float4 ase_screenPosNorm = ScreenPos / ScreenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float2 appendResult1146 = (float2(ase_screenPosNorm.x , ase_screenPosNorm.y));
				float2 Screen_UV1145 = appendResult1146;
				float2 appendResult1112 = (float2(_ScreenParams.x , _ScreenParams.y));
				float2 Screen_Resolution1113 = appendResult1112;
				float2 Screen_Position1254 = ( Screen_UV1145 * Screen_Resolution1113 );
				float2 screenPosition1243 = Screen_Position1254;
				float mulTime1247 = _TimeParameters.x * 60.0;
				float time1243 = mulTime1247;
				float3 localHash331243 = Hash33( screenPosition1243 , time1243 );
				float3 Sample_Noise1248 = ( (localHash331243*2.0 + -1.0) * _UVSampleNoise );
				float3 Noise_Base_UV220 = ( staticSwitch356 + Sample_Noise1248 );
				float localSpherize_float5_g487 = ( 0.0 );
				float2 uv5_g487 = (Noise_Base_UV220).xy;
				float2 center5_g487 = ( _SpherizeNoiseOffset + float2( 0.5,0.5 ) );
				float radius5_g487 = _SpherizeNoiseRadius;
				float strength5_g487 = _SpherizeNoiseStrength;
				float2 output5_g487 = float2( 0,0 );
				Spherize_float( uv5_g487 , center5_g487 , radius5_g487 , strength5_g487 , output5_g487 );
				float3 appendResult611 = (float3(output5_g487 , (Noise_Base_UV220).z));
				#ifdef _SPHERIZENOISE_ON
				float3 staticSwitch625 = appendResult611;
				#else
				float3 staticSwitch625 = Noise_Base_UV220;
				#endif
				float localTwistXZ_float11_g493 = ( 0.0 );
				float3 temp_output_10_0_g493 = staticSwitch625;
				float3 position11_g493 = temp_output_10_0_g493;
				float temp_output_9_0_g493 = _NoiseXZTwist;
				float angle11_g493 = radians( temp_output_9_0_g493 );
				float3 output11_g493 = float3( 0,0,0 );
				TwistXZ_float( position11_g493 , angle11_g493 , output11_g493 );
				#ifdef _NOISEXZTWISTENABLED_ON
				float3 staticSwitch801 = output11_g493;
				#else
				float3 staticSwitch801 = staticSwitch625;
				#endif
				float3 break728 = staticSwitch801;
				float temp_output_738_0 = ( ( break728.y - _NoiseUVYPreOffset ) * _NoiseUVYPreScale );
				float temp_output_7_0_g496 = abs( temp_output_738_0 );
				float temp_output_733_14 = ( pow( temp_output_7_0_g496 , _NoiseUVYPrePower ) * sign( temp_output_738_0 ) );
				float3 appendResult732 = (float3(break728.x , temp_output_733_14 , break728.z));
				float3 ase_viewVectorWS = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				float3 ase_viewDirWS = normalize( ase_viewVectorWS );
				float3 temp_output_872_0 = ( -ase_viewDirWS * _NoiseParallaxOffset );
				#ifdef _SWAPUVXY_ON
				float3 staticSwitch464 = (temp_output_872_0).yxz;
				#else
				float3 staticSwitch464 = temp_output_872_0;
				#endif
				float3 Parallax_Offset465 = staticSwitch464;
				float localSimplexNoise_float2_g492 = ( 0.0 );
				float Particle_Stable_Random_X147 = ( ( input.ase_texcoord2.w - 0.5 ) * 100.0 * _ParticleRandomization );
				float Particle_Age_Percent146 = input.ase_texcoord2.z;
				float4 Distortion_Noise_Offset163 = ( _NoiseDistortionOffset + Particle_Stable_Random_X147 + ( _NoiseDistortionParticleAnimation * Particle_Age_Percent146 ) );
				float4 temp_output_10_0_g489 = ( float4( ( ( Noise_Base_UV220 + Parallax_Offset465 ) * _NoiseDistortionScale * _NoiseDistortionTiling ) , 0.0 ) - ( Distortion_Noise_Offset163 + ( _NoiseDistortionAnimation * _TimeParameters.x ) ) );
				float3 temp_output_160_0 = (temp_output_10_0_g489).xyz;
				float3 position2_g492 = temp_output_160_0;
				float temp_output_160_15 = (temp_output_10_0_g489).w;
				float angle2_g492 = temp_output_160_15;
				float octaves2_g492 = _NoiseDistortionOctaves;
				float noise2_g492 = 0.0;
				float3 gradient2_g492 = float3( 0,0,0 );
				SimplexNoise_float( position2_g492 , angle2_g492 , octaves2_g492 , noise2_g492 , gradient2_g492 );
				float localSimplexNoise_Caustics_float2_g491 = ( 0.0 );
				float3 position2_g491 = temp_output_160_0;
				float angle2_g491 = temp_output_160_15;
				float octaves2_g491 = _NoiseDistortionOctaves;
				float gradientStrength2_g491 = _NoiseDistortionDilation;
				float noise2_g491 = 0.0;
				float3 gradient2_g491 = float3( 0,0,0 );
				SimplexNoise_Caustics_float( position2_g491 , angle2_g491 , octaves2_g491 , gradientStrength2_g491 , noise2_g491 , gradient2_g491 );
				#ifdef _NOISEDISTORTIONDILATIONENABLED_ON
				float3 staticSwitch440 = gradient2_g491;
				#else
				float3 staticSwitch440 = gradient2_g492;
				#endif
				float3 temp_output_7_0_g495 = abs( staticSwitch440 );
				float3 temp_cast_3 = (_NoiseDistortionPower).xxx;
				#ifdef _NOISEDISTORTIONENABLED_ON
				float3 staticSwitch442 = ( ( pow( temp_output_7_0_g495 , temp_cast_3 ) * sign( staticSwitch440 ) ) * _NoiseDistortion );
				#else
				float3 staticSwitch442 = float3( 0,0,0 );
				#endif
				float3 Noise_Distortion73 = staticSwitch442;
				float3 Noise_UV173 = ( appendResult732 + Parallax_Offset465 + Noise_Distortion73 );
				float4 Noise_Offset175 = ( _NoiseOffset + Particle_Stable_Random_X147 + ( _NoiseParticleAnimation * Particle_Age_Percent146 ) );
				float4 temp_output_10_0_g501 = ( float4( ( Noise_UV173 * _NoiseScale * _NoiseTiling ) , 0.0 ) - ( Noise_Offset175 + ( _NoiseAnimation * _TimeParameters.x ) ) );
				float3 temp_output_159_0 = (temp_output_10_0_g501).xyz;
				float3 position2_g504 = temp_output_159_0;
				float temp_output_159_15 = (temp_output_10_0_g501).w;
				float angle2_g504 = temp_output_159_15;
				float octaves2_g504 = _NoiseOctaves;
				float noise2_g504 = 0.0;
				float3 gradient2_g504 = float3( 0,0,0 );
				SimplexNoise_float( position2_g504 , angle2_g504 , octaves2_g504 , noise2_g504 , gradient2_g504 );
				float localSimplexNoise_Caustics_float2_g503 = ( 0.0 );
				float3 position2_g503 = temp_output_159_0;
				float angle2_g503 = temp_output_159_15;
				float octaves2_g503 = _NoiseOctaves;
				float gradientStrength2_g503 = _NoiseDilation;
				float noise2_g503 = 0.0;
				float3 gradient2_g503 = float3( 0,0,0 );
				SimplexNoise_Caustics_float( position2_g503 , angle2_g503 , octaves2_g503 , gradientStrength2_g503 , noise2_g503 , gradient2_g503 );
				#ifdef _NOISEDILATIONENABLED_ON
				float staticSwitch444 = noise2_g503;
				#else
				float staticSwitch444 = noise2_g504;
				#endif
				float temp_output_20_0_g574 = staticSwitch444;
				float temp_output_4_0_g574 = _NoisePower;
				float smoothstepResult22_g574 = smoothstep( temp_output_7_0_g574 , temp_output_23_0_g574 , pow( temp_output_20_0_g574 , temp_output_4_0_g574 ));
				float Particle_Subtract_Noise_over_Lifetime480 = ( input.ase_texcoord5.y * _ParticleSubtractNoiseoverLifetime );
				float temp_output_478_0 = ( smoothstepResult22_g574 - Particle_Subtract_Noise_over_Lifetime480 );
				float lerpResult569 = lerp( 1.0 , temp_output_478_0 , _Noise);
				float Noise11 = lerpResult569;
				float Particle_Mask_Radius_over_Lifetime161 = input.ase_texcoord5.x;
				float lerpResult183 = lerp( 1.0 , Particle_Mask_Radius_over_Lifetime161 , _RadialMaskRadiusOverParticleLifetime);
				float temp_output_6_0_g497 = ( 1.0 - ( _RadialMaskRadius * lerpResult183 ) );
				float lerpResult5_g497 = lerp( temp_output_6_0_g497 , 1.0 , _RadialMaskFeather);
				float2 texCoord330 = input.ase_texcoord2.xy * float2( 2,2 ) + float2( -1,-1 );
				#ifdef _SWAPUVXY_ON
				float2 staticSwitch329 = (texCoord330).yx;
				#else
				float2 staticSwitch329 = texCoord330;
				#endif
				float2 UV_2D_Centered328 = staticSwitch329;
				float localSimplexNoise_float2_g486 = ( 0.0 );
				float4 Mask_Distortion_Noise_Offset171 = ( _RadialMaskDistortionOffset + Particle_Stable_Random_X147 + ( _RadialMaskDistortionParticleAnimation * Particle_Age_Percent146 ) );
				float4 temp_output_10_0_g483 = ( float4( ( Noise_Base_UV220 * _RadialMaskDistortionScale * _RadialMaskDistortionTiling ) , 0.0 ) - ( Mask_Distortion_Noise_Offset171 + ( _RadialMaskDistortionAnimation * _TimeParameters.x ) ) );
				float3 temp_output_158_0 = (temp_output_10_0_g483).xyz;
				float3 position2_g486 = temp_output_158_0;
				float temp_output_158_15 = (temp_output_10_0_g483).w;
				float angle2_g486 = temp_output_158_15;
				float octaves2_g486 = _RadialMaskDistortionOctaves;
				float noise2_g486 = 0.0;
				float3 gradient2_g486 = float3( 0,0,0 );
				SimplexNoise_float( position2_g486 , angle2_g486 , octaves2_g486 , noise2_g486 , gradient2_g486 );
				float localSimplexNoise_Caustics_float2_g485 = ( 0.0 );
				float3 position2_g485 = temp_output_158_0;
				float angle2_g485 = temp_output_158_15;
				float octaves2_g485 = _RadialMaskDistortionOctaves;
				float gradientStrength2_g485 = _RadialMaskDistortionDilation;
				float noise2_g485 = 0.0;
				float3 gradient2_g485 = float3( 0,0,0 );
				SimplexNoise_Caustics_float( position2_g485 , angle2_g485 , octaves2_g485 , gradientStrength2_g485 , noise2_g485 , gradient2_g485 );
				#ifdef _RADIALMASKDISTORTIONDILATIONENABLED_ON
				float3 staticSwitch441 = gradient2_g485;
				#else
				float3 staticSwitch441 = gradient2_g486;
				#endif
				float3 temp_output_7_0_g488 = abs( staticSwitch441 );
				float3 temp_cast_8 = (_RadialMaskDistortionPower).xxx;
				#ifdef _RADIALMASKDISTORTIONENABLED_ON
				float3 staticSwitch451 = ( ( pow( temp_output_7_0_g488 , temp_cast_8 ) * sign( staticSwitch441 ) ) * _RadialMaskDistortion );
				#else
				float3 staticSwitch451 = float3( 0,0,0 );
				#endif
				float3 Mask_Distortion117 = staticSwitch451;
				float temp_output_7_0_g497 = ( 1.0 - length( ( ( ( UV_2D_Centered328 + (Mask_Distortion117).xy ) - _RadialMaskOffset ) * _RadialMaskTiling ) ) );
				float smoothstepResult4_g497 = smoothstep( temp_output_6_0_g497 , lerpResult5_g497 , temp_output_7_0_g497);
				#ifdef _RADIALMASK_ON
				float staticSwitch601 = ( 1.0 - pow( smoothstepResult4_g497 , _RadialMaskPower ) );
				#else
				float staticSwitch601 = 0.0;
				#endif
				float Radial_Mask227 = staticSwitch601;
				#ifdef _RADIALMASKSUBTRACTIVE_ON
				float staticSwitch942 = Radial_Mask227;
				#else
				float staticSwitch942 = 0.0;
				#endif
				float temp_output_7_0_g500 = _VerticalMask1RemapMax;
				float temp_output_23_0_g500 = _VerticalMask1RemapMin;
				float UV_2D_Y691 = (staticSwitch321).y;
				float UV_3D_Y719 = (staticSwitch339).y;
				#ifdef _VERTICALMASKSOBJECTSPACE_ON
				float staticSwitch716 = ( ( UV_3D_Y719 - _VerticalMask1ObjectSpaceOffset ) / _VerticalMask1ObjectSpaceScale );
				#else
				float staticSwitch716 = UV_2D_Y691;
				#endif
				float temp_output_20_0_g500 = staticSwitch716;
				float smoothstepResult25_g500 = smoothstep( temp_output_7_0_g500 , temp_output_23_0_g500 , temp_output_20_0_g500);
				float temp_output_4_0_g500 = _VerticalMask1Power;
				float temp_output_862_0 = pow( smoothstepResult25_g500 , temp_output_4_0_g500 );
				#ifdef _VERTICALMASK1SUBTRACTIVE_ON
				float staticSwitch713 = ( 1.0 - temp_output_862_0 );
				#else
				float staticSwitch713 = temp_output_862_0;
				#endif
				float Vertical_Mask_1350 = staticSwitch713;
				#ifdef _VERTICALMASK1SUBTRACTIVE_ON
				float staticSwitch709 = ( staticSwitch942 + Vertical_Mask_1350 );
				#else
				float staticSwitch709 = staticSwitch942;
				#endif
				#ifdef _VERTICALMASK1_ON
				float staticSwitch741 = staticSwitch709;
				#else
				float staticSwitch741 = staticSwitch942;
				#endif
				float temp_output_7_0_g505 = _VerticalMask2RemapMin;
				float temp_output_23_0_g505 = _VerticalMask2RemapMax;
				#ifdef _VERTICALMASKSOBJECTSPACE_ON
				float staticSwitch767 = ( ( UV_3D_Y719 - _VerticalMask2ObjectSpaceOffset ) / _VerticalMask2ObjectSpaceScale );
				#else
				float staticSwitch767 = UV_2D_Y691;
				#endif
				float temp_output_20_0_g505 = staticSwitch767;
				float smoothstepResult25_g505 = smoothstep( temp_output_7_0_g505 , temp_output_23_0_g505 , temp_output_20_0_g505);
				float temp_output_4_0_g505 = _VerticalMask2Power;
				float temp_output_863_0 = pow( smoothstepResult25_g505 , temp_output_4_0_g505 );
				#ifdef _VERTICALMASK2SUBTRACTIVE_ON
				float staticSwitch758 = ( 1.0 - temp_output_863_0 );
				#else
				float staticSwitch758 = temp_output_863_0;
				#endif
				float Vertical_Mask_2759 = staticSwitch758;
				#ifdef _VERTICALMASK2SUBTRACTIVE_ON
				float staticSwitch760 = ( staticSwitch741 + Vertical_Mask_2759 );
				#else
				float staticSwitch760 = staticSwitch741;
				#endif
				#ifdef _VERTICALMASK2_ON
				float staticSwitch766 = staticSwitch760;
				#else
				float staticSwitch766 = staticSwitch741;
				#endif
				float fresnelNdotV232 = dot( input.clipPosV.xyz, ase_viewDirWS );
				float fresnelNode232 = ( 0.0 + 1.0 * pow( 1.0 - fresnelNdotV232, _FresnelMaskPower ) );
				float smoothstepResult234 = smoothstep( _FresnelMaskRemapMin , _FresnelMaskRemapMax , fresnelNode232);
				float lerpResult242 = lerp( 1.0 , smoothstepResult234 , _FresnelMask);
				float Fresnel_Mask233 = lerpResult242;
				float temp_output_7_0_g576 = 0.0;
				float temp_output_23_0_g576 = 1.0;
				float screenDepth186 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth186 = saturate( abs( ( screenDepth186 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _DepthFade ) ) );
				#ifdef _INVERTDEPTHFADE_ON
				float staticSwitch218 = ( 1.0 - distanceDepth186 );
				#else
				float staticSwitch218 = distanceDepth186;
				#endif
				float temp_output_20_0_g576 = staticSwitch218;
				float temp_output_4_0_g576 = _DepthFadePower;
				float smoothstepResult22_g576 = smoothstep( temp_output_7_0_g576 , temp_output_23_0_g576 , pow( temp_output_20_0_g576 , temp_output_4_0_g576 ));
				float temp_output_7_0_g575 = 0.0;
				float temp_output_23_0_g575 = 1.0;
				float screenDepth208 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth208 = saturate( abs( ( screenDepth208 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _SubtractiveDepthFade ) ) );
				float temp_output_20_0_g575 = ( 1.0 - distanceDepth208 );
				float temp_output_4_0_g575 = _SubtractiveDepthFadePower;
				float smoothstepResult22_g575 = smoothstep( temp_output_7_0_g575 , temp_output_23_0_g575 , pow( temp_output_20_0_g575 , temp_output_4_0_g575 ));
				float Depth_Fade188 = saturate( ( smoothstepResult22_g576 - smoothstepResult22_g575 ) );
				float temp_output_7_0_g577 = 0.0;
				float temp_output_23_0_g577 = 1.0;
				float eyeDepth = input.ase_texcoord4.w;
				float cameraDepthFade191 = (( eyeDepth -_ProjectionParams.y - _CameraDepthFadeOffset ) / _CameraDepthFadeLength);
				float temp_output_20_0_g577 = saturate( cameraDepthFade191 );
				float temp_output_4_0_g577 = _CameraDepthFadePower;
				float smoothstepResult22_g577 = smoothstep( temp_output_7_0_g577 , temp_output_23_0_g577 , pow( temp_output_20_0_g577 , temp_output_4_0_g577 ));
				float Camera_Depth_Fade195 = smoothstepResult22_g577;
				float temp_output_7_0_g578 = _IntersectionHighlightRemapMin;
				float temp_output_23_0_g578 = _IntersectionHighlightRemapMax;
				float screenDepth1005 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth1005 = saturate( abs( ( screenDepth1005 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _IntersectionHighlight ) ) );
				float temp_output_20_0_g578 = ( 1.0 - distanceDepth1005 );
				float temp_output_4_0_g578 = _IntersectionHighlightPower;
				float smoothstepResult22_g578 = smoothstep( temp_output_7_0_g578 , temp_output_23_0_g578 , pow( temp_output_20_0_g578 , temp_output_4_0_g578 ));
				float Intersection_Highlight1011 = smoothstepResult22_g578;
				float Intersection_Highlight_Alpha1024 = _IntersectionHighlightColour.a;
				float localGetMainLightShadow_float1080 = ( 0.0 );
				float3 position1080 = ase_worldPos;
				float2 screenPosition1080 = Screen_Position1254;
				float worldNoise1080 = _MainLightShadowWorldNoise;
				float lightDirectionNoise1080 = _MainLightShadowDirectionalNoise;
				float lightDirectionOrthogonalAlignmentNoise1080 = _MainLightShadowOrthogonalAlignmentWorldNoise;
				float lightDirectionAlignmentNoise1080 = _MainLightShadowDirectionalAlignmentNoise;
				float3 normal1080 = input.clipPosV.xyz;
				float3 ase_worldTangent = input.ase_texcoord6.xyz;
				float3 ase_worldBitangent = input.ase_texcoord7.xyz;
				float3x3 ase_worldToTangent = float3x3(ase_worldTangent,ase_worldBitangent,input.clipPosV.xyz);
				float3x3 worldToTangentMatrix1080 = ase_worldToTangent;
				float output1080 = 0.0;
				GetMainLightShadow_float( position1080 , screenPosition1080 , worldNoise1080 , lightDirectionNoise1080 , lightDirectionOrthogonalAlignmentNoise1080 , lightDirectionAlignmentNoise1080 , normal1080 , worldToTangentMatrix1080 , output1080 );
				float lerpResult984 = lerp( 1.0 , output1080 , _MainLightTransparencyShadow);
				float Main_Light_Transparency_Shadow981 = lerpResult984;
				#ifdef _MAINLIGHTTRANSPARENCYSHADOWENABLED_ON
				float staticSwitch1076 = Main_Light_Transparency_Shadow981;
				#else
				float staticSwitch1076 = 1.0;
				#endif
				float localGetAdditionalLightsShadow_float1125 = ( 0.0 );
				float3 position1125 = ase_worldPos;
				float2 screenPosition1125 = Screen_Position1254;
				float2 screenUV1125 = Screen_UV1145;
				float worldNoise1125 = _AdditionalLightsShadowWorldNoise;
				float lightDirectionNoise1125 = _AdditionalLightsShadowDirectionalNoise;
				float lightDirectionOrthogonalAlignmentNoise1125 = _AdditionalLightsShadowOrthogonalAlignmentWorldNoise;
				float lightDirectionAlignmentNoise1125 = _AdditionalLightsShadowDirectionalAlignmentNoise;
				float3 normal1125 = input.clipPosV.xyz;
				float3x3 worldToTangentMatrix1125 = ase_worldToTangent;
				float output1125 = 0.0;
				GetAdditionalLightsShadow_float( position1125 , screenPosition1125 , screenUV1125 , worldNoise1125 , lightDirectionNoise1125 , lightDirectionOrthogonalAlignmentNoise1125 , lightDirectionAlignmentNoise1125 , normal1125 , worldToTangentMatrix1125 , output1125 );
				float lerpResult993 = lerp( 1.0 , output1125 , _AdditionalLightsTransparencyShadow);
				float Additional_Lights_Transparency_Shadow994 = lerpResult993;
				#ifdef _ADDITIONALLIGHTSTRANSPARENCYSHADOWENABLED_ON
				float staticSwitch1077 = Additional_Lights_Transparency_Shadow994;
				#else
				float staticSwitch1077 = 1.0;
				#endif
				float temp_output_1030_0 = saturate( ( ( saturate( ( Noise11 - staticSwitch766 ) ) * Fresnel_Mask233 * (input.ase_color).a * Depth_Fade188 * Camera_Depth_Fade195 * _Alpha ) + ( Intersection_Highlight1011 * Intersection_Highlight_Alpha1024 * pow( ( staticSwitch1076 * staticSwitch1077 ) , _IntersectionHighlightShadowMaskPower ) ) ) );
				#ifdef _RADIALMASKSUBTRACTIVE_ON
				float staticSwitch943 = temp_output_1030_0;
				#else
				float staticSwitch943 = ( temp_output_1030_0 * ( 1.0 - Radial_Mask227 ) );
				#endif
				#ifdef _VERTICALMASK1SUBTRACTIVE_ON
				float staticSwitch711 = staticSwitch943;
				#else
				float staticSwitch711 = ( staticSwitch943 * Vertical_Mask_1350 );
				#endif
				#ifdef _VERTICALMASK1_ON
				float staticSwitch744 = staticSwitch711;
				#else
				float staticSwitch744 = staticSwitch943;
				#endif
				#ifdef _VERTICALMASK2SUBTRACTIVE_ON
				float staticSwitch763 = staticSwitch744;
				#else
				float staticSwitch763 = ( staticSwitch744 * Vertical_Mask_2759 );
				#endif
				#ifdef _VERTICALMASK2_ON
				float staticSwitch768 = staticSwitch763;
				#else
				float staticSwitch768 = staticSwitch744;
				#endif
				#ifdef _MAINLIGHTTRANSPARENCYSHADOWENABLED_ON
				float staticSwitch985 = ( staticSwitch768 * Main_Light_Transparency_Shadow981 );
				#else
				float staticSwitch985 = staticSwitch768;
				#endif
				#ifdef _ADDITIONALLIGHTSTRANSPARENCYSHADOWENABLED_ON
				float staticSwitch998 = ( staticSwitch985 * Additional_Lights_Transparency_Shadow994 );
				#else
				float staticSwitch998 = staticSwitch985;
				#endif
				float Alpha49 = staticSwitch998;
				

				float Alpha = Alpha49;
				float AlphaClipThreshold = 0.5;

				#if _ALPHATEST_ON
					clip( Alpha - AlphaClipThreshold );
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( input.positionCS );
				#endif

				#if defined(_GBUFFER_NORMALS_OCT)
					float3 normalWS = normalize(input.normalWS);
					float2 octNormalWS = PackNormalOctQuadEncode(normalWS);           // values between [-1, +1], must use fp32 on some platforms
					float2 remappedOctNormalWS = saturate(octNormalWS * 0.5 + 0.5);   // values between [ 0,  1]
					half3 packedNormalWS = PackFloat2To888(remappedOctNormalWS);      // values between [ 0,  1]
					outNormalWS = half4(packedNormalWS, 0.0);
				#else
					float3 normalWS = input.normalWS;
					outNormalWS = half4(NormalizeNormalPerPixel(normalWS), 0.0);
				#endif

				#ifdef _WRITE_RENDERING_LAYERS
					uint renderingLayers = GetMeshRenderingLayer();
					outRenderingLayers = float4(EncodeMeshRenderingLayer(renderingLayers), 0, 0, 0);
				#endif
			}

			ENDHLSL
		}

	
	}
	
	CustomEditor "Mirza.Solaris.SolarisGUI"
	FallBack "Hidden/Shader Graph/FallbackError"
	
	Fallback Off
}
/*ASEBEGIN
Version=19701
Node;AmplifyShaderEditor.ScreenPosInputsNode;1144;-9984,3584;Float;False;0;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ScreenParams;1111;-9984,3840;Inherit;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;1146;-9728,3584;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;1112;-9728,3840;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1145;-9472,3584;Inherit;False;Screen UV;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1113;-9472,3840;Inherit;False;Screen Resolution;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1256;-9088,3584;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1254;-8832,3584;Inherit;False;Screen Position;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PosVertexDataNode;341;-7296,-2176;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;322;-7296,-2816;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WorldPosInputsNode;623;-7296,-1920;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SwizzleNode;338;-6912,-2048;Inherit;False;FLOAT3;1;0;2;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SwizzleNode;316;-6912,-2688;Inherit;False;FLOAT2;1;0;2;3;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;1257;-9088,-2816;Inherit;False;1254;Screen Position;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleTimeNode;1247;-9088,-2688;Inherit;False;1;0;FLOAT;60;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;145;-3328,-3328;Inherit;False;0;4;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SwizzleNode;620;-6912,-1792;Inherit;False;FLOAT3;1;0;2;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;339;-6656,-2176;Inherit;False;Property;_SwapUVXY2;Swap UV XY;36;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;321;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;321;-6656,-2816;Inherit;False;Property;_SwapUVXY;Swap UV XY;36;0;Create;True;0;0;0;False;2;Header(Base UVs);Space(5);False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CustomExpressionNode;1243;-8832,-2816;Inherit;False; ;3;File;2;True;screenPosition;FLOAT2;0,0;In;;Inherit;False;True;time;FLOAT;0;In;;Inherit;False;Hash33;False;False;0;3e9fef90fa1fa8d4091eea0baa50ed09;False;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;156;-2944,-3200;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;477;-2944,-3072;Inherit;False;Property;_ParticleRandomization;Particle Randomization;42;0;Create;True;0;0;0;False;2;Header(Particle Settings);Space(5);False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;340;-6016,-2176;Inherit;False;UV 3D;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;327;-6016,-2816;Inherit;False;UV 2D;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StaticSwitch;621;-6656,-1920;Inherit;False;Property;_SwapUVXY4;Swap UV XY;36;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;321;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;1251;-8448,-2816;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT;2;False;2;FLOAT;-1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1259;-8448,-2688;Inherit;False;Property;_UVSampleNoise;UV Sample Noise;39;0;Create;True;0;0;0;False;1;Space(5);False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;157;-2560,-3200;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;100;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;146;-2944,-3328;Inherit;False;Particle Age Percent;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;622;-5760,-1920;Inherit;False;UV 3D World;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;342;-7296,-1536;Inherit;False;340;UV 3D;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;332;-7296,-1664;Inherit;False;327;UV 2D;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1258;-8064,-2816;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;147;-2304,-3200;Inherit;False;Particle Stable Random X;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;168;-5376,-1232;Inherit;False;146;Particle Age Percent;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;170;-5376,-1408;Inherit;False;Property;_RadialMaskDistortionParticleAnimation;Radial Mask Distortion Particle Animation;121;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StaticSwitch;223;-7040,-1664;Inherit;False;Property;_ObjectSpaceUVs;Object Space UVs;38;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;624;-7040,-1536;Inherit;False;622;UV 3D World;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1248;-7808,-2816;Inherit;False;Sample Noise;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;151;-5376,-1488;Inherit;False;147;Particle Stable Random X;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;169;-4992,-1408;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.Vector4Node;109;-5376,-1664;Inherit;False;Property;_RadialMaskDistortionOffset;Radial Mask Distortion Offset;122;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StaticSwitch;356;-6656,-1664;Inherit;False;Property;_WorldSpaceUVs;World Space UVs;37;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1268;-6656,-1536;Inherit;False;1248;Sample Noise;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;150;-4736,-1664;Inherit;False;3;3;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;2;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1267;-6272,-1664;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;71;-7040,-1280;Inherit;False;Property;_NoiseParallaxOffset;Noise Parallax Offset;80;0;Create;True;0;0;0;False;1;Space(5);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;171;-4480,-1664;Inherit;False;Mask Distortion Noise Offset;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;220;-6016,-1664;Inherit;False;Noise Base UV;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;872;-6784,-1280;Inherit;False;Parallax Offset;-1;;482;66d259709a71255489a93d3df825942b;3,20,0,16,1,9,1;1;13;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;172;-4096,-1104;Inherit;False;171;Mask Distortion Noise Offset;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;323;-4096,-1664;Inherit;False;220;Noise Base UV;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;106;-4096,-1536;Inherit;False;Property;_RadialMaskDistortionScale;Radial Mask Distortion Scale;118;0;Create;True;0;0;0;False;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;107;-4096,-1456;Inherit;False;Property;_RadialMaskDistortionTiling;Radial Mask Distortion Tiling;119;0;Create;True;0;0;0;False;0;False;1.5,1,1;1,1,1;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.Vector4Node;108;-4096,-1280;Inherit;False;Property;_RadialMaskDistortionAnimation;Radial Mask Distortion Animation;120;0;Create;True;0;0;0;False;0;False;0,2,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SwizzleNode;463;-6528,-1152;Inherit;False;FLOAT3;1;0;2;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;165;-5376,-2000;Inherit;False;146;Particle Age Percent;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;167;-5376,-2176;Inherit;False;Property;_NoiseDistortionParticleAnimation;Noise Distortion Particle Animation;98;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;158;-3328,-1664;Inherit;False;Scale Tiling Offset Animation;-1;;483;650501f4d90f3194eb72a847e06cc2e3;1,21,0;6;4;FLOAT3;0,0,0;False;7;FLOAT;1;False;8;FLOAT3;1,1,1;False;9;FLOAT4;0,0,0,0;False;19;INT;0;False;12;FLOAT4;0,0,0,0;False;2;FLOAT3;0;FLOAT;15
Node;AmplifyShaderEditor.RangedFloatNode;111;-3328,-1488;Inherit;False;Property;_RadialMaskDistortionOctaves;Radial Mask Distortion Octaves;123;1;[IntRange];Create;True;0;0;0;False;0;False;1;1;1;8;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;112;-3328,-1408;Inherit;False;Property;_RadialMaskDistortionDilation;Radial Mask Distortion Dilation;124;0;Create;True;0;0;0;False;0;False;0.004;0.002;0;0.1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;447;-9984,-768;Inherit;False;220;Noise Base UV;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Vector2Node;137;-9856,-512;Inherit;False;Property;_SpherizeNoiseOffset;Spherize Noise Offset;149;0;Create;True;0;0;0;False;0;False;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.GetLocalVarNode;149;-5376,-2256;Inherit;False;147;Particle Stable Random X;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;166;-4992,-2176;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.Vector4Node;82;-5376,-2432;Inherit;False;Property;_NoiseDistortionOffset;Noise Distortion Offset;99;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StaticSwitch;464;-6144,-1280;Inherit;False;Property;_SwapUVXY3;Swap UV XY;36;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;321;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;118;-2816,-1664;Inherit;False;Simplex Noise Caustics;-1;;485;477e7c249263854458b4f42934448d42;0;4;4;FLOAT3;0,0,0;False;6;FLOAT;0;False;7;FLOAT;1;False;9;FLOAT;0.01;False;2;FLOAT;0;FLOAT3;3
Node;AmplifyShaderEditor.FunctionNode;443;-2816,-1792;Inherit;False;Simplex Noise;-1;;486;c68ae2e20c00ec54aaecd9d04797372e;0;3;4;FLOAT3;0,0,0;False;6;FLOAT;0;False;7;FLOAT;1;False;2;FLOAT;0;FLOAT3;3
Node;AmplifyShaderEditor.ComponentMaskNode;612;-9600,-768;Inherit;False;True;True;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ComponentMaskNode;613;-9600,-640;Inherit;False;False;False;True;False;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;629;-9600,-512;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;148;-4736,-2432;Inherit;False;3;3;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;2;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;465;-5888,-1280;Inherit;False;Parallax Offset;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;441;-2432,-1664;Inherit;False;Property;_RadialMaskDistortionDilationEnabled;Radial Mask Distortion Dilation Enabled;125;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;119;-2432,-1536;Inherit;False;Property;_RadialMaskDistortionPower;Radial Mask Distortion Power;126;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;61;-9600,-384;Inherit;False;Property;_SpherizeNoiseRadius;Spherize Noise Radius;147;0;Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;62;-9600,-304;Inherit;False;Property;_SpherizeNoiseStrength;Spherize Noise Strength;148;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;617;-9104,-528;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;66;-9216,-768;Inherit;False;Spherize;-1;;487;dce7577f44cbfeb4c822afd6b5c80507;0;4;7;FLOAT2;0,0;False;6;FLOAT2;0,0;False;8;FLOAT;1;False;9;FLOAT;0.5;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;163;-4480,-2432;Inherit;False;Distortion Noise Offset;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;476;-4096,-2352;Inherit;False;465;Parallax Offset;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;324;-4096,-2432;Inherit;False;220;Noise Base UV;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;437;-1920,-1664;Inherit;False;Signed Power Smoothstep;-1;;488;3654d4d5f7b612d4085eb90cd7a60668;3,3,2,20,1,15,0;7;2;FLOAT;0;False;4;FLOAT2;0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT4;0,0,0,0;False;12;FLOAT;1;False;17;FLOAT;0;False;18;FLOAT;1;False;1;FLOAT3;14
Node;AmplifyShaderEditor.RangedFloatNode;97;-1920,-1536;Inherit;False;Property;_RadialMaskDistortion;Radial Mask Distortion;116;0;Create;True;0;0;0;False;2;Header(Radial Mask Distortion);Space(5);False;0.05;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;611;-8832,-768;Inherit;False;FLOAT3;4;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;628;-9616,-912;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;475;-3712,-2432;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;164;-4096,-1840;Inherit;False;163;Distortion Noise Offset;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;80;-4096,-2272;Inherit;False;Property;_NoiseDistortionScale;Noise Distortion Scale;95;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;84;-4096,-2192;Inherit;False;Property;_NoiseDistortionTiling;Noise Distortion Tiling;96;0;Create;True;0;0;0;False;0;False;1.5,1,1;1,1,1;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.Vector4Node;83;-4096,-2016;Inherit;False;Property;_NoiseDistortionAnimation;Noise Distortion Animation;97;0;Create;True;0;0;0;False;0;False;0,1,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;116;-1536,-1664;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;330;-7296,-2432;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;2,2;False;1;FLOAT2;-1,-1;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StaticSwitch;625;-8576,-896;Inherit;False;Property;_SpherizeNoise;Spherize Noise;146;0;Create;True;0;0;0;False;2;Header(Spherize Noise);Space(5);False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;160;-3328,-2432;Inherit;False;Scale Tiling Offset Animation;-1;;489;650501f4d90f3194eb72a847e06cc2e3;1,21,0;6;4;FLOAT3;0,0,0;False;7;FLOAT;1;False;8;FLOAT3;1,1,1;False;9;FLOAT4;0,0,0,0;False;19;INT;0;False;12;FLOAT4;0,0,0,0;False;2;FLOAT3;0;FLOAT;15
Node;AmplifyShaderEditor.RangedFloatNode;86;-3328,-2256;Inherit;False;Property;_NoiseDistortionOctaves;Noise Distortion Octaves;100;1;[IntRange];Create;True;0;0;0;False;0;False;1;1;1;8;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;87;-3328,-2176;Inherit;False;Property;_NoiseDistortionDilation;Noise Distortion Dilation;101;0;Create;True;0;0;0;False;0;False;0.004;0.002;0;0.1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;798;-8576,-768;Inherit;False;Property;_NoiseXZTwist;Noise XZ Twist;83;0;Create;True;0;0;0;False;1;Space(5);False;0;0;-360;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;451;-1280,-1664;Inherit;False;Property;_RadialMaskDistortionEnabled;Radial Mask Distortion Enabled;117;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SwizzleNode;331;-6912,-2304;Inherit;False;FLOAT2;1;0;2;3;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;89;-2816,-2432;Inherit;False;Simplex Noise Caustics;-1;;491;477e7c249263854458b4f42934448d42;0;4;4;FLOAT3;0,0,0;False;6;FLOAT;0;False;7;FLOAT;1;False;9;FLOAT;0.01;False;2;FLOAT;0;FLOAT3;3
Node;AmplifyShaderEditor.FunctionNode;439;-2816,-2560;Inherit;False;Simplex Noise;-1;;492;c68ae2e20c00ec54aaecd9d04797372e;0;3;4;FLOAT3;0,0,0;False;6;FLOAT;0;False;7;FLOAT;1;False;2;FLOAT;0;FLOAT3;3
Node;AmplifyShaderEditor.FunctionNode;851;-8192,-768;Inherit;False;TwistXZ;-1;;493;9581222175ed3d74faf64569d7d97396;1,12,0;2;10;FLOAT3;0,0,0;False;9;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;117;-896,-1664;Inherit;False;Mask Distortion;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;329;-6656,-2432;Inherit;False;Property;_SwapUVXY1;Swap UV XY;36;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;321;True;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StaticSwitch;440;-2432,-2432;Inherit;False;Property;_NoiseDistortionDilationEnabled;Noise Distortion Dilation Enabled;102;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;88;-2432,-2304;Inherit;False;Property;_NoiseDistortionPower;Noise Distortion Power;103;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;801;-7808,-896;Inherit;False;Property;_NoiseXZTwistEnabled;Noise XZ Twist Enabled;84;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;328;-6016,-2432;Inherit;False;UV 2D Centered;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;102;-4736,2816;Inherit;False;117;Mask Distortion;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;162;-3328,-2944;Inherit;False;1;4;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;103;-1920,-2304;Inherit;False;Property;_NoiseDistortion;Noise Distortion;93;1;[Header];Create;True;0;0;0;False;2;Header(Noise Distortion);Space(5);False;0.05;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;436;-1920,-2432;Inherit;False;Signed Power Smoothstep;-1;;495;3654d4d5f7b612d4085eb90cd7a60668;3,3,2,20,1,15,0;7;2;FLOAT;0;False;4;FLOAT2;0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT4;0,0,0,0;False;12;FLOAT;1;False;17;FLOAT;0;False;18;FLOAT;1;False;1;FLOAT3;14
Node;AmplifyShaderEditor.BreakToComponentsNode;728;-7424,-896;Inherit;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.RangedFloatNode;737;-7680,-768;Inherit;False;Property;_NoiseUVYPreOffset;Noise UV Y Pre-Offset;85;0;Create;True;0;0;0;False;1;Space(5);False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;718;-6016,-2048;Inherit;False;False;True;False;True;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;161;-2688,-2944;Inherit;False;Particle Mask Radius over Lifetime;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;343;-4736,2688;Inherit;False;328;UV 2D Centered;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ComponentMaskNode;122;-4480,2816;Inherit;False;True;True;False;True;1;0;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;94;-1536,-2432;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;740;-7680,-608;Inherit;False;Property;_NoiseUVYPreScale;Noise UV Y Pre-Scale;86;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;736;-7168,-896;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;719;-5760,-2048;Inherit;False;UV 3D Y;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;99;-4096,2688;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;181;-4352,3024;Inherit;False;161;Particle Mask Radius over Lifetime;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;126;-4096,2816;Inherit;False;Property;_RadialMaskOffset;Radial Mask Offset;113;0;Create;True;0;0;0;False;0;False;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode;184;-4352,3104;Inherit;False;Property;_RadialMaskRadiusOverParticleLifetime;Radial Mask Radius over Particle Lifetime;109;0;Create;False;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;442;-1280,-2432;Inherit;False;Property;_NoiseDistortionEnabled;Noise Distortion Enabled;94;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;730;-7680,-688;Inherit;False;Property;_NoiseUVYPrePower;Noise UV Y Pre-Power;87;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;738;-6912,-896;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;690;-6016,-2688;Inherit;False;False;True;True;True;1;0;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;717;-8192,2304;Inherit;False;719;UV 3D Y;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;722;-8192,2384;Inherit;False;Property;_VerticalMask1ObjectSpaceOffset;Vertical Mask 1 Object Space Offset;136;0;Create;True;0;0;0;False;0;False;-1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;125;-3840,2688;Inherit;False;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;183;-3872,3024;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;57;-4352,3200;Inherit;False;Property;_RadialMaskFeather;Radial Mask Feather;110;0;Create;True;0;0;0;False;0;False;1;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;123;-3840,2816;Inherit;False;Property;_RadialMaskTiling;Radial Mask Tiling;112;0;Create;True;0;0;0;False;0;False;1.5,1;1,1;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode;120;-4352,2944;Inherit;False;Property;_RadialMaskRadius;Radial Mask Radius;108;0;Create;True;0;0;0;False;1;Space(10);False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;177;-5376,-464;Inherit;False;146;Particle Age Percent;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;179;-5376,-640;Inherit;False;Property;_NoiseParticleAnimation;Noise Particle Animation;72;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;73;-896,-2432;Inherit;False;Noise Distortion;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;735;-6672,-784;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;733;-6656,-896;Inherit;False;Signed Power Smoothstep;-1;;496;3654d4d5f7b612d4085eb90cd7a60668;3,3,0,20,1,15,0;7;2;FLOAT;0;False;4;FLOAT2;0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT4;0,0,0,0;False;12;FLOAT;1;False;17;FLOAT;0;False;18;FLOAT;1;False;1;FLOAT;14
Node;AmplifyShaderEditor.WireNode;734;-6672,-1040;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;691;-5760,-2688;Inherit;False;UV 2D Y;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;726;-7808,2304;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;724;-8192,2464;Inherit;False;Property;_VerticalMask1ObjectSpaceScale;Vertical Mask 1 Object Space Scale;135;0;Create;True;0;0;0;False;0;False;2;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;121;-3584,2688;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;180;-3584,2944;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;185;-3472,3056;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;19;-5376,-896;Inherit;False;Property;_NoiseOffset;Noise Offset;73;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;153;-5376,-720;Inherit;False;147;Particle Stable Random X;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;178;-4992,-640;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.DynamicAppendNode;732;-6272,-896;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;95;-6272,-688;Inherit;False;73;Noise Distortion;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;466;-6272,-768;Inherit;False;465;Parallax Offset;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;699;-7936,2176;Inherit;False;691;UV 2D Y;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;725;-7552,2304;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;53;-3200,2688;Inherit;True;Radial Gradient 2;-1;;497;969db7e12a1ad8c4c8b8d89670372700;1,12,1;3;10;FLOAT2;0,0;False;8;FLOAT;1;False;9;FLOAT;0.2;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;567;-3200,2944;Inherit;False;Property;_RadialMaskPower;Radial Mask Power;111;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;152;-4736,-896;Inherit;False;3;3;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;2;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleAddOpNode;70;-5888,-896;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;716;-7296,2176;Inherit;False;Property;_VerticalMasksObjectSpace;Vertical Masks Object Space;129;0;Create;True;0;0;0;False;2;Header(Vertical Masks);Space(5);False;0;1;1;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;345;-7296,2384;Inherit;False;Property;_VerticalMask1RemapMin;Vertical Mask 1 Remap Min;133;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;346;-7296,2464;Inherit;False;Property;_VerticalMask1RemapMax;Vertical Mask 1 Remap Max;134;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;347;-7296,2304;Inherit;False;Property;_VerticalMask1Power;Vertical Mask 1 Power;132;0;Create;True;0;0;0;False;2;;Space(5);False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;746;-8192,2688;Inherit;False;719;UV 3D Y;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;747;-8192,2768;Inherit;False;Property;_VerticalMask2ObjectSpaceOffset;Vertical Mask 2 Object Space Offset;143;0;Create;True;0;0;0;False;0;False;-1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;566;-2816,2688;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;175;-4480,-896;Inherit;False;Noise Offset;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;173;-5760,-896;Inherit;False;Noise UV;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;749;-7808,2688;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;748;-8192,2848;Inherit;False;Property;_VerticalMask2ObjectSpaceScale;Vertical Mask 2 Object Space Scale;142;0;Create;True;0;0;0;False;0;False;2;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;862;-6784,2176;Inherit;True;Power Smoothstep;-1;;500;eaa8bfb6a4986cb418a1675cea297eed;1,24,1;4;20;FLOAT;1;False;4;FLOAT;1;False;7;FLOAT;0;False;23;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;55;-2560,2688;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;18;-4096,-512;Inherit;False;Property;_NoiseAnimation;Noise Animation;71;0;Create;True;0;0;0;False;0;False;0,4,1,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector3Node;72;-4096,-688;Inherit;False;Property;_NoiseTiling;Noise Tiling;70;0;Create;True;0;0;0;False;0;False;1.5,1,1;1,1,1;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;176;-4096,-336;Inherit;False;175;Noise Offset;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;174;-4096,-896;Inherit;False;173;Noise UV;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;16;-4096,-768;Inherit;False;Property;_NoiseScale;Noise Scale;69;0;Create;True;0;0;0;False;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;742;-6400,2304;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;750;-7936,2560;Inherit;False;691;UV 2D Y;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;751;-7552,2688;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;601;-2304,2688;Inherit;False;Property;_RadialMask;Radial Mask;106;0;Create;True;0;0;0;False;2;Header(Radial Mask);Space(5);False;0;1;1;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;13;-3328,-720;Inherit;False;Property;_NoiseOctaves;Noise Octaves;74;1;[IntRange];Create;True;0;0;0;False;0;False;1;1;1;8;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;14;-3328,-640;Inherit;False;Property;_NoiseDilation;Noise Dilation;75;0;Create;True;0;0;0;False;0;False;0.004;0.002;0;0.1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;159;-3328,-896;Inherit;False;Scale Tiling Offset Animation;-1;;501;650501f4d90f3194eb72a847e06cc2e3;1,21,0;6;4;FLOAT3;0,0,0;False;7;FLOAT;1;False;8;FLOAT3;1,1,1;False;9;FLOAT4;0,0,0,0;False;19;INT;0;False;12;FLOAT4;0,0,0,0;False;2;FLOAT3;0;FLOAT;15
Node;AmplifyShaderEditor.RangedFloatNode;485;-3328,-2768;Inherit;False;Property;_ParticleSubtractNoiseoverLifetime;Particle Subtract Noise over Lifetime;43;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;713;-6144,2176;Inherit;False;Property;_VerticalMask1Subtractive;Vertical Mask 1 Subtractive;131;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;754;-7296,2688;Inherit;False;Property;_VerticalMask2Power;Vertical Mask 2 Power;139;0;Create;True;0;0;0;False;2;;Space(5);False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;752;-7296,2768;Inherit;False;Property;_VerticalMask2RemapMin;Vertical Mask 2 Remap Min;140;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;753;-7296,2848;Inherit;False;Property;_VerticalMask2RemapMax;Vertical Mask 2 Remap Max;141;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;767;-7296,2560;Inherit;False;Property;_VerticalMaskObjectSpace1;Vertical Mask Object Space;129;0;Create;True;0;0;0;False;1;Space(5);False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;716;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;227;-2048,2688;Inherit;False;Radial Mask;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;24;-2816,-896;Inherit;False;Simplex Noise Caustics;-1;;503;477e7c249263854458b4f42934448d42;0;4;4;FLOAT3;0,0,0;False;6;FLOAT;0;False;7;FLOAT;1;False;9;FLOAT;0.01;False;2;FLOAT;0;FLOAT3;3
Node;AmplifyShaderEditor.FunctionNode;445;-2816,-1024;Inherit;False;Simplex Noise;-1;;504;c68ae2e20c00ec54aaecd9d04797372e;0;3;4;FLOAT3;0,0,0;False;6;FLOAT;0;False;7;FLOAT;1;False;2;FLOAT;0;FLOAT3;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;484;-2944,-2816;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;350;-5760,2176;Inherit;False;Vertical Mask 1;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;863;-6784,2560;Inherit;True;Power Smoothstep;-1;;505;eaa8bfb6a4986cb418a1675cea297eed;1,24,1;4;20;FLOAT;1;False;4;FLOAT;1;False;7;FLOAT;0;False;23;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;187;-7552,128;Inherit;False;Property;_DepthFade;Depth Fade;158;0;Create;True;0;0;0;False;2;Header(Depth Fade);Space(5);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;684;-5120,4224;Inherit;False;227;Radial Mask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;444;-2432,-896;Inherit;False;Property;_NoiseDilationEnabled;Noise Dilation Enabled;76;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;22;-2432,-768;Inherit;False;Property;_NoisePower;Noise Power;77;0;Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;565;-2432,-592;Inherit;False;Property;_NoiseRemapMax;Noise Remap Max;79;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;564;-2432,-672;Inherit;False;Property;_NoiseRemapMin;Noise Remap Min;78;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.DepthFade;186;-7152,128;Inherit;False;True;True;True;2;1;FLOAT3;0,0,0;False;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;480;-2688,-2864;Inherit;False;Particle Subtract Noise over Lifetime;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;757;-6400,2688;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;210;-7552,384;Inherit;False;Property;_SubtractiveDepthFade;Subtractive Depth Fade;161;0;Create;True;0;0;0;False;1;Space(5);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;704;-5120,4352;Inherit;False;350;Vertical Mask 1;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;942;-4608,4224;Inherit;False;Property;_RadialMaskSubtractive;Radial Mask Subtractive;107;0;Create;True;0;0;0;False;0;False;0;1;1;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;479;-1920,-736;Inherit;False;480;Particle Subtract Noise over Lifetime;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;219;-6800,-16;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DepthFade;208;-7152,384;Inherit;False;True;True;True;2;1;FLOAT3;0,0,0;False;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;217;-6784,128;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;864;-1920,-896;Inherit;False;Power Smoothstep;-1;;574;eaa8bfb6a4986cb418a1675cea297eed;1,24,0;4;20;FLOAT;1;False;4;FLOAT;1;False;7;FLOAT;0;False;23;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;758;-6144,2560;Inherit;False;Property;_VerticalMask2Subtractive;Vertical Mask 2 Subtractive;138;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;703;-4864,4352;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldPosInputsNode;1081;-9984,4864;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldPosInputsNode;1126;-9984,6656;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;1085;-9984,5120;Inherit;False;Property;_MainLightShadowWorldNoise;Main Light Shadow World Noise;12;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1089;-9984,5200;Inherit;False;Property;_MainLightShadowDirectionalNoise;Main Light Shadow Directional Noise;13;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1123;-9984,5280;Inherit;False;Property;_MainLightShadowOrthogonalAlignmentWorldNoise;Main Light Shadow Orthogonal Alignment World Noise;14;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1110;-9984,5360;Inherit;False;Property;_MainLightShadowDirectionalAlignmentNoise;Main Light Shadow Directional Alignment Noise;15;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;1115;-9984,5488;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldToTangentMatrix;1088;-9984,5648;Inherit;False;0;1;FLOAT3x3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1150;-9984,5024;Inherit;False;1254;Screen Position;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;1148;-9984,6800;Inherit;False;1254;Screen Position;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;1129;-9984,6960;Inherit;False;Property;_AdditionalLightsShadowWorldNoise;Additional Lights Shadow World Noise;26;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1130;-9984,7040;Inherit;False;Property;_AdditionalLightsShadowDirectionalNoise;Additional Lights Shadow Directional Noise;27;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1131;-9984,7120;Inherit;False;Property;_AdditionalLightsShadowOrthogonalAlignmentWorldNoise;Additional Lights Shadow Orthogonal Alignment World Noise;28;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1132;-9984,7200;Inherit;False;Property;_AdditionalLightsShadowDirectionalAlignmentNoise;Additional Lights Shadow Directional Alignment Noise;29;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1255;-9984,6880;Inherit;False;1145;Screen UV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.WorldNormalVector;1133;-9984,7280;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldToTangentMatrix;1134;-9984,7440;Inherit;False;0;1;FLOAT3x3;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;478;-1536,-896;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;218;-6528,0;Inherit;False;Property;_InvertDepthFade;Invert Depth Fade;160;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;190;-7152,256;Inherit;False;Property;_DepthFadePower;Depth Fade Power;159;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;211;-6784,384;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;209;-7152,512;Inherit;False;Property;_SubtractiveDepthFadePower;Subtractive Depth Fade Power;162;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;193;-7168,720;Inherit;False;Property;_CameraDepthFadeOffset;Camera Depth Fade Offset;164;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;192;-7168,640;Inherit;False;Property;_CameraDepthFadeLength;Camera Depth Fade Length;163;0;Create;True;0;0;0;False;2;Header(Camera Depth Fade);Space(5);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;759;-5760,2560;Inherit;False;Vertical Mask 2;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;709;-4608,4352;Inherit;False;Property;_Keyword2;Keyword 2;131;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;713;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;980;-9344,5424;Inherit;False;Property;_MainLightTransparencyShadow;Main Light Transparency Shadow;17;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;996;-9344,7168;Inherit;False;Property;_AdditionalLightsTransparencyShadow;Additional Lights Transparency Shadow;31;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.CustomExpressionNode;1125;-9344,6656;Inherit;False;GetMainLightShadow_float;7;File;10;True;position;FLOAT3;0,0,0;In;;Inherit;False;True;screenPosition;FLOAT2;0,0;In;;Inherit;False;True;screenUV;FLOAT2;0,0;In;;Inherit;False;True;worldNoise;FLOAT;0;In;;Inherit;False;True;lightDirectionNoise;FLOAT;0;In;;Inherit;False;True;lightDirectionOrthogonalAlignmentNoise;FLOAT;0;In;;Inherit;False;True;lightDirectionAlignmentNoise;FLOAT;0;In;;Inherit;False;True;normal;FLOAT3;0,0,0;In;;Inherit;False;True;worldToTangentMatrix;FLOAT3x3;1,0,0,1,1,1,1,0,1;In;;Inherit;False;True;output;FLOAT;0;Out;;Inherit;False;GetAdditionalLightsShadow_float;False;False;0;3e9fef90fa1fa8d4091eea0baa50ed09;False;11;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT3;0,0,0;False;9;FLOAT3x3;1,0,0,1,1,1,1,0,1;False;10;FLOAT;0;False;2;FLOAT;0;FLOAT;11
Node;AmplifyShaderEditor.CustomExpressionNode;1080;-9344,4992;Inherit;False;GetMainLightShadow_float;7;File;9;True;position;FLOAT3;0,0,0;In;;Inherit;False;True;screenPosition;FLOAT2;0,0;In;;Inherit;False;True;worldNoise;FLOAT;0;In;;Inherit;False;True;lightDirectionNoise;FLOAT;0;In;;Inherit;False;True;lightDirectionOrthogonalAlignmentNoise;FLOAT;0;In;;Inherit;False;True;lightDirectionAlignmentNoise;FLOAT;0;In;;Inherit;False;True;normal;FLOAT3;0,0,0;In;;Inherit;False;True;worldToTangentMatrix;FLOAT3x3;1,0,0,1,1,1,1,0,1;In;;Inherit;False;True;output;FLOAT;0;Out;;Inherit;False;GetMainLightShadow_float;False;False;0;3e9fef90fa1fa8d4091eea0baa50ed09;False;10;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;2;FLOAT2;0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT3;0,0,0;False;8;FLOAT3x3;1,0,0,1,1,1,1,0,1;False;9;FLOAT;0;False;2;FLOAT;0;FLOAT;10
Node;AmplifyShaderEditor.WireNode;571;-1040,-912;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;570;-1280,-640;Inherit;False;Property;_Noise;Noise;68;0;Create;True;0;0;0;False;2;Header(Noise);Space(5);False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.CameraDepthFade;191;-6784,640;Inherit;False;3;2;FLOAT3;0,0,0;False;0;FLOAT;1;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;866;-6144,384;Inherit;False;Power Smoothstep;-1;;575;eaa8bfb6a4986cb418a1675cea297eed;1,24,0;4;20;FLOAT;1;False;4;FLOAT;1;False;7;FLOAT;0;False;23;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;865;-6144,128;Inherit;False;Power Smoothstep;-1;;576;eaa8bfb6a4986cb418a1675cea297eed;1,24,0;4;20;FLOAT;1;False;4;FLOAT;1;False;7;FLOAT;0;False;23;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1007;-7552,1024;Inherit;False;Property;_IntersectionHighlight;Intersection Highlight;168;0;Create;True;0;0;0;False;2;Header(Intersection Highlight);Space(5);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;235;-4352,3456;Inherit;False;Property;_FresnelMaskPower;Fresnel Mask Power;153;0;Create;True;0;0;0;False;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;762;-5120,4480;Inherit;False;759;Vertical Mask 2;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;741;-4224,4224;Inherit;False;Property;_VerticalMask1;Vertical Mask 1;130;0;Create;True;0;0;0;False;2;Header(Vertical Mask 1);Space(5);False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;984;-8832,5376;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;993;-8832,7040;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;569;-892.5645,-770.2216;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;214;-5760,128;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;196;-6784,768;Inherit;False;Property;_CameraDepthFadePower;Camera Depth Fade Power;165;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;568;-6528,640;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DepthFade;1005;-7168,1024;Inherit;False;True;True;True;2;1;FLOAT3;0,0,0;False;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;232;-3968,3456;Inherit;True;Standard;WorldNormal;ViewDir;False;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;236;-3968,3712;Inherit;False;Property;_FresnelMaskRemapMin;Fresnel Mask Remap Min;154;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;237;-3968,3792;Inherit;False;Property;_FresnelMaskRemapMax;Fresnel Mask Remap Max;155;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;761;-4736,4480;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;981;-8576,5376;Inherit;False;Main Light Transparency Shadow;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;994;-8576,7040;Inherit;False;Additional Lights Transparency Shadow;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;11;-640,-896;Inherit;False;Noise;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;216;-5600,128;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;868;-6144,640;Inherit;False;Power Smoothstep;-1;;577;eaa8bfb6a4986cb418a1675cea297eed;1,24,0;4;20;FLOAT;1;False;4;FLOAT;1;False;7;FLOAT;0;False;23;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;1006;-6912,1024;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1010;-7168,1152;Inherit;False;Property;_IntersectionHighlightPower;Intersection Highlight Power;170;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1016;-7168,1280;Inherit;False;Property;_IntersectionHighlightRemapMin;Intersection Highlight Remap Min;171;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1017;-7168,1360;Inherit;False;Property;_IntersectionHighlightRemapMax;Intersection Highlight Remap Max;172;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;234;-3456,3456;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;243;-3456,3584;Inherit;False;Property;_FresnelMask;Fresnel Mask;152;0;Create;True;0;0;0;False;2;Header(Fresnel Mask);Space(5);False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;760;-4608,4480;Inherit;False;Property;_Keyword5;Keyword 2;138;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;758;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1078;-4608,4608;Inherit;False;Constant;_Float1;Float 1;209;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1047;-4608,4736;Inherit;False;981;Main Light Transparency Shadow;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1046;-4608,4816;Inherit;False;994;Additional Lights Transparency Shadow;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;1064;-3504,4816;Inherit;False;392.6667;131.3335;Adjust amount of intersection highlight shadow masking.;1;1063;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;195;-5760,640;Inherit;False;Camera Depth Fade;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;188;-5376,128;Inherit;False;Depth Fade;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1008;-6656,1024;Inherit;False;Power Smoothstep;-1;;578;eaa8bfb6a4986cb418a1675cea297eed;1,24,0;4;20;FLOAT;1;False;4;FLOAT;1;False;7;FLOAT;0;False;23;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;242;-3072,3584;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;41;-4224,3968;Inherit;False;11;Noise;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;766;-4224,4352;Inherit;False;Property;_VerticalMask2;Vertical Mask 2;137;0;Create;True;0;0;0;False;2;Header(Vertical Mask 2);Space(5);False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;313;-4608,6448;Inherit;False;146;Particle Age Percent;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;314;-4608,6272;Inherit;False;Property;_VertexNoiseParticleAnimation;Vertex Noise Particle Animation;206;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;1019;-3200,2080;Inherit;False;Property;_IntersectionHighlightColour;Intersection Highlight Colour;174;0;Create;True;0;0;0;False;2;Header(Intersection Highlight Colour);Space(5);False;1,1,1,1;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.StaticSwitch;1076;-4224,4608;Inherit;False;Property;_MainLightTransparencyShadowEnabled1;Main Light Transparency Shadow Enabled;16;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;985;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;1077;-4224,4736;Inherit;False;Property;_AdditionalLightsTransparencyShadowEnabled1;Additional Lights Transparency Shadow Enabled;30;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;998;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1011;-6144,1024;Inherit;False;Intersection Highlight;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.VertexColorNode;142;-3456,4128;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;199;-3456,4384;Inherit;False;195;Camera Depth Fade;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;128;-3456,4480;Inherit;False;Property;_Alpha;Alpha;54;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;56;-3712,3968;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;233;-2816,3456;Inherit;False;Fresnel Mask;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;197;-3456,4304;Inherit;False;188;Depth Fade;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;300;-4608,6016;Inherit;False;Property;_VertexNoiseOffset;Vertex Noise Offset;207;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;310;-4608,6192;Inherit;False;147;Particle Stable Random X;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;315;-4224,6272;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1024;-3200,2432;Inherit;False;Intersection Highlight Alpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1054;-3456,4608;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1063;-3456,4864;Inherit;False;Property;_IntersectionHighlightShadowMaskPower;Intersection Highlight Shadow Mask Power;173;0;Create;True;0;0;0;False;0;False;1;1;0.01;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;200;-2960,4336;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;239;-3456,4048;Inherit;False;233;Fresnel Mask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;143;-3200,4128;Inherit;False;False;False;False;True;1;0;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;240;-2960,4464;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;58;-3456,3968;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;701;-2960,4208;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;641;-4480,7040;Inherit;False;327;UV 2D;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;309;-3968,6016;Inherit;False;3;3;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;2;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.PowerNode;1061;-2816,4608;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1028;-2816,4304;Inherit;False;1024;Intersection Highlight Alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1027;-2816,4224;Inherit;False;1011;Intersection Highlight;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;127;-2816,3968;Inherit;False;6;6;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;642;-4288,7040;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;2,1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;588;-4480,6656;Inherit;False;327;UV 2D;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;606;-3840,5840;Inherit;False;622;UV 3D World;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;311;-3840,6016;Inherit;False;Vertex Noise Offset;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;452;-3840,5760;Inherit;False;340;UV 3D;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1029;-2432,4224;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;944;-2176,4096;Inherit;False;227;Radial Mask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1012;-2176,3968;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TauNode;284;-4480,5728;Inherit;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;276;-4480,5632;Inherit;False;Property;_VertexWaveOffset;Vertex Wave Offset;198;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;260;-4480,5536;Inherit;False;Property;_VertexWaveAnimation;Vertex Wave Animation;197;0;Create;True;0;0;0;False;0;False;4;4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;335;-4480,5248;Inherit;False;327;UV 2D;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;643;-4096,7040;Inherit;False;2;0;FLOAT2;0,0;False;1;FLOAT2;1,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;590;-4288,6656;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;2,1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StaticSwitch;605;-3584,5760;Inherit;False;Property;_WorldSpaceUVs2;World Space UVs;37;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;356;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Vector3Node;296;-3584,6144;Inherit;False;Property;_VertexNoiseTiling;Vertex Noise Tiling;204;0;Create;True;0;0;0;False;0;False;1,1,1;1,1,1;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.Vector4Node;295;-3584,6304;Inherit;False;Property;_VertexNoiseAnimation;Vertex Noise Animation;205;0;Create;True;0;0;0;False;0;False;0,2,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;312;-3584,6496;Inherit;False;311;Vertex Noise Offset;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;294;-3584,6016;Inherit;False;Property;_VertexNoiseScale;Vertex Noise Scale;203;0;Create;True;0;0;0;False;1;Space(5);False;2;4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;305;-7296,3280;Inherit;False;Property;_VertexWaveNoiseVerticalMaskRemapMin;Vertex Wave-Noise Vertical Mask Remap Min;216;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;306;-7296,3360;Inherit;False;Property;_VertexWaveNoiseVerticalMaskRemapMax;Vertex Wave-Noise Vertical Mask Remap Max;217;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;279;-7296,3200;Inherit;False;Property;_VertexWaveNoiseVerticalMaskPower;Vertex Wave-Noise Vertical Mask Power;215;0;Create;True;0;0;0;False;2;Header(Vertex Wave Noise Vertical Mask);Space(5);False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;700;-7296,3072;Inherit;False;691;UV 2D Y;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;948;-1920,4096;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;1030;-1920,3968;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TauNode;595;-4480,5376;Inherit;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;254;-4480,5456;Inherit;False;Property;_VertexWaveScale;Vertex Wave Scale;196;0;Create;True;0;0;0;False;0;False;2;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;336;-4224,5248;Inherit;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;285;-4096,5632;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;258;-4096,5504;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;644;-3840,7040;Inherit;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.SimpleSubtractOpNode;591;-4096,6656;Inherit;False;2;0;FLOAT2;0,0;False;1;FLOAT2;1,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;292;-3072,5888;Inherit;False;Scale Tiling Offset Animation;-1;;579;650501f4d90f3194eb72a847e06cc2e3;1,21,0;6;4;FLOAT3;0,0,0;False;7;FLOAT;1;False;8;FLOAT3;1,1,1;False;9;FLOAT4;0,0,0,0;False;19;INT;0;False;12;FLOAT4;0,0,0,0;False;2;FLOAT3;0;FLOAT;15
Node;AmplifyShaderEditor.RangedFloatNode;858;-3072,6064;Inherit;False;Property;_VertexNoiseOctaves;Vertex Noise Octaves;208;1;[IntRange];Create;True;0;0;0;False;0;False;1;0;1;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;303;-3072,6144;Inherit;False;Property;_VertexNoiseDilation;Vertex Noise Dilation;209;0;Create;True;0;0;0;False;1;Space(5);False;0;0;-0.2;0.2;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;867;-6784,3072;Inherit;True;Power Smoothstep;-1;;581;eaa8bfb6a4986cb418a1675cea297eed;1,24,0;4;20;FLOAT;1;False;4;FLOAT;1;False;7;FLOAT;0;False;23;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;945;-1664,3952;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;1033;-1680,4048;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;251;-3968,5248;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;16.13;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;583;-3840,5504;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;587;-3840,6656;Inherit;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.RangedFloatNode;662;-4096,7296;Inherit;False;Property;_VertexUVOffsetBottomPower;Vertex UV Offset Bottom Power;183;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;661;-4096,6912;Inherit;False;Property;_VertexUVOffsetTopPower;Vertex UV Offset Top Power;181;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;657;-3584,7168;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;302;-2688,5888;Inherit;False;Simplex Noise Caustics;-1;;582;477e7c249263854458b4f42934448d42;0;4;4;FLOAT3;0,0,0;False;6;FLOAT;0;False;7;FLOAT;1;False;9;FLOAT;0.01;False;2;FLOAT;0;FLOAT3;3
Node;AmplifyShaderEditor.FunctionNode;489;-2688,5760;Inherit;False;Simplex Noise;-1;;583;c68ae2e20c00ec54aaecd9d04797372e;0;3;4;FLOAT3;0,0,0;False;6;FLOAT;0;False;7;FLOAT;1;False;2;FLOAT;0;FLOAT3;3
Node;AmplifyShaderEditor.RegisterLocalVarNode;280;-6400,3072;Inherit;False;Vertex WaveNoise Vertical Mask;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;353;-2176,4224;Inherit;False;350;Vertical Mask 1;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;943;-1408,3968;Inherit;False;Property;_Keyword8;Keyword 2;107;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;942;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;584;-3584,5248;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;646;-3328,7168;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;597;-3328,6784;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;660;-3328,6912;Inherit;False;Property;_VertexUVOffsetTop;Vertex UV Offset Top;180;0;Create;True;0;0;0;True;2;Header(Vertex UV Offset);Space(5);False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;490;-2304,5888;Inherit;False;Property;_VertexNoiseDilationEnabled;Vertex Noise Dilation Enabled;210;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;789;-2304,6016;Inherit;False;Property;_VertexNoiseTwist;Vertex Noise Twist;211;0;Create;True;0;0;0;False;1;Space(5);False;0;0;-180;180;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;694;-3712,10240;Inherit;False;691;UV 2D Y;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;894;-3584,7552;Inherit;False;691;UV 2D Y;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;663;-3328,7296;Inherit;False;Property;_VertexUVOffsetBottom;Vertex UV Offset Bottom;182;0;Create;True;0;0;0;True;2;;Space(5);False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;712;-1664,4224;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;249;-3328,5248;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;281;-3328,5456;Inherit;False;280;Vertex WaveNoise Vertical Mask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;267;-3328,5376;Inherit;False;Property;_VertexWave;Vertex Wave;194;0;Create;True;0;0;0;False;2;Header(Vertex Wave);Space(5);False;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;648;-3072,7040;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;649;-2944,7296;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;574;-3072,6656;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;604;-2944,6912;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;852;-1792,6016;Inherit;False;TwistXZ;-1;;584;9581222175ed3d74faf64569d7d97396;1,12,0;2;10;FLOAT3;0,0,0;False;9;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;679;-3712,10368;Inherit;False;Property;_VertexNormalOffsetBottomPower;Vertex Normal Offset Bottom Power;190;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;682;-3456,10240;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;693;-3712,9728;Inherit;False;691;UV 2D Y;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;668;-3712,9856;Inherit;False;Property;_VertexNormalOffsetTopPower;Vertex Normal Offset Top Power;188;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PiNode;895;-3328,7552;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;711;-1408,4224;Inherit;False;Property;_Keyword3;Keyword 2;131;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;713;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;266;-2944,5248;Inherit;False;3;3;0;FLOAT;1;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalVertexDataNode;264;-2944,5376;Inherit;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;650;-2688,7040;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;576;-2688,6656;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;290;-1408,6144;Inherit;False;Property;_VertexNoise;Vertex Noise;201;0;Create;True;0;0;0;False;2;Header(Vertex Noise);Space(5);False;0.02;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;297;-1408,6224;Inherit;False;280;Vertex WaveNoise Vertical Mask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;856;-1168,6000;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalVertexDataNode;244;-3712,9472;Inherit;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.NormalVertexDataNode;666;-3712,9984;Inherit;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.NormalVertexDataNode;677;-3712,10496;Inherit;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;681;-3712,10656;Inherit;False;Property;_VertexNormalOffsetBottom;Vertex Normal Offset Bottom;189;0;Create;True;0;0;0;False;1;Space(5);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;669;-3200,9728;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;680;-3200,10240;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;246;-3712,9616;Inherit;False;Property;_VertexNormalOffset;Vertex Normal Offset;186;0;Create;True;0;0;0;False;2;Header(Vertex Normal Offset);Space(5);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;667;-3712,10144;Inherit;False;Property;_VertexNormalOffsetTop;Vertex Normal Offset Top;187;0;Create;True;0;0;0;False;1;Space(5);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;896;-3072,7552;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;765;-2176,4352;Inherit;False;759;Vertical Mask 2;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;744;-896,4224;Inherit;False;Property;_Keyword4;Keyword 2;130;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;741;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;282;-2688,5248;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;594;-2432,6784;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;575;-2432,6656;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;652;-2432,7168;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;653;-2432,7040;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;289;-896,5888;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;245;-3200,9472;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;676;-2944,10368;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;665;-2944,9856;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;897;-2944,7552;Inherit;False;UV 2D Circular Y;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;764;-1664,4352;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;448;-2432,5248;Inherit;False;Property;_VertexWaveEnabled;Vertex Wave Enabled;195;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;593;-2176,6656;Inherit;False;Property;_Keyword0;Keyword 0;36;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;321;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;654;-2176,7040;Inherit;False;Property;_Keyword1;Keyword 0;36;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;321;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;450;-640,5888;Inherit;False;Property;_VertexNoiseEnabled;Vertex Noise Enabled;202;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;674;-2560,9856;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Vector3Node;633;-3712,7808;Inherit;False;Property;_VertexOffsetOverY1;Vertex Offset over Y 1;220;0;Create;False;0;0;0;False;2;Header(Vertex Offset over Y);Space(5);False;0,0,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;631;-3712,8192;Inherit;False;Property;_VertexOffsetOverY1Power;Vertex Offset over Y 1 Power;221;0;Create;False;0;0;0;False;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;692;-3712,8064;Inherit;False;691;UV 2D Y;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;899;-3712,8576;Inherit;False;691;UV 2D Y;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;902;-3712,9088;Inherit;False;897;UV 2D Circular Y;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;775;-3712,8704;Inherit;False;Property;_VertexOffsetOverY2Power;Vertex Offset over Y 2 Power;223;0;Create;False;0;0;0;False;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;777;-3712,8320;Inherit;False;Property;_VertexOffsetOverY2;Vertex Offset over Y 2;222;0;Create;False;0;0;0;False;1;Space(5);False;0,0,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;886;-3712,9216;Inherit;False;Property;_VertexOffsetOverCircularYPower;Vertex Offset over Circular Y Power;225;0;Create;False;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;763;-1408,4352;Inherit;False;Property;_Keyword6;Keyword 2;138;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;758;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;889;-3712,8832;Inherit;False;Property;_VertexOffsetOverCircularY;Vertex Offset over Circular Y;224;0;Create;False;0;0;0;False;2;Header(Vertex Offset over Circular Y);Space(5);False;0,0,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RegisterLocalVarNode;265;-2048,5248;Inherit;False;Vertex Sine;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;579;-1664,6656;Inherit;False;Vertex Offset Top;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;655;-1664,7040;Inherit;False;Vertex Offset Bottom;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;298;-256,5888;Inherit;False;Vertex Noise;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;670;-2304,9856;Inherit;False;Vertex Normal Offset;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TransformDirectionNode;636;-3328,7808;Inherit;False;World;Object;False;Fast;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.PowerNode;632;-3200,8064;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TransformDirectionNode;780;-3328,8320;Inherit;False;World;Object;False;Fast;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.PowerNode;776;-3328,8576;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;888;-3328,9088;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;768;-896,4352;Inherit;False;Property;_Keyword7;Keyword 2;137;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;766;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;983;-896,4480;Inherit;False;981;Main Light Transparency Shadow;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;671;-3712,10880;Inherit;False;670;Vertex Normal Offset;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;268;-3712,10960;Inherit;False;265;Vertex Sine;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;299;-3712,11040;Inherit;False;298;Vertex Noise;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;580;-3712,11120;Inherit;False;579;Vertex Offset Top;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;638;-2944,7936;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;893;-2944,8960;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;782;-2944,8448;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;656;-3712,11200;Inherit;False;655;Vertex Offset Bottom;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;986;-288,4032;Inherit;False;1275.315;190.7114;Separate from Lighting Enabled.;2;998;985;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;982;-512,4352;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;269;-3200,10880;Inherit;False;5;5;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;785;-2560,8448;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;818;-3200,11136;Inherit;False;Property;_VertexTwist;Vertex Twist;192;0;Create;True;0;0;0;False;2;Header(Vertex Twist);Space(5);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PosVertexDataNode;816;-3200,11232;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;1000;-256,4352;Inherit;False;994;Additional Lights Transparency Shadow;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;819;-2944,10880;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;639;-2304,8448;Inherit;False;Vertex Offset over Y;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NegateNode;854;-2944,11136;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;985;-256,4096;Inherit;False;Property;_MainLightTransparencyShadowEnabled;Main Light Transparency Shadow Enabled;16;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;999;256,4352;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;640;-2688,11008;Inherit;False;639;Vertex Offset over Y;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;853;-2688,10880;Inherit;False;TwistXZ;-1;;586;9581222175ed3d74faf64569d7d97396;1,12,0;2;10;FLOAT3;0,0,0;False;9;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;857;-2304,10880;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;998;512,4096;Inherit;False;Property;_AdditionalLightsTransparencyShadowEnabled;Additional Lights Transparency Shadow Enabled;30;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;1187;-8242,3022;Inherit;False;868;521.6667;Unsed.;6;1102;1103;1104;1106;1109;1105;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1186;-10032,3024;Inherit;False;964;433.3333;Unsed.;6;1100;1108;1098;1099;1101;1107;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;49;1152,4096;Inherit;False;Alpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;247;-2048,10880;Inherit;False;Vertex Offset;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldToObjectMatrix;1269;-9648,7344;Inherit;False;0;1;FLOAT4x4;0
Node;AmplifyShaderEditor.SamplerNode;557;-1920,-3328;Inherit;True;Property;_Texture;Texture;33;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RegisterLocalVarNode;560;-1408,-3248;Inherit;False;Texture A;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;562;-1536,-640;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;558;-1280,-768;Inherit;False;Property;_TextureEnabled;Texture Enabled;34;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;510;-2432,-1152;Inherit;False;Property;_NoiseDilationEnabled1;Noise Dilation Enabled;32;0;Create;True;0;0;0;False;0;False;0;1;1;True;;Toggle;2;Key0;Key1;Reference;444;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;509;-1920,-1152;Inherit;False;Signed Power Smoothstep;-1;;588;3654d4d5f7b612d4085eb90cd7a60668;3,3,2,20,1,15,1;7;2;FLOAT;0;False;4;FLOAT2;0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT4;0,0,0,0;False;12;FLOAT;1;False;17;FLOAT;0;False;18;FLOAT;1;False;1;FLOAT3;14
Node;AmplifyShaderEditor.RegisterLocalVarNode;511;-1280,-1152;Inherit;False;Noise Gradient;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;559;-1408,-3328;Inherit;False;Texture R;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;36;-3840,192;Inherit;False;Colour RGB x A;-1;;589;034d6205f93eb7e4f9100dabf18de7c4;0;1;22;COLOR;1,1,1,0.5019608;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;37;-3840,0;Inherit;False;Colour RGB x A;-1;;590;034d6205f93eb7e4f9100dabf18de7c4;0;1;22;COLOR;1,1,1,0.5019608;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;31;-3328,0;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;30;-4096,192;Inherit;False;Property;_ColourB;Colour B;49;1;[HDR];Create;True;0;0;0;False;0;False;1,0.02745098,0,1;1,1,1,1;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.GetLocalVarNode;43;-3840,304;Inherit;False;42;Colour Power;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;29;-4096,0;Inherit;False;Property;_ColourA;Colour A;48;2;[HDR];[Header];Create;True;0;0;0;False;2;Header(Colour);Space(5);False;1,0.1254902,0,1;1,1,1,1;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.HSVToRGBNode;132;-2304,0;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.StaticSwitch;392;-1664,0;Inherit;False;Property;_VerticalColour;Vertical Colour;57;0;Create;True;0;0;0;False;2;Header(Vertical Colour);Space(5);False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;370;-1920,256;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;44;-2944,-256;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;35;-3200,-176;Inherit;False;Property;_ColourPower;Colour Power;50;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;33;-3200,-256;Inherit;False;11;Noise;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;42;-2688,-256;Inherit;False;Colour Power;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;385;-3840,704;Inherit;False;Colour RGB x A;-1;;591;034d6205f93eb7e4f9100dabf18de7c4;0;1;22;COLOR;1,1,1,0.5019608;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;386;-3840,512;Inherit;False;Colour RGB x A;-1;;592;034d6205f93eb7e4f9100dabf18de7c4;0;1;22;COLOR;1,1,1,0.5019608;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;387;-3328,512;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;389;-4096,704;Inherit;False;Property;_VerticalColourB;Vertical Colour B;59;1;[HDR];Create;True;0;0;0;False;0;False;0,0,1,1;1,1,1,1;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleAddOpNode;398;-2688,512;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;399;-2688,640;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;400;-2688,768;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;391;-2304,672;Inherit;False;369;Vertical Colour Mask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;395;-3072,672;Inherit;False;Property;_VerticalColourHueShift;Vertical Colour Hue Shift;60;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;396;-3072,768;Inherit;False;Property;_VerticalColourSaturationShift;Vertical Colour Saturation Shift;61;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;397;-3072,864;Inherit;False;Property;_VerticalColourValueMultiplier;Vertical Colour Value Multiplier;62;0;Create;True;0;0;0;False;0;False;5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;388;-4096,512;Inherit;False;Property;_VerticalColourA;Vertical Colour A;58;2;[HDR];[Header];Create;True;0;0;0;False;0;False;0,0.5019608,1,1;1,1,1,1;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.GetLocalVarNode;390;-3840,816;Inherit;False;42;Colour Power;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;248;-1664,672;Inherit;False;247;Vertex Offset;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;301;-1664,768;Inherit;False;Property;_Tessellation;Tessellation;227;0;Create;True;0;0;0;True;2;Header(Tessellation);Space(5);False;1;0;1;64;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;771;-7680,-512;Inherit;False;Property;_NoiseUVYPreRemapMin;Noise UV Y Pre-Remap Min;89;0;Create;True;0;0;0;False;0;False;0;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;773;-7680,-432;Inherit;False;Property;_NoiseUVYPreRemapMax;Noise UV Y Pre-Remap Max;90;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;770;-6656,-512;Inherit;False;Property;_NoiseUVPreRemap;Noise UV Pre-Remap;88;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;769;-7040,-512;Inherit;False;Signed Power Smoothstep;-1;;593;3654d4d5f7b612d4085eb90cd7a60668;3,3,0,20,1,15,1;7;2;FLOAT;0;False;4;FLOAT2;0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT4;0,0,0,0;False;12;FLOAT;1;False;17;FLOAT;0;False;18;FLOAT;1;False;1;FLOAT;14
Node;AmplifyShaderEditor.RangedFloatNode;806;-9600,-1280;Inherit;False;Property;_NoiseXYTwist;Noise XY Twist;81;0;Create;True;0;0;0;False;1;Space(5);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;807;-9600,-1152;Inherit;False;Property;_NoiseXYTwistOffset;Noise XY Twist Offset;82;0;Create;True;0;0;0;False;0;False;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.FunctionNode;805;-8960,-1280;Inherit;False;Twirl;-1;;594;90936742ac32db8449cd21ab6dd337c8;0;4;1;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT;0;False;4;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;808;-9344,-1152;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RadiansOpNode;809;-9344,-1280;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;561;-1920,-640;Inherit;False;560;Texture A;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RGBToHSVNode;402;-3072,512;Inherit;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.HSVToRGBNode;401;-2304,512;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;52;-1664,592;Inherit;False;49;Alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.VertexColorNode;139;-4096,1024;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;951;-2688,1024;Inherit;False;Vertex Colour;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;698;-7296,1664;Inherit;False;691;UV 2D Y;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;364;-7296,1792;Inherit;False;Property;_VerticalColourMaskPower;Vertical Colour Mask Power;63;0;Create;True;0;0;0;False;2;Header(Vertical Colour Mask);Space(5);False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;362;-7296,1872;Inherit;False;Property;_VerticalColourMaskRemapMin;Vertical Colour Mask Remap Min;64;0;Create;True;0;0;0;False;0;False;0.5;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;363;-7296,1952;Inherit;False;Property;_VerticalColourMaskRemapMax;Vertical Colour Mask Remap Max;65;0;Create;True;0;0;0;False;0;False;0.1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;869;-6784,1664;Inherit;True;Power Smoothstep;-1;;598;eaa8bfb6a4986cb418a1675cea297eed;1,24,0;4;20;FLOAT;1;False;4;FLOAT;1;False;7;FLOAT;0;False;23;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;369;-6400,1664;Inherit;False;Vertical Colour Mask;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;393;-1280,0;Inherit;False;Colour Input;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;68;-3072,352;Inherit;False;Property;_ColourValueMultiplier;Colour Value Multiplier;53;0;Create;True;0;0;0;False;0;False;5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RGBToHSVNode;129;-3072,0;Inherit;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;136;-2688,256;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;134;-3072,256;Inherit;False;Property;_ColourSaturationShift;Colour Saturation Shift;52;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;131;-3072,160;Inherit;False;Property;_ColourHueShift;Colour Hue Shift;51;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;135;-2688,128;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;130;-2688,0;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RGBToHSVNode;949;-3840,1152;Inherit;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ComponentMaskNode;141;-2944,1152;Inherit;False;True;True;True;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.HSVToRGBNode;950;-3200,1152;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;1074;-3712,2304;Inherit;False;Property;_IntersectionHighlightAlpha;Intersection Highlight Alpha;169;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;394;-4480,1664;Inherit;False;393;Colour Input;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;140;-3840,1664;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RGBToHSVNode;1067;-4096,1920;Inherit;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleAddOpNode;1071;-3712,2048;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1072;-3712,1920;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1070;-4096,2080;Inherit;False;Property;_IntersectionHighlightColourHueShift;Intersection Highlight Colour Hue Shift;175;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1069;-4096,2176;Inherit;False;Property;_IntersectionHighlightColourSaturationShift;Intersection Highlight Colour Saturation Shift;176;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1066;-4096,2272;Inherit;False;Property;_IntersectionHighlightColourValueMultiplier;Intersection Highlight Colour Value Multiplier;177;0;Create;True;0;0;0;False;0;False;5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1068;-3712,2176;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.HSVToRGBNode;1073;-3200,1920;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;1020;-3200,2304;Inherit;False;1011;Intersection Highlight;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;1041;-2816,2304;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;0.0001;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1075;-2816,1920;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;241;-3072,3456;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TransformDirectionNode;891;-3328,8832;Inherit;False;World;Object;False;Fast;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.StaticSwitch;810;-1408,5888;Inherit;False;Property;_VertexNoiseTwistEnabled;Vertex Noise Twist Enabled;212;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;952;-4480,1792;Inherit;False;951;Vertex Colour;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;953;-3840,1488;Inherit;False;Property;_VertexColourSaturationShift;Vertex Colour Saturation Shift;45;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;955;-3456,1536;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;956;-3456,1408;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;954;-3840,1408;Inherit;False;Property;_VertexColourHueShift;Vertex Colour Hue Shift;44;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;492;-3456,1664;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;50;-2048,1664;Inherit;False;Colour;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;1018;-2304,1664;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;496;-3840,1792;Inherit;False;495;Lighting;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;51;-1664,512;Inherit;False;50;Colour;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RotateAboutAxisNode;1102;-7680,3072;Inherit;False;False;4;0;FLOAT3;1,0,0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RotateAboutAxisNode;1103;-7680,3216;Inherit;False;False;4;0;FLOAT3;0,1,0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RotateAboutAxisNode;1104;-7680,3360;Inherit;False;False;4;0;FLOAT3;0,0,1;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.BreakToComponentsNode;1106;-7936,3200;Inherit;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.GetLocalVarNode;1109;-8192,3200;Inherit;False;1107;Particle Rotation 3D;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1105;-8192,3072;Inherit;False;1101;Particle Center;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1172;-6784,3968;Inherit;False;Normal from Height Back;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1171;-6784,3712;Inherit;False;Normal from Height Front;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;528;-7680,3968;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;518;-7936,3968;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;523;-7424,3968;Inherit;False;Normal From Height;-1;;604;1942fe2c5f1a1f94881a33d532e4afeb;0;2;20;FLOAT;0;False;110;FLOAT;1;False;2;FLOAT3;40;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;507;-7424,3712;Inherit;False;Normal From Height;-1;;605;1942fe2c5f1a1f94881a33d532e4afeb;0;2;20;FLOAT;0;False;110;FLOAT;1;False;2;FLOAT3;40;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;506;-8192,3712;Inherit;False;11;Noise;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;1138;-7040,3968;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;1124;-8192,4224;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;1201;-8192,4480;Inherit;False;1171;Normal from Height Front;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1219;-8192,4608;Inherit;False;1172;Normal from Height Back;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CustomExpressionNode;1118;-7680,4224;Inherit;False;GetMainLightShadow_float;7;File;2;True;viewDirection;FLOAT3;0,0,0;In;;Inherit;False;True;output;FLOAT3;0,0,0;Out;;Inherit;False;GetMainLightColourFlat_float;False;False;0;3e9fef90fa1fa8d4091eea0baa50ed09;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;2;FLOAT3;0;FLOAT3;3
Node;AmplifyShaderEditor.CustomExpressionNode;1197;-7680,4480;Inherit;False;GetMainLightShadow_float;7;File;3;True;viewDirection;FLOAT3;0,0,0;In;;Inherit;False;True;normal;FLOAT3;0,0,0;In;;Inherit;False;True;output;FLOAT3;0,0,0;Out;;Inherit;False;GetMainLightColourLambert_float;False;False;0;3e9fef90fa1fa8d4091eea0baa50ed09;False;4;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;2;FLOAT3;0;FLOAT3;4
Node;AmplifyShaderEditor.CustomExpressionNode;1218;-7680,4608;Inherit;False;GetMainLightShadow_float;7;File;3;True;viewDirection;FLOAT3;0,0,0;In;;Inherit;False;True;normal;FLOAT3;0,0,0;In;;Inherit;False;True;output;FLOAT3;0,0,0;Out;;Inherit;False;GetMainLightColourLambert_float;False;False;0;3e9fef90fa1fa8d4091eea0baa50ed09;False;4;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;2;FLOAT3;0;FLOAT3;4
Node;AmplifyShaderEditor.StaticSwitch;1207;-7296,4224;Inherit;False;Property;_MainLightFlatEnabled;Main Light Flat Enabled;4;0;Create;True;0;0;0;False;0;False;0;1;1;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;1208;-7296,4480;Inherit;False;Property;_MainLightLambertEnabled;Main Light Lambert Enabled;5;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;1206;-7296,4624;Inherit;False;Property;_AdditionalLightsFlat6;Additional Lights Flat;5;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;1208;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;1213;-6784,4736;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;1220;-6528,4608;Inherit;False;Property;_AdditionalLightsFlat9;Additional Lights Flat;4;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;1207;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;1223;-6528,4352;Inherit;False;Property;_AdditionalLightsFlat12;Additional Lights Flat;4;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;1207;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;1214;-6784,4480;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1216;-5760,4224;Inherit;False;Main Light Front;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1217;-5760,4608;Inherit;False;Main Light Back;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1227;-8192,4992;Inherit;False;1216;Main Light Front;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalizeNode;1228;-7552,5120;Inherit;False;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LengthOpNode;1229;-7552,5248;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1230;-7808,5376;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1231;-7552,5376;Inherit;False;2;2;0;FLOAT;1;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1232;-8192,5376;Inherit;False;11;Noise;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1235;-8192,5120;Inherit;False;1217;Main Light Back;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1236;-7296,5248;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1237;-7040,5120;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;502;-6272,4992;Inherit;False;4;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;988;-6016,4992;Inherit;False;Main Light;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;505;-6784,5248;Inherit;False;Property;_MainLight;Main Light;3;0;Create;True;0;0;0;False;1;Space(5);False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1233;-8192,5504;Inherit;False;Property;_MainLightLambertTranslucencyMask;Main Light Lambert Translucency Mask;8;0;Create;True;0;0;0;False;0;False;0;0;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1234;-8192,5632;Inherit;False;Property;_MainLightLambertTranslucency;Main Light Lambert Translucency;7;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;1225;-6784,4992;Inherit;False;Property;_AdditionalLightsFlat7;Additional Lights Flat;5;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;1208;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1195;-7296,4736;Inherit;False;Property;_MainLightFlatLambertBlend;Main Light Flat-Lambert Blend;6;0;Create;True;0;0;0;False;0;False;0.5;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1120;-7296,5504;Inherit;False;Property;_MainLightAnisotropy;Main Light Anisotropy;9;0;Create;True;0;0;0;False;0;False;0.8;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;1204;-7296,5632;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;1121;-6784,5632;Inherit;False;Property;_MainLightAnisotropyBlend;Main Light Anisotropy Blend;10;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.CustomExpressionNode;1203;-6784,5504;Inherit;False;GetMainLightShadow_float;7;File;3;True;anisotropy;FLOAT;0;In;;Inherit;False;True;viewDirection;FLOAT3;0,0,0;In;;Inherit;False;True;output;FLOAT;0;Out;;Inherit;False;GetMainLightAnisotropy_float;False;False;0;3e9fef90fa1fa8d4091eea0baa50ed09;False;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;2;FLOAT3;0;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;1205;-6400,5504;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1117;-6784,5120;Inherit;False;1116;Main Light Shadow;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;1215;-6144,4224;Inherit;False;Property;_AdditionalLightsFlat8;Additional Lights Flat;5;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;1208;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;965;-9344,5344;Inherit;False;Property;_MainLightShadow;Main Light Shadow;11;0;Create;True;0;0;0;False;1;Space(5);False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;963;-8832,4992;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1116;-8576,4992;Inherit;False;Main Light Shadow;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldPosInputsNode;1152;-8192,5888;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;1174;-8192,6272;Inherit;False;1172;Normal from Height Back;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1173;-8192,6144;Inherit;False;1171;Normal from Height Front;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;1183;-7296,6288;Inherit;False;Property;_AdditionalLightsFlat2;Additional Lights Flat;21;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;1182;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;1179;-7296,5888;Inherit;False;Property;_AdditionalLightsFlatEnabled;Additional Lights Flat Enabled;20;0;Create;True;0;0;0;False;0;False;0;1;1;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;1182;-7296,6144;Inherit;False;Property;_AdditionalLightsLambertEnabled;Additional Lights Lambert Enabled;21;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1169;-7296,6400;Inherit;False;Property;_AdditionalLightsFlatLambertBlend;Additional Lights Flat-Lambert Blend;22;0;Create;True;0;0;0;False;1;Space(5);False;0.5;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1199;-6784,6400;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;1221;-6528,6272;Inherit;False;Property;_AdditionalLightsFlat10;Additional Lights Flat;20;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;1179;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;1198;-6144,5888;Inherit;False;Property;_AdditionalLightsFlat5;Additional Lights Flat;21;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;1182;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1175;-5760,5888;Inherit;False;Additional Lights Front;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;1176;-6784,6144;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;1222;-6528,6016;Inherit;False;Property;_AdditionalLightsFlat11;Additional Lights Flat;20;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;1179;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1180;-5760,6272;Inherit;False;Additional Lights Back;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;989;-8192,7424;Inherit;False;988;Main Light;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;500;-7296,7424;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;495;-7168,7424;Inherit;False;Lighting;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;553;-8192,7552;Inherit;False;552;Additional Lights;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;1200;-6784,6656;Inherit;False;Property;_AdditionalLightsFlat4;Additional Lights Flat;21;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;1182;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1184;-8192,6656;Inherit;False;1175;Additional Lights Front;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalizeNode;540;-7552,6784;Inherit;False;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LengthOpNode;543;-7552,6912;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1141;-7808,7040;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;556;-7552,7040;Inherit;False;2;2;0;FLOAT;1;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;549;-8192,7040;Inherit;False;11;Noise;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1142;-8192,7168;Inherit;False;Property;_AdditionalLightsLambertTranslucencyMask;Additional Lights Lambert Translucency Mask;24;0;Create;True;0;0;0;False;0;False;0;0;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;555;-8192,7296;Inherit;False;Property;_AdditionalLightsLambertTranslucency;Additional Lights Lambert Translucency;23;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1185;-8192,6784;Inherit;False;1180;Additional Lights Back;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;542;-7296,6912;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;527;-7040,6784;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;497;-6272,6656;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;552;-6016,6656;Inherit;False;Additional Lights;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;498;-6784,6912;Inherit;False;Property;_AdditionalLights;Additional Lights;19;0;Create;True;0;0;0;False;1;Space(5);False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1224;-6784,6784;Inherit;False;1153;Additional Lights Shadow;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;494;-7808,7424;Inherit;False;Property;_MainLightEnabled;Main Light Enabled;2;0;Create;True;0;0;0;False;2;Header(Main Light);Space(5);False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;1079;-7808,7552;Inherit;False;Property;_AdditionalLightsEnabled;Additional Lights Enabled;18;0;Create;True;0;0;0;False;2;Header(Additional Lights);Space(5);False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CustomExpressionNode;992;-9344,6400;Inherit;False; ;7;File;3;True;screenPosition;FLOAT2;0,0;In;;Inherit;False;True;position;FLOAT3;0,0,0;In;;Inherit;False;True;output;FLOAT;0;Out;;Inherit;False;GetAdditionalLightsShadow_float;False;False;0;3e9fef90fa1fa8d4091eea0baa50ed09;False;4;0;FLOAT;0;False;1;FLOAT2;0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;2;FLOAT;0;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;1153;-8576,6656;Inherit;False;Additional Lights Shadow;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1241;-8832,6656;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1147;-9984,6400;Inherit;False;1145;Screen UV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;1242;-9344,7040;Inherit;False;Property;_AdditionalLightsShadow;Additional Lights Shadow;25;0;Create;True;0;0;0;False;2;Header(Additional Lights Shadow);Space(5);False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;508;-7936,3840;Inherit;False;Property;_LambertLightingNormalfromHeight;Lambert Lighting Normal from Height;1;0;Create;True;0;0;0;False;1;Space(5);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;1100;-9600,3072;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;1108;-9600,3248;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;1098;-9984,3072;Inherit;False;1;4;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexCoordVertexDataNode;1099;-9984,3248;Inherit;False;2;4;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;1101;-9344,3072;Inherit;False;Particle Center;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1107;-9344,3200;Inherit;False;Particle Rotation 3D;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;938;-9984,80;Inherit;False;Property;_EndFoldoutBaseUVs;End Foldout Base UVs;40;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;903;-9984,304;Inherit;False;Property;_StartFoldoutColour;Start Foldout Colour;47;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;909;-9984,592;Inherit;False;Property;_StartFoldoutNoise;Start Foldout Noise;67;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;910;-9984,656;Inherit;False;Property;_EndFoldoutNoise;End Foldout Noise;91;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;912;-9984,736;Inherit;False;Property;_StartFoldoutNoiseDistortion;Start Foldout Noise Distortion;92;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;911;-9984,800;Inherit;False;Property;_EndFoldoutNoiseDistortion;End Foldout Noise Distortion;104;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;913;-9984,880;Inherit;False;Property;_StartFoldoutRadialMask;Start Foldout Radial Mask;105;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;914;-9984,944;Inherit;False;Property;_EndFoldoutRadialMask;End Foldout Radial Mask;114;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;916;-9984,1024;Inherit;False;Property;_StartFoldoutRadialMaskDistortion;Start Foldout Radial Mask Distortion;115;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;917;-9984,1088;Inherit;False;Property;_EndFoldoutRadialMaskDistortion;End Foldout Radial Mask Distortion;127;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;919;-9984,1232;Inherit;False;Property;_EndFoldoutVerticalMasks;End Foldout Vertical Masks;144;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;918;-9984,1168;Inherit;False;Property;_StartFoldoutVerticalMasks;Start Foldout Vertical Masks;128;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;921;-9984,1312;Inherit;False;Property;_StartFoldoutSpherizeNoise;Start Foldout Spherize Noise;145;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;920;-9984,1376;Inherit;False;Property;_EndFoldoutSpherizeNoise;End Foldout Spherize Noise;150;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;922;-9984,1456;Inherit;False;Property;_StartFoldoutFresnelMask;Start Foldout Fresnel Mask;151;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;923;-9984,1520;Inherit;False;Property;_EndFoldoutFresnelMask;End Foldout Fresnel Mask;156;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;904;-9984,368;Inherit;False;Property;_EndFoldoutColour;End Foldout Colour;55;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;907;-9984,448;Inherit;False;Property;_StartFoldoutVerticalColour;Start Foldout Vertical Colour;56;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;908;-9984,512;Inherit;False;Property;_EndFoldoutVerticalColour;End Foldout Vertical Colour;66;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;905;-9984,-128;Inherit;False;Property;_StartFoldoutLighting;Start Foldout Lighting;0;0;Create;True;0;0;0;True;1;Tooltip(Allow lighting to affect the surface, from a single directional light and any number of additional lights.);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;906;-9984,-64;Inherit;False;Property;_EndFoldoutLighting;End Foldout Lighting;32;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;939;-9984,16;Inherit;False;Property;_StartFoldoutBaseUVs;Start Foldout Base UVs;35;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;940;-9984,160;Inherit;False;Property;_StartFoldoutParticleSettings;Start Foldout Particle Settings;41;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;941;-9984,224;Inherit;False;Property;_EndFoldoutParticleSettings;End Foldout Particle Settings;46;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;924;-9984,1600;Inherit;False;Property;_StartFoldoutDepthFade;Start Foldout Depth Fade;157;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;925;-9984,1664;Inherit;False;Property;_EndFoldoutDepthFade;End Foldout Depth Fade;166;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1043;-9984,1744;Inherit;False;Property;_StartFoldoutIntersectionHighlight;Start Foldout Intersection Highlight;167;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1044;-9984,1808;Inherit;False;Property;_EndFoldoutIntersectionHighlight;End Foldout Intersection Highlight;178;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;926;-9984,1888;Inherit;False;Property;_StartFoldoutVertexUVOffset;Start Foldout Vertex UV Offset;179;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;927;-9984,1952;Inherit;False;Property;_EndFoldoutVertexUVOffset;End Foldout Vertex UV Offset;184;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;928;-9984,2032;Inherit;False;Property;_StartFoldoutVertexNormalOffset;Start Foldout Vertex Normal Offset;185;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;929;-9984,2096;Inherit;False;Property;_EndFoldoutVertexNormalOffset;End Foldout Vertex Normal Offset;191;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;930;-9984,2176;Inherit;False;Property;_StartFoldoutVertexWave;Start Foldout Vertex Wave;193;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;931;-9984,2240;Inherit;False;Property;_EndFoldoutVertexWave;End Foldout Vertex Wave;199;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;932;-9984,2320;Inherit;False;Property;_StartFoldoutVertexNoise;Start Foldout Vertex Noise;200;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;933;-9984,2384;Inherit;False;Property;_EndFoldoutVertexNoise;End Foldout Vertex Noise;213;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;935;-9984,2528;Inherit;False;Property;_EndFoldoutVertexWaveNoiseVerticalMask;End Foldout Vertex Wave-Noise Vertical Mask;218;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;936;-9984,2608;Inherit;False;Property;_StartFoldoutVertexOffsetoverY;Start Foldout Vertex Offset over Y;219;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;937;-9984,2672;Inherit;False;Property;_EndFoldoutVertexOffsetoverY;End Foldout Vertex Offset over Y;226;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;934;-9984,2464;Inherit;False;Property;_StartFoldoutVertexWaveNoiseVerticalMask;Start Foldout Vertex Wave-Noise Vertical Mask;214;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1261;-6656,-2048;Inherit;False;1248;Sample Noise;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1264;-6656,-2304;Inherit;False;1248;Sample Noise;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1265;-6656,-2688;Inherit;False;1248;Sample Noise;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1260;-6656,-1792;Inherit;False;1248;Sample Noise;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1250;-6272,-1792;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1262;-6272,-2048;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1263;-6272,-2304;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1266;-6272,-2688;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CustomExpressionNode;1135;-7680,6144;Inherit;False; ;7;File;4;True;position;FLOAT3;0,0,0;In;;Inherit;False;True;screenUV;FLOAT2;0,0;In;;Inherit;False;True;normal;FLOAT3;0,0,0;In;;Inherit;False;True;output;FLOAT3;0,0,0;Out;;Inherit;False;GetAdditionalLightsColourLambert_float;False;False;0;3e9fef90fa1fa8d4091eea0baa50ed09;False;5;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;2;FLOAT2;0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;2;FLOAT;0;FLOAT3;5
Node;AmplifyShaderEditor.CustomExpressionNode;1137;-7680,6288;Inherit;False; ;7;File;4;True;position;FLOAT3;0,0,0;In;;Inherit;False;True;screenUV;FLOAT2;0,0;In;;Inherit;False;True;normal;FLOAT3;0,0,0;In;;Inherit;False;True;output;FLOAT3;0,0,0;Out;;Inherit;False;GetAdditionalLightsColourLambert_float;False;False;0;3e9fef90fa1fa8d4091eea0baa50ed09;False;5;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;2;FLOAT2;0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;2;FLOAT;0;FLOAT3;5
Node;AmplifyShaderEditor.GetLocalVarNode;1149;-8192,6048;Inherit;False;1145;Screen UV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CustomExpressionNode;1167;-7680,5888;Inherit;False; ;7;File;3;True;position;FLOAT3;0,0,0;In;;Inherit;False;True;screenUV;FLOAT2;0,0;In;;Inherit;False;True;output;FLOAT3;0,0,0;Out;;Inherit;False;GetAdditionalLightsColourFlat_float;False;False;0;3e9fef90fa1fa8d4091eea0baa50ed09;False;4;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;2;FLOAT2;0,0;False;3;FLOAT3;0,0,0;False;2;FLOAT;0;FLOAT3;4
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;13;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;3;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;13;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;True;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;4;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;13;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;5;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;13;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;6;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;13;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;SceneSelectionPass;0;6;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;7;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;13;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;ScenePickingPass;0;7;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;8;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;13;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;DepthNormals;0;8;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormalsOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;9;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;13;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;DepthNormalsOnly;0;9;DepthNormalsOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormalsOnly;False;True;9;d3d11;metal;vulkan;xboxone;xboxseries;playstation;ps4;ps5;switch;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;0;-3456,288;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;13;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1;-1280,512;Float;False;True;-1;2;Mirza.Solaris.SolarisGUI;0;13;Mirza/Solaris;2992e84f91cbeb14eab234972e07ea9d;True;Forward;0;1;Forward;8;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;True;1;5;False;;10;False;;1;1;False;;10;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;2;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForwardOnly;False;False;5;Include;;False;;Native;False;0;0;;Custom;#pragma multi_compile _ _FORWARD_PLUS;False;;Custom;False;0;0;;Custom;#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN;False;;Custom;False;0;0;;Custom;#pragma multi_compile _ _ADDITIONAL_LIGHTS;False;;Custom;False;0;0;;Custom; #pragma multi_compile _ _ADDITIONAL_LIGHT_SHADOWS;False;;Custom;False;0;0;;;0;0;Standard;25;Surface;1;638678258758353849;  Blend;0;0;Two Sided;0;638679950529090718;Forward Only;0;0;Alpha Clipping;0;638678277663027203;  Use Shadow Threshold;0;0;Cast Shadows;0;638859229672840056;Receive Shadows;0;638859229669061415;Motion Vectors;0;0;  Add Precomputed Velocity;0;0;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;Meta Pass;0;0;Extra Pre Pass;0;638682750905672820;Tessellation;1;638859176089271674;  Phong;1;638682750923282078;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,True,_Tessellation;638751898865654623;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Vertex Position,InvertActionOnDeselection;0;638690283907091048;0;11;False;True;False;True;False;False;True;True;True;False;False;False;;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1270;-1280,612;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;MotionVectors;0;10;MotionVectors;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;False;False;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=MotionVectors;False;False;0;;0;0;Standard;0;False;0
WireConnection;1146;0;1144;1
WireConnection;1146;1;1144;2
WireConnection;1112;0;1111;1
WireConnection;1112;1;1111;2
WireConnection;1145;0;1146;0
WireConnection;1113;0;1112;0
WireConnection;1256;0;1145;0
WireConnection;1256;1;1113;0
WireConnection;1254;0;1256;0
WireConnection;338;0;341;0
WireConnection;316;0;322;0
WireConnection;620;0;623;0
WireConnection;339;1;341;0
WireConnection;339;0;338;0
WireConnection;321;1;322;0
WireConnection;321;0;316;0
WireConnection;1243;0;1257;0
WireConnection;1243;1;1247;0
WireConnection;156;0;145;4
WireConnection;340;0;339;0
WireConnection;327;0;321;0
WireConnection;621;1;623;0
WireConnection;621;0;620;0
WireConnection;1251;0;1243;0
WireConnection;157;0;156;0
WireConnection;157;2;477;0
WireConnection;146;0;145;3
WireConnection;622;0;621;0
WireConnection;1258;0;1251;0
WireConnection;1258;1;1259;0
WireConnection;147;0;157;0
WireConnection;223;1;332;0
WireConnection;223;0;342;0
WireConnection;1248;0;1258;0
WireConnection;169;0;170;0
WireConnection;169;1;168;0
WireConnection;356;1;223;0
WireConnection;356;0;624;0
WireConnection;150;0;109;0
WireConnection;150;1;151;0
WireConnection;150;2;169;0
WireConnection;1267;0;356;0
WireConnection;1267;1;1268;0
WireConnection;171;0;150;0
WireConnection;220;0;1267;0
WireConnection;872;13;71;0
WireConnection;463;0;872;0
WireConnection;158;4;323;0
WireConnection;158;7;106;0
WireConnection;158;8;107;0
WireConnection;158;9;108;0
WireConnection;158;12;172;0
WireConnection;166;0;167;0
WireConnection;166;1;165;0
WireConnection;464;1;872;0
WireConnection;464;0;463;0
WireConnection;118;4;158;0
WireConnection;118;6;158;15
WireConnection;118;7;111;0
WireConnection;118;9;112;0
WireConnection;443;4;158;0
WireConnection;443;6;158;15
WireConnection;443;7;111;0
WireConnection;612;0;447;0
WireConnection;613;0;447;0
WireConnection;629;0;137;0
WireConnection;148;0;82;0
WireConnection;148;1;149;0
WireConnection;148;2;166;0
WireConnection;465;0;464;0
WireConnection;441;1;443;3
WireConnection;441;0;118;3
WireConnection;617;0;613;0
WireConnection;66;7;612;0
WireConnection;66;6;629;0
WireConnection;66;8;61;0
WireConnection;66;9;62;0
WireConnection;163;0;148;0
WireConnection;437;5;441;0
WireConnection;437;12;119;0
WireConnection;611;0;66;0
WireConnection;611;2;617;0
WireConnection;628;0;447;0
WireConnection;475;0;324;0
WireConnection;475;1;476;0
WireConnection;116;0;437;14
WireConnection;116;1;97;0
WireConnection;625;1;628;0
WireConnection;625;0;611;0
WireConnection;160;4;475;0
WireConnection;160;7;80;0
WireConnection;160;8;84;0
WireConnection;160;9;83;0
WireConnection;160;12;164;0
WireConnection;451;0;116;0
WireConnection;331;0;330;0
WireConnection;89;4;160;0
WireConnection;89;6;160;15
WireConnection;89;7;86;0
WireConnection;89;9;87;0
WireConnection;439;4;160;0
WireConnection;439;6;160;15
WireConnection;439;7;86;0
WireConnection;851;10;625;0
WireConnection;851;9;798;0
WireConnection;117;0;451;0
WireConnection;329;1;330;0
WireConnection;329;0;331;0
WireConnection;440;1;439;3
WireConnection;440;0;89;3
WireConnection;801;1;625;0
WireConnection;801;0;851;0
WireConnection;328;0;329;0
WireConnection;436;5;440;0
WireConnection;436;12;88;0
WireConnection;728;0;801;0
WireConnection;718;0;339;0
WireConnection;161;0;162;1
WireConnection;122;0;102;0
WireConnection;94;0;436;14
WireConnection;94;1;103;0
WireConnection;736;0;728;1
WireConnection;736;1;737;0
WireConnection;719;0;718;0
WireConnection;99;0;343;0
WireConnection;99;1;122;0
WireConnection;442;0;94;0
WireConnection;738;0;736;0
WireConnection;738;1;740;0
WireConnection;690;0;321;0
WireConnection;125;0;99;0
WireConnection;125;1;126;0
WireConnection;183;1;181;0
WireConnection;183;2;184;0
WireConnection;73;0;442;0
WireConnection;735;0;728;2
WireConnection;733;2;738;0
WireConnection;733;12;730;0
WireConnection;734;0;728;0
WireConnection;691;0;690;0
WireConnection;726;0;717;0
WireConnection;726;1;722;0
WireConnection;121;0;125;0
WireConnection;121;1;123;0
WireConnection;180;0;120;0
WireConnection;180;1;183;0
WireConnection;185;0;57;0
WireConnection;178;0;179;0
WireConnection;178;1;177;0
WireConnection;732;0;734;0
WireConnection;732;1;733;14
WireConnection;732;2;735;0
WireConnection;725;0;726;0
WireConnection;725;1;724;0
WireConnection;53;10;121;0
WireConnection;53;8;180;0
WireConnection;53;9;185;0
WireConnection;152;0;19;0
WireConnection;152;1;153;0
WireConnection;152;2;178;0
WireConnection;70;0;732;0
WireConnection;70;1;466;0
WireConnection;70;2;95;0
WireConnection;716;1;699;0
WireConnection;716;0;725;0
WireConnection;566;0;53;0
WireConnection;566;1;567;0
WireConnection;175;0;152;0
WireConnection;173;0;70;0
WireConnection;749;0;746;0
WireConnection;749;1;747;0
WireConnection;862;20;716;0
WireConnection;862;4;347;0
WireConnection;862;7;346;0
WireConnection;862;23;345;0
WireConnection;55;0;566;0
WireConnection;742;0;862;0
WireConnection;751;0;749;0
WireConnection;751;1;748;0
WireConnection;601;0;55;0
WireConnection;159;4;174;0
WireConnection;159;7;16;0
WireConnection;159;8;72;0
WireConnection;159;9;18;0
WireConnection;159;12;176;0
WireConnection;713;1;862;0
WireConnection;713;0;742;0
WireConnection;767;1;750;0
WireConnection;767;0;751;0
WireConnection;227;0;601;0
WireConnection;24;4;159;0
WireConnection;24;6;159;15
WireConnection;24;7;13;0
WireConnection;24;9;14;0
WireConnection;445;4;159;0
WireConnection;445;6;159;15
WireConnection;445;7;13;0
WireConnection;484;0;162;2
WireConnection;484;1;485;0
WireConnection;350;0;713;0
WireConnection;863;20;767;0
WireConnection;863;4;754;0
WireConnection;863;7;752;0
WireConnection;863;23;753;0
WireConnection;444;1;445;0
WireConnection;444;0;24;0
WireConnection;186;0;187;0
WireConnection;480;0;484;0
WireConnection;757;0;863;0
WireConnection;942;0;684;0
WireConnection;219;0;186;0
WireConnection;208;0;210;0
WireConnection;217;0;186;0
WireConnection;864;20;444;0
WireConnection;864;4;22;0
WireConnection;864;7;564;0
WireConnection;864;23;565;0
WireConnection;758;1;863;0
WireConnection;758;0;757;0
WireConnection;703;0;942;0
WireConnection;703;1;704;0
WireConnection;478;0;864;0
WireConnection;478;1;479;0
WireConnection;218;1;219;0
WireConnection;218;0;217;0
WireConnection;211;0;208;0
WireConnection;759;0;758;0
WireConnection;709;1;942;0
WireConnection;709;0;703;0
WireConnection;1125;1;1126;0
WireConnection;1125;2;1148;0
WireConnection;1125;3;1255;0
WireConnection;1125;4;1129;0
WireConnection;1125;5;1130;0
WireConnection;1125;6;1131;0
WireConnection;1125;7;1132;0
WireConnection;1125;8;1133;0
WireConnection;1125;9;1134;0
WireConnection;1080;1;1081;0
WireConnection;1080;2;1150;0
WireConnection;1080;3;1085;0
WireConnection;1080;4;1089;0
WireConnection;1080;5;1123;0
WireConnection;1080;6;1110;0
WireConnection;1080;7;1115;0
WireConnection;1080;8;1088;0
WireConnection;571;0;478;0
WireConnection;191;0;192;0
WireConnection;191;1;193;0
WireConnection;866;20;211;0
WireConnection;866;4;209;0
WireConnection;865;20;218;0
WireConnection;865;4;190;0
WireConnection;741;1;942;0
WireConnection;741;0;709;0
WireConnection;984;1;1080;10
WireConnection;984;2;980;0
WireConnection;993;1;1125;11
WireConnection;993;2;996;0
WireConnection;569;1;571;0
WireConnection;569;2;570;0
WireConnection;214;0;865;0
WireConnection;214;1;866;0
WireConnection;568;0;191;0
WireConnection;1005;0;1007;0
WireConnection;232;3;235;0
WireConnection;761;0;741;0
WireConnection;761;1;762;0
WireConnection;981;0;984;0
WireConnection;994;0;993;0
WireConnection;11;0;569;0
WireConnection;216;0;214;0
WireConnection;868;20;568;0
WireConnection;868;4;196;0
WireConnection;1006;0;1005;0
WireConnection;234;0;232;0
WireConnection;234;1;236;0
WireConnection;234;2;237;0
WireConnection;760;1;741;0
WireConnection;760;0;761;0
WireConnection;195;0;868;0
WireConnection;188;0;216;0
WireConnection;1008;20;1006;0
WireConnection;1008;4;1010;0
WireConnection;1008;7;1016;0
WireConnection;1008;23;1017;0
WireConnection;242;1;234;0
WireConnection;242;2;243;0
WireConnection;766;1;741;0
WireConnection;766;0;760;0
WireConnection;1076;1;1078;0
WireConnection;1076;0;1047;0
WireConnection;1077;1;1078;0
WireConnection;1077;0;1046;0
WireConnection;1011;0;1008;0
WireConnection;56;0;41;0
WireConnection;56;1;766;0
WireConnection;233;0;242;0
WireConnection;315;0;314;0
WireConnection;315;1;313;0
WireConnection;1024;0;1019;4
WireConnection;1054;0;1076;0
WireConnection;1054;1;1077;0
WireConnection;200;0;199;0
WireConnection;143;0;142;0
WireConnection;240;0;128;0
WireConnection;58;0;56;0
WireConnection;701;0;197;0
WireConnection;309;0;300;0
WireConnection;309;1;310;0
WireConnection;309;2;315;0
WireConnection;1061;0;1054;0
WireConnection;1061;1;1063;0
WireConnection;127;0;58;0
WireConnection;127;1;239;0
WireConnection;127;2;143;0
WireConnection;127;3;701;0
WireConnection;127;4;200;0
WireConnection;127;5;240;0
WireConnection;642;0;641;0
WireConnection;311;0;309;0
WireConnection;1029;0;1027;0
WireConnection;1029;1;1028;0
WireConnection;1029;2;1061;0
WireConnection;1012;0;127;0
WireConnection;1012;1;1029;0
WireConnection;643;0;642;0
WireConnection;590;0;588;0
WireConnection;605;1;452;0
WireConnection;605;0;606;0
WireConnection;948;0;944;0
WireConnection;1030;0;1012;0
WireConnection;336;0;335;0
WireConnection;285;0;276;0
WireConnection;285;1;284;0
WireConnection;258;0;260;0
WireConnection;644;0;643;0
WireConnection;591;0;590;0
WireConnection;292;4;605;0
WireConnection;292;7;294;0
WireConnection;292;8;296;0
WireConnection;292;9;295;0
WireConnection;292;12;312;0
WireConnection;867;20;700;0
WireConnection;867;4;279;0
WireConnection;867;7;305;0
WireConnection;867;23;306;0
WireConnection;945;0;1030;0
WireConnection;945;1;948;0
WireConnection;1033;0;1030;0
WireConnection;251;0;336;1
WireConnection;251;1;595;0
WireConnection;251;2;254;0
WireConnection;583;0;258;0
WireConnection;583;1;285;0
WireConnection;587;0;591;0
WireConnection;657;0;644;1
WireConnection;302;4;292;0
WireConnection;302;6;292;15
WireConnection;302;7;858;0
WireConnection;302;9;303;0
WireConnection;489;4;292;0
WireConnection;489;6;292;15
WireConnection;489;7;858;0
WireConnection;280;0;867;0
WireConnection;943;1;945;0
WireConnection;943;0;1033;0
WireConnection;584;0;251;0
WireConnection;584;1;583;0
WireConnection;646;0;657;0
WireConnection;646;1;662;0
WireConnection;597;0;587;1
WireConnection;597;1;661;0
WireConnection;490;1;489;3
WireConnection;490;0;302;3
WireConnection;712;0;943;0
WireConnection;712;1;353;0
WireConnection;249;0;584;0
WireConnection;648;0;644;0
WireConnection;648;1;646;0
WireConnection;649;0;663;0
WireConnection;574;0;587;0
WireConnection;574;1;597;0
WireConnection;604;0;660;0
WireConnection;852;10;490;0
WireConnection;852;9;789;0
WireConnection;682;0;694;0
WireConnection;895;0;894;0
WireConnection;711;1;712;0
WireConnection;711;0;943;0
WireConnection;266;0;249;0
WireConnection;266;1;267;0
WireConnection;266;2;281;0
WireConnection;650;0;648;0
WireConnection;650;1;649;0
WireConnection;576;0;574;0
WireConnection;576;1;604;0
WireConnection;856;0;852;0
WireConnection;669;0;693;0
WireConnection;669;1;668;0
WireConnection;680;0;682;0
WireConnection;680;1;679;0
WireConnection;896;0;895;0
WireConnection;744;1;943;0
WireConnection;744;0;711;0
WireConnection;282;0;266;0
WireConnection;282;1;264;0
WireConnection;594;1;576;0
WireConnection;575;0;576;0
WireConnection;652;1;650;0
WireConnection;653;0;650;0
WireConnection;289;0;856;0
WireConnection;289;1;290;0
WireConnection;289;2;297;0
WireConnection;245;0;244;0
WireConnection;245;1;246;0
WireConnection;676;0;680;0
WireConnection;676;1;677;0
WireConnection;676;2;681;0
WireConnection;665;0;669;0
WireConnection;665;1;666;0
WireConnection;665;2;667;0
WireConnection;897;0;896;0
WireConnection;764;0;744;0
WireConnection;764;1;765;0
WireConnection;448;0;282;0
WireConnection;593;1;575;0
WireConnection;593;0;594;0
WireConnection;654;1;653;0
WireConnection;654;0;652;0
WireConnection;450;0;289;0
WireConnection;674;0;245;0
WireConnection;674;1;665;0
WireConnection;674;2;676;0
WireConnection;763;1;764;0
WireConnection;763;0;744;0
WireConnection;265;0;448;0
WireConnection;579;0;593;0
WireConnection;655;0;654;0
WireConnection;298;0;450;0
WireConnection;670;0;674;0
WireConnection;636;0;633;0
WireConnection;632;0;692;0
WireConnection;632;1;631;0
WireConnection;780;0;777;0
WireConnection;776;0;899;0
WireConnection;776;1;775;0
WireConnection;888;0;902;0
WireConnection;888;1;886;0
WireConnection;768;1;744;0
WireConnection;768;0;763;0
WireConnection;638;0;636;0
WireConnection;638;1;632;0
WireConnection;893;0;889;0
WireConnection;893;1;888;0
WireConnection;782;0;780;0
WireConnection;782;1;776;0
WireConnection;982;0;768;0
WireConnection;982;1;983;0
WireConnection;269;0;671;0
WireConnection;269;1;268;0
WireConnection;269;2;299;0
WireConnection;269;3;580;0
WireConnection;269;4;656;0
WireConnection;785;0;638;0
WireConnection;785;1;782;0
WireConnection;785;2;893;0
WireConnection;819;0;269;0
WireConnection;819;1;816;0
WireConnection;639;0;785;0
WireConnection;854;0;818;0
WireConnection;985;1;768;0
WireConnection;985;0;982;0
WireConnection;999;0;985;0
WireConnection;999;1;1000;0
WireConnection;853;10;819;0
WireConnection;853;9;854;0
WireConnection;857;0;853;0
WireConnection;857;1;640;0
WireConnection;998;1;985;0
WireConnection;998;0;999;0
WireConnection;49;0;998;0
WireConnection;247;0;857;0
WireConnection;560;0;557;4
WireConnection;562;0;561;0
WireConnection;562;1;479;0
WireConnection;558;1;478;0
WireConnection;558;0;562;0
WireConnection;510;1;445;3
WireConnection;510;0;24;3
WireConnection;509;5;510;0
WireConnection;509;12;22;0
WireConnection;509;17;564;0
WireConnection;509;18;565;0
WireConnection;511;0;509;14
WireConnection;559;0;557;1
WireConnection;36;22;30;0
WireConnection;37;22;29;0
WireConnection;31;0;36;0
WireConnection;31;1;37;0
WireConnection;31;2;43;0
WireConnection;132;0;130;0
WireConnection;132;1;135;0
WireConnection;132;2;136;0
WireConnection;392;1;132;0
WireConnection;392;0;370;0
WireConnection;370;0;132;0
WireConnection;370;1;401;0
WireConnection;370;2;391;0
WireConnection;44;0;33;0
WireConnection;44;1;35;0
WireConnection;42;0;44;0
WireConnection;385;22;389;0
WireConnection;386;22;388;0
WireConnection;387;0;385;0
WireConnection;387;1;386;0
WireConnection;387;2;390;0
WireConnection;398;0;402;1
WireConnection;398;1;395;0
WireConnection;399;0;402;2
WireConnection;399;1;396;0
WireConnection;400;0;402;3
WireConnection;400;1;397;0
WireConnection;770;1;733;14
WireConnection;770;0;769;14
WireConnection;769;2;738;0
WireConnection;769;12;730;0
WireConnection;769;17;771;0
WireConnection;769;18;773;0
WireConnection;805;1;611;0
WireConnection;805;2;808;0
WireConnection;805;3;809;0
WireConnection;808;0;807;0
WireConnection;809;0;806;0
WireConnection;402;0;387;0
WireConnection;401;0;398;0
WireConnection;401;1;399;0
WireConnection;401;2;400;0
WireConnection;951;0;139;0
WireConnection;869;20;698;0
WireConnection;869;4;364;0
WireConnection;869;7;362;0
WireConnection;869;23;363;0
WireConnection;369;0;869;0
WireConnection;393;0;392;0
WireConnection;129;0;31;0
WireConnection;136;0;129;3
WireConnection;136;1;68;0
WireConnection;135;0;129;2
WireConnection;135;1;134;0
WireConnection;130;0;129;1
WireConnection;130;1;131;0
WireConnection;949;0;139;0
WireConnection;141;0;950;0
WireConnection;950;0;956;0
WireConnection;950;1;955;0
WireConnection;950;2;949;3
WireConnection;140;0;394;0
WireConnection;140;1;952;0
WireConnection;1067;0;394;0
WireConnection;1071;0;1067;2
WireConnection;1071;1;1069;0
WireConnection;1072;0;1067;1
WireConnection;1072;1;1070;0
WireConnection;1068;0;1067;3
WireConnection;1068;1;1066;0
WireConnection;1073;0;1072;0
WireConnection;1073;1;1071;0
WireConnection;1073;2;1068;0
WireConnection;1041;0;1020;0
WireConnection;1075;0;1073;0
WireConnection;1075;1;1019;5
WireConnection;241;0;234;0
WireConnection;891;0;889;0
WireConnection;810;1;490;0
WireConnection;810;0;852;0
WireConnection;955;0;949;2
WireConnection;955;1;953;0
WireConnection;956;0;949;1
WireConnection;956;1;954;0
WireConnection;492;0;140;0
WireConnection;492;1;496;0
WireConnection;50;0;1018;0
WireConnection;1018;0;492;0
WireConnection;1018;1;1075;0
WireConnection;1018;2;1041;0
WireConnection;1102;1;1106;0
WireConnection;1102;3;1105;0
WireConnection;1103;1;1106;0
WireConnection;1103;3;1102;0
WireConnection;1104;1;1106;0
WireConnection;1104;3;1103;0
WireConnection;1106;0;1109;0
WireConnection;1172;0;1138;0
WireConnection;1171;0;507;0
WireConnection;528;0;518;0
WireConnection;518;0;506;0
WireConnection;523;20;528;0
WireConnection;523;110;508;0
WireConnection;507;20;506;0
WireConnection;507;110;508;0
WireConnection;1138;0;523;0
WireConnection;1118;1;1124;0
WireConnection;1197;1;1124;0
WireConnection;1197;2;1201;0
WireConnection;1218;1;1124;0
WireConnection;1218;2;1219;0
WireConnection;1207;0;1118;3
WireConnection;1208;0;1197;4
WireConnection;1206;0;1218;4
WireConnection;1213;1;1206;0
WireConnection;1213;2;1195;0
WireConnection;1220;1;1206;0
WireConnection;1220;0;1213;0
WireConnection;1223;1;1208;0
WireConnection;1223;0;1214;0
WireConnection;1214;0;1207;0
WireConnection;1214;1;1208;0
WireConnection;1214;2;1195;0
WireConnection;1216;0;1215;0
WireConnection;1217;0;1220;0
WireConnection;1228;0;1235;0
WireConnection;1229;0;1235;0
WireConnection;1230;1;1232;0
WireConnection;1230;2;1233;0
WireConnection;1231;0;1230;0
WireConnection;1231;1;1234;0
WireConnection;1236;0;1228;0
WireConnection;1236;1;1229;0
WireConnection;1236;2;1231;0
WireConnection;1237;0;1227;0
WireConnection;1237;1;1236;0
WireConnection;502;0;1225;0
WireConnection;502;1;1117;0
WireConnection;502;2;505;0
WireConnection;502;3;1205;0
WireConnection;988;0;502;0
WireConnection;1225;1;1227;0
WireConnection;1225;0;1237;0
WireConnection;1203;1;1120;0
WireConnection;1203;2;1204;0
WireConnection;1205;1;1203;4
WireConnection;1205;2;1121;0
WireConnection;1215;1;1207;0
WireConnection;1215;0;1223;0
WireConnection;963;1;1080;10
WireConnection;963;2;965;0
WireConnection;1116;0;963;0
WireConnection;1183;0;1137;5
WireConnection;1179;0;1167;4
WireConnection;1182;0;1135;5
WireConnection;1199;1;1183;0
WireConnection;1199;2;1169;0
WireConnection;1221;1;1183;0
WireConnection;1221;0;1199;0
WireConnection;1198;1;1179;0
WireConnection;1198;0;1222;0
WireConnection;1175;0;1198;0
WireConnection;1176;0;1179;0
WireConnection;1176;1;1182;0
WireConnection;1176;2;1169;0
WireConnection;1222;1;1182;0
WireConnection;1222;0;1176;0
WireConnection;1180;0;1221;0
WireConnection;500;0;494;0
WireConnection;500;1;1079;0
WireConnection;495;0;500;0
WireConnection;1200;1;1184;0
WireConnection;1200;0;527;0
WireConnection;540;0;1185;0
WireConnection;543;0;1185;0
WireConnection;1141;1;549;0
WireConnection;1141;2;1142;0
WireConnection;556;0;1141;0
WireConnection;556;1;555;0
WireConnection;542;0;540;0
WireConnection;542;1;543;0
WireConnection;542;2;556;0
WireConnection;527;0;1184;0
WireConnection;527;1;542;0
WireConnection;497;0;1200;0
WireConnection;497;1;1224;0
WireConnection;497;2;498;0
WireConnection;552;0;497;0
WireConnection;494;0;989;0
WireConnection;1079;0;553;0
WireConnection;992;1;1147;0
WireConnection;992;2;1126;0
WireConnection;1153;0;1241;0
WireConnection;1241;1;1125;11
WireConnection;1241;2;1242;0
WireConnection;1100;0;1098;3
WireConnection;1100;1;1098;4
WireConnection;1100;2;1099;1
WireConnection;1108;0;1099;2
WireConnection;1108;1;1099;3
WireConnection;1108;2;1099;4
WireConnection;1101;0;1100;0
WireConnection;1107;0;1108;0
WireConnection;1250;0;621;0
WireConnection;1250;1;1260;0
WireConnection;1262;0;339;0
WireConnection;1262;1;1261;0
WireConnection;1263;0;329;0
WireConnection;1263;1;1264;0
WireConnection;1266;0;321;0
WireConnection;1266;1;1265;0
WireConnection;1135;1;1152;0
WireConnection;1135;2;1149;0
WireConnection;1135;3;1173;0
WireConnection;1137;1;1152;0
WireConnection;1137;2;1149;0
WireConnection;1137;3;1174;0
WireConnection;1167;1;1152;0
WireConnection;1167;2;1149;0
WireConnection;1;2;51;0
WireConnection;1;3;52;0
WireConnection;1;5;248;0
ASEEND*/
//CHKSM=8BE14AA3E0607A9D784F18AB9BC2F7F1E931E5DD