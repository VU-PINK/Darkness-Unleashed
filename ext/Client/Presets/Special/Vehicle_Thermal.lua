return [[
{
    "Name": "DU_Vehicle_Thermal",
    "Priority": "10",
    "Visibility": "2",
    "CameraParams": {
        "ViewDistance": "-1.0",
        "NearPlane": "-1.0",
        "SunShadowmapViewDistance": "0.0"
    },
    "ColorCorrection":{
        "Enable":"true",
        "ColorGradingTexture":"FX/VisualEnviroments/NightVision/colorCube_flir_BW",
        "ColorGradingEnable":"true",
        "Brightness": "1.2999999523162842:1.2999999523162842:1.2999999523162842:",
        "Contrast": "1.2999999523162842:1.2999999523162842:1.2999999523162842:",
        "Saturation": "1.0:1.0:1.0:",
        "Hue": "0.0"
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
    "Enlighten":{
        "Enable":"false"
    },
    "Fog":{

    },
    "OutdoorLight":{
        "SunColor": "5:5:5:",
        "SkyColor": "5:5:5:",
        "GroundColor": "5:5:5:",
        "TranslucencyAmbient": "0.0",
        "TranslucencyScale": "0.0",
        "TranslucencyPower": "8.0",
        "TranslucencyDistortion": "0.10000000149011612"
    },
    "FilmGrain":{
        "Enable":"true",
        "TextureScale":"(0.10999999940395355, 0.10000000149011612)",
        "ColorScale":"(0.02500000037252903, 0.02500000037252903, 0.02500000037252903)",
        "LinearFilteringEnable":"false",
        "RandomEnable":"true"
    },
    "Vignette":{
        "Enable":"true",
        "Scale":"(2.0, 1.25)",
        "Exponent":"2.0",
        "Color":"(0.05900000035762787, 0.09399999678134918, 0.06499999761581421)",
        "Opacity":"0.800000011920929"
    },
    "Tonemap":{
        "TonemapMethod": "2",
        "MiddleGray":"0.25",
        "MinExposure":"0.25",
        "MaxExposure":"5",
        "ExposureAdjustTime":"0.5",
        "BloomScale":"(0.6000000238418579, 0.6000000238418579, 0.6000000238418579)",
        "ChromostereopsisEnable": "false",
        "ChromostereopsisScale": "1.0",
        "ChromostereopsisOffset": "1.0"
    },
    "Sky":{
    	"BrightnessScale": "0.10000000149011612",
        "SkyGradientTexture": "FX/VisualEnviroments/NightVision/IRNVG_Sky_Gradient_01"
    },
    "SunFlare": {

    },
    "Wind":{

    },
    "ShaderParams": {
        "ParameterName":"FlirData",
        "Value": "(0.30000001192092896, 0.30000001192092896, 0.30000001192092896, 0.30000001192092896)"
    },
    "ShaderParams": {
        "ParameterName":"MP007_BD_Emissive",
        "Value": "(0.029999999329447746, 0.029999999329447746, 0.029999999329447746, 0.029999999329447746)"
    }
}
]]
