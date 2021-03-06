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
								UserSettings_userBrightnessMin = PostProcessing.userBrightnessMin
								UserSettings_userBrightnessMax = PostProcessing.userBrightnessMax
								UserSettings_brightness = PostProcessing.brightness
								print('Saving User Settings:')
								print('Brightness_Min: ' .. UserSettings_userBrightnessMin)
								print('Brightness_Max: '..UserSettings_userBrightnessMax)
								UserSettingsSaved = true
						end

						if UserSettingsSaved == true then
								PostProcessing = GlobalPostProcessSettings(PostProcessing)
								PostProcessing.userBrightnessMin = 1
								PostProcessing.userBrightnessMax = 1
								PostProcessing.brightness = Vec3(1.5, 1.5, 1.5)
								print('Changed PostProcessing')
						end

end

function ReleaseBrightness()
local PostProcessing = ResourceManager:GetSettings("GlobalPostProcessSettings")

							if PostProcessing ~= nil and UserSettingsSaved ~= true then
									PostProcessing = GlobalPostProcessSettings(PostProcessing)
									UserSettings_userBrightnessMin = PostProcessing.userBrightnessMin
									UserSettings_userBrightnessMax = PostProcessing.userBrightnessMax
									UserSettings_brightness = PostProcessing.brightness
									print('Saving User Settings:')
									print('Brightness_Min: ' .. UserSettings_userBrightnessMin)
									print('Brightness_Max: '..UserSettings_userBrightnessMax)
									UserSettingsSaved = true
							end

							if UserSettingsSaved == true then
									local PostProcessingX = ResourceManager:GetSettings("GlobalPostProcessSettings")
									PostProcessingX = GlobalPostProcessSettings(PostProcessing)
									PostProcessingX.userBrightnessMin = UserSettings_userBrightnessMin
									PostProcessingX.userBrightnessMax = UserSettings_userBrightnessMax
									PostProcessingX.brightness = UserSettings_brightness
									print('Changed PostProcessing')
							end
end
