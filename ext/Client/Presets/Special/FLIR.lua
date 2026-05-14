return [[
{
    "Name": "DU_FLIR",
    "Priority": "10",
    "Visibility": "0",
    "CharacterLighting": {
    },
    "DynamicEnvmap": {
    },
    "MotionBlur": {
    },
    "PlanarReflection": {
    },
    "ScreenEffect": {
    },
    "CameraParams": {
        "ViewDistance": "-1.0",
        "NearPlane": "-1.0",
        "SunShadowmapViewDistance": "0.0"
    },
    "ColorCorrection": {
        "Enable": "true",
        "Brightness": "(1.2999999523162842, 1.2999999523162842, 1.2999999523162842)",
        "Contrast": "(1.2999999523162842, 1.2999999523162842, 1.2999999523162842)",
        "Saturation": "(1.0, 1.0, 1.0)",
        "Hue": "0.0",
        "ColorGradingEnable": "true",
        "ColorGradingTexture": "FX/VisualEnviroments/NightVision/colorCube_flir_BW"
    },
    "Enlighten": {
        "Enable": "true"
    },
    "DynamicAO": {
        "Enable": "true",
        "SsaoFade": "1.0",
        "SsaoRadius": "1.0",
        "SsaoMaxDistanceInner": "1.0",
        "SsaoMaxDistanceOuter": "1.0",
        "HbaoRadius": "1.0",
        "HbaoAngleBias": "0.0",
        "HbaoAttenuation": "0.699999988079071",
        "HbaoContrast": "1.399999976158142",
        "HbaoMaxFootprintRadius": "0.10000000149011612",
        "HbaoPowerExponent": "1.0"
    },
    "FilmGrain": {
        "Enable": "true",
        "TextureScale": "(0.10999999940395355, 0.10000000149011612)",
        "ColorScale": "(0.02500000037252903, 0.02500000037252903, 0.02500000037252903)",
        "LinearFilteringEnable": "true",
        "RandomEnable": "true"
    },
    "Fog": {
        "Enable": "true",
        "FogDistanceMultiplier": "1.0",
        "FogGradientEnable": "true",
        "Start": "0",
        "EndValue": "2000",
        "Curve": "(-0.042334575206041336, 0.5502106547355652, 0.5809825658798218, -0.08835604041814804)",
        "FogColorEnable": "true",
        "FogColor": "(0.017000000923871994, 0.017000000923871994, 0.017000000923871994)",
        "FogColorStart": "0.0",
        "FogColorEnd": "1000",
        "FogColorCurve": "(-0.8003332018852234, 2.2526183128356934, -0.3408157229423523, 0.005141695030033588)",
        "HeightFogEnable": "true",
        "HeightFogFollowCamera": "0.0",
        "HeightFogAltitude": "0.0",
        "HeightFogDepth": "100.0",
        "HeightFogVisibilityRange": "100.0"
    },
    "OutdoorLight": {
        "Enable": "true",
        "SunColor": "(0.30000001192092896, 0.30000001192092896, 0.30000001192092896)",
        "SkyColor": "(0.5, 0.5, 0.5)",
        "GroundColor": "(0.5, 0.5, 0.5)",
        "SkyLightAngleFactor": "0",
        "SunSpecularScale": "0",
        "SkyEnvmapShadowScale": "0",
        "SunShadowHeightScale": "0.05000000074505806",
        "CloudShadowEnable": "true",
        "CloudShadowSpeed": "(2.0, 2.0)",
        "CloudShadowSize": "500",
        "CloudShadowCoverage": "0.30000001192092896",
        "CloudShadowExponent": "8",
        "TranslucencyAmbient": "0.0",
        "TranslucencyScale": "0.0",
        "TranslucencyPower": "8.0",
        "TranslucencyDistortion": "0.10000000149011612"
    },
    "ShaderParams": {
        "ParameterName": "FLIRData",
        "Value": "(0.5, 0.5, 0.3, 0.5)"
    },
    "Sky": {
        "Enable": "true",
        "BrightnessScale": "0.10000000149011612",
        "SunSize": "0",
        "SunScale": "1.0",
        "PanoramicUVMinX": "0.0",
        "PanoramicUVMaxX": "1.0",
        "PanoramicUVMinY": "0.0",
        "PanoramicUVMaxY": "1.0",
        "PanoramicTileFactor": "1.0",
        "PanoramicRotation": "0",
        "CloudLayerSunColor": "(1.0, 1.0, 1.0)",
        "CloudLayer1Altitude": "1000.0",
        "CloudLayer1TileFactor": "0.25",
        "CloudLayer1Rotation": "0",
        "CloudLayer1Speed": "0.009999999776482582",
        "CloudLayer1SunLightIntensity": "4.0",
        "CloudLayer1SunLightPower": "50.0",
        "CloudLayer1AmbientLightIntensity": "0.20000000298023224",
        "CloudLayer1Color": "(1.0, 1.0, 1.0)",
        "CloudLayer1AlphaMul": "1.0",
        "CloudLayer2Altitude": "1000.0",
        "CloudLayer2TileFactor": "0.25",
        "CloudLayer2Rotation": "0",
        "CloudLayer2Speed": "0.009999999776482582",
        "CloudLayer2SunLightIntensity": "4.0",
        "CloudLayer2SunLightPower": "50.0",
        "CloudLayer2AmbientLightIntensity": "0.20000000298023224",
        "CloudLayer2Color": "(1.0, 1.0, 1.0)",
        "CloudLayer2AlphaMul": "1.0",
        "StaticEnvmapScale": "1",
        "SkyEnvmap8BitTexScale": "0.25",
        "CustomEnvmapScale": "1",
        "CustomEnvmapAmbient": "0",
        "SkyVisibilityExponent": "1.0",
        "SkyGradientTexture": "FX/VisualEnviroments/NightVision/IRNVG_Sky_Gradient_01"
    },
    "Tonemap": {
        "TonemapMethod": "2",
        "MiddleGray": "0.25",
        "MinExposure": "0.25",
        "MaxExposure": "5.0",
        "ExposureAdjustTime": "0.5",
        "BloomScale": "(0.6000000238418579, 0.6000000238418579, 0.6000000238418579)",
        "ChromostereopsisEnable": "true",
        "ChromostereopsisScale": "1.0",
        "ChromostereopsisOffset": "1.0"
    },
    "Vignette": {
        "Enable": "true",
        "Scale": "(2.0, 1.25)",
        "Exponent": "2.0",
        "Color": "(0.05900000035762787, 0.09399999678134918, 0.06499999761581421)",
        "Opacity": "0.800000011920929"
    }
}
]]