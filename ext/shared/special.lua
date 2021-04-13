-- Special
local NightVision = { -- Night Vision Goggles
    OutdoorLightComponentData = {
        enable = true,
        sunColor = Vec3(0.5, 0.5, 0.5),
        skyColor = Vec3(1, 1, 1),
        groundColor = Vec3(0.4, 0.4, 0.4),
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
        minExposure = 4,
        maxExposure = 8,
        middleGray = 1,
        exposureAdjustTime = 10,
        bloomScale = Vec3(0.4, 0.4, 0.4),
        tonemapMethod = 1
    },
    FogComponentData = {
        enable = true,
        fogDistanceMultiplier = 1.0,
        fogGradientEnable = true,
        start = 0.0,
        endValue = 100.0,
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
}

local NightVisionVehicle = { -- Night Vision Goggles Vehicles
    OutdoorLightComponentData = {
        enable = true,
        sunColor = Vec3(0.5, 0.5, 0.5),
        skyColor = Vec3(1, 1, 1),
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

return {
    NightVision = NightVision,
    NightVisionVehicle = NightVisionVehicle
}
