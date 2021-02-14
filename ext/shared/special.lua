-- Special
local NightVision = { -- Night Vision Goggles
    OutdoorLightComponentData = {
        enable = true,
        sunColor = Vec3(0.10000000149, 0.10000000149, 0.10000000149),
        skyColor = Vec3(0.0399999991059, 0.0399999991059, 0.0399999991059),
        groundColor = Vec3(0.0299999993294, 0.0299999993294, 0.0299999993294),
        skyEnvmapShadowScale = 0.25,
        cloudShadowEnable = true,
        cloudShadowSize = 2000.0,
        cloudShadowExponent = 3,
        cloudShadowCoverage = 0.44,
        cloudShadowSpeed = Vec2(-15.000000, -15.000000),
        skyLightAngleFactor = 0.0089999996125698,
        sunSpecularScale = 0,
        skyEnvmapShadowScale = 0,
        sunShadowHeightScale = 0.3,
        translucencyDistortion = 0,
        translucencyAmbient = 0,
        translucencyScale = 0,
        translucencyPower = 0,
        sunRotationX = 255.48399353027,
        sunRotationY = 25
    },
    SkyComponentData = {
        enable = true,
        brightnessScale = 1,
        sunSize = 0,
        sunScale = 0,
        realm = 0,
        panoramicUVMinX = 0.280999988317,
        panoramicUVMaxX = 0.298999994993,
        panoramicUVMinY = 0.0630000010133,
        panoramicUVMaxY = 0.307000011206,
        panoramicTileFactor = 1.0,
        panoramicRotation = 260,
        staticEnvmapScale = 0,
        skyVisibilityExponent = 1,
        skyEnvmap8BitTexScale = 1,
        customEnvmapScale = 1,
        customEnvmapAmbient = 1,
        cloudLayer1Altitude = 2000000.0,
        cloudLayer1TileFactor = 0.600000023842,
        cloudLayer1Rotation = 237.072998047,
        cloudLayer1Speed = -0.0010000000475,
        cloudLayer1SunLightIntensity = 0.5,
        cloudLayer1SunLightPower = 0.5,
        cloudLayer1AmbientLightIntensity = 0.5,
        cloudLayer1AlphaMul = 0.55,
        cloudLayer1Texture = 'MoonNightStars',
        panoramicTexture = nil,
        panoramicAlphaTexture = nil,
        staticEnvmapTexture = nil,
        skyGradientTexture = 'MoonNightGradient'
    },
    ColorCorrectionComponentData = {
        enable = true,
        brightness = Vec3(1.25, 1.25, 1.25),
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
        colorScale = Vec3(0.25, 0.25, 0.25)
    },
    TonemapComponentData = {
        minExposure = 2,
        maxExposure = 6,
        middleGray = 0.75,
        exposureAdjustTime = 10,
        bloomScale = Vec3(0.3, 0.3, 0.3),
        tonemapMethod = 2
    },
    FogComponentData = {
        enable = true,
        fogDistanceMultiplier = 1.0,
        fogGradientEnable = true,
        start = 0.0,
        endValue = 75.0,
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

return {
    NightVision = NightVision,
}
