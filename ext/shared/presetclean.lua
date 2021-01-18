require '__shared/settings' --settings
require '__shared/functionclean' -- functions

--------------------------------------------------------------------------------

local Preset = class('Preset')

function Preset:Save()
        if presetsaved ~= true then
                -- OutdoorLightComponentData --
                local outdoor = OutdoorLightComponentData(instance)

                local SunColor = outdoor.sunColor
                local SkyColor = outdoor.skyColor
                local groundColor = outdoor.groundColor

                local skyEnvmapShadowScale = outdoor.skyEnvmapShadowScale

                -- SkyComponentData --
                local sky = SkyComponentData(instance)

                local brightnessScale = sky.brightnessScale

                local sunSize = sky.sunSize
                local sunScale = sky.sunScale

                local cloudLayer1SunLightIntensity = sky.cloudLayer1SunLightIntensity
                local cloudLayer1SunLightPower = sky.cloudLayer1SunLightPower
                local cloudLayer1AmbientLightIntensity = sky.cloudLayer1AmbientLightIntensity

                local cloudLayer2SunLightIntensity = sky.cloudLayer2SunLightIntensity
                local cloudLayer2SunLightPower = sky.cloudLayer2SunLightPower
                local cloudLayer2AmbientLightIntensity = sky.cloudLayer2AmbientLightIntensity

                local staticEnvmapScale = sky.staticEnvmapScale
                local skyEnvmap8BitTexScale = sky.skyEnvmap8BitTexScale
                local customEnvmapAmbient = sky.customEnvmapAmbient

                local panoramicRotation = sky.panoramicRotation

                -- FogComponentData --
                local fog = FogComponentData(instance)

                local fogEnable = fog.enable
                local fogColorEnable = fog.start

                local fogStart = fog.fogColorStart
                local fogEndValue = fog.fogColorEnd

                local fogColor = fog.fogColor
                local fogColorCurve = fog.fogColorCurve

                local fogTransparencyFadeEnd = fog.transparencyFadeEnd

                -- TonemapComponentData --
                local tonemap = TonemapComponentData(instance)

                local minExposure = tonemap.minExposure
                local exposureAdjustTime = tonemap.exposureAdjustTime
                local bloomScale = tonemap.bloomScale

                local tonemapMethod = tonemap.tonemapMethod

                -- ColorCorrectionComponentData --
                local color = ColorCorrectionComponentData(instance)

                local Contrast = color.contrast
                local Saturation = color.saturation

                -- EnlightenComponentData --
                local enlighten = EnlightenComponentData(instance)

                local enlightenEnable = enlighten.enable

                -- SunFlareComponentData --
                local flare = SunFlareComponentData(instance)

                local SunFlareExcluded = flare.excluded

                -- Mesh Assets --
                --local shadervalue =

                -- EmitterTemplateData --

                --local templateemissive =

                -- LocalLightEntityData (Dynamic Lights) --
                local Dynamic = LocalLightEntityData(instance)

                local dynamicEnable = Dynamic.visible
                local enlightenEnable = Dynamic.enlightenEnable
                local specularEnable = Dynamic.specularEnable

                -- LensFlareEntityData --
                local flares = LensFlareEntityData(instance)

                local flaresVisible = flares.visible

                -- SpotLightEntityData (Flashlights) --

                local flashlightRadius = 220
                local flashlightIntensity = 1.4
                local flashlightConeOuterAngle = 35
                local flashlightorthoWidth = 7
                local flashlightorthoHeight = 7
                local flashlightfrustumFov = 40
                local flashlightcastShadowsEnable = true
                local flashlightcastShadowsMinLevel = QualityLevel.QualityLevel_Ultra
                local flashlightShape = 0
                presetsaved = true
                return true
        else
                print('Standard Preset already saved')
                return false
end

--- Standard ---
function Preset:Standard()

        -- OutdoorLightComponentData --

        local SunColor =
        local SkyColor =
        local groundColor =

        local skyEnvmapShadowScale =

        -- SkyComponentData --

        local brightnessScale =

        local sunSize =
        local sunScale =

        local cloudLayer1SunLightIntensity =
        local cloudLayer1SunLightPower =
        local cloudLayer1AmbientLightIntensity =

        local cloudLayer2SunLightIntensity =
        local cloudLayer2SunLightPower =
        local cloudLayer2AmbientLightIntensity =

        local staticEnvmapScale =
        local skyEnvmap8BitTexScale =
        local customEnvmapAmbient =

        local panoramicRotation =

        -- FogComponentData --

        local fogEnable =
        local fogColorEnable =

        local fogStart =
        local fogEndValue =

        local fogColor =
        local fogColorCurve =

        local fogTransparencyFadeEnd =

        -- TonemapComponentData --

        local minExposure =
        local exposureAdjustTime =
        local bloomScale =

        local tonemapMethod =

        -- ColorCorrectionComponentData --

        local Contrast =
        local Saturation =

        -- EnlightenComponentData --

        local enlightenEnable =

        -- SunFlareComponentData --

        local SunFlareExcluded =

        -- Mesh Assets --

        local shadervalue =

        -- EmitterTemplateData --

        local templateemissive =

        -- LocalLightEntityData (Dynamic Lights) --

        local dynamicEnable =
        local enlightenEnable =
        local specularEnable =

        -- LensFlareEntityData --

        local flaresVisible =

        -- SpotLightEntityData (Flashlights) --

        local flashlightRadius =
        local flashlightIntensity =
        local flashlightConeOuterAngle =
        local flashlightorthoWidth =
        local flashlightorthoHeight =
        local flashlightfrustumFov =
        local flashlightcastShadowsEnable =
        local flashlightcastShadowsMinLevel =
        local flashlightShape =

return true
end

-- Night --
function Preset:Night()

        -- OutdoorLightComponentData --

        local SunColor =
        local SkyColor =
        local groundColor =

        local skyEnvmapShadowScale =

        -- SkyComponentData --

        local brightnessScale =

        local sunSize =
        local sunScale =

        local cloudLayer1SunLightIntensity =
        local cloudLayer1SunLightPower =
        local cloudLayer1AmbientLightIntensity =

        local cloudLayer2SunLightIntensity =
        local cloudLayer2SunLightPower =
        local cloudLayer2AmbientLightIntensity =

        local staticEnvmapScale =
        local skyEnvmap8BitTexScale =
        local customEnvmapAmbient =

        local panoramicRotation =

        -- FogComponentData --

        local fogEnable =
        local fogColorEnable =

        local fogStart =
        local fogEndValue =

        local fogColor =
        local fogColorCurve =

        local fogTransparencyFadeEnd =

        -- TonemapComponentData --

        local minExposure =
        local exposureAdjustTime =
        local bloomScale =

        local tonemapMethod =

        -- ColorCorrectionComponentData --

        local Contrast =
        local Saturation =

        -- EnlightenComponentData --

        local enlightenEnable =

        -- SunFlareComponentData --

        local SunFlareExcluded =

        -- Mesh Assets --

        local shadervalue =

        -- EmitterTemplateData --

        local templateemissive =

        -- LocalLightEntityData (Dynamic Lights) --

        local dynamicEnable =
        local enlightenEnable =
        local specularEnable =

        -- LensFlareEntityData --

        local flaresVisible =

        -- SpotLightEntityData (Flashlights) --

        local flashlightRadius =
        local flashlightIntensity =
        local flashlightConeOuterAngle =
        local flashlightorthoWidth =
        local flashlightorthoHeight =
        local flashlightfrustumFov =
        local flashlightcastShadowsEnable =
        local flashlightcastShadowsMinLevel =
        local flashlightShape =

return true
end

-- Bright Night --
function Preset:Bright_Night()

        -- OutdoorLightComponentData --

        local SunColor =
        local SkyColor =
        local groundColor =

        local skyEnvmapShadowScale =

        -- SkyComponentData --

        local brightnessScale =

        local sunSize =
        local sunScale =

        local cloudLayer1SunLightIntensity =
        local cloudLayer1SunLightPower =
        local cloudLayer1AmbientLightIntensity =

        local cloudLayer2SunLightIntensity =
        local cloudLayer2SunLightPower =
        local cloudLayer2AmbientLightIntensity =

        local staticEnvmapScale =
        local skyEnvmap8BitTexScale =
        local customEnvmapAmbient =

        local panoramicRotation =

        -- FogComponentData --

        local fogEnable =
        local fogColorEnable =

        local fogStart =
        local fogEndValue =

        local fogColor =
        local fogColorCurve =

        local fogTransparencyFadeEnd =

        -- TonemapComponentData --

        local minExposure =
        local exposureAdjustTime =
        local bloomScale =

        local tonemapMethod =

        -- ColorCorrectionComponentData --

        local Contrast =
        local Saturation =

        -- EnlightenComponentData --

        local enlightenEnable =

        -- SunFlareComponentData --

        local SunFlareExcluded =

        -- Mesh Assets --

        local shadervalue =

        -- EmitterTemplateData --

        local templateemissive =

        -- LocalLightEntityData (Dynamic Lights) --

        local dynamicEnable =
        local enlightenEnable =
        local specularEnable =

        -- LensFlareEntityData --

        local flaresVisible =

        -- SpotLightEntityData (Flashlights) --

        local flashlightRadius =
        local flashlightIntensity =
        local flashlightConeOuterAngle =
        local flashlightorthoWidth =
        local flashlightorthoHeight =
        local flashlightfrustumFov =
        local flashlightcastShadowsEnable =
        local flashlightcastShadowsMinLevel =
        local flashlightShape =

return true
end

-- Morning --

function Preset:Morning()

        -- OutdoorLightComponentData --

        local SunColor =
        local SkyColor =
        local groundColor =

        local skyEnvmapShadowScale =

        -- SkyComponentData --

        local brightnessScale =

        local sunSize =
        local sunScale =

        local cloudLayer1SunLightIntensity =
        local cloudLayer1SunLightPower =
        local cloudLayer1AmbientLightIntensity =

        local cloudLayer2SunLightIntensity =
        local cloudLayer2SunLightPower =
        local cloudLayer2AmbientLightIntensity =

        local staticEnvmapScale =
        local skyEnvmap8BitTexScale =
        local customEnvmapAmbient =

        local panoramicRotation =

        -- FogComponentData --

        local fogEnable =
        local fogColorEnable =

        local fogStart =
        local fogEndValue =

        local fogColor =
        local fogColorCurve =

        local fogTransparencyFadeEnd =

        -- TonemapComponentData --

        local minExposure =
        local exposureAdjustTime =
        local bloomScale =

        local tonemapMethod =

        -- ColorCorrectionComponentData --

        local Contrast =
        local Saturation =

        -- EnlightenComponentData --

        local enlightenEnable =

        -- SunFlareComponentData --

        local SunFlareExcluded =

        -- Mesh Assets --

        local shadervalue =

        -- EmitterTemplateData --

        local templateemissive =

        -- LocalLightEntityData (Dynamic Lights) --

        local dynamicEnable =
        local enlightenEnable =
        local specularEnable =

        -- LensFlareEntityData --

        local flaresVisible =

        -- SpotLightEntityData (Flashlights) --

        local flashlightRadius =
        local flashlightIntensity =
        local flashlightConeOuterAngle =
        local flashlightorthoWidth =
        local flashlightorthoHeight =
        local flashlightfrustumFov =
        local flashlightcastShadowsEnable =
        local flashlightcastShadowsMinLevel =
        local flashlightShape =

return true
end

-- Evening

function Preset:Evening()

        -- OutdoorLightComponentData --

        local SunColor =
        local SkyColor =
        local groundColor =

        local skyEnvmapShadowScale =

        -- SkyComponentData --

        local brightnessScale =

        local sunSize =
        local sunScale =

        local cloudLayer1SunLightIntensity =
        local cloudLayer1SunLightPower =
        local cloudLayer1AmbientLightIntensity =

        local cloudLayer2SunLightIntensity =
        local cloudLayer2SunLightPower =
        local cloudLayer2AmbientLightIntensity =

        local staticEnvmapScale =
        local skyEnvmap8BitTexScale =
        local customEnvmapAmbient =

        local panoramicRotation =

        -- FogComponentData --

        local fogEnable =
        local fogColorEnable =

        local fogStart =
        local fogEndValue =

        local fogColor =
        local fogColorCurve =

        local fogTransparencyFadeEnd =

        -- TonemapComponentData --

        local minExposure =
        local exposureAdjustTime =
        local bloomScale =

        local tonemapMethod =

        -- ColorCorrectionComponentData --

        local Contrast =
        local Saturation =

        -- EnlightenComponentData --

        local enlightenEnable =

        -- SunFlareComponentData --

        local SunFlareExcluded =

        -- Mesh Assets --

        local shadervalue =

        -- EmitterTemplateData --

        local templateemissive =

        -- LocalLightEntityData (Dynamic Lights) --

        local dynamicEnable =
        local enlightenEnable =
        local specularEnable =

        -- LensFlareEntityData --

        local flaresVisible =

        -- SpotLightEntityData (Flashlights) --

        local flashlightRadius =
        local flashlightIntensity =
        local flashlightConeOuterAngle =
        local flashlightorthoWidth =
        local flashlightorthoHeight =
        local flashlightfrustumFov =
        local flashlightcastShadowsEnable =
        local flashlightcastShadowsMinLevel =
        local flashlightShape =

return true
end
