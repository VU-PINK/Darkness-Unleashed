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
        "TonemapMethod": "2",
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
    "SunFlare": {
        "Realm": "0",
        "Enable": "false",
        "DebugDrawOccluder": "false",
        "OccluderSize": "300.0",
        "Element1Enable": "false",
        "Element1RayDistance": "0.0",
        "Element1Size": "0.1:0.1:",
        "Element1SizeOccluderCurve": "(0.000000, 0.000000, -2.971014, 3.561449)",
        "Element1SizeScreenPosCurve": "(0.000000, 0.000000, -0.468144, 1.045845)",
        "Element1AlphaOccluderCurve": "(-0.169719, -0.203206, -0.130994, 0.596260)",
        "Element1AlphaScreenPosCurve": "(0.000000, 0.000000, 0.000000, 0.130000)",
        "Element2Enable": "false",
        "Element2RayDistance": "0",
        "Element2Size": "0.1:0.1:",
        "Element2SizeOccluderCurve": "(0.000000, 0.000000, 0.000000, 1.005000)",
        "Element2SizeScreenPosCurve": "(0.000000, 0.000000, 1.046446, 0.001858)",
        "Element2AlphaOccluderCurve": "(0.000000, 0.000000, -1.125922, 0.364515)",
        "Element2AlphaScreenPosCurve": "(0.000000, 0.000000, 0.016854, -0.005730)",
        "Element3Enable": "false",
        "Element3RayDistance": "0.0",
        "Element3Size": "0.1:0.1:",
        "Element3SizeOccluderCurve": "(0.000000, 0.000000, 0.000000, 1.005000)",
        "Element3SizeScreenPosCurve": "(0.000000, 0.000000, 0.743084, 0.278439)",
        "Element3AlphaOccluderCurve": "(0.000000, 0.000000, -0.564839, 0.343529)",
        "Element3AlphaScreenPosCurve": "(0.000000, 0.000000, 0.701987, 0.365265)",
        "Element4Enable": "false",
        "Element4RayDistance": "0.0",
        "Element4Size": "(1.000000, 1.000000)",
        "Element4SizeOccluderCurve": "(0.000000, 0.000000, 0.000000, 0.985000)",
        "Element4SizeScreenPosCurve": "(0.000000, 0.000000, 0.000000, 0.975000)",
        "Element4AlphaOccluderCurve": "(0.000000, 0.000000, -12.026724, 0.478798)",
        "Element4AlphaScreenPosCurve": "(0.000000, 0.000000, 0.000000, 1.000000)",
        "Element5Enable": "false",
        "Element5RayDistance": "1.0",
        "Element5Size": "(0.800000, 0.800000)",
        "Element5SizeOccluderCurve": "(0.000000, 0.000000, 0.000000, 1.000000)",
        "Element5SizeScreenPosCurve": "(0.000000, 0.000000, 0.000000, 0.820000)",
        "Element5AlphaOccluderCurve": "(0.000000, 0.000000, -0.289483, 0.029082)",
        "Element5AlphaScreenPosCurve": "(0.000000, 0.000000, -0.930245, 0.629199)"
    },
    "Wind":{
        "WindDirection":"211.25799560547",
        "WindStrength":"1.7000000476837"
    },
    "ShaderParams": {
        "ParameterName":"FlirData",
        "Value": "(0.5, 0.5, 0.5, 0.5)"
    }
}
]]
