local night = nil
local shaderParams = nil
local outdoorLight = nil
local sky = nil
local fog = nil
local tonemap = nil
local cc = nil
local enlighten = nil
local sunFlare = nil


function Night()
	--Code Idea/Concept credit to https://github.com/OrfeasZ

	night = VisualEnvironmentState()
	night.visibility = 1.0
	night.priority = 100

	shaderParams = ShaderParamsData()
	shaderParams.value = Vec4(1.0, 1.0, 1.0, 1.0)
	shaderParams.parameterName = 'FLIRData'

	outdoorLight = OutdoorLightData()
	outdoorLight.enable = true
	outdoorLight.sunColor = Vec3(0.02, 0.02, 0.02)
	outdoorLight.skyColor = Vec3(0.01, 0.01, 0.01)
	outdoorLight.groundColor = Vec3(0, 0, 0)

	sky = SkyComponentData()
	sky.brightnessScale = 0.0005
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
	sky.panoramicRotation = rotation

	fog = FogData()
	fog.enable = true
	fog.fogDistanceMultiplier = 1.0
	fog.fogGradientEnable = true
	fog.start = 2
	fog.endValue = 65
	fog.curve = Vec4(3.108949, -4.2201934, 2.0970724, -0.001664313)
	fog.fogColorEnable = true
	fog.fogColor = Vec3(0.0005, 0.0005, 0.0000000015)
	fog.fogColorStart = 2
	fog.fogColorEnd = 40
	fog.fogColorCurve = Vec4(0.30, 0.20, 0.15, 0)
	fog.transparencyFadeStart = -50
	fog.transparencyFadeEnd = 50
	fog.transparencyFadeClamp = 1.0

	tonemap = TonemapData()
	tonemap.minExposure = 0.2
	tonemap.maxExposure = 4
	tonemap.exposureAdjustTime = 1.5
	tonemap.bloomScale = Vec(0.05, 0.05, 0.05)
	tonemap.tonemapMethod = 3

	cc = ColorCorrectionData()
	cc.enable = true
	cc.contrast = Vec3(1.05, 1.05, 1.05)
	cc.saturation = Vec3(1.22, 1.25, 1.5)

	enlighten = EnlightenData()
	enlighten.enlightenEnable = false

	sunFlare = SunFlareData()
	sunFlare.flareExcluded = true

	-- Add components to VE state.
	night.outdoorLight = outdoorLight
	night.vignette = vignette
	night.fog = fog
	night.colorCorrection = cc
	night.enlighten = enlighten
	night.sunFlare = sunFlare
	night.tonemap = tonemap

	night:AddShaderParams(shaderParams)
	-- Add state to VE manager.
	VisualEnvironmentManager:AddState(night)

end

function removeNight()

	if night ~= nil then
		night:Destroy()
		night = nil
	end

	print('removed VES')
end

-- Remove the VE state when the mod is unloading.
Events:Subscribe('Extension:Unloading', function()
	removeNight()
end)
