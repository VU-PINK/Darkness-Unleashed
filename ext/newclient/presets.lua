require '__shared/settings'
require '__shared/functions'
require '__shared/skyboxrotation'


-- Using Day/Night by GramThanos & GreatApo as a Template for cleaner code + easier integration of their day/night cycle system. :) Credit: https://community.veniceunleashed.net/t/day-night-live-change-levels-lighting-during-the-game/1776
local presets = {}

-- Preset Standard --
presets.standard = {}

-- OutdoorLightComponentData --
presets.standard.sunColor = nil
presets.standard.skyColor = nil
presets.standard.groundColor = nil

presets.standard.skyEnvmapShadowScale = nil

-- SkyComponentData --
presets.standard.brightnessScale = nil
presets.standard.sunSize = nil
presets.standard.sunScale = nil

presets.standard.cloudLayer1SunLightIntensity = nil
presets.standard.cloudLayer1SunLightPower = nil
presets.standard.cloudLayer1AmbientLightIntensity = nil

presets.standard.cloudLayer2SunLightIntensity = nil
presets.standard.cloudLayer2SunLightPower = nil
presets.standard.cloudLayer2AmbientLightIntensity = nil

presets.standard.staticEnvmapScale = nil
presets.standard.skyEnvmap8BitTexScale = nil

presets.standard.customEnvmapAmbient = nil

presets.standard.panoramicRotation = nil

-- FogComponentData --
presets.standard.fogEnable = nil
presets.standard.fogColorEnable = nil

presets.standard.fogstart = nil
presets.standard.endValue = nil
presets.standard.fogColorStart = nil
presets.standard.fogColorEnd = nil

presets.standard.fogColor = nil
presets.standard.fogColorCurve = nil

presets.standard.transparencyFadeEnd = nil

-- TonemapComponentData --
presets.standard.minExposure = nil
presets.standard.exposureAdjustTime = nil
presets.standard.bloomScale = nil

presets.standard.tonemapMethod = nil

-- ColorCorrectionComponentData --
presets.standard.contrast = nil
presets.standard.saturation = nil

-- EnlightenComponentData --
presets.standard.enlightenEnable = nil

-- SunFlareComponentData --
presets.standard.flareExcluded = nil

--------------------------------------------------------------------------------
-- Preset Night --
presets.night = {}

-- OutdoorLightComponentData --
presets.night.sunColor = Vec3(0.02, 0.02, 0.02)
presets.night.skyColor = Vec3(0.01, 0.01, 0.01)
presets.night.groundColor = Vec3(0, 0, 0)

presets.night.skyEnvmapShadowScale = 0.25

-- SkyComponentData --
presets.night.brightnessScale = 0.0005--*BrightnessMultiplicator
presets.night.sunSize = 15
presets.night.sunScale = 15

presets.night.cloudLayer1SunLightIntensity = 0.0001
presets.night.cloudLayer1SunLightPower = 0.0001
presets.night.cloudLayer1AmbientLightIntensity = 0.0005

presets.night.cloudLayer2SunLightIntensity = 0.0001
presets.night.cloudLayer2SunLightPower = 0.0001
presets.night.cloudLayer2AmbientLightIntensity = 0.0005

presets.night.staticEnvmapScale = 0.1
presets.night.skyEnvmap8BitTexScale = 1

presets.night.customEnvmapAmbient = 0.05

presets.night.panoramicRotation = rotation

-- FogComponentData --
presets.night.fogEnable = true
presets.night.fogColorEnable = true

presets.night.fogstart = 2
presets.night.endValue = 65
presets.night.fogColorStart = 2
presets.night.fogColorEnd = 40

presets.night.fogColor = Vec3(0.0005, 0.0005, 0.0000000015)
presets.night.fogColorCurve = Vec4(0.30, 0.20, 0.15)--Vec4((0.30*FogMultiplicator), (0.20*FogMultiplicator), (0.15*FogMultiplicator), 0)

presets.night.transparencyFadeEnd = 50

-- TonemapComponentData --
presets.night.minExposure = 0.2
presets.night.exposureAdjustTime = 1.5
presets.night.bloomScale = tonemap.bloomScale * 0.25

presets.night.tonemapMethod = 3

-- ColorCorrectionComponentData --
presets.night.contrast = color.contrast = Vec3(1.05, 1.05, 1.05)
presets.night.saturation = Vec3(1.22, 1.25, 1.5)

-- EnlightenComponentData --
presets.night.enlightenEnable = nil

-- SunFlareComponentData --
presets.night.flareExcluded = true

--------------------------------------------------------------------------------

-- Night Preset
local function Night()
    local factor = math.abs(hours % 24 - 12)/12

    local states = VisualEnvironmentManager:GetStates()
    for _, state in pairs(states) do
        if not cache_states[_] then
            cache_states[_] = {}
        end
        if state.outdoorLight ~= nil then
            if not cache_states[_].outdoorLight then
                cache_states[_].outdoorLight = {}
                cache_states[_].outdoorLight.sunColor = state.outdoorLight.sunColor
                cache_states[_].outdoorLight.skyColor = state.outdoorLight.skyColor
                cache_states[_].outdoorLight.groundColor = state.outdoorLight.groundColor
                cache_states[_].outdoorLight.skyEnvmapShadowScale = state.outdoorLight.skyEnvmapShadowScale
            end
            state.outdoorLight.sunColor = presets.night.sunColor
            state.outdoorLight.skyColor = presets.night.skyColor
            state.outdoorLight.groundColor = presets.night.groundColor
            state.outdoorLight.skyEnvmapShadowScale = presets.night.skyEnvmapShadowScale
        end
        if state.sky ~= nil then
            if not cache_states[_].sky then
                cache_states[_].sky = {}
                cache_states[_].sky.brightnessScale = state.sky.brightnessScale
                cache_states[_].sky.sunSize = state.sky.sunSize
                cache_states[_].sky.sunScale = state.sky.sunScale
                cache_states[_].sky.cloudLayer1SunLightIntensity = state.sky.cloudLayer1SunLightIntensity
                cache_states[_].sky.cloudLayer1SunLightPower = state.sky.cloudLayer1SunLightPower
                cache_states[_].sky.cloudLayer1AmbientLightIntensity = state.sky.cloudLayer1AmbientLightIntensity
                cache_states[_].sky.cloudLayer2SunLightIntensity = state.sky.cloudLayer2SunLightIntensity
                cache_states[_].sky.cloudLayer2SunLightPower = state.sky.cloudLayer2SunLightPower
                cache_states[_].sky.cloudLayer2AmbientLightIntensity = state.sky.cloudLayer2AmbientLightIntensity
                cache_states[_].sky.staticEnvmapScale = state.sky.staticEnvmapScale
                cache_states[_].sky.skyEnvmap8BitTexScale = state.sky.skyEnvmap8BitTexScale
            end
            state.sky.brightnessScale = presets.night.brightnessScale
            state.sky.sunSize = presets.night.sunSize
            state.sky.sunScale = presets.night.sunScale
            state.sky.cloudLayer1SunLightIntensity = presets.night.cloudLayer1SunLightIntensity
            state.sky.cloudLayer1SunLightPower = presets.night.cloudLayer1SunLightPower
            state.sky.cloudLayer1AmbientLightIntensity = presets.night.cloudLayer1AmbientLightIntensity
            state.sky.cloudLayer2SunLightIntensity = presets.night.cloudLayer2SunLightIntensity
            state.sky.cloudLayer2SunLightPower = presets.night.cloudLayer2SunLightPower
            state.sky.cloudLayer2AmbientLightIntensity = presets.night.cloudLayer2AmbientLightIntensity
            state.sky.staticEnvmapScale = presets.night.staticEnvmapScale
            state.sky.skyEnvmap8BitTexScale = presets.night.skyEnvmap8BitTexScale
        end
        if state.fog ~= nil then
            if not cache_states[_].fog then
                cache_states[_].fog = {}
                cache_states[_].fog.start = state.fog.start
                cache_states[_].fog.endValue = state.fog.endValue
                cache_states[_].fog.fogColor = state.fog.fogColor
                cache_states[_].fog.fogColorCurve = state.fog.fogColorCurve
                cache_states[_].fog.transparencyFadeEnd = state.fog.transparencyFadeEnd
            end
            state.fog.start = 2
            state.fog.endValue = 65
            state.fog.fogColorStart = 2
            state.fog.fogColorEnd = 40
            state.fog.fogColor = Vec3(0.0005, 0.0005, 0.0000000015)
            state.fog.fogColorCurve = Vec4(0.30, 0.20, 0.15)
            state.fog.transparencyFadeEnd = 50
        end
        if state.tonemap ~= nil then
            if not cache_states[_].tonemap then
                cache_states[_].tonemap = {}
                cache_states[_].tonemap.minExposure = state.tonemap.minExposure
                cache_states[_].tonemap.maxExposure = state.tonemap.maxExposure
                cache_states[_].tonemap.exposureAdjustTime = state.tonemap.exposureAdjustTime
                cache_states[_].tonemap.bloomScale = state.tonemap.bloomScale
                cache_states[_].tonemap.middleGray = state.tonemap.middleGray
            end
            state.tonemap.minExposure = 0.2
            state.tonemap.maxExposure = 4
            state.tonemap.exposureAdjustTime = (cache_states[_].tonemap.bloomScale * 0.25)
        end
        if state.enlighten ~= nil then
            if not cache_states[_].enlighten then
                cache_states[_].enlighten = {}
                cache_states[_].enlighten.skyBoxSkyColor = state.enlighten.skyBoxSkyColor
                cache_states[_].enlighten.skyBoxBackLightColor = state.enlighten.skyBoxBackLightColor
                cache_states[_].enlighten.skyBoxGroundColor = state.enlighten.skyBoxGroundColor
                cache_states[_].enlighten.terrainColor = state.enlighten.terrainColor

                --cache_states[_].enlighten.sunScale = state.enlighten.sunScale
                --cache_states[_].enlighten.skyBoxSunLightColorSize = state.enlighten.skyBoxSunLightColorSize
                --cache_states[_].enlighten.skyBoxBackLightColorSize = state.enlighten.skyBoxBackLightColorSize
            end
            state.englighten.enable = nil
            --state.enlighten.bounceScale = fVal(profiles.standard.bounceScale, profiles.night.bounceScale, factor)
            --state.enlighten.cullDistance = fVal(profiles.standard.cullDistance, profiles.night.cullDistance, factor)
            --state.enlighten.sunScale = fVal(profiles.standard.esunScale, profiles.night.esunScale, factor)
            --state.enlighten.skyBoxSunLightColorSize = fVal(profiles.standard.skyBoxSunLightColorSize, profiles.night.skyBoxSunLightColorSize, factor)
            --state.enlighten.skyBoxBackLightColorSize = fVal(profiles.standard.skyBoxBackLightColorSize, profiles.night.skyBoxBackLightColorSize, factor)
        end

        -- Sun flare should be enabled on standard only
        --if state.sunFlare ~= nil then
        --    if factor < 0.5 then
        --        state.sunFlare.enable = true
        --    else
        --        state.sunFlare.enable = false
        --    end
        --end
    end


end


-- Initialize default values
Events:Subscribe('Partition:Loaded', function(partition)
    for _, instance in pairs(partition.instances) do
        -- Init OutdoorLight values
        if instance:Is('OutdoorLightComponentData') then
            --print('OutdoorLightComponentData')
            local outdoor = OutdoorLightComponentData(instance)
            outdoor:MakeWritable()

            profiles.standard.sunColor = outdoor.sunColor:Clone()
            profiles.standard.skyColor = outdoor.skyColor:Clone()
            profiles.standard.groundColor = outdoor.groundColor:Clone()
            profiles.standard.skyEnvmapShadowScale = outdoor.skyEnvmapShadowScale
        end
        -- Init Sky values
        if instance:Is('SkyComponentData') then
            --print('SkyComponentData')
            sky = SkyComponentData(instance)
            sky:MakeWritable()

            profiles.standard.brightnessScale = sky.brightnessScale
            profiles.standard.sunSize = sky.sunSize
            profiles.standard.sunScale = sky.sunScale
            profiles.standard.cloudLayer1SunLightIntensity = sky.cloudLayer1SunLightIntensity
            profiles.standard.cloudLayer1SunLightPower = sky.cloudLayer1SunLightPower
            profiles.standard.cloudLayer1AmbientLightIntensity = sky.cloudLayer1AmbientLightIntensity
            profiles.standard.cloudLayer2SunLightIntensity = sky.cloudLayer2SunLightIntensity
            profiles.standard.cloudLayer2SunLightPower = sky.cloudLayer2SunLightPower
            profiles.standard.cloudLayer2AmbientLightIntensity = sky.cloudLayer2AmbientLightIntensity
            profiles.standard.staticEnvmapScale = sky.staticEnvmapScale
            profiles.standard.skyEnvmap8BitTexScale = sky.skyEnvmap8BitTexScale

            if sky.partition.name:match('mp_subway') or sky.partition.name:match('mp_011') then
                profiles.night.staticEnvmapScale = 0.01
            end

            if sky.partition.name:match('mp_subway_subway') then
                profiles.night.staticEnvmapScale = 0.1

                ResourceManager:RegisterInstanceLoadHandlerOnce(Guid('36536A99-7BE3-11E0-8611-A913E18AE9A4'), Guid('64EE680C-405E-2E81-E327-6DF58605AB0B'), function(loadedInstance)
                    sky.staticEnvmapTexture = TextureAsset(loadedInstance)
                end)
            end
        end
        -- Init Fog values
        if instance:Is('FogComponentData') then
            --print('FogComponentData')
            local fog = FogComponentData(instance)
            fog:MakeWritable()

            profiles.standard.fogColor = fog.fogColor:Clone()
        end
        -- Init Tonemap values
        if instance:Is('TonemapComponentData') then
            --print('TonemapComponentData')
            local tonemap = TonemapComponentData(instance)
            tonemap:MakeWritable()

            profiles.standard.minExposure = tonemap.minExposure
            profiles.standard.maxExposure = tonemap.maxExposure
            profiles.standard.exposureAdjustTime = tonemap.exposureAdjustTime
            profiles.standard.middleGray = tonemap.middleGray
            --tonemap.tonemapMethod = TonemapMethod.TonemapMethod_FilmicNeutral
        end
        ---- Init ColorCorrection values
        if instance:Is('ColorCorrectionComponentData') then
            local color = ColorCorrectionComponentData(instance)
            color:MakeWritable()

            if instance.partition.name:match('menuvisualenvironment') then
                color.enable = false
            end

            if instance.partition.name:match('outofcombat') then
                color.enable = false
            end
        end
        -- Init Enlighten values
        if instance:Is('EnlightenComponentData') then
            --print('EnlightenComponentData')
            local enlighten = EnlightenComponentData(instance)
            enlighten:MakeWritable()

            profiles.standard.skyBoxSkyColor = enlighten.skyBoxSkyColor:Clone()
            profiles.standard.skyBoxBackLightColor = enlighten.skyBoxBackLightColor:Clone()
            profiles.standard.skyBoxGroundColor = enlighten.skyBoxGroundColor:Clone()
            profiles.standard.terrainColor = enlighten.terrainColor:Clone()
            profiles.standard.skyBoxSunLightColor = enlighten.skyBoxSunLightColor:Clone()
            profiles.standard.bounceScale = enlighten.bounceScale
            profiles.standard.cullDistance = enlighten.cullDistance
            profiles.standard.esunScale = enlighten.sunScale
            profiles.standard.skyBoxSunLightColorSize = enlighten.skyBoxSunLightColorSize
            profiles.standard.skyBoxBackLightColorSize = enlighten.skyBoxBackLightColorSize

            --enlighten.enable = false
        end
        -- Init SunFlare values
        if instance:Is('SunFlareComponentData') then
            local flare = SunFlareComponentData(instance)
            flare:MakeWritable()
            flare.excluded = true
        end
        -- Init Mesh values
        --if instance:Is('MeshAsset') then
        --    if
        --        instance.partition.name:match('mp_011/objects/mp011_backdrop') or
        --        instance.partition.name:match('mp_012/terrain/mp012_matte') or
        --        instance.partition.name:match('mp_012/objects/smokestacks') or
        --        instance.partition.name:match('mp_018/terrain/mp018_matte')
        --    then
        --        local mesh = MeshAsset(instance)
        --        mesh:MakeWritable()
        --
        --        for _, value in pairs(mesh.materials) do
        --            value:MakeWritable()
        --            value.shader.shader = nil
        --        end
        --    end
        --end
        --
        --if instance:Is('MeshMaterialVariation') then
        --    if instance.partition.name:match('mp_012/objects/smokestacks') then
        --        local variation = MeshMaterialVariation(instance)
        --        variation:MakeWritable()
        --        variation.shader.shader = nil
        --    end
        --end
    end


end)
