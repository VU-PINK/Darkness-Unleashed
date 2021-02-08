local Night = {
    OutdoorLightComponentData = {
        enable = true,
        sunColor = Vec3(0, 0, 0),
        skyColor = Vec3(0.04, 0.04, 0.04),
        groundColor = Vec3(0.015, 0.015, 0.015),
        skyEnvmapShadowScale = 0.25,
        cloudShadowEnable = true,
        cloudShadowSize = 2000.0,
        cloudShadowExponent = 3,
        cloudShadowCoverage = 0.44,
        cloudShadowSpeed = Vec2(-15.000000, -15.000000),
        skyLightAngleFactor = 0.0089999996125698,
        sunSpecularScale = 4,
        skyEnvmapShadowScale = 0.4,
        sunShadowHeightScale = 1,
        translucencyDistortion = 0.10000000149012,
        translucencyAmbient = 0,
        translucencyScale = 1,
        translucencyPower = 80.0,
        sunRotationX = 255.48399353027,
        sunRotationY = 25
    },
    SkyComponentData = {
        enable = true,
        brightnessScale = 0.01,
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
        brightness = Vec3(1, 1, 1),
        contrast = Vec3(1.1, 1.1, 1.1),
        saturation = Vec3(1, 1, 1.05)
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
        start = 15,
        endValue = 150,
        curve = Vec4(0.4, -0.77, 1.3, -0.01),
        fogColorEnable = true,
        fogColorStart = 0,
        fogColorEnd = 5000,
        fogColorCurve = Vec4(6.1, -11.7, 5.62, -0.18),
        transparencyFadeStart = 0,
        transparencyFadeEnd = 150,
        transparencyFadeClamp = 1.0,
        fogColor = Vec3(0.014, 0.015, 0.035)
    },
    EnlightenComponentData = {
        enable = false
    },
    WindComponentData = {
        realm = 0,
        windDirection = 211.25799560547,
        windStrength = 1.4
    },
    SunFlareComponentData = {
        enable = false
    }
}

local Bright_Night = {
    OutdoorLightComponentData = {
        enable = true,
        sunColor = Vec3(0.2, 0.2, 0.2),
        skyColor = Vec3(0.04, 0.04, 0.04),
        groundColor = Vec3(0.015, 0.015, 0.015),
        skyEnvmapShadowScale = 0.25,
        cloudShadowEnable = true,
        cloudShadowSize = 2000.0,
        cloudShadowExponent = 3,
        cloudShadowCoverage = 0.44,
        cloudShadowSpeed = Vec2(-15.000000, -15.000000),
        skyLightAngleFactor = 0.0089999996125698,
        sunSpecularScale = 4,
        skyEnvmapShadowScale = 0.4,
        sunShadowHeightScale = 1,
        translucencyDistortion = 0.10000000149012,
        translucencyAmbient = 0,
        translucencyScale = 1,
        translucencyPower = 80.0,
        sunRotationX = 255.48399353027,
        sunRotationY = 25
    },
    SkyComponentData = {
        enable = true,
	      brightnessScale = 0.3,
        sunSize = 0.013,
        sunScale = 0.6,
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
        brightness = Vec3(1, 1, 1),
        contrast = Vec3(1.1, 1.1, 1.1),
        saturation = Vec3(1, 1, 1.05)
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
        start = 25,
        endValue = 800,
        curve = Vec4(0.4, -0.77, 1.3, -0.01),
        fogColorEnable = true,
        fogColorStart = 0,
        fogColorEnd = 5000,
        fogColorCurve = Vec4(6.1, -11.7, 5.62, -0.18),
        transparencyFadeStart = 0,
        transparencyFadeEnd = 150,
        transparencyFadeClamp = 1.0,
        fogColor = Vec3(0.08, 0.0615, 0.0157)
    },
    EnlightenComponentData = {
        enable = false
    },
    SunFlareComponentData = {
        enable = false
    }
}

return {
    Night = Night,
    Bright_Night = Bright_Night
}
