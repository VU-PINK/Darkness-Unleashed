return [[
{
    "Name": "DU_NVG",
    "Priority": "2",
    "Visibility": "1",
    "ColorCorrection":{
        "Enable":"false",
        "ColorGradingTexture":"FX/VisualEnviroments/NightVision/colorCube_flir_IRNVG_CoOp",
        "ColorGradingEnable":"true",
        "Brightness": "1:1:1:",
        "Contrast": "1.15:1.15:1.15:",
        "Saturation": "1.0:1.0:1.0:",
        "Hue": "0.0"
    },
    "Dof":{
        "Enable":"false",
        "FocusDistance":"5.0",
        "BlurFilter":"4",
        "BlurFilterDeviation":"3.0",
        "NearDistanceScale":"0.30000001192093",
        "FarDistanceScale":"2.5",
        "Scale":"1.0",
        "BlurAdd":"0.0",
        "DiffusionDofEnable":"false",
        "DiffusionDofAperture":"5.0",
        "DiffusionDofFocalLength":"0.20000000298023"
    },
    "DynamicAO":{
        "Enable":"true",
        "SsaoFade":"1.0",
        "SsaoRadius":"0.75",
        "SsaoMaxDistanceInner":"1.0",
        "SsaoMaxDistanceOuter":"1.0",
        "HbaoRadius":"9.6700000762939",
        "HbaoAngleBias":"6.1999998092651",
        "HbaoAttenuation":"6.4099998474121",
        "HbaoContrast":"5.1999998092651",
        "HbaoMaxFootprintRadius":"5.9800000190735",
        "HbaoPowerExponent":"6.3000001907349"
    },
    "FilmGrain":{
        "Enable":"true",
        "TextureScale":"(0.55, 0.55)",
        "ColorScale":"(0.05999999046326, 0.08000000119209, 0.08000000119209)",
        "LinearFilteringEnable":"false",
        "RandomEnable":"true"
    },
    "Tonemap":{
        "MiddleGray":"0.50",
        "MinExposure":"0.25",
        "MaxExposure":"1.00",
        "ExposureAdjustTime":"3.0",
        "BloomScale":"(0.10000000149012, 0.10000000149012, 0.10000000149012)",
        "ChromostereopsisEnable":"true",
        "ChromostereopsisScale":"1.0",
        "ChromostereopsisOffset":"1.0"
    },
    "Vignette":{
        "Enable":"true",
        "Scale":"(2.4000000953674, 2.4000000953674)",
        "Exponent":"1.5",
        "Color":"(0.0, 0.20000000298023, 0.20000000298023)",
        "Opacity":"0.80000001192093"
    },
    "Sky":{
        "Enable":"true",
        "SkyGradientTexture":"FX/VisualEnviroments/NightVision/IRNVG_Sky_Gradient_01"
    }
}
]]