local Settings = require '__shared/settings' --settings
local Tool = require '__shared/classes/tools/tool'

--------------------------------------------------------------------------------

BrightnessMultiplicator = nil
FogMultiplicator = nil

--------------------------------------------------------------------------------

--Custom Map Settings Brightness/Fog

function Multipliers(mapName)
	BrightnessMultiplicator = Settings.Generalbrightness * Settings.MapBrightnessMultipliers[mapName]
	FogMultiplicator = Settings.Generalfog * Settings.MapFogMultipliers[mapName]

	Tool:DebugPrint("BrightnessMultiplicator: " ..BrightnessMultiplicator, 'common')
	Tool:DebugPrint("FogMultiplicator: " ..FogMultiplicator, 'common')
end

--------------------------------------------------------------------------


function EnforceBrightness()
local PostProcessing = ResourceManager:GetSettings("GlobalPostProcessSettings")

	if PostProcessing ~= nil and UserSettingsSaved ~= true then

		PostProcessing = GlobalPostProcessSettings(PostProcessing)
		UserSettings.userBrightnessMin = PostProcessing.userBrightnessMin
		UserSettings.userBrightnessMax = PostProcessing.userBrightnessMax
		UserSettings.brightness = PostProcessing.brightness
		UserSettings.forceExposure = PostProcessing.forceExposure
		Tool:DebugPrint('Saving User PP Settings:', 'common')
		Tool:DebugPrint('Brightness_Min: ' .. UserSettings.userBrightnessMin, 'common')
		Tool:DebugPrint('Brightness_Max: '..UserSettings.userBrightnessMax, 'common')
		UserSettingsSaved = true

	end

	if UserSettingsSaved == true then

		PostProcessing = GlobalPostProcessSettings(PostProcessing)
		PostProcessing.userBrightnessMin = 1
		PostProcessing.userBrightnessMax = 1
		PostProcessing.brightness = Vec3(1, 1, 1)
		PostProcessing.forceExposure = 0.70
		Tool:DebugPrint('Changed PostProcessing', 'common')
			
	end

end

function ReleaseBrightness()
	local PostProcessing = ResourceManager:GetSettings("GlobalPostProcessSettings")

	if PostProcessing ~= nil and UserSettingsSaved ~= true then

		Tool:DebugPrint("No User PP Settings saved.")

	elseif UserSettingsSaved == true then

		PostProcessing = GlobalPostProcessSettings(PostProcessing)
		PostProcessing.userBrightnessMin = UserSettings.userBrightnessMin
		PostProcessing.userBrightnessMax = UserSettings.userBrightnessMax
		PostProcessing.brightness = UserSettings.brightness
		PostProcessing.forceExposure = UserSettings.forceExposure
		Tool:DebugPrint('Changed PostProcessing', 'common')

	end

end


function allowMoreSpotlights()
	local WorldRender = ResourceManager:GetSettings('WorldRenderSettings')

	if WorldRender ~= nil and changedSpotlightSettings ~= true then

		WorldRender = WorldRenderSettings(WorldRender)
		
		UserSettings.maxSpotLightShadowCount = WorldRender.maxSpotLightShadowCount
		UserSettings.maxSpotLightCount = WorldRender.maxSpotLightCount
		UserSettings.shadowmapViewDistance = WorldRender.shadowmapViewDistance
		UserSettings.lightOverdrawMaxLayerCount = WorldRender.lightOverdrawMaxLayerCount

		Tool:DebugPrint('Changing Max Spotlight Count', 'altering')
		WorldRender.maxSpotLightShadowCount = 6
		Tool:DebugPrint('[NEW] maxSpotLightShadowCount: ' ..WorldRender.maxSpotLightShadowCount, 'altering')

		Tool:DebugPrint('[OLD] maxSpotLightCount ' .. WorldRender.maxSpotLightCount, 'altering')
		WorldRender.maxSpotLightCount = WorldRender.maxSpotLightCount * 2
		Tool:DebugPrint('[NEW] maxSpotLightCount ' .. WorldRender.maxSpotLightCount, 'altering')
	
		Tool:DebugPrint('[OLD] shadowmapViewDistance ' .. WorldRender.shadowmapViewDistance, 'altering')
		WorldRender.shadowmapViewDistance = 100
		Tool:DebugPrint('[NEW] shadowmapViewDistance ' .. WorldRender.shadowmapViewDistance, 'altering')

		Tool:DebugPrint('[OLD] lightOverdrawMaxLayerCount ' .. WorldRender.lightOverdrawMaxLayerCount, 'altering')
		WorldRender.lightOverdrawMaxLayerCount = 32
		Tool:DebugPrint('[NEW] lightOverdrawMaxLayerCount ' .. WorldRender.lightOverdrawMaxLayerCount, 'altering')

		changedSpotlightSettings = true
	end

	local Visual = ResourceManager:GetSettings('VisualTerrainSettings')

	if Visual ~= nil then 

		Visual = VisualTerrainSettings(Visual)

		UserSettings.meshScatteringCastShadowsEnable = Visual.meshScatteringCastShadowsEnable
		
		Tool:DebugPrint('[OLD] meshScatteringCastShadowsEnable ' .. tostring(Visual.meshScatteringCastShadowsEnable), 'altering')
		Visual.meshScatteringCastShadowsEnable = false 
		Tool:DebugPrint('[NEW] meshScatteringCastShadowsEnable ' .. tostring(Visual.meshScatteringCastShadowsEnable), 'altering')

	end 

		
end

function resetMoreSpotlights()
	local WorldRender = ResourceManager:GetSettings('WorldRenderSettings')
	local Visual = ResourceManager:GetSettings('VisualTerrainSettings')

	if WorldRender ~= nil and changedSpotlightSettings == true then

		WorldRender = WorldRenderSettings(WorldRender)

		WorldRender.maxSpotLightShadowCount = UserSettings.maxSpotLightShadowCount
		Tool:DebugPrint('Resetting Max Spotlight Shadow Count to ' .. WorldRender.xenonLightTileMaxSpotLightCount, 'altering')

		WorldRender.shadowmapViewDistance = UserSettings.shadowmapViewDistance
		Tool:DebugPrint('Resetting shadowmapViewDistance to ' .. WorldRender.shadowmapViewDistance, 'altering')

		WorldRender.maxSpotLightCount = UserSettings.maxSpotLightCount
		Tool:DebugPrint('Resetting Max Spotlight Count to ' .. WorldRender.maxSpotLightCount, 'altering')
		
		WorldRender.lightOverdrawMaxLayerCount = UserSettings.lightOverdrawMaxLayerCount
		Tool:DebugPrint('Resetting lightOverdrawMaxLayerCount to ' .. WorldRender.lightOverdrawMaxLayerCount, 'altering')

	end

	if Visual ~= nil and changedSpotlightSettings == true then

		Visual = VisualTerrainSettings(Visual)

		Visual.meshScatteringCastShadowsEnable = UserSettings.meshScatteringCastShadowsEnable
		Tool:DebugPrint('Resetting meshScatteringCastShadowsEnable to ' .. tostring(Visual.meshScatteringCastShadowsEnable), 'altering')

		Visual.meshScatteringInstanceCullJobCount = UserSettings.meshScatteringInstanceCullJobCount
		Tool:DebugPrint('Resetting meshScatteringInstanceCullJobCount to ' .. tostring(Visual.meshScatteringInstanceCullJobCount), 'altering')


	end

	if changedSpotlightSettings == true then
		changedSpotlightSettings = false 
	end

end

