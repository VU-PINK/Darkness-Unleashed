local outdoorLight = nil
local enlighten = nil
local tonemap = nil
local cc = nil
local sky = nil
local fog = nil
local wind = nil
local sunFlare = nil
local dynamicAO = nil
local dof = nil
local vignette = nil
local grain = nil
local lens = nil
local screen = nil

function Presetname(Map)

	if nightPreset ~= nil then
		return
	end

  -- OutdoorLightComponentData
  local outdoorLight = OutdoorLightComponentData()
  outdoorLight.enable = bool
  outdoorLight.realm = 0

  outdoorLight.skyColor = Vec3()
  outdoorLight.groundColor = Vec3()
  outdoorLight.sunColor = Vec3()
  outdoorLight.sunRotationX = float
  outdoorLight.sunRotationY = float

  outdoorLight.cloudShadowEnable = bool
  outdoorLight.cloudShadowTexture = TextureAsset()
  outdoorLight.cloudShadowSize = float
  outdoorLight.cloudShadowExponent = float
  outdoorLight.cloudShadowCoverage = float
  outdoorLight.cloudShadowSpeed = Vec2()

  outdoorLight.skyLightAngleFactor = float
  outdoorLight.sunSpecularScale = float
  outdoorLight.skyEnvmapShadowScale = float
  outdoorLight.sunShadowHeightScale = float

  outdoorLight.translucencyDistortion = float
  outdoorLight.translucencyAmbient = float
  outdoorLight.translucencyScale = float
  outdoorLight.translucencyPower = float

  -- EnlightenComponentData
  local enlighten = EnlightenComponentData()
  enlighten.enable = bool
  enlighten.realm = 0

  enlighten.sunScale = float
  enlighten.bounceScale = float
  enlighten.cullDistance = float

  enlighten.skyBoxEnable = bool
  enlighten.skyBoxSkyColor = Vec3()
  enlighten.skyBoxSunLightColor = Vec3()
  enlighten.skyBoxGroundColor = Vec3()
  enlighten.skyBoxBackLightColor = Vec3()
  enlighten.skyBoxSunLightColorSize = float
  enlighten.skyBoxBackLightColorSize = float
  enlighten.skyBoxBackLightRotationX = float
  enlighten.skyBoxBackLightRotationY = float

  enlighten.terrainColor = Vec3()

  -- TonemapComponentData
  local tonemap = TonemapComponentData()
  tonemap.realm = 0

  tonemap.bloomScale = Vec3()
  tonemap.tonemapMethod = 1

  tonemap.minExposure = float
  tonemap.maxExposure = float
  tonemap.exposureAdjustTime = float
  tonemap.middleGray = float

  tonemap.chromostereopsisEnable = bool
  tonemap.chromostereopsisScale = float
  tonemap.chromostereopsisOffset = float

  -- ColorCorrectionComponentData
  local cc = ColorCorrectionComponentData()
  cc.enable = bool
  cc.realm = 0

  cc.brightness = Vec3()
  cc.saturation = Vec3()
  cc.contrast = Vec3()
  cc.hue = float

  cc.colorGradingEnable = bool
  cc.colorGradingTexture = TextureAsset()

  -- SkyComponentData
  local sky = SkyComponentData()
  sky.enable = bool
  sky.realm = 0

  sky.brightnessScale = float
  sky.sunSize = 0
  sky.sunScale = float
  sky.skyVisibilityExponent = float

  sky.panoramicTexture = TextureAsset()
  sky.panoramicAlphaTexture = TextureAsset()
  sky.panoramicTileFactor = float
  sky.panoramicUVMinX = float
  sky.panoramicUVMinY = float
  sky.panoramicUVMaxX = float
  sky.panoramicUVMaxY = float

  sky.staticEnvmapTexture = TextureAsset()
  sky.staticEnvmapScale = float
  sky.customEnvmapTexture = TextureAsset()
  sky.customEnvmapScale = float
  sky.customEnvmapAmbient = float
  sky.skyEnvmap8BitTexScale = float

  sky.cloudLayerMaskTexture = TextureAsset()
  sky.cloudLayerSunColor = Vec3()
  sky.cloudLayer1Color = Vec3()
  sky.cloudLayer1SunLightIntensity = float
  sky.cloudLayer1AmbientLightIntensity = float
  sky.cloudLayer1SunLightPower = float
  sky.cloudLayer1AlphaMul = float
  sky.cloudLayer1Altitude = float
  sky.cloudLayer1Rotation = float
  sky.cloudLayer1TileFactor = float
  sky.cloudLayer1Speed = float
  sky.cloudLayer2Color = Vec3()
  sky.cloudLayer2SunLightIntensity = float
  sky.cloudLayer2AmbientLightIntensity = float
  sky.cloudLayer2SunLightPower = float
  sky.cloudLayer2AlphaMul = float
  sky.cloudLayer2Altitude = float
  sky.cloudLayer2Rotation = float
  sky.cloudLayer2TileFactor = float
  sky.cloudLayer2Speed = float

  -- FogComponentData
  local fog = FogComponentData()
  fog.enable = bool
  fog.realm = 0

  fog.start = float
  fog.endValue = float
  fog.curve = Vec4()
  fog.fogDistanceMultiplier = float
  fog.fogGradientEnable = bool

  fog.fogColorEnable = bool
  fog.fogColor = Vec3()
  fog.fogColorCurve = Vec4()
  fog.fogColorStart = float
  fog.fogColorEnd = float

  fog.transparencyFadeStart = float
  fog.transparencyFadeClamp = float
  fog.transparencyFadeEnd = float

  fog.heightFogEnable = bool
  fog.heightFogDepth = float
  fog.heightFogAltitude = float
  fog.heightFogFollowCamera = float
  fog.heightFogVisibilityRange = float

  -- WindComponentData
  local wind = WindComponentData()
  wind.realm = 0

  wind.windDirection = float
  wind.windStrength = float

  -- SunFlareComponentData
  local sunFlare = SunFlareComponentData()
  sunFlare.enable = bool
  sunFlare.realm = 0

  sunFlare.element1Enable = bool
  sunFlare.element1Shader = SurfaceShaderBaseAsset()
  sunFlare.element1Size = Vec2()
  sunFlare.element1SizeOccluderCurve = Vec4()
  sunFlare.element1SizeScreenPosCurve = Vec4()
  sunFlare.element1AlphaOccluderCurve = Vec4()
  sunFlare.element1AlphaScreenPosCurve = Vec4()
  sunFlare.element1RayDistance = float

  sunFlare.element2Enable = bool
  sunFlare.element2Shader = SurfaceShaderBaseAsset()
  sunFlare.element2Size = Vec2()
  sunFlare.element2SizeOccluderCurve = Vec4()
  sunFlare.element2SizeScreenPosCurve = Vec4()
  sunFlare.element2AlphaOccluderCurve = Vec4()
  sunFlare.element2AlphaScreenPosCurve = Vec4()
  sunFlare.element2RayDistance = float

  sunFlare.element3Enable = bool
  sunFlare.element3Shader = SurfaceShaderBaseAsset()
  sunFlare.element3Size = Vec2()
  sunFlare.element3SizeOccluderCurve = Vec4()
  sunFlare.element3SizeScreenPosCurve = Vec4()
  sunFlare.element3AlphaOccluderCurve = Vec4()
  sunFlare.element3AlphaScreenPosCurve = Vec4()
  sunFlare.element3RayDistance = float

  sunFlare.element4Enable = bool
  sunFlare.element4Shader = SurfaceShaderBaseAsset()
  sunFlare.element4Size = Vec2()
  sunFlare.element4SizeOccluderCurve = Vec4()
  sunFlare.element4SizeScreenPosCurve = Vec4()
  sunFlare.element4AlphaOccluderCurve = Vec4()
  sunFlare.element4AlphaScreenPosCurve = Vec4()
  sunFlare.element4RayDistance = float

  sunFlare.element5Enable = bool
  sunFlare.element5Shader = SurfaceShaderBaseAsset()
  sunFlare.element5Size = Vec2()
  sunFlare.element5SizeOccluderCurve = Vec4()
  sunFlare.element5SizeScreenPosCurve = Vec4()
  sunFlare.element5AlphaOccluderCurve = Vec4()
  sunFlare.element5AlphaScreenPosCurve = Vec4()
  sunFlare.element5RayDistance = float

  -- DynamicAOComponentData
  local dynamicAO = DynamicAOComponentData
  dynamicAO.enable = bool
  dynamicAO.realm = 0

  dynamicAO.ssaoMaxDistanceOuter = float
  dynamicAO.ssaoFade = float
  dynamicAO.ssaoRadius = float
  dynamicAO.ssaoMaxDistanceInner = float
  dynamicAO.hbaoRadius = float
  dynamicAO.hbaoAttenuation = float
  dynamicAO.hbaoAngleBias = float
  dynamicAO.hbaoPowerExponent = float
  dynamicAO.hbaoContrast = float
  dynamicAO.hbaoMaxFootprintRadius = float

  -- DofComponentData
  local dof = DofComponentData()
  dof.enable = bool
  dof.realm = 0

  dof.scale = float
  dof.nearDistanceScale = float
  dof.farDistanceScale = float
  dof.focusDistance = float
  dof.blurFilter = BlurFilter()
  dof.blurFilterDeviation = float
  dof.blurAdd = float

  dof.diffusionDofEnable = bool
  dof.diffusionDofAperture = float
  dof.diffusionDofFocalLength = float

  -- VignetteComponentData
  local vignette = VignetteComponentData()
  vignette.enable = bool
  vignette.realm = 0

  vignette.scale = Vec2()
  vignette.color = Vec3()
  vignette.exponent = float
  vignette.opactiy = float

  -- FilmGrainComponentData
  local grain = FilmGrainComponentData()
  grain.enable = bool
  grain.realm = 0

  grain.randomEnable = bool
  grain.linearFilteringEnable = bool
  grain.texture = TextureAsset()
  grain.textureScale = Vec2()
  grain.colorScale = Vec3()

  -- LensScopeComponentData
  local lens = LensScopeComponentData()
  lens.enable = bool
  lens.realm = 0

  lens.blurScale = float
  lens.blurCenter = Vec2()

  lens.chromaticAberrationStrengths = Vec2()
  lens.chromaticAberrationColor1 = Vec3()
  lens.chromaticAberrationDisplacement1 = Vec2()
  lens.chromaticAberrationColor2 = Vec3()
  lens.chromaticAberrationDisplacement2 = Vec3()
  lens.radialBlendDistanceCoefficients = Vec2()

  -- ScreenEffectComponentData
  local screen = ScreenEffectComponentData()
  screen.enable = bool
  screen.realm = 0

  screen.shader = SurfaceShaderBaseAsset()
  screen.frameType = ScreenEffectFrameType()
  screen.frameWidth = float
  screen.outerFrameOpacity = float
  screen.innerFrameOpacity = float
  screen.screenEffectParams = Vec4()
  screen.angle = float

  -- DamageEffectComponentData
  local damage = DamageEffectComponentData()
  damage.realm = 0








	PresetnameData.components:add(outdoorLight)
	PresetnameData.runtimeComponentCount = PresetnameData.runtimeComponentCount + 1



	nightPreset = EntityManager:CreateEntity(nightData, LinearTransform())

	if PresetnamePreset ~= nil then
		PresetnamePreset:Init(Realm.Realm_Client, true)
	end

end

function removePresetname()

	if PresetnamePreset ~= nil then
		PresetnamePreset:Destroy()
		PresetnamePreset = nil
		return true
	end

	print('removed VES Presetname')
end

-- Remove the VE state when the mod is unloading.
Events:Subscribe('Extension:Unloading', function()
	removePresetname()
end)
