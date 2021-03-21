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

	Tool:DebugPrint("BrightnessMultiplicator: " ..BrightnessMultiplicator)
	Tool:DebugPrint("FogMultiplicator: " ..FogMultiplicator)
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
		Tool:DebugPrint('Saving User PP Settings:')
		Tool:DebugPrint('Brightness_Min: ' .. UserSettings.userBrightnessMin)
		Tool:DebugPrint('Brightness_Max: '..UserSettings.userBrightnessMax)
		UserSettingsSaved = true

	end

	if UserSettingsSaved == true then

		PostProcessing = GlobalPostProcessSettings(PostProcessing)
		PostProcessing.userBrightnessMin = 1
		PostProcessing.userBrightnessMax = 1
		PostProcessing.brightness = Vec3(1, 1, 1)
		PostProcessing.forceExposure = 0.70
		Tool:DebugPrint('Changed PostProcessing')
			
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
		Tool:DebugPrint('Changed PostProcessing')

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

		Tool:DebugPrint('Changing Max Spotlight Count')
		WorldRender.maxSpotLightShadowCount = 6
		Tool:DebugPrint('[NEW] maxSpotLightShadowCount: ' ..WorldRender.maxSpotLightShadowCount)

		Tool:DebugPrint('[OLD] maxSpotLightCount ' .. WorldRender.maxSpotLightCount)
		WorldRender.maxSpotLightCount = WorldRender.maxSpotLightCount * 2
		Tool:DebugPrint('[NEW] maxSpotLightCount ' .. WorldRender.maxSpotLightCount)
	
		Tool:DebugPrint('[OLD] shadowmapViewDistance ' .. WorldRender.shadowmapViewDistance)
		WorldRender.shadowmapViewDistance = 100
		Tool:DebugPrint('[NEW] shadowmapViewDistance ' .. WorldRender.shadowmapViewDistance)

		Tool:DebugPrint('[OLD] lightOverdrawMaxLayerCount ' .. WorldRender.lightOverdrawMaxLayerCount)
		WorldRender.lightOverdrawMaxLayerCount = 32
		Tool:DebugPrint('[NEW] lightOverdrawMaxLayerCount ' .. WorldRender.lightOverdrawMaxLayerCount)

		changedSpotlightSettings = true
	end

	local Visual = ResourceManager:GetSettings('VisualTerrainSettings')

	if Visual ~= nil then 

		Visual = VisualTerrainSettings(Visual)

		UserSettings.meshScatteringCastShadowsEnable = Visual.meshScatteringCastShadowsEnable
		
		Tool:DebugPrint('[OLD] meshScatteringCastShadowsEnable ' .. tostring(Visual.meshScatteringCastShadowsEnable))
		Visual.meshScatteringCastShadowsEnable = false 
		Tool:DebugPrint('[NEW] meshScatteringCastShadowsEnable ' .. tostring(Visual.meshScatteringCastShadowsEnable))

	end 

		
end

function resetMoreSpotlights()
	local WorldRender = ResourceManager:GetSettings('WorldRenderSettings')
	local Visual = ResourceManager:GetSettings('VisualTerrainSettings')

	if WorldRender ~= nil and changedSpotlightSettings == true then

		WorldRender = WorldRenderSettings(WorldRender)

		WorldRender.maxSpotLightShadowCount = UserSettings.maxSpotLightShadowCount
		Tool:DebugPrint('Resetting Max Spotlight Shadow Count to ' .. WorldRender.xenonLightTileMaxSpotLightCount)

		WorldRender.shadowmapViewDistance = UserSettings.shadowmapViewDistance
		Tool:DebugPrint('Resetting shadowmapViewDistance to ' .. WorldRender.shadowmapViewDistance)

		WorldRender.maxSpotLightCount = UserSettings.maxSpotLightCount
		Tool:DebugPrint('Resetting Max Spotlight Count to ' .. WorldRender.maxSpotLightCount)
		
		WorldRender.lightOverdrawMaxLayerCount = UserSettings.lightOverdrawMaxLayerCount
		Tool:DebugPrint('Resetting lightOverdrawMaxLayerCount to ' .. WorldRender.lightOverdrawMaxLayerCount)

	end

	if Visual ~= nil and changedSpotlightSettings == true then

		Visual = VisualTerrainSettings(Visual)

		Visual.meshScatteringCastShadowsEnable = UserSettings.meshScatteringCastShadowsEnable
		Tool:DebugPrint('Resetting meshScatteringCastShadowsEnable to ' .. tostring(Visual.meshScatteringCastShadowsEnable))

		Visual.meshScatteringInstanceCullJobCount = UserSettings.meshScatteringInstanceCullJobCount
		Tool:DebugPrint('Resetting meshScatteringInstanceCullJobCount to ' .. tostring(Visual.meshScatteringInstanceCullJobCount))


	end

	if changedSpotlightSettings == true then
		changedSpotlightSettings = false 
	end

end

