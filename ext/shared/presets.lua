local Bright_Night = {
    OutdoorLightComponentData = {
        enable = true,
        sunColor = Vec3(0.001, 0.001, 0.001),
        skyColor = Vec3(0.089, 0.089, 0.091),
        groundColor = Vec3(0.01, 0.01, 0.01),
        skyEnvmapShadowScale = 0.25
    },
    SkyComponentData = {
        enable = true,
	    brightnessScale = (0.25),
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
        customEnvmapScale = 1.0,
        customEnvmapAmbient = 0.05,
        cloudLayer1Altitude = 2000000.0,
        cloudLayer1TileFactor = 0.600000023842,
        cloudLayer1Rotation = 237.072998047,
        cloudLayer1Speed = -0.0010000000475,
        cloudLayer1SunLightIntensity = 0.3,
        cloudLayer1SunLightPower = 0.3,
        cloudLayer1AmbientLightIntensity = 0.5,
        cloudLayer1AlphaMul = 0.1,
        cloudLayer1Texture = 'MoonNightStars',
        panoramicTexture = 'MoonNightSkybox',
        panoramicAlphaTexture = 'MoonNightAlpha',
        staticEnvmapTexture = 'MoonNightEnvmap',
        skyGradientTexture = 'MoonNightGradient'
    },
    ColorCorrectionComponentData = {
        enable = true,
        brightness = Vec3(1, 1, 1),
        contrast = Vec3(1.15, 1.15, 1.15),
        saturation = Vec3(1, 0.95, 1)
    },
    TonemapComponentData = {
        minExposure = 0.2,
        maxExposure = 4,
        exposureAdjustTime = 1.5,
        bloomScale = Vec3(0.05, 0.05, 0.05),
        tonemapMethod = 2
    },
    FogComponentData = {
        enable = true,
        fogDistanceMultiplier = 1.0,
        fogGradientEnable = true,
        start = 20,
        endValue = 45,
        curve = Vec4(0.45, 0.35, 0.25, -2),
        fogColorEnable = true,
        fogColorStart = 0,
        fogColorEnd = 1450,
        fogColorCurve = Vec4(0.4, 0.35, 0.2, -2),
        transparencyFadeStart = 0,
        transparencyFadeEnd = 208,
        transparencyFadeClamp = 1.0,
        fogColor = Vec3((0.4), (0.4), (0.4))
    },
    EnlightenComponentData = {
        enable = false
    },
    SunFlareComponentData = {
        enable = false
    }
}

return {
    Bright_Night = Bright_Night
}