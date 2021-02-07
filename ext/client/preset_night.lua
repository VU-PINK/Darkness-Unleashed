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
--require 'preset_bright_night_nightvisiongadget'

function Night(Map)

Multipliers(Map)

	if nightPreset ~= nil then
		return
	end

	local nightData = VisualEnvironmentEntityData()
	nightData.enabled = true
	nightData.visibility = 1.0
	nightData.priority = 999999

	-- OutdoorLightComponentData
  local outdoorLight = OutdoorLightComponentData()
  outdoorLight.enable = true
  outdoorLight.realm = 0

  outdoorLight.skyColor = Vec3(0.15, 0.15, 0.15)
  outdoorLight.groundColor = Vec3(0, 0.0, 0)
  outdoorLight.sunColor = Vec3(0.5, 0.5, 0.5)

  outdoorLight.cloudShadowEnable = true
  outdoorLight.cloudShadowSize = 2000.0
  outdoorLight.cloudShadowExponent = 3
  outdoorLight.cloudShadowCoverage = 0.44
  outdoorLight.cloudShadowSpeed = Vec2(-15.000000, -15.000000)

  outdoorLight.skyLightAngleFactor = 0.0089999996125698
  outdoorLight.sunSpecularScale = 4
  outdoorLight.skyEnvmapShadowScale = 0.4
  outdoorLight.sunShadowHeightScale = 1

  outdoorLight.translucencyDistortion = 0.10000000149012
  outdoorLight.translucencyAmbient = 0
  outdoorLight.translucencyScale = 1
  outdoorLight.translucencyPower = 80.0

	local sky = SkyComponentData()
	sky.brightnessScale = 0.21
	sky.enable = true
	sky.sunSize = 0.02
	sky.sunScale = 0.5
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
	sky.cloudLayer1AlphaMul = 0.4

	local colorCorrection = ColorCorrectionComponentData()
	colorCorrection.enable = true
	colorCorrection.brightness = Vec3(1, 1, 1)
	colorCorrection.contrast = Vec3(1.1, 1.1, 1.1)
	colorCorrection.saturation = Vec3(0.55, 0.55, 0.25)

	local tonemap = TonemapComponentData()
	tonemap.minExposure = 0.1
	tonemap.maxExposure = 1.6
	tonemap.exposureAdjustTime = 0.60000002384186
	tonemap.bloomScale = Vec3(0.25, 0.25, 0.25)
	tonemap.tonemapMethod = 2
	tonemap.middleGray = 0.25

	local fog = FogComponentData()
  fog.enable = true
  fog.realm = 0

  fog.start = 40
  fog.endValue = 4000.0
  fog.curve = Vec4(0.4, -0.77, 1.3, -0.01)
  fog.fogDistanceMultiplier = 1.0
  fog.fogGradientEnable = true

  fog.fogColorEnable = true
  fog.fogColor = Vec3(0.02, 0.05, 0.11)
  fog.fogColorCurve = Vec4(6.1, -11.7, 5.62, -0.18)
  fog.fogColorStart = 0
  fog.fogColorEnd = 10000

  fog.transparencyFadeStart = 0
  fog.transparencyFadeClamp = 1
  fog.transparencyFadeEnd = 3500

  fog.heightFogEnable = false


	local enlighten = EnlightenComponentData()
  enlighten.enable = false
  enlighten.realm = 0

  enlighten.sunScale = 2.0
  enlighten.bounceScale = 1.0
  enlighten.cullDistance = -1.0

  enlighten.skyBoxEnable = true
  enlighten.skyBoxSkyColor = Vec3(0.022000, 0.078000, 0.177000)
  enlighten.skyBoxSunLightColor = Vec3(0.282000, 0.991000, 3.000000)
  enlighten.skyBoxGroundColor = Vec3(0.085000, 0.206000, 0.394000)
  enlighten.skyBoxBackLightColor = Vec3(0.022000, 0.078000, 0.177000)
  enlighten.skyBoxSunLightColorSize = 0.0
  enlighten.skyBoxBackLightColorSize = 0.62199997901917
  enlighten.skyBoxBackLightRotationX = 171.95899963379
  enlighten.skyBoxBackLightRotationY = 26.563999176025

  enlighten.terrainColor = Vec3(0.100000, 0.100000, 0.100000)

	-- VignetteComponentData
  local vignette = VignetteComponentData()
  vignette.enable = true
  vignette.realm = 0

  vignette.scale = Vec2(2.000000, 2.000000)
  vignette.color = Vec3(0.000000, 0.000000, 0.000000)
  vignette.exponent = 1.5
  vignette.opacity = 0.2039999961853

	-- WindComponentData
	local wind = WindComponentData()
	wind.realm = 0

	wind.windDirection = 211.25799560547
	wind.windStrength = 0.99400001764297

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

	nightData.components:add(vignette)
	nightData.runtimeComponentCount = nightData.runtimeComponentCount + 1

	nightData.components:add(wind)
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
