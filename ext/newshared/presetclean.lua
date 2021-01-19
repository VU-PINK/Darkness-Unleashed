require '__shared/settings' --settings
require '__shared/functionclean' -- functions

--------------------------------------------------------------------------------

local Preset = class('Preset')

-- Night --
function Preset:Night()
print('Loading Night Preset')
        -- OutdoorLightComponentData --

        local SunColor = Vec3(0.02, 0.02, 0.02)
        local SkyColor = Vec3(0.01, 0.01, 0.01)
        local groundColor = Vec3(0, 0, 0)

        local skyEnvmapShadowScale = 0.25

        -- SkyComponentData --

        local brightnessScale = (0.0005*BrightnessMultiplicator)

        local sunSize = 15
        local sunScale = 15

        local cloudLayer1SunLightIntensity = 0.0001
        local cloudLayer1SunLightPower = 0.0001
        local cloudLayer1AmbientLightIntensity = 0.0005

        local cloudLayer2SunLightIntensity = 0.0001
        local cloudLayer2SunLightPower = 0.0001
        local cloudLayer2AmbientLightIntensity = 0.0005

        local staticEnvmapScale = 0.1
        local skyEnvmap8BitTexScale = 1
        local customEnvmapAmbient = 0.05

        local panoramicRotation = rotation

        -- FogComponentData --

        local fogEnable = true
        local fogColorEnable = true


        local fogStart = 2
        local fogEndValue = 65
        local fogColorStart = 2
        local fogColorEnd = 40

        local fogColor = Vec3(0.0005, 0.0005, 0.0000000015)
        local fogColorCurve = Vec4((0.30*FogMultiplicator), (0.20*FogMultiplicator), (0.15*FogMultiplicator), 0)

        local fogTransparencyFadeEnd = 50

        -- TonemapComponentData --

        local minExposure = 0.2
        local exposureAdjustTime = 1.5
        local bloomScale = tonemap.bloomScale * 0.25

        local tonemapMethod = TonemapMethod.TonemapMethod_FilmicNeutral

        -- ColorCorrectionComponentData --

        local Contrast = Vec3(1.05, 1.05, 1.05)
        local Saturation = Vec3(1.22, 1.25, 1.5)

        -- EnlightenComponentData --

        local enlightenEnable = false

        -- SunFlareComponentData --

        local SunFlareExcluded = true

        -- Mesh Assets --

        local shadervalue = nil

        -- EmitterTemplateData --

        local templateemissive = false

        -- LocalLightEntityData (Dynamic Lights) --

        local dynamicEnable = true
        local enlightenEnable = true
        local specularEnable = true

        -- LensFlareEntityData --

        local flaresVisible = false

        -- SpotLightEntityData (Flashlights) --

        local flashlightRadius = 220
        local flashlightIntensity = 1.4
        local flashlightConeOuterAngle = 35
        local flashlightorthoWidth = 7
        local flashlightorthoHeight = 7
        local flashlightfrustumFov = 40
        local flashlightcastShadowsEnable = true
        local flashlightcastShadowsMinLevel = 3
        local flashlightShape = 1

return true
end
