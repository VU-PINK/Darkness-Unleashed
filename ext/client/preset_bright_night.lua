local bnightPreset = nil
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

function Bright_Night(Map)

Multipliers(Map)

	if bnightPreset ~= nil then
		return
	end

	local bnightData = VisualEnvironmentEntityData()
	bnightData.enabled = true
	bnightData.visibility = 1.0
	bnightData.priority = 999999

	local outdoorLight = OutdoorLightComponentData()
	outdoorLight.enable = true
	outdoorLight.sunColor = Vec3(0.001, 0.001, 0.001)
	outdoorLight.skyColor = Vec3(0.089, 0.089, 0.091)
	outdoorLight.groundColor = Vec3(0.01, 0.01, 0.01)
	outdoorLight.skyEnvmapShadowScale = 0.25

	local sky = SkyComponentData()
	sky.brightnessScale = (0.25*BrightnessMultiplicator)
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
	sky.realm = 0
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
	sky.cloudLayer1AlphaMul = 0.1

	local colorCorrection = ColorCorrectionComponentData()
	colorCorrection.enable = true
	colorCorrection.brightness = Vec3(1, 1, 1)
	colorCorrection.contrast = Vec3(1.15, 1.15, 1.15)
	colorCorrection.saturation = Vec3(1, 0.95, 1)

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

	bnightData.components:add(outdoorLight)
	bnightData.runtimeComponentCount = bnightData.runtimeComponentCount + 1

	bnightData.components:add(colorCorrection)
	bnightData.runtimeComponentCount = bnightData.runtimeComponentCount + 1

	bnightData.components:add(tonemap)
	bnightData.runtimeComponentCount = bnightData.runtimeComponentCount + 1

	bnightData.components:add(fog)
	bnightData.runtimeComponentCount = bnightData.runtimeComponentCount + 1

	bnightData.components:add(sky)
	bnightData.runtimeComponentCount = bnightData.runtimeComponentCount + 1

	bnightData.components:add(enlighten)
	bnightData.runtimeComponentCount = bnightData.runtimeComponentCount + 1

	bnightData.components:add(sunFlare)
	bnightData.runtimeComponentCount = bnightData.runtimeComponentCount + 1

	bnightPreset = EntityManager:CreateEntity(bnightData, LinearTransform())

	if bnightPreset ~= nil then
		bnightPreset:Init(Realm.Realm_Client, true)
	end

end

function removebNight()

	if bnightPreset ~= nil then
		bnightPreset:Destroy()
		bnightPreset = nil
		print('removed VES Bright_Night')
		return true
	end
end

-- Remove the VE state when the mod is unloading.
Events:Subscribe('Extension:Unloading', function()
	removeNight()
end)
