require '__shared/settings' --settings

--------------------------------------------------------------------------------

BrightnessMultiplicator = nil
FogMultiplicator = nil

--------------------------------------------------------------------------------

--Custom Map Settings Brightness/Fog

function Multipliers(Map)
	if Map == 1 then
			BrightnessMultiplicator = generalbrightness[1] * Bazaar_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Bazaar_fogMultiplier[1]
	end
	if Map == 2 then
			BrightnessMultiplicator = generalbrightness[1] * Teheran_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Teheran_fogMultiplier[1]
	end
	if Map == 3 then
			BrightnessMultiplicator = generalbrightness[1] * Caspian_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Caspian_fogMultiplier[1]
	end
	if Map == 4 then
			BrightnessMultiplicator = generalbrightness[1] * Seine_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Seine_fogMultiplier[1]
	end
	if Map == 5 then
			BrightnessMultiplicator = generalbrightness[1] * Firestorm_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Firestorm_fogMultiplier[1]
	end
	if Map == 6 then
			BrightnessMultiplicator = generalbrightness[1] * Davamand_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Davamand_fogMultiplier[1]
	end
	if Map == 7 then
			BrightnessMultiplicator = generalbrightness[1] * Noshahr_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Noshahr_fogMultiplier[1]
	end
	if Map == 8 then
			BrightnessMultiplicator = generalbrightness[1] * Kharg_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Kharg_fogMultiplier[1]
	end
	if Map == 9 then
			BrightnessMultiplicator = generalbrightness[1] * Metro_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Metro_fogMultiplier[1]
	end
		------------------------- DLC - Back to Karkand ----------------------
	if Map == 10 then
			BrightnessMultiplicator = generalbrightness[1] * Karkand_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Karkand_fogMultiplier[1]
	end
	if Map == 11 then
			BrightnessMultiplicator = generalbrightness[1] * Gulf_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Gulf_fogMultiplier[1]
	end
	if Map == 12 then
			BrightnessMultiplicator = generalbrightness[1] * Sharqi_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Sharqi_fogMultiplier[1]
	end
	if Map == 13 then
			BrightnessMultiplicator = generalbrightness[1] * Wake_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Wake_fogMultiplier[1]
	end
		----------------------- DLC - Close Quarters -------------------------
	if Map == 14 then
			BrightnessMultiplicator = generalbrightness[1] * Donya_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Donya_fogMultiplier[1]
	end
	if Map == 15 then
			BrightnessMultiplicator = generalbrightness[1] * Operation925_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Operation925_fogMultiplier[1]
	end
	if Map == 16 then
			BrightnessMultiplicator = generalbrightness[1] * Scrapmetal_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Scrapmetal_fogMultiplier[1]
	end
	if Map == 17 then
			BrightnessMultiplicator = generalbrightness[1] * Ziba_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Ziba_fogMultiplier[1]
	end
		---------------------- DLC - Armored Kill ----------------------------
	if Map == 18 then
			BrightnessMultiplicator = generalbrightness[1] * Alborz_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Alborz_fogMultiplier[1]
	end
	if Map == 19 then
			BrightnessMultiplicator = generalbrightness[1] * Shield_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Shield_fogMultiplier[1]
	end
	if Map == 20 then
			BrightnessMultiplicator = generalbrightness[1] * Bandar_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Bandar_fogMultiplier[1]
	end
	if Map == 21 then
			BrightnessMultiplicator = generalbrightness[1] * Death_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Death_fogMultiplier[1]
	end
		----------------------- DLC - Aftermath ------------------------------
	if Map == 22 then
			BrightnessMultiplicator = generalbrightness[1] * Azadi_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Azadi_fogMultiplier[1]
	end
	if Map == 23 then
			BrightnessMultiplicator = generalbrightness[1] * Epicenter_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Epicenter_fogMultiplier[1]
	end
	if Map == 24 then
			BrightnessMultiplicator = generalbrightness[1] * Markaz_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Markaz_fogMultiplier[1]
	end
	if Map == 25 then
			BrightnessMultiplicator = generalbrightness[1] * Talah_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Talah_fogMultiplier[1]
	end
		----------------------- DLC - End Game -------------------------------
	if Map == 26 then
			BrightnessMultiplicator = generalbrightness[1] * Riverside_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Riverside_fogMultiplier[1]
	end
	if Map == 27 then
			BrightnessMultiplicator = generalbrightness[1] * Nebandan_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Nebandan_fogMultiplier[1]
	end
	if Map == 28 then
			BrightnessMultiplicator = generalbrightness[1] * Kiasar_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Kiasar_fogMultiplier[1]
	end
	if Map == 29 then
			BrightnessMultiplicator = generalbrightness[1] * Pipeline_brightnessMultiplier[1]
			FogMultiplicator = generalfog[1] * Pipeline_fogMultiplier[1]
	end
	print("BrightnessMultiplicator: " ..BrightnessMultiplicator)
	print("FogMultiplicator: " ..FogMultiplicator)
end

--------------------------------------------------------------------------


function EnforceBrightness()
PostProcessing = ResourceManager:GetSettings("GlobalPostProcessSettings")

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
