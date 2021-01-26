local morningPreset = nil
local shaderParams = nil
local outdoorLight = nil
local sky = nil
local fog = nil
local tonemap = nil
local cc = nil
local enlighten = nil
local sunFlare = nil


function Morning(Map, panoramicTexture, panoramicAlphaTexture, SkyGradient, cEnvmapTexture)

	if morningPreset ~= nil then
		return
	end

	local morningData = VisualEnvironmentEntityData()
	morningData.enabled = true
	morningData.visibility = 1.0
	morningData.priority = 999999

	sky = SkyComponentData()
	sky.brightnessScale = 1.80200004578
	sky.enable = true
	sky.sunSize = 0.0170000009239
	sky.sunScale = 0.699999988079
	print(panoramicTexture)
	sky.panoramicTexture = TextureAsset(panoramicTexture)
	print(panoramicAlphaTexture)
	sky.panoramicAlphaTexture = TextureAsset(panoramicAlphaTexture)
	print(cEnvmapTexture)
	sky.staticEnvmapTexture = TextureAsset(cEnvmapTexture)
	print(SkyGradient)
	sky.skyGradientTexture = TextureAsset(SkyGradient)
	sky.brightnessScale = 1
	sky.realm = 0
	sky.panoramicUVMinX = 0.280999988317
	sky.panoramicUVMaxX = 0.298999994993
	sky.panoramicUVMinY = 0.0630000010133
	sky.panoramicUVMaxY = 0.307000011206
	sky.panoramicTileFactor = 1.0
	sky.panoramicRotation = 0.0
	sky.staticEnvmapScale = 1
	sky.skyVisibilityExponent = 1
	sky.skyEnvmap8BitTexScale = 1
	sky.customEnvmapScale = 1.0
	sky.customEnvmapAmbient = 1.0

	local outdoorLight = OutdoorLightComponentData()
	outdoorLight.enable = true
	outdoorLight.sunColor = Vec3(0.6, 0.45, 0.45)
	outdoorLight.skyColor = Vec3(0.6, 0.45, 0.45)
	outdoorLight.groundColor = outdoorLight.skyColor/2
	outdoorLight.sunRotationX = 240
	outdoorLight.sunRotationY = 25
	--outdoorLight.skyEnvmapShadowScale = 0.25

	local colorCorrection = ColorCorrectionComponentData()
	colorCorrection.enable = true
	colorCorrection.brightness = Vec3(0.9, 0.9, 0.9)
	colorCorrection.contrast = Vec3(1, 1, 1)
	colorCorrection.saturation = Vec3(1.1, 1.1, 1.1)

	local tonemap = TonemapComponentData()
	--tonemap.minExposure = 0.2
	--tonemap.maxExposure = 4
	tonemap.exposureAdjustTime = 1.5
	tonemap.bloomScale = Vec3(0.05, 0.05, 0.05)
	tonemap.tonemapMethod = 2

	local fog = FogComponentData()
	fog.enable = true
	--fog.fogDistanceMultiplier = 1.0
	--fog.fogGradientEnable = true
	--fog.start = 1
	--fog.endValue = 25
	fog.curve = Vec4(0.45, 0.35, 0.25, -2)
	fog.fogColorEnable = true
	fog.fogColor = Vec3(0.02, 0.02, 0.02)
	fog.fogColorStart = 2
	fog.fogColorEnd = 30
	fog.fogColorCurve = Vec4(0.04, 0.035, 0.03, 0.000)
	--fog.transparencyFadeEnd = 50
	--fog.transparencyFadeClamp = 1.0

	local enlighten = EnlightenComponentData()
	enlighten.enable = true


	morningData.components:add(outdoorLight)
	morningData.runtimeComponentCount = morningData.runtimeComponentCount + 1

	morningData.components:add(colorCorrection)
	morningData.runtimeComponentCount = morningData.runtimeComponentCount + 1

	morningData.components:add(tonemap)
	morningData.runtimeComponentCount = morningData.runtimeComponentCount + 1

	morningData.components:add(fog)
	morningData.runtimeComponentCount = morningData.runtimeComponentCount + 1

	morningData.components:add(enlighten)
	morningData.runtimeComponentCount = morningData.runtimeComponentCount + 1

	morningData.components:add(sky)
	morningData.runtimeComponentCount = morningData.runtimeComponentCount + 1


	morningPreset = EntityManager:CreateEntity(morningData, LinearTransform())

	if morningPreset ~= nil then
		morningPreset:Init(Realm.Realm_Client, true)
	end

end

function removeMorning()

	if morningPreset ~= nil then
		morningPreset:Destroy()
		morningPreset = nil
		return true
	end

	print('removed VES Morning')
end

-- Remove the VE state when the mod is unloading.
Events:Subscribe('Extension:Unloading', function()
	removeMorning()
end)
