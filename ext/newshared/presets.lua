require '__shared/settings'
require '__shared/functions'
require '__shared/skyboxrotation'


-- Using Day/Night by GramThanos & GreatApo as a Template for cleaner code + easier integration of their day/night cycle system. :) https://community.veniceunleashed.net/t/day-night-live-change-levels-lighting-during-the-game/1776
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
presets.night.brightnessScale = (0.0005*BrightnessMultiplicator)
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
presets.night.fogColorCurve = Vec4((0.30*FogMultiplicator), (0.20*FogMultiplicator), (0.15*FogMultiplicator), 0)

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
