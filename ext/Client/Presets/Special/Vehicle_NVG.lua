return [[
{
    "Name": "DU_Vehicle_NVG",
    "Priority": "10",
    "Visibility": "1",
    "CharacterLighting": {

    },
    "DynamicEnvmap": {

    },
    "MotionBlur":{

    },
    "PlanarReflection":{

    },
    "ScreenEffect":{

    },
    "ColorCorrection":{
        "Enable":"true",
        "ColorGradingTexture":"FX/VisualEnviroments/NightVision/colorCube_flir_IRNVG_CoOp",
        "ColorGradingEnable":"true",
        "Brightness": "50.0:50.0:50.0:",
        "Contrast": "2.0:2.0:2.0:",
        "Saturation": "0.0:0.0:0.0:",
        "Hue": "0.0"
    },
    "Enlighten":{
        "Enable":"false"
    },
    "Fog":{
        "Enable":"false"
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
		  "Enable": "false"
		},
    "OutdoorLight":{
        "GroundColor":"(10.0, 40.00, 10.0)"
    },
    "FilmGrain":{
        "Enable":"false",
        "TextureScale":"(0.029999999329447746, 0.30000001192092896)",
        "ColorScale":"(0.029999999329447746, 0.029999999329447746, 0.029999999329447746)",
        "LinearFilteringEnable":"false",
        "RandomEnable":"true",
        "Texture": "Systems/PostProcess/FilmGrainNoise"
    },
    "Tonemap":{
        "TonemapMethod": "2",
        "MiddleGray":"15.15000000596046448",
        "MinExposure":"10.30000001192092896",
        "MaxExposure":"100.0",
        "ExposureAdjustTime":"0.01",
        "BloomScale":"(0.0, 0.0, 0.0)"
    },
    "Vignette":{
        "Enable":"false",
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
    	"StaticEnvmapScale": "0.0",
        "SkyGradientTexture":"FX/VisualEnviroments/NightVision/IRNVG_Sky_Gradient_01"
    },
    "SunFlare": {

    },
    "Wind":{

    },
    "ShaderParams": {
        "ParameterName":"FlirData",
        "Value": "(1.0, 1.0, 1.0, 1.0)"
    }
}
]]
