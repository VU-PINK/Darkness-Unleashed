local bnightPreset = nil
local shaderParams = nil
local outdoorLight = nil
local sky = nil
local fog = nil
local tonemap = nil
local cc = nil
local enlighten = nil
local sunFlare = nil

require '__shared/settings'
require 'functions'

function NightVisionGadget()

	if bnightNVGadget ~= nil then
		return
	end

	local bnightData = VisualEnvironmentEntityData()
	bnightData.enabled = true
	bnightData.visibility = 1.0
	bnightData.priority = 1000000

	local outdoorLight = OutdoorLightComponentData()
  outdoorLight.enable = true
  outdoorLight.realm = 0

  outdoorLight.skyColor = Vec3(0.0399999991059, 0.0399999991059, 0.0399999991059)
  outdoorLight.groundColor = Vec3(0.0299999993294, 0.0299999993294, 0.0299999993294)
  outdoorLight.sunColor = Vec3(0.10000000149, 0.10000000149, 0.10000000149)

  outdoorLight.cloudShadowEnable = true
  outdoorLight.cloudShadowSize = 2000.0
  outdoorLight.cloudShadowExponent = 3
  outdoorLight.cloudShadowCoverage = 0.44
  outdoorLight.cloudShadowSpeed = Vec2(-15.000000, -15.000000)

  outdoorLight.skyLightAngleFactor = 0.0089999996125698
  outdoorLight.sunSpecularScale = 0
  outdoorLight.skyEnvmapShadowScale = 0
  outdoorLight.sunShadowHeightScale = 0.3

  outdoorLight.translucencyDistortion = 0
  outdoorLight.translucencyAmbient = 0
  outdoorLight.translucencyScale = 0
  outdoorLight.translucencyPower = 0

	outdoorLight.sunRotationX = 255.48399353027
	outdoorLight.sunRotationY = 25

	local sky = SkyComponentData()
	sky.brightnessScale = 0.5
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
	--[[colorCorrection.enable = true
	colorCorrection.brightness = Vec3(1, 1, 1)
	colorCorrection.contrast = Vec3(1.1, 1.1, 1.1)
	colorCorrection.saturation = Vec3(1, 1, 1)]]

	colorCorrection.enable = true
	colorCorrection.brightness = Vec3(1.5, 1.5, 1.5)
	colorCorrection.contrast = Vec3(1.39999997616, 1.39999997616, 1.39999997616)
	colorCorrection.saturation = Vec3(0.800000011921, 0.800000011921, 0.800000011921)
	colorCorrection.hue = 0.0
	colorCorrection.colorGradingTexture = TextureAsset(ResourceManager:SearchForInstanceByGuid(Guid('E79F27A1-7B97-4A63-8ED8-372FE5012A31')))
	colorCorrection.colorGradingEnable = true

	-- FilmGrainComponentData
	local grain = FilmGrainComponentData()
	grain.enable = true
	grain.realm = 0
	grain.textureScale = Vec2(0.40000000596, 0.40000000596)
	grain.texture = TextureAsset(ResourceManager:SearchForInstanceByGuid(Guid('FA9F620D-DEC7-4B88-88AC-84B3E0A07BDC')))

	grain.randomEnable = true
	grain.linearFilteringEnable = false
	grain.colorScale = Vec3(0.10, 0.10, 0.10)

	local tonemap = TonemapComponentData()
	tonemap.tonemapMethod = 1
	tonemap.minExposure = 0.4
	tonemap.maxExposure = 2.0
	tonemap.bloomScale = Vec3(1.2, 1.2, 1.2)
	tonemap.exposureAdjustTime = 10

	local fog = FogComponentData()
	fog.enable = true
  fog.realm = 0

  fog.start = 0.0
  fog.endValue = 250.0
  fog.curve = Vec4(1.11925065517, -1.70694792271, 1.49723529816, -0.148290395737)
  fog.fogDistanceMultiplier = 1.0
  fog.fogGradientEnable = true

  fog.fogColorEnable = true
  fog.fogColor = Vec3(0.0740000009537, 0.0740000009537, 0.0740000009537)
  fog.fogColorCurve = Vec4(2.60263705254, -4.24849796295, 2.82176566124, -0.359705537558)
  fog.fogColorStart = 0
  fog.fogColorEnd = 10000

  fog.transparencyFadeStart = 0
  fog.transparencyFadeClamp = 0.600000023842
  fog.transparencyFadeEnd = 1.0

  fog.heightFogEnable = false

	local enlighten = EnlightenComponentData()
	enlighten.enable = true

	local sunFlare = SunFlareComponentData()
	sunFlare.enable = false

	local shaderParams = ShaderParamsComponentData()
	shaderParams.value = Vec4(0.55, 0.55, 0.55, 0.55)
	shaderParams.parameterName = 'FLIRData'

	-- VignetteComponentData
	local vignette = VignetteComponentData()
	vignette.enable = true
	vignette.realm = 0

	vignette.scale = Vec2(2.8, 2.4)
	vignette.color = Vec3(0.1, 0.1, 0.1)
	vignette.exponent = 2.0
	vignette.opacity = 0.6

	local motion = MotionBlurComponentData()
	motion.motionBlurEnable = true

	motion.cutoffGradientScale = 1
	motion.motionBlurCutoffRadius = 1



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

	--bnightData.components:add(shaderParams)
	--bnightData.runtimeComponentCount = bnightData.runtimeComponentCount + 1

	bnightData.components:add(vignette)
	bnightData.runtimeComponentCount = bnightData.runtimeComponentCount + 1

	bnightData.components:add(grain)
	bnightData.runtimeComponentCount = bnightData.runtimeComponentCount + 1

	bnightData.components:add(motion)
	bnightData.runtimeComponentCount = bnightData.runtimeComponentCount + 1

	bnightNVGadget = EntityManager:CreateEntity(bnightData, LinearTransform())

	if bnightNVGadget ~= nil then
		bnightNVGadget:Init(Realm.Realm_Client, true)
		NVGadgetActivated = true
		print('Activated NV')
	end


end

function removeNVGadget()

	if bnightNVGadget ~= nil then
		bnightNVGadget:Destroy()
		bnightNVGadget = nil
		NVGadgetActivated = nil
		print('Deactivated NV')
		return true
	end
end

-- Remove the VE state when the mod is unloading.
Events:Subscribe('Extension:Unloading', function()
	removeNVGadget()
end)

-- Remove when Killed
Events:Subscribe('Player:Killed', function(player)
	local localplayer = PlayerManager:GetLocalPlayer()
	if player == localplayer then
  removeNVGadget()
	end
end)
