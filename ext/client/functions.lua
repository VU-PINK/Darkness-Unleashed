local Settings = require '__shared/settings' --settings

--------------------------------------------------------------------------------

BrightnessMultiplicator = nil
FogMultiplicator = nil

--------------------------------------------------------------------------------

--Custom Map Settings Brightness/Fog

function Multipliers(mapName)
	BrightnessMultiplicator = Settings.Generalbrightness * Settings.MapBrightnessMultipliers[mapName]
	FogMultiplicator = Settings.Generalfog * Settings.MapFogMultipliers[mapName]

	print("BrightnessMultiplicator: " ..BrightnessMultiplicator)
	print("FogMultiplicator: " ..FogMultiplicator)
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
								print('Saving User PP Settings:')
								print('Brightness_Min: ' .. UserSettings.userBrightnessMin)
								print('Brightness_Max: '..UserSettings.userBrightnessMax)
								UserSettingsSaved = true

						end

						if UserSettingsSaved == true then

								PostProcessing = GlobalPostProcessSettings(PostProcessing)
								PostProcessing.userBrightnessMin = 1
								PostProcessing.userBrightnessMax = 1
								PostProcessing.brightness = Vec3(1, 1, 1)
								PostProcessing.forceExposure = 0.70
								print('Changed PostProcessing')
								
						end

end

function ReleaseBrightness()
local PostProcessing = ResourceManager:GetSettings("GlobalPostProcessSettings")

						if PostProcessing ~= nil and UserSettingsSaved ~= true then

								print("No User PP Settings saved.")

						elseif UserSettingsSaved == true then

								PostProcessing = GlobalPostProcessSettings(PostProcessing)
								PostProcessing.userBrightnessMin = UserSettings.userBrightnessMin
								PostProcessing.userBrightnessMax = UserSettings.userBrightnessMax
								PostProcessing.brightness = UserSettings.brightness
								PostProcessing.forceExposure = UserSettings.forceExposure
								print('Changed PostProcessing')

						end

end


function allowMoreSpotlights()
local WorldRender = ResourceManager:GetSettings('WorldRenderSettings')

						if WorldRender ~= nil and changedSpotlightSettings ~= true then

								WorldRender = WorldRenderSettings(WorldRender)
								UserSettings.maxSpotLightShadowCount = WorldRender.maxSpotLightShadowCount
								--print(WorldRender.maxSpotLightShadowCount)
								print('Changing Max Spotlight Count')
								WorldRender.maxSpotLightShadowCount = 6
								--print(WorldRender.maxSpotLightShadowCount)
								changedSpotlightSettings = true 
								
						end

end

function resetMoreSpotlights()
local WorldRender = ResourceManager:GetSettings('WorldRenderSettings')

						if WorldRender ~= nil and changedSpotlightSettings == true then

						WorldRender = WorldRenderSettings(WorldRender)
						WorldRender.maxSpotLightShadowCount = UserSettings.maxSpotLightShadowCount
						print('Resetting Max Spotlight Count')
						changedSpotlightSettings = false 

						end

end

