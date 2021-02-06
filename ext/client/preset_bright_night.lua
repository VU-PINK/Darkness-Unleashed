local bnightPreset = nil
local shaderParams = nil
local outdoorLight = nil
local sky = nil
local fog = nil
local tonemap = nil
local cc = nil
local enlighten = nil
local sunFlare = nil
NVGadgetActivated = nil

-- Based on Code by Orfeas Zafeiris
-- expanded by IllustrisJack

require '__shared/settings'
require 'functions'
require 'preset_bright_night_nightvisiongadget'

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
  outdoorLight.realm = 0

  outdoorLight.skyColor = Vec3(0.04, 0.04, 0.04)
  outdoorLight.groundColor = Vec3(0.015, 0.015, 0.015)
  outdoorLight.sunColor = Vec3(0.2, 0.2, 0.2)

  outdoorLight.cloudShadowEnable = true
  outdoorLight.cloudShadowSize = 2000.0
  outdoorLight.cloudShadowExponent = 3
  outdoorLight.cloudShadowCoverage = 0.44
  outdoorLight.cloudShadowSpeed = Vec2(-15.000000, -15.000000)

  outdoorLight.skyLightAngleFactor = 0.0089999996125698
  outdoorLight.sunSpecularScale = 0.25
  outdoorLight.skyEnvmapShadowScale = 0.3
  outdoorLight.sunShadowHeightScale = 0.3

  outdoorLight.translucencyDistortion = 0.10000000149012
  outdoorLight.translucencyAmbient = 0
  outdoorLight.translucencyScale = 1
  outdoorLight.translucencyPower = 80.0

	outdoorLight.sunRotationX = 255.48399353027
	outdoorLight.sunRotationY = 25

	local sky = SkyComponentData()
	sky.brightnessScale = 0.3
	sky.enable = true
	sky.sunSize = 0.013
	sky.sunScale = 0.6
	sky.panoramicTexture = TextureAsset(_G.MoonNightSkybox)
	sky.panoramicAlphaTexture = TextureAsset(_G.MoonNightAlpha)
	sky.staticEnvmapTexture = TextureAsset(_G.MoonNightEnvmap)
	sky.skyGradientTexture = TextureAsset(_G.MoonNightGradient)
	sky.realm = 2
	sky.panoramicUVMinX = 0.280999988317
	sky.panoramicUVMaxX = 0.298999994993
	sky.panoramicUVMinY = 0.0630000010133
	sky.panoramicUVMaxY = 0.307000011206
	sky.panoramicTileFactor = 1.0
	sky.panoramicRotation = 260
	sky.staticEnvmapScale = 1
	sky.skyVisibilityExponent = 0.2
	sky.skyEnvmap8BitTexScale = 1
	sky.customEnvmapScale = 1
	sky.customEnvmapAmbient = 1
	sky.cloudLayer1Texture = TextureAsset(_G.MoonNightStars)
	sky.cloudLayer1Altitude = 2000000.0
	sky.cloudLayer1TileFactor = 0.600000023842
	sky.cloudLayer1Rotation = 237.072998047
	sky.cloudLayer1Speed = -0.0010000000475
	sky.cloudLayer1SunLightIntensity = 0.3
	sky.cloudLayer1SunLightPower = 0.3
	sky.cloudLayer1AmbientLightIntensity = 0.5
	sky.cloudLayer1AlphaMul = 0.25

	local colorCorrection = ColorCorrectionComponentData()
	colorCorrection.enable = true
	colorCorrection.brightness = Vec3(1, 1, 1)
	colorCorrection.contrast = Vec3(1.1, 1.1, 1.1)
	colorCorrection.saturation = Vec3(1, 1, 1.05)

	local tonemap = TonemapComponentData()
	tonemap.tonemapMethod = 2
	tonemap.minExposure = 0.25
	tonemap.maxExposure = 1.75
	tonemap.exposureAdjustTime = 1.75
	tonemap.bloomScale = Vec3(0.2, 0.2, 0.2)

	local fog = FogComponentData()
	fog.enable = true
  fog.realm = 0

  fog.start = 25
  fog.endValue = 800
  fog.curve = Vec4(0.4, -0.77, 1.3, -0.01)
  fog.fogDistanceMultiplier = 1.0
  fog.fogGradientEnable = true

  fog.fogColorEnable = true
  fog.fogColor = Vec3(0.08, 0.0615, 0.0157)
  fog.fogColorCurve = Vec4(6.1, -11.7, 5.62, -0.18)
  fog.fogColorStart = 0
  fog.fogColorEnd = 5000

  fog.transparencyFadeStart = 0
  fog.transparencyFadeClamp = 1
  fog.transparencyFadeEnd = 150

  fog.heightFogEnable = false

	local enlighten = EnlightenComponentData()
	enlighten.enable = false
	enlighten.bounceScale = 1
	enlighten.sunScale = 0.00002
	enlighten.skyBoxEnable = false

	local sunFlare = SunFlareComponentData()
	sunFlare.enable = true

	local character = CharacterLightingComponentData()
	character.characterLightEnable = true
	character.topLight = Vec3(0.1, 0.1, 0.1)
	character.bottomLight = Vec3(0.1, 0.1, 0.1)


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

	bnightData.components:add(character)
	bnightData.runtimeComponentCount = bnightData.runtimeComponentCount + 1

	bnightPreset = EntityManager:CreateEntity(bnightData, LinearTransform())

	if bnightPreset ~= nil then
		bnightPreset:Init(Realm.Realm_Client, true)
	end
NVGadgetActivated = nil
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
	removebNight()
end)

-- Night Vision "Gadget"
Events:Subscribe('Player:UpdateInput', function(player, deltaTime)
    if InputManager:WentKeyDown(58) or InputManager:WentKeyDown(8) then

			if NVGadgetActivated == nil then
				NightVisionGadget()
			elseif NVGadgetActivated == true then
				removeNVGadget()
			end

		end
end)
