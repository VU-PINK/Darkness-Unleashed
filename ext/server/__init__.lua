local Presets = require '__shared/presets'
local Settings = require '__shared/settings'

--Concept:
Events:Subscribe('Level:LoadResources', function(levelName, gameMode, isDedicatedServer)

        print(levelName)

        -- Vanilla Maps
        ------------------------------------------------------------------------

        -- Bazaar
        if string.find(levelName, "MP_001") then
              if Map['Bazaar.Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Bazaar Night")
              elseif Map['Bazaar.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
                  ServerUtils:SetCustomMapName("Bazaar Morning")
              elseif Map['Bazaar.Bright_Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Bazaar Bright Night")
              --elseif Settings.Map[1] == (true, 'evening') then
                  --Presets.Preset.Evening()
                  --print('Using Preset Evening on Grand Bazaar')
              --elseif Settings.Map[1] == (false, 'none') then
                  --print('Not Changing Map Time')
                  --return
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Teheran Highway
        if string.find(levelName, "MP_003") then
              if Map['Teheran.Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Teheran Night")
              elseif Map['Teheran.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
                  ServerUtils:SetCustomMapName("Teheran Morning")
              elseif Map['Teheran.Bright_Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Teheran Bright Night")
              --elseif Settings.Map[1] == (true, 'evening') then
                  --Presets.Preset.Evening()
                  --print('Using Preset Evening on Grand Bazaar')
              --elseif Settings.Map[1] == (false, 'none') then
                  --print('Not Changing Map Time')
                  --return
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Caspian Border
        if string.find(levelName, "MP_007") then
              if Map['Caspian.Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Caspian Night")
              elseif Map['Caspian.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
                  ServerUtils:SetCustomMapName("Caspian Morning")
              elseif Map['Caspian.Bright_Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Caspian Bright Night")
              --elseif Settings.Map[1] == (true, 'evening') then
                  --Presets.Preset.Evening()
                  --print('Using Preset Evening on Grand Bazaar')
              --elseif Settings.Map[1] == (false, 'none') then
                  --print('Not Changing Map Time')
                  --return
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Seine Crossing
        if string.find(levelName, "MP_011") then
              if Map['Seine.Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Seine Night")
              elseif Map['Seine.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
                  ServerUtils:SetCustomMapName("Seine Morning")
              elseif Map['Seine.Bright_Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Seine Bright Night")
              --elseif Settings.Map[1] == (true, 'evening') then
                  --Presets.Preset.Evening()
                  --print('Using Preset Evening on Grand Bazaar')
              --elseif Settings.Map[1] == (false, 'none') then
                  --print('Not Changing Map Time')
                  --return
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Operation Firestorm
        if string.find(levelName, "MP_012") then
              if Map['Firestorm.Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Firestorm Night")
              elseif Map['Firestorm.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
                  ServerUtils:SetCustomMapName("Firestorm Morning")
              elseif Map['Firestorm.Bright_Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Firestorm Bright Night")
              --elseif Settings.Map[1] == (true, 'evening') then
                  --Presets.Preset.Evening()
                  --print('Using Preset Evening on Grand Bazaar')
              --elseif Settings.Map[1] == (false, 'none') then
                  --print('Not Changing Map Time')
                  --return
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Davamand Peak
		    if string.find(levelName, "MP_013") then
              if Map['Davamand.Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Davamand Night")
              elseif Map['Davamand.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
                  ServerUtils:SetCustomMapName("Davamand Morning")
              elseif Map['Davamand.Bright_Night'] then
                RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                print('Blue-Filter enabled')
                ServerUtils:SetCustomMapName("Davamand Bright Night")
              --elseif Settings.Map[1] == (true, 'evening') then
                  --Presets.Preset.Evening()
                  --print('Using Preset Evening on Grand Bazaar')
              --elseif Settings.Map[1] == (false, 'none') then
                  --print('Not Changing Map Time')
                  --return
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Noshahr Canals
		    if string.find(levelName, "MP_017") then
              if Map['Noshahr.Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Noshahr Night")
              elseif Map['Noshahr.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
                  ServerUtils:SetCustomMapName("Noshahr Morning")
              elseif Map['Noshar.Bright_Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Noshahr Bright Night")
              --elseif Settings.Map[1] == (true, 'evening') then
                  --Presets.Preset.Evening()
                  --print('Using Preset Evening on Grand Bazaar')
              --elseif Settings.Map[1] == (false, 'none') then
                  --print('Not Changing Map Time')
                  --return
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Noshahr Canals
        if string.find(levelName, "MP_018") then
              if Map['Kharg.Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Kharg Night")
              elseif Map['Kharg.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
                  ServerUtils:SetCustomMapName("Kharg Morning")
              elseif Map['Kharg.Bright_Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Kharg Bright Night")
              --elseif Settings.Map[1] == (true, 'evening') then
                  --Presets.Preset.Evening()
                  --print('Using Preset Evening on Grand Bazaar')
              --elseif Settings.Map[1] == (false, 'none') then
                  --print('Not Changing Map Time')
                  --return
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Operation Metro
        if string.find(levelName, "MP_Subway") then
              if Map['Metro.Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Metro Night")
              elseif Map['Metro.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
                  ServerUtils:SetCustomMapName("Metro Morning")
              elseif Map['Metro.Bright_Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Metro Bright Night")
              --elseif Settings.Map[1] == (true, 'evening') then
                  --Presets.Preset.Evening()
                  --print('Using Preset Evening on Grand Bazaar')
              --elseif Settings.Map[1] == (false, 'none') then
                  --print('Not Changing Map Time')
                  --return
              else
                  print('Wrong Configuration')
                  return
              end
        end

        --- Back to Karkand maps | DLC
        ------------------------------------------------------------------------

        -- Back to Karkand
        if string.find(levelName, "XP1_001") then
              if Map['Karkand.Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Karkand Night")
              elseif Map['Karkand.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
                  ServerUtils:SetCustomMapName("Karkand Morning")
              elseif Map['Karkand.Bright_Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Karkand Bright Night")
              --elseif Settings.Map[1] == (true, 'evening') then
                  --Presets.Preset.Evening()
                  --print('Using Preset Evening on Grand Bazaar')
              --elseif Settings.Map[1] == (false, 'none') then
                  --print('Not Changing Map Time')
                  --return
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Gulf of Oman
        if string.find(levelName, "XP1_002") then
              if Map['Gulf.Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Gulf Night")
              elseif Map['Gulf.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
                  ServerUtils:SetCustomMapName("Gulf Morning")
              elseif Map['Gulf.Bright_Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Gulf Bright Night")
              --elseif Settings.Map[1] == (true, 'evening') then
                  --Presets.Preset.Evening()
                  --print('Using Preset Evening on Grand Bazaar')
              --elseif Settings.Map[1] == (false, 'none') then
                  --print('Not Changing Map Time')
                  --return
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Sharqi Peninsula
        if string.find(levelName, "XP1_003") then
              if Map['Sharqi.Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Sharqi Night")
              elseif Map['Sharqi.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
                  ServerUtils:SetCustomMapName("Sharqi Morning")
              elseif Map['Sharqi.Bright_Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Sharqi Bright Night")
              --elseif Settings.Map[1] == (true, 'evening') then
                  --Presets.Preset.Evening()
                  --print('Using Preset Evening on Grand Bazaar')
              --elseif Settings.Map[1] == (false, 'none') then
                  --print('Not Changing Map Time')
                  --return
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Wake Island
        if string.find(levelName, "XP1_004") then
              if Map['Wake.Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Wake Night")
              elseif Map['Wake.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
                  ServerUtils:SetCustomMapName("Wake Morning")
              elseif Map['Wake.Bright_Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Wake Bright Night")
              --elseif Settings.Map[1] == (true, 'evening') then
                  --Presets.Preset.Evening()
                  --print('Using Preset Evening on Grand Bazaar')
              --elseif Settings.Map[1] == (false, 'none') then
                  --print('Not Changing Map Time')
                  --return
              else
                  print('Wrong Configuration')
                  return
              end
        end

        --- Close Quarters | DLC
        ------------------------------------------------------------------------

        -- Donya Fortress
        if string.find(levelName, "XP2_Palace") then
              if Map['Donya.Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Donya Night")
              elseif Map['Donya.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
                  ServerUtils:SetCustomMapName("Donya Morning")
              elseif Map['Donya.Bright_Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Donya Bright Night")
              --elseif Settings.Map[1] == (true, 'evening') then
                  --Presets.Preset.Evening()
                  --print('Using Preset Evening on Grand Bazaar')
              --elseif Settings.Map[1] == (false, 'none') then
                  --print('Not Changing Map Time')
                  --return
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Operation 925
        if string.find(levelName, "XP2_Office") then
              if Map['Operation925.Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Operation 925 Night")
              elseif Map['Operation925.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
                  ServerUtils:SetCustomMapName("Operation 925 Morning")
              elseif Map['Operation925.Bright_Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Operation 925 Bright Night")
              --elseif Settings.Map[1] == (true, 'evening') then
                  --Presets.Preset.Evening()
                  --print('Using Preset Evening on Grand Bazaar')
              --elseif Settings.Map[1] == (false, 'none') then
                  --print('Not Changing Map Time')
                  --return
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Scrapmetal
        if string.find(levelName, "XP2_Factory") then
              if Map['Scrapmetal.Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Scrapmetal Night")
              elseif Map['Scrapmetal.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
                  ServerUtils:SetCustomMapName("Scrapmetal Morning")
              elseif Map['Scrapmetal.Bright_Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Scrapmetal Bright Night")
              --elseif Settings.Map[1] == (true, 'evening') then
                  --Presets.Preset.Evening()
                  --print('Using Preset Evening on Grand Bazaar')
              --elseif Settings.Map[1] == (false, 'none') then
                  --print('Not Changing Map Time')
                  --return
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Ziba Tower
        if string.find(levelName, "XP2_Skybar") then
              if Map['Ziba.Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Ziba Night")
              elseif Map['Ziba.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
                  ServerUtils:SetCustomMapName("Ziba Morning")
              elseif Map['Ziba.Bright_Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Ziba Bright Night")
              --elseif Settings.Map[1] == (true, 'evening') then
                  --Presets.Preset.Evening()
                  --print('Using Preset Evening on Grand Bazaar')
              --elseif Settings.Map[1] == (false, 'none') then
                  --print('Not Changing Map Time')
                  --return
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Armored Kill | DLC
        ------------------------------------------------------------------------

        -- Alborz Mountains
        if string.find(levelName, "XP3_Alborz") then
              if Map['Alborz.Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Alborz Night")
              elseif Map['Alborz.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
                  ServerUtils:SetCustomMapName("Alborz Morning")
              elseif Map['Alborz.Bright_Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Alborz Bright Night")
              --elseif Settings.Map[1] == (true, 'evening') then
                  --Presets.Preset.Evening()
                  --print('Using Preset Evening on Grand Bazaar')
              --elseif Settings.Map[1] == (false, 'none') then
                  --print('Not Changing Map Time')
                  --return
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Armored Shield
        if string.find(levelName, "XP3_Shield") then
              if Map['Shield.Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Shield Night")
              elseif Map['Shield.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
                  ServerUtils:SetCustomMapName("Shield Morning")
              elseif Map['Shield.Bright_Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Shield Bright Night")
              --elseif Settings.Map[1] == (true, 'evening') then
                  --Presets.Preset.Evening()
                  --print('Using Preset Evening on Grand Bazaar')
              --elseif Settings.Map[1] == (false, 'none') then
                  --print('Not Changing Map Time')
                  --return
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Bandar Desert
        if string.find(levelName, "XP3_Desert") then
              if Map['Bandar.Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Bandar Night")
              elseif Map['Bandar.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
                  ServerUtils:SetCustomMapName("Bandar Morning")
              elseif Map['Bandar.Bright_Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Bandar Bright Night")
              --elseif Settings.Map[1] == (true, 'evening') then
                  --Presets.Preset.Evening()
                  --print('Using Preset Evening on Grand Bazaar')
              --elseif Settings.Map[1] == (false, 'none') then
                  --print('Not Changing Map Time')
                  --return
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Death Valley
        if string.find(levelName, "XP3_Valley") then
              if Map['Death.Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Death Night")
              elseif Map['Death.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
                  ServerUtils:SetCustomMapName("Death Morning")
              elseif Map['Death.Bright_Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Death Bright Night")
              --elseif Settings.Map[1] == (true, 'evening') then
                  --Presets.Preset.Evening()
                  --print('Using Preset Evening on Grand Bazaar')
              --elseif Settings.Map[1] == (false, 'none') then
                  --print('Not Changing Map Time')
                  --return
              else
                  print('Wrong Configuration')
                  return
              end
        end

        --- Aftermath | DLC
        ------------------------------------------------------------------------

        -- Azadi Palace
        if string.find(levelName, "XP4_Parl") then
              if Map['Azadi.Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Azadi Night")
              elseif Map['Azadi.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
                  ServerUtils:SetCustomMapName("Azadi Morning")
              elseif Map['Azadi.Bright_Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Azadi Bright Night")
              --elseif Settings.Map[1] == (true, 'evening') then
                  --Presets.Preset.Evening()
                  --print('Using Preset Evening on Grand Bazaar')
              --elseif Settings.Map[1] == (false, 'none') then
                  --print('Not Changing Map Time')
                  --return
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Epicenter
        if string.find(levelName, "XP4_Quake") then
              if Map['Epicenter.Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Epicenter Night")
              elseif Map['Epicenter.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
                  ServerUtils:SetCustomMapName("Epicenter Morning")
              elseif Map['Epicenter.Bright_Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Epicenter Bright Night")
              --elseif Settings.Map[1] == (true, 'evening') then
                  --Presets.Preset.Evening()
                  --print('Using Preset Evening on Grand Bazaar')
              --elseif Settings.Map[1] == (false, 'none') then
                  --print('Not Changing Map Time')
                  --return
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Markaz Monolith
        if string.find(levelName, "XP4_FD") then
              if Map['Markaz.Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Markaz Night")
              elseif Map['Markaz.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
                  ServerUtils:SetCustomMapName("Markaz Morning")
              elseif Map['Markaz.Bright_Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Markaz Bright Night")
              --elseif Settings.Map[1] == (true, 'evening') then
                  --Presets.Preset.Evening()
                  --print('Using Preset Evening on Grand Bazaar')
              --elseif Settings.Map[1] == (false, 'none') then
                  --print('Not Changing Map Time')
                  --return
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Talah Market
        if string.find(levelName, "XP4_Rubble") then
              if Map['Talah.Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Talah Night")
              elseif Map['Talah.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
                  ServerUtils:SetCustomMapName("Talah Morning")
              elseif Map['Talah.Bright_Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Talah Bright Night")
              --elseif Settings.Map[1] == (true, 'evening') then
                  --Presets.Preset.Evening()
                  --print('Using Preset Evening on Grand Bazaar')
              --elseif Settings.Map[1] == (false, 'none') then
                  --print('Not Changing Map Time')
                  --return
              else
                  print('Wrong Configuration')
                  return
              end
        end

        --- End Game | DLC
        ------------------------------------------------------------------------

        -- Operation Riverside
        if string.find(levelName, "XP5_001") then
              if Map['Riverside.Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Riverside Night")
              elseif Map['Riverside.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
                  ServerUtils:SetCustomMapName("Riverside Morning")
              elseif Map['Riverside.Bright_Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Riverside Bright Night")
              --elseif Settings.Map[1] == (true, 'evening') then
                  --Presets.Preset.Evening()
                  --print('Using Preset Evening on Grand Bazaar')
              --elseif Settings.Map[1] == (false, 'none') then
                  --print('Not Changing Map Time')
                  --return
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Nebandan Flats
        if string.find(levelName, "XP5_002") then
              if Map['Nebandan.Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Nebandan Night")
              elseif Map['Nebandan.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
                  ServerUtils:SetCustomMapName("Nebandan Morning")
              elseif Map['Nebandan.Bright_Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Nebandan Bright Night")
              --elseif Settings.Map[1] == (true, 'evening') then
                  --Presets.Preset.Evening()
                  --print('Using Preset Evening on Grand Bazaar')
              --elseif Settings.Map[1] == (false, 'none') then
                  --print('Not Changing Map Time')
                  --return
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Kiasar Railroad
        if string.find(levelName, "XP5_003") then
              if Map['Kiasar.Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Kiasar Night")
              elseif Map['Kiasar.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
                  ServerUtils:SetCustomMapName("Kiasar Morning")
              elseif Map['Kiasar.Bright_Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Kiasar Bright Night")
              --elseif Settings.Map[1] == (true, 'evening') then
                  --Presets.Preset.Evening()
                  --print('Using Preset Evening on Grand Bazaar')
              --elseif Settings.Map[1] == (false, 'none') then
                  --print('Not Changing Map Time')
                  --return
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Sabalan Pipeline
        if string.find(levelName, "XP5_004") then
              if Map['Pipeline.Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Pipeline Night")
              elseif Map['Pipeline.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
                  ServerUtils:SetCustomMapName("Pipeline Morning")
              elseif Map['Pipeline.Bright_Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Pipeline Bright Night")
              --elseif Settings.Map[1] == (true, 'evening') then
                  --Presets.Preset.Evening()
                  --print('Using Preset Evening on Grand Bazaar')
              --elseif Settings.Map[1] == (false, 'none') then
                  --print('Not Changing Map Time')
                  --return
              else
                  print('Wrong Configuration')
                  return
              end
        end

        ------------------------------------------------------------------------
end)

--Check
Events:Subscribe('Player:Created', function(player)

    if player ~= nil then
      if Check() == true then
          return
      else
          player:Kick()
      end
    end

end)


--

function Check()
    if Night()==true or Morning()==true or Bright_Night()==true then
        print("Preset Load OK")
				return true
    else
        print("Preset Load FAIL")
				return false
    end
end
