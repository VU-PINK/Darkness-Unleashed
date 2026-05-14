return [[
{
    "Name": "DU_Vehicle_NVG",
    "Priority": "10",
    "Visibility": "1",
    "CameraParams": {
        "ViewDistance": "8000.0",
        "NearPlane": "5.0",
        "SunShadowmapViewDistance": "-1.0"
    },
    "ColorCorrection":{
        "Enable":"true",
        "ColorGradingTexture":"FX/VisualEnviroments/NightVision/colorCube_flir_IRNVG_CoOp",
        "ColorGradingEnable":"true",
        "Brightness": "2.0:2.0:2.0:",
        "Contrast": "2.0:2.0:2.0:",
        "Saturation": "0.0:0.0:0.0:",
        "Hue": "0.0"
    },
    "Enlighten":{
        "Enable":"false"
    },
    "Fog":{

    },
    "Dof": {
		  "Enable": "false",
		  "FocusDistance": "1500.0",
		  "BlurFilter": "4",
		  "BlurFilterDeviation": "8.0",
		  "NearDistanceScale": "1.0",
		  "FarDistanceScale": "1.5",
		  "Scale": "1.0",
		  "BlurAdd": "0.0",
		  "DiffusionDofEnable": "false",
		  "DiffusionDofAperture": "5.0",
		  "DiffusionDofFocalLength": "0.20000000298023"
	},
    "DynamicAO": {
		  "Enable": "true",
		  "SsaoFade": "1.0",
		  "SsaoRadius": "1.0",
		  "SsaoMaxDistanceInner": "1.0",
		  "SsaoMaxDistanceOuter": "1.0",
		  "HbaoRadius": "42.66699981689453",
		  "HbaoAngleBias": "3.1530001163482666",
		  "HbaoAttenuation": "0.699999988079071",
		  "HbaoContrast": "1.399999976158142",
		  "HbaoMaxFootprintRadius": "0.10000000149011612",
		  "HbaoPowerExponent": "1.0"
		},
     "OutdoorLight":{
        "SunColor": "( 0.019999999552965164, 0.019999999552965164, 0.019999999552965164)",
        "SkyColor": "( 1.0, 1.0, 1.0)",
        "GroundColor": "(0.0, 0.0, 0.0)",
        "SkyLightAngleFactor": "0.0",
        "SunSpecularScale": "0.0",
	    "SkyEnvmapShadowScale":" 0.0",
	    "CloudShadowEnable": "false"
    },
    "FilmGrain":{
        "Enable":"true",
        "TextureScale":"(0.029999999329447746, 0.30000001192092896)",
        "ColorScale":"(0.029999999329447746, 0.029999999329447746, 0.029999999329447746)",
        "LinearFilteringEnable":"false",
        "RandomEnable":"true",
        "Texture": "Systems/PostProcess/FilmGrainNoise"
    },
    "Tonemap":{
        "TonemapMethod": "2",
        "MiddleGray":"0.15000000596046448",
        "MinExposure":"0.30000001192092896",
        "MaxExposure":"50.0",
        "ExposureAdjustTime":"0.05000000074505806",
        "BloomScale":"(0.125, 0.125, 0.125)",
        "ChromostereopsisEnable":"true",
        "ChromostereopsisScale":"1.0",
        "ChromostereopsisOffset":"0.1"
    },
    "Vignette":{
        "Enable":"true",
        "Scale":"(2.5, 1.0)",
        "Exponent":"10.0",
        "Color":"(0.0, 0.0, 0.0)",
        "Opacity":"0.0560000017285347"
    },
    "LensScope": {
		"Enable": "true",
        "ChromaticAberrationColor1": "0.0:0.7070000171661377:0.7070000171661377:",
		"ChromaticAberrationColor2": "0.7070000171661377:0.0:0.7070000171661377:",
		"RadialBlendDistanceCoefficients": "0.07999999821186066:0.07999999821186066:",
		"ChromaticAberrationDisplacement1": "-0.00019999999494757503:0.00039999998989515007:",
        "ChromaticAberrationDisplacement2": "0.0006000000284984708:0.0:",
		"ChromaticAberrationStrengths": "0.800000011920929:0.0:",
		"BlurScale": "0.9998999834060669",
        "BlurCenter": "(0.5, 0.5)"
    },
    "Sky":{
    	"StaticEnvmapScale": "1.0",
        "SkyGradientTexture":"FX/VisualEnviroments/NightVision/IRNVG_Sky_Gradient_01"
    },
    "SunFlare": {

    },
    "Wind":{

    },
    "ShaderParams": {
        "ParameterName":"FlirData",
        "Value": "(1, 1, 1, 1)"
    }
}
]]
