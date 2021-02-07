local Night = {
    OutdoorLightComponentData = {
        enable = true,
        realm = 0,
        skyColor = Vec3(0.15, 0.15, 0.15),
        groundColor = Vec3(0, 0.0, 0),
        sunColor = Vec3(0.5, 0.5, 0.5),
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
        translucencyPower = 80.0
    },
    SkyComponentData = {
        brightnessScale = 0.21,
        enable = true,
        sunSize = 0.02,
        sunScale = 0.5,
        realm = 2,
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
        cloudLayer1AlphaMul = 0.4,
        panoramicTexture = 'MoonNightSkybox',
        panoramicAlphaTexture = 'MoonNightAlpha',
        staticEnvmapTexture = 'MoonNightEnvmap',
        skyGradientTexture = 'MoonNightGradient',
        cloudLayer1Texture = 'MoonNightStars'
    },
    ColorCorrectionComponentData = {
        enable = true,
        brightness = Vec3(1, 1, 1),
        contrast = Vec3(1.1, 1.1, 1.1),
        saturation = Vec3(0.55, 0.55, 0.25)
    },
    TonemapComponentData = {
        minExposure = 0.1,
        maxExposure = 1.6,
        exposureAdjustTime = 0.60000002384186,
        bloomScale = Vec3(0.25, 0.25, 0.25),
        tonemapMethod = 2,
        middleGray = 0.25
    },
    FogComponentData = {
        enable = true,
        realm = 0,
        start = 40,
        endValue = 4000.0,
        curve = Vec4(0.4, -0.77, 1.3, -0.01),
        fogDistanceMultiplier = 1.0,
        fogGradientEnable = true,
        fogColorEnable = true,
        fogColor = Vec3(0.02, 0.05, 0.11),
        fogColorCurve = Vec4(6.1, -11.7, 5.62, -0.18),
        fogColorStart = 0,
        fogColorEnd = 10000,
        transparencyFadeStart = 0,
        transparencyFadeClamp = 1,
        transparencyFadeEnd = 3500,
        heightFogEnable = false
    },
    EnlightenComponentData = {
        enable = false,
        realm = 0,
        sunScale = 2.0,
        bounceScale = 1.0,
        cullDistance = -1.0,
        skyBoxEnable = true,
        skyBoxSkyColor = Vec3(0.022000, 0.078000, 0.177000),
        skyBoxSunLightColor = Vec3(0.282000, 0.991000, 3.000000),
        skyBoxGroundColor = Vec3(0.085000, 0.206000, 0.394000),
        skyBoxBackLightColor = Vec3(0.022000, 0.078000, 0.177000),
        skyBoxSunLightColorSize = 0.0,
        skyBoxBackLightColorSize = 0.62199997901917,
        skyBoxBackLightRotationX = 171.95899963379,
        skyBoxBackLightRotationY = 26.563999176025,
        terrainColor = Vec3(0.100000, 0.100000, 0.100000)
    },
    WindComponentData = {
        realm = 0,
        windDirection = 211.25799560547,
        windStrength = 0.99400001764297
    },
    SunFlareComponentData = {
        enable = false
    }
}

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
    Night = Night,
    Bright_Night = Bright_Night
}