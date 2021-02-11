local NVG = { -- Night Vision Goggles
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
	      brightnessScale = 0.5,
        sunSize = 0.013,
        sunScale = 0.6,
        realm = 0,
        panoramicUVMinX = 0.280999988317,
        panoramicUVMaxX = 0.298999994993,
        panoramicUVMinY = 0.0630000010133,
        panoramicUVMaxY = 0.307000011206,
        panoramicTileFactor = 1.0,
        panoramicRotation = 260,
        staticEnvmapScale = 1,
        skyVisibilityExponent = 0.2,
        skyEnvmap8BitTexScale = 1,
        customEnvmapScale = 1,
        customEnvmapAmbient = 1,
        cloudLayer1Altitude = 2000000.0,
        cloudLayer1TileFactor = 0.600000023842,
        cloudLayer1Rotation = 237.072998047,
        cloudLayer1Speed = -0.0010000000475,
        cloudLayer1SunLightIntensity = 0.3,
        cloudLayer1SunLightPower = 0.3,
        cloudLayer1AmbientLightIntensity = 0.5,
        cloudLayer1AlphaMul = 0.25,
        cloudLayer1Texture = 'MoonNightStars',
        panoramicTexture = 'MoonNightSkybox',
        panoramicAlphaTexture = 'MoonNightAlpha',
        staticEnvmapTexture = 'MoonNightEnvmap',
        skyGradientTexture = 'MoonNightGradient'
    },
    ColorCorrectionComponentData = {
        enable = true,
        brightness = Vec3(1.5, 1.5, 1.5),
        contrast = Vec3(1.39999997616, 1.39999997616, 1.39999997616),
        saturation = Vec3(0.800000011921, 0.800000011921, 0.800000011921),
        hue = 0.0,
        colorGradingTexture = 'NV_colorGradingTexture',
        colorGradingEnable = true
    },
    FilmGrainComponentData = {
        enable = true,
        realm = 0,
        textureScale = Vec2(0.40000000596, 0.40000000596),
        texture = 'NV_FilmGrain',
        randomEnable = true,
        linearFilteringEnable = false,
        colorScale = Vec3(0.10, 0.10, 0.10)
    },
    TonemapComponentData = {
        minExposure = 0.25,
        maxExposure = 1.75,
        exposureAdjustTime = 1.75,
        bloomScale = Vec3(0.2, 0.2, 0.2),
        tonemapMethod = 2
    },
    FogComponentData = {
        enable = true,
        fogDistanceMultiplier = 1.0,
        fogGradientEnable = true,
        start = 0.0,
        endValue = 250.0,
        curve = Vec4(1.11925065517, -1.70694792271, 1.49723529816, -0.148290395737),
        fogColorEnable = true,
        fogColorStart = 0,
        fogColorEnd = 10000,
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
    ShaderParamsComponentData = {
        value = Vec4(0.55, 0.55, 0.55, 0.55),
        parameterName = 'FLIRData'
    },
    VignetteComponentData = {
        enable = true,
        realm = 0,
        scale = Vec2(2.8, 2.4),
        color = Vec3(0.1, 0.1, 0.1),
        exponent = 2.0,
        opacity = 0.6
    },
    LensScopeComponentData = {
        enable = true,
        realm = 0,
        blurCenter = Vec2(0.5, 0.5),
        blurScale = 0.999000012875,
        chromaticAberrationColor1 = Vec3(0.0, 0.707000017166, 0.707000017166),
        chromaticAberrationColor2 = Vec3(0.707000017166, 0.0, 0.707000017166),
        chromaticAberrationStrengths = Vec2(0.20000000298, 0.20000000298),
        chromaticAberrationDisplacement1 = Vec2(-0.00200000009499, 0.00400000018999),
        chromaticAberrationDisplacement2 = Vec2(0.00600000005215, 0.0),
        radialBlendDistanceCoefficients = Vec2(4.0, -0.5)
    }
}


return {
    NVG = NVG
}
