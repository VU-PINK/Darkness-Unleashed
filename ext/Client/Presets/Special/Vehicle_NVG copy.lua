return [[
{
    "Name": "DU_Vehicle_NVG",
    "Priority": "100",
    "Visibility": "1",
    "ColorCorrection":{
        "Enable":"true",
        "ColorGradingTexture":"FX/VisualEnviroments/NightVision/colorCube_flir_IRNVG_CoOp",
        "ColorGradingEnable":"true",
        "Brightness": "1:1:1:",
        "Contrast": "1.00:1.00:1.00:",
        "Saturation": "1.0:1.0:1.0:",
        "Hue": "0.0"
    },
    "Enlighten":{
        "Enable":"false",
        "BounceScale":"0.10000000149012",
        "SunScale":"0.0",
        "TerrainColor":"(0.0, 0.0, 0.0)",
        "CullDistance":"-1.0",
        "SkyBoxEnable":"true",
        "SkyBoxSkyColor":"(0.021999999880791, 0.078000001609325, 0.17700000107288)",
        "SkyBoxGroundColor":"(0.08500000089407, 0.20600000023842, 0.39399999380112)",
        "SkyBoxSunLightColor":"(0.28200000524521, 0.99099999666214, 3.0)",
        "SkyBoxSunLightColorSize":"0.0",
        "SkyBoxBackLightColor":"(0.021999999880791, 0.078000001609325, 0.17700000107288)",
        "SkyBoxBackLightColorSize":"0.10000000149012",
        "SkyBoxBackLightRotationX":"171.95899963379",
        "SkyBoxBackLightRotationY":"26.563999176025"
    },
    "Fog":{
        "Enable":"true",
        "FogDistanceMultiplier":"1.0",
        "FogGradientEnable":"true",
        "Start":"-50.0",
        "EndValue":"500.0",
        "Curve":"(0.40000000596046, -0.76999998092651, 1.2999999523163, -0.0099999997764826)",
        "FogColorEnable":"true",
        "FogColor":"(0.0020000000949949, 0.0020000000949949, 0.0020000000949949)",
        "FogColorStart":"0.0",
        "FogColorEnd":"1630.4348144531",
        "FogColorCurve":"(6.0999999046326, -11.699999809265, 5.6199998855591, -0.18000000715256)",
        "TransparencyFadeStart":"0.0",
        "TransparencyFadeEnd":"0.0",
        "TransparencyFadeClamp":"0.91299998760223",
        "HeightFogEnable":"false",
        "HeightFogFollowCamera":"0.0",
        "HeightFogAltitude":"0.0",
        "HeightFogDepth":"100.0",
        "HeightFogVisibilityRange":"100.0"
    },
    "OutdoorLight":{
        "Enable":"true",
        "SunRotationX": "150.0",
        "SunRotationY":"0.0",
        "SunColor":"(0.1, 0.1, 0.1)",
        "SkyColor":"(0.1, 0.1, 0.1)",
        "GroundColor":"(0.25, 0.25, 0.25)",
        "SunSpecularScale":"0.0",
        "SkyEnvmapShadowScale":"0.25",
        "SunShadowHeightScale":"0.0",
        "CloudShadowEnable":"false",
        "CloudShadowSpeed":"(-15.0, -15.0)",
        "CloudShadowSize":"53.260898590088",
        "CloudShadowCoverage":"0.0",
        "CloudShadowExponent":"5.108699798584",
        "TranslucencyAmbient":"0.0",
        "TranslucencyScale":"1.0",
        "TranslucencyPower":"80.0",
        "TranslucencyDistortion":"0.10000000149012"
    },
    "FilmGrain":{
        "Enable":"true",
        "TextureScale":"(0.55, 0.55)",
        "ColorScale":"(0.05999999046326, 0.08000000119209, 0.08000000119209)",
        "LinearFilteringEnable":"false",
        "RandomEnable":"true"
    },
    "Tonemap":{
        "TonemapMethod":"1",
        "MiddleGray":"0.75",
        "MinExposure":"2.5",
        "MaxExposure":"8",
        "ExposureAdjustTime":"10.0",
        "BloomScale":"(0.1, 0.1, 0.1)",
        "ChromostereopsisEnable":"true",
        "ChromostereopsisScale":"1.0",
        "ChromostereopsisOffset":"0.1"
    },
    "Sky":{
        "Enable":"false"
    },
    "Wind":{
        "WindDirection":"211.25799560547",
        "WindStrength":"1.7000000476837"
    },
    "ShaderParams": {
        "ParameterName":"FlirData",
        "Value": "(0.4, 0.4, 0.4, 0.4)"
    }
}
]]
