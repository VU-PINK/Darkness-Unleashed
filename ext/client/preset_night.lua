local nightPreset = nil
local shaderParams = nil
local outdoorLight = nil
local sky = nil
local fog = nil
local tonemap = nil
local cc = nil
local enlighten = nil
local sunFlare = nil

-- Based on Code by Orfeas Zafeiris
-- expanded by IllustrisJack

require '__shared/settings'
require 'functions'

function Night(Map)

Multipliers(Map)

	if nightPreset ~= nil then
		return
	end

	local nightData = VisualEnvironmentEntityData()
	nightData.enabled = true
	nightData.visibility = 1.0
	nightData.priority = 999999

	local outdoorLight = OutdoorLightComponentData()
	outdoorLight.enable = true
	outdoorLight.sunColor = Vec3(0.001, 0.001, 0.001)
	outdoorLight.skyColor = Vec3(0.022, 0.022, 0.022)
	outdoorLight.groundColor = Vec3(0.01, 0.01, 0.01)
	outdoorLight.skyEnvmapShadowScale = 0.25

	local sky = SkyComponentData()
	sky.brightnessScale = (0.023*BrightnessMultiplicator)
	sky.enable = true
	sky.sunSize = 0
	sky.sunScale = 0
	print(MoonNightSkybox)
	sky.panoramicTexture = TextureAsset(_G.MoonNightSkybox)
	print(MoonNightAlpha)
	sky.panoramicAlphaTexture = TextureAsset(_G.MoonNightAlpha)
	print(MoonNightEnvmap)
	sky.staticEnvmapTexture = TextureAsset(_G.MoonNightEnvmap)
	print(MoonNightGradient)
	sky.skyGradientTexture = TextureAsset(_G.MoonNightGradient)
	sky.realm = 2
	sky.panoramicUVMinX = 0.280999988317
	sky.panoramicUVMaxX = 0.298999994993
	sky.panoramicUVMinY = 0.0630000010133
	sky.panoramicUVMaxY = 0.307000011206
	sky.panoramicTileFactor = 1.0
	sky.panoramicRotation = 260
	sky.staticEnvmapScale = 0
	sky.skyVisibilityExponent = 1
	sky.skyEnvmap8BitTexScale = 1
	sky.customEnvmapScale = 1.0
	sky.customEnvmapAmbient = 0.05
	print(MoonNightStars)
	sky.cloudLayer1Texture = TextureAsset(_G.MoonNightStars)
	sky.cloudLayer1Altitude = 2000000.0
	sky.cloudLayer1TileFactor = 0.600000023842
	sky.cloudLayer1Rotation = 237.072998047
	sky.cloudLayer1Speed = -0.0010000000475
	sky.cloudLayer1SunLightIntensity = 0.3
	sky.cloudLayer1SunLightPower = 0.3
	sky.cloudLayer1AmbientLightIntensity = 0.5
	sky.cloudLayer1AlphaMul = 0.2

	local colorCorrection = ColorCorrectionComponentData()
	colorCorrection.enable = true
	colorCorrection.brightness = Vec3(1, 1, 1)
	colorCorrection.contrast = Vec3(1.15, 1.15, 1.15)
	colorCorrection.saturation = Vec3(1, 1, 1)

	local tonemap = TonemapComponentData()
	tonemap.minExposure = 0.2
	tonemap.maxExposure = 4
	tonemap.exposureAdjustTime = 1.5
	tonemap.bloomScale = Vec3(0.05, 0.05, 0.05)
	tonemap.tonemapMethod = 2

	local fog = FogComponentData()
	fog.enable = true
	fog.fogDistanceMultiplier = 1.0
	fog.fogGradientEnable = true
	fog.start = 20
	fog.endValue = 45
	fog.curve = Vec4(0.45, 0.35, 0.25, -2)
	fog.fogColorEnable = true
	fog.fogColor = Vec3((0.4*FogMultiplicator), (0.4*FogMultiplicator), (0.4*FogMultiplicator))
	fog.fogColorStart = 0
	fog.fogColorEnd = 1450
	fog.fogColorCurve = Vec4(0.4, 0.35, 0.2, -2)
	fog.transparencyFadeStart = 0
	fog.transparencyFadeEnd = 208
	fog.transparencyFadeClamp = 1.0

	local enlighten = EnlightenComponentData()
	enlighten.enable = false

	local sunFlare = SunFlareComponentData()
	sunFlare.enable = false

	nightData.components:add(outdoorLight)
	nightData.runtimeComponentCount = nightData.runtimeComponentCount + 1

	nightData.components:add(colorCorrection)
	nightData.runtimeComponentCount = nightData.runtimeComponentCount + 1

	nightData.components:add(tonemap)
	nightData.runtimeComponentCount = nightData.runtimeComponentCount + 1

	nightData.components:add(fog)
	nightData.runtimeComponentCount = nightData.runtimeComponentCount + 1

	nightData.components:add(sky)
	nightData.runtimeComponentCount = nightData.runtimeComponentCount + 1

	nightData.components:add(enlighten)
	nightData.runtimeComponentCount = nightData.runtimeComponentCount + 1

	nightData.components:add(sunFlare)
	nightData.runtimeComponentCount = nightData.runtimeComponentCount + 1

	nightPreset = EntityManager:CreateEntity(nightData, LinearTransform())

	if nightPreset ~= nil then
		nightPreset:Init(Realm.Realm_Client, true)
	end

end

function removeNight()

	if nightPreset ~= nil then
		nightPreset:Destroy()
		nightPreset = nil
		print('removed VES Night')
		return true
	end

end

-- Remove the VE state when the mod is unloading.
Events:Subscribe('Extension:Unloading', function()
	removeNight()
end)
