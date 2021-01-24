local night = nil
local shaderParams = nil
local outdoorLight = nil
local sky = nil
local fog = nil
local tonemap = nil
local cc = nil
local enlighten = nil
local sunFlare = nil


function Night(Map)
	if night ~= nil then
		return
	end

	local nightData = VisualEnvironmentEntityData()
	nightData.enabled = true
	nightData.visibility = 1.0
	nightData.priority = 999999

	local shaderParams = ShaderParamsComponentData()
	shaderParams.value = Vec4(1.0, 1.0, 1.0, 1.0)
	shaderParams.parameterName = 'FLIRData'

	local outdoorLight = OutdoorLightComponentData()
	outdoorLight.enable = true
	outdoorLight.sunColor = Vec3(0.02, 0.02, 0.02)
	outdoorLight.skyColor = Vec3(0.01, 0.01, 0.025)
	outdoorLight.groundColor = Vec3(0.01, 0.01, 0.01)
	outdoorLight.skyEnvmapShadowScale = 0.25

	local sky = SkyComponentData()
	sky.brightnessScale = 0.00005--*BrightnessMultiplicator
	sky.sunSize = 0
	sky.sunScale = 0
	sky.cloudLayer1SunLightIntensity = 0.0001
	sky.cloudLayer1SunLightPower = 0.0001
	sky.cloudLayer1AmbientLightIntensity = 0.0005
	sky.cloudLayer2SunLightIntensity = 0.0001
	sky.cloudLayer2SunLightPower = 0.0001
	sky.cloudLayer2AmbientLightIntensity = 0.0005
	sky.staticEnvmapScale = 0.1
	sky.skyEnvmap8BitTexScale = 1
	sky.customEnvmapAmbient = 0.05

	local colorCorrection = ColorCorrectionComponentData()
	colorCorrection.enable = true
	colorCorrection.brightness = Vec3(1, 1, 1)
	colorCorrection.contrast = Vec3(1.05, 1.05, 1.05)
	colorCorrection.saturation = Vec3(1.0, 1.025, 1.15)

	local tonemap = TonemapComponentData()
	tonemap.minExposure = 0.2
	tonemap.maxExposure = 4
	tonemap.exposureAdjustTime = 1.5
	tonemap.bloomScale = Vec3(0.05, 0.05, 0.05)
	tonemap.tonemapMethod = 2

	local fog = FogComponentData()
	fog.enable = true
	--fog.fogDistanceMultiplier = 1.0
	--fog.fogGradientEnable = true
	fog.start = 1
	fog.endValue = 25
	fog.curve = Vec4(0.45, 0.35, 0.25, -2)
	fog.fogColorEnable = true
	fog.fogColor = Vec3(0.0001, 0.0001, 0.0001)
	fog.fogColorStart = 2
	fog.fogColorEnd = 30
	fog.fogColorCurve = Vec4(0.4, 0.35, 0.2, -2)
	fog.transparencyFadeEnd = 50
	fog.transparencyFadeClamp = 1.0

	local enlighten = EnlightenComponentData()
	enlighten.enable = false

	local sunFlare = SunFlareComponentData()
	sunFlare.enable = false

	--nightData.components:add(shaderParams)
	--nightData.runtimeComponentCount = nightData.runtimeComponentCount + 1

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
	end

	print('removed VES')
end

-- Remove the VE state when the mod is unloading.
Events:Subscribe('Extension:Unloading', function()
	removeNight()
end)
