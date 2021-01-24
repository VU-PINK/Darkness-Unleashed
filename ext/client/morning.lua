local morning = nil
local shaderParams = nil
local outdoorLight = nil
local sky = nil
local fog = nil
local tonemap = nil
local cc = nil
local enlighten = nil
local sunFlare = nil


function Morning(Map)
	if morning ~= nil then
		return
	end

	local morningData = VisualEnvironmentEntityData()
	morningData.enabled = true
	morningData.visibility = 1.0
	morningData.priority = 999999

	local shaderParams = ShaderParamsComponentData()
	shaderParams.value = Vec4(1.0, 1.0, 1.0, 1.0)
	shaderParams.parameterName = 'FLIRData'

	local outdoorLight = OutdoorLightComponentData()
	outdoorLight.enable = true
	outdoorLight.sunColor = Vec3(0.5, 0.4, 0.4)
	outdoorLight.skyColor = Vec3(0.5, 0.3, 0.3)
	outdoorLight.groundColor = outdoorLight.skyColor/2
	--outdoorLight.skyEnvmapShadowScale = 0.25

	local sky = SkyComponentData()
	sky.brightnessScale = 0.55--*BrightnessMultiplicator


	local colorCorrection = ColorCorrectionComponentData()
	colorCorrection.enable = true
	colorCorrection.brightness = Vec3(1, 1, 1)
	colorCorrection.contrast = Vec3(1.1, 1.1, 1.1)
	colorCorrection.saturation = Vec3(1.2, 1.15, 1.15)

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

	local sunFlare = SunFlareComponentData()
	sunFlare.enable = true
	sunFlare.element1Size = sunFlare.element1Size*0.25
	sunFlare.element2Size = sunFlare.element2Size*0.25
	sunFlare.element3Size = sunFlare.element3Size*0.25
	sunFlare.element4Size = sunFlare.element4Size*0.25
	sunFlare.element5Size = sunFlare.element5Size*0.25

	--morningData.components:add(shaderParams)
	--morningData.runtimeComponentCount = morningData.runtimeComponentCount + 1

	morningData.components:add(outdoorLight)
	morningData.runtimeComponentCount = morningData.runtimeComponentCount + 1

	morningData.components:add(colorCorrection)
	morningData.runtimeComponentCount = morningData.runtimeComponentCount + 1

	morningData.components:add(tonemap)
	morningData.runtimeComponentCount = morningData.runtimeComponentCount + 1

	morningData.components:add(fog)
	morningData.runtimeComponentCount = morningData.runtimeComponentCount + 1

	morningData.components:add(sky)
	morningData.runtimeComponentCount = morningData.runtimeComponentCount + 1

	morningData.components:add(enlighten)
	morningData.runtimeComponentCount = morningData.runtimeComponentCount + 1

	morningData.components:add(sunFlare)
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
	end

	print('removed VES')
end

-- Remove the VE state when the mod is unloading.
Events:Subscribe('Extension:Unloading', function()
	removeMorning()
end)
