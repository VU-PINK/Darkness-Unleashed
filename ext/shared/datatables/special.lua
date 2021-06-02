-- Special
local NightVision = { -- Night Vision Goggles
    OutdoorLightComponentData = {
        enable = true,
        sunColor = Vec3(0.525, 0.525, 0.525),
        skyColor = Vec3(255, 255, 255),
        groundColor = Vec3(255, 255, 255),
        skyEnvmapShadowScale = 0.25,
        sunSpecularScale = 0,
        skyEnvmapShadowScale = 0,
        sunShadowHeightScale = 0,
        translucencyDistortion = 0,
        translucencyAmbient = 1,
        translucencyScale = 1,
        translucencyPower = 80,
        sunRotationX = 0,
        sunRotationY = 0
    },
    SkyComponentData = {
        enable = true,
        brightnessScale = 1.5,
        sunSize = 0.1,
        sunScale = 0,
        realm = 0,
        --panoramicUVMinX = 0.280999988317,
        --panoramicUVMaxX = 0.298999994993,
        --panoramicUVMinY = 0.0630000010133,
        --panoramicUVMaxY = 0.307000011206,
        panoramicUVMinX = m_panoramicXmin,
        panoramicUVMaxX = m_panoramicXmax,
        panoramicUVMinY = m_panoramicYmin,
        panoramicUVMaxY = m_panoramicYmax,
        panoramicRotation = m_panoramicRotation,
        staticEnvmapScale = 0,
        skyVisibilityExponent = 0,
        skyEnvmap8BitTexScale = 1,
        customEnvmapScale = 0,
        customEnvmapAmbient = 0,
        cloudLayer1Altitude = 2000000.0,
        cloudLayer1TileFactor = 0.600000023842,
        cloudLayer1Rotation = 237.072998047,
        cloudLayer1Speed = 0, --0.0010000000475,
        cloudLayer1SunLightIntensity = 0.335,
        cloudLayer1SunLightPower = 0.335,
        cloudLayer1AmbientLightIntensity = 0.335,
        cloudLayer1AlphaMul = 0.335,
        cloudLayer1Texture = 'Stars',
        cloudLayer2Altitude = 10000.0,
        cloudLayer2TileFactor = 0.25,
        cloudLayer2Rotation = 0.0,
        cloudLayer2Speed = 0.00999999977648,
        cloudLayer2SunLightIntensity = 4.0,
        cloudLayer2SunLightPower = 50.0,
        cloudLayer2AmbientLightIntensity = 0.20000000298,
        cloudLayer2Color = Vec3(1, 1, 1),
        cloudLayer2AlphaMul = 1.0,
        --panoramicTexture = 'mapPanoramicTexture',
        --panoramicAlphaTexture = 'mapPanoramicAlphaTexture',
        staticEnvmapTexture = nil,
        skyGradientTexture = 'mapSkyGradientTexture'
    },
    ColorCorrectionComponentData = {
        enable = true,
        brightness = Vec3(1.45, 1.45, 1.45),
        contrast = Vec3(1.35999997616, 1.35999997616, 1.35999997616),
        saturation = Vec3(0.800000011921, 0.800000011921, 0.800000011921),
        hue = 0.0,
        colorGradingTexture = 'NvColorGrade',
        colorGradingEnable = true
    },
    FilmGrainComponentData = {
        enable = true,
        realm = 0,
        randomEnable = true,
        linearFilteringEnable = false,
        colorScale = Vec3(0.17, 0.17, 0.17)
    },
    TonemapComponentData = {
        minExposure = 5.25,
        maxExposure = 9,
        middleGray = 2.55,
        exposureAdjustTime = 10,
        bloomScale = Vec3(0.4, 0.4, 0.4),
        tonemapMethod = 1
    },
    FogComponentData = {
        enable = true,
        fogDistanceMultiplier = 1.00,
        fogGradientEnable = true,
        start = 0.0,
        endValue = 200.0,
        curve = Vec4(1.11925065517, -1.70694792271, 1.49723529816, -0.148290395737),
        fogColorEnable = true,
        fogColorStart = 0,
        fogColorEnd = 5000,
        fogColorCurve = Vec4(2.60263705254, -4.24849796295, 2.82176566124, -0.359705537558),
        transparencyFadeStart = 0,
        transparencyFadeEnd = 100,
        transparencyFadeClamp = 0.600000023842,
        fogColor = Vec3(0.0540000009537, 0.0540000009537, 0.0540000009537),
        heightFogEnable = false
    },
    EnlightenComponentData = {
        enable = true
    },
    SunFlareComponentData = {
        enable = false
    },
    VignetteComponentData = {
        enable = true,
        realm = 0,
        scale = Vec2(2.4, 2.2), --Aspect ratio = 1,0909090909090909090909090909091
        color = Vec3(0.1, 0.1, 0.1),
        exponent = 0.0,
        opacity = 1
    },
}

local NightVisionVehicle = { -- Night Vision Goggles Vehicles
    OutdoorLightComponentData = {
        enable = true,
        sunColor = Vec3(10.5, 10.5, 10.5),
        skyColor = Vec3(10, 10, 10),
        groundColor = Vec3(0.4, 0.4, 0.4),
        skyEnvmapShadowScale = 0.25,
        sunSpecularScale = 0,
        skyEnvmapShadowScale = 0,
        sunShadowHeightScale = 0,
        translucencyDistortion = 0,
        translucencyAmbient = 1,
        translucencyScale = 0,
        translucencyPower = 0,
        sunRotationX = 0,
        sunRotationY = 90
    },
    SkyComponentData = {
        enable = false,
    },
    ColorCorrectionComponentData = {
        enable = true,
        brightness = Vec3(1.4, 1.4, 1.4),
        contrast = Vec3(1.39999997616, 1.39999997616, 1.39999997616),
        saturation = Vec3(0.800000011921, 0.800000011921, 0.800000011921),
        hue = 0.0,
        colorGradingTexture = 'nv_colorgrade',
        colorGradingEnable = true
    },
    FilmGrainComponentData = {
        enable = true,
        realm = 0,
        randomEnable = true,
        linearFilteringEnable = false,
        colorScale = Vec3(0.17, 0.17, 0.17)
    },
    TonemapComponentData = {
        minExposure = 2.5,
        maxExposure = 8,
        middleGray = 0.75,
        exposureAdjustTime = 10,
        bloomScale = Vec3(0.1, 0.1, 0.1),
        tonemapMethod = 1
    },
    FogComponentData = {
        enable = true,
        fogDistanceMultiplier = 1.0,
        fogGradientEnable = true,
        start = 0.0,
        endValue = 200.0,
        curve = Vec4(1.11925065517, -1.70694792271, 1.49723529816, -0.148290395737),
        fogColorEnable = true,
        fogColorStart = 0,
        fogColorEnd = 5000,
        fogColorCurve = Vec4(2.60263705254, -4.24849796295, 2.82176566124, -0.359705537558),
        transparencyFadeStart = 0,
        transparencyFadeEnd = 1.0,
        transparencyFadeClamp = 0.600000023842,
        fogColor = Vec3(0.0740000009537, 0.0740000009537, 0.0740000009537),
        heightFogEnable = false
    },
    EnlightenComponentData = {
        enable = true
    },
    SunFlareComponentData = {
        enable = false
    },
    VignetteComponentData = {
        enable = true,
        realm = 0,
        scale = Vec2(2.4, 2.2), --Aspect ratio = 1,0909090909090909090909090909091
        color = Vec3(0.1, 0.1, 0.1),
        exponent = 0.0,
        opacity = 1
    },
    ShaderParamsComponentData = {
        value = Vec4(0.4, 0.4, 0.4, 0.4),
        parameterName = 'FlirData'
    },
}

local Sandstorm = {
    --[[OutdoorLightComponentData = {
        enable = true,
        sunColor = Vec3(0.21, 0.23, 0.21),
        skyColor = Vec3(0.1, 0.11, 0.13),
        groundColor = Vec3(0.13, 0.1, 0.13),
        skyEnvmapShadowScale = 0.25,
        cloudShadowEnable = true,
        cloudShadowSize = 2000.0,
        cloudShadowExponent = 3,
        cloudShadowCoverage = 0.44,
        cloudShadowSpeed = Vec2(-15.000000, -15.000000),
        skyLightAngleFactor = 0.0089999996125698,
        sunSpecularScale = 1,
        sunShadowHeightScale = 1,
        translucencyDistortion = 0.10000000149012,
        translucencyAmbient = 1,
        translucencyScale = 0,
        translucencyPower = 80.0,
        sunRotationX = 0,
        sunRotationY = 0
    },]]
    SkyComponentData = {
        enable = true,
        brightnessScale = 7,
        sunSize = 0.1,
        sunScale = 1,
        realm = 0,
        panoramicUVMinX = m_panoramicXmin,
        panoramicUVMaxX = m_panoramicXmax,
        panoramicUVMinY = m_panoramicYmin,
        panoramicUVMaxY = m_panoramicYmax,
        panoramicTileFactor = m_panoramicTileFactor,
        panoramicRotation = m_panoramicRotation,
        staticEnvmapScale = 0,
        skyVisibilityExponent = 1,
        skyEnvmap8BitTexScale = 1,
        customEnvmapScale = 0,
        customEnvmapAmbient = 0,
        cloudLayer1Altitude = 2000000.0,
        cloudLayer1TileFactor = 0.600000023842,
        cloudLayer1Rotation = 237.072998047,
        cloudLayer1Speed = 0, --0.0010000000475,
        cloudLayer1SunLightIntensity = 0.335,
        cloudLayer1SunLightPower = 0.335,
        cloudLayer1AmbientLightIntensity = 0.335,
        cloudLayer1AlphaMul = 0.335,
        cloudLayer1Texture = 'Stars',
        cloudLayer2Altitude = 10000.0,
        cloudLayer2TileFactor = 0.25,
        cloudLayer2Rotation = 0.0,
        cloudLayer2Speed = 0.00999999977648,
        cloudLayer2SunLightIntensity = 4.0,
        cloudLayer2SunLightPower = 50.0,
        cloudLayer2AmbientLightIntensity = 0.20000000298,
        cloudLayer2Color = Vec3(1, 1, 1),
        cloudLayer2AlphaMul = 1.0,
        cloudLayer2Texture = nil,
        panoramicTexture = nil,
        panoramicAlphaTexture = nil,
        staticEnvmapTexture = nil,
        skyGradientTexture = 'm_SkyGradientTexture'
    },
    ColorCorrectionComponentData = {
        enable = true,
        brightness = Vec3(0.46, 0.4, 0.36),
        contrast = Vec3(0.7, 0.53, 0.44),
        saturation = Vec3(0.94, 0.84, 0.84),
    },
    TonemapComponentData = {
        minExposure = 0,
        maxExposure = 1.7,
        exposureAdjustTime = 3,
        bloomScale = Vec3(0.2, 0.15, 0.25),
        tonemapMethod = 1,
        middleGray = 0.09,
    },
    FogComponentData = {
        enable = true,
        fogDistanceMultiplier = 1,
        fogGradientEnable = true,
        start = -10,
        endValue = 350,
        curve = Vec4(0.4, -0.77, 1.3, -0.01),
        fogColorEnable = true,
        fogColorStart = 0,  
        fogColorEnd = 220,
        fogColorCurve = Vec4(6.1, -11.7, 5.62, -0.18),
        transparencyFadeStart = 5000,
        transparencyFadeEnd = 0,
        transparencyFadeClamp = 0.45,
        fogColor = Vec3(0.53, 0.5, 1)
    },
    EnlightenComponentData = {
        enable = false,
        skyBoxEnable = false,
        sunScale = 0,
        bounceScale = 1.0,
        cullDistance = -1,
        terrainColor = Vec3(0, 0, 0),
        skyBoxSkyColor = Vec3(0, 0, 0),
        skyBoxBackLightColor = Vec3(0, 0, 0),
        skyBoxGroundColor = Vec3(0, 0, 0),
        skyBoxSunLightColor = Vec3(0, 0, 0),
    },
    DynamicAOComponentData = {
        enable = true,
        hbaoRadius = 1,
        hbaoAttenuation = 1,
        hbaoAngleBias = 1,
        hbaoPowerExponent = 1,
        hbaoContrast = 1,
        hbaoMaxFootprintRadius = 1,	
        ssaoRadius = 1,
        ssaoFade = 1,
        ssaoMaxDistanceInner = 1,
        ssaoMaxDistanceOuter = 1,
    }, 
    WindComponentData = {
        realm = 0,
        windDirection = 80,
        windStrength = 10
    },
    SunFlareComponentData = {
        enable = false
    },
    DofComponentData = {
        enable = false, 
        scale = 1,
        blurFilter = 6,
        nearDistanceScale = 0,
        farDistanceScale = 0.14,
        focusDistance = 27,
        blurAdd = 0,
        diffusionDofEnable = true,
        diffusionDofFocalLength = 7.4,
        diffusionDofAperture = 67,
    },
    VignetteComponentData = {
        enable = true,
        realm = 0,
        scale = Vec2(1.8, 1.2), --Aspect ratio = 1,0909090909090909090909090909091
        color = Vec3(0.1, 0.1, 0.1),
        exponent = 0.7,
        opacity = 0.7
    },
}

local isWeather = {
    Sandstorm = true,
}

return {
    NightVision = NightVision,
    NightVisionVehicle = NightVisionVehicle,
    isWeather = isWeather,
    Sandstorm = Sandstorm,
}
