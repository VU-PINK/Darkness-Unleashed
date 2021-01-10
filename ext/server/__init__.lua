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
                  print('Blue-Filter enabled')
              elseif Map['Bazaar.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              --elseif Settings.Map[1] == (true, 'noon') then
                  --Presets.Preset.Noon()
                  --print('Using Preset Noon on Grand Bazaar')
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
                  print('Blue-Filter enabled')
              elseif Map['Teheran.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              --elseif Settings.Map[1] == (true, 'noon') then
                  --Presets.Preset.Noon()
                  --print('Using Preset Noon on Grand Bazaar')
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
                  print('Blue-Filter enabled')
              elseif Map['Caspian.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              --elseif Settings.Map[1] == (true, 'noon') then
                  --Presets.Preset.Noon()
                  --print('Using Preset Noon on Grand Bazaar')
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
                  print('Blue-Filter enabled')
              elseif Map['Seine.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              --elseif Settings.Map[1] == (true, 'noon') then
                  --Presets.Preset.Noon()
                  --print('Using Preset Noon on Grand Bazaar')
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
                  print('Blue-Filter enabled')
              elseif Map['Firestorm.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              --elseif Settings.Map[1] == (true, 'noon') then
                  --Presets.Preset.Noon()
                  --print('Using Preset Noon on Grand Bazaar')
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
                  print('Blue-Filter enabled')
              elseif Map['Davamand.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              --elseif Settings.Map[1] == (true, 'noon') then
                  --Presets.Preset.Noon()
                  --print('Using Preset Noon on Grand Bazaar')
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
                  print('Blue-Filter enabled')
              elseif Map['Noshahr.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              --elseif Settings.Map[1] == (true, 'noon') then
                  --Presets.Preset.Noon()
                  --print('Using Preset Noon on Grand Bazaar')
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
                  print('Blue-Filter enabled')
              elseif Map['Kharg.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              --elseif Settings.Map[1] == (true, 'noon') then
                  --Presets.Preset.Noon()
                  --print('Using Preset Noon on Grand Bazaar')
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
                  print('Blue-Filter enabled')
              elseif Map['Metro.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              --elseif Settings.Map[1] == (true, 'noon') then
                  --Presets.Preset.Noon()
                  --print('Using Preset Noon on Grand Bazaar')
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
                  print('Blue-Filter enabled')
              elseif Map['Karkand.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              elseif Map['Karkand.Bright_Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Using Preset Bright Night on Strike at Karkand')
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
                  print('Blue-Filter enabled')
              elseif Map['Gulf.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              --elseif Settings.Map[1] == (true, 'noon') then
                  --Presets.Preset.Noon()
                  --print('Using Preset Noon on Grand Bazaar')
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
                  print('Blue-Filter enabled')
              elseif Map['Sharqi.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              --elseif Settings.Map[1] == (true, 'noon') then
                  --Presets.Preset.Noon()
                  --print('Using Preset Noon on Grand Bazaar')
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
                  print('Blue-Filter enabled')
              elseif Map['Wake.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              --elseif Settings.Map[1] == (true, 'noon') then
                  --Presets.Preset.Noon()
                  --print('Using Preset Noon on Grand Bazaar')
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
                  print('Blue-Filter enabled')
              elseif Map['Donya.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              --elseif Settings.Map[1] == (true, 'noon') then
                  --Presets.Preset.Noon()
                  --print('Using Preset Noon on Grand Bazaar')
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
                  print('Blue-Filter enabled')
              elseif Map['Operation925.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              --elseif Settings.Map[1] == (true, 'noon') then
                  --Presets.Preset.Noon()
                  --print('Using Preset Noon on Grand Bazaar')
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
                  print('Blue-Filter enabled')
              elseif Map['Scrapmetal.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              --elseif Settings.Map[1] == (true, 'noon') then
                  --Presets.Preset.Noon()
                  --print('Using Preset Noon on Grand Bazaar')
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
                  print('Blue-Filter enabled')
              elseif Map['Ziba.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              --elseif Settings.Map[1] == (true, 'noon') then
                  --Presets.Preset.Noon()
                  --print('Using Preset Noon on Grand Bazaar')
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
                  print('Blue-Filter enabled')
              elseif Map['Alborz.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              --elseif Settings.Map[1] == (true, 'noon') then
                  --Presets.Preset.Noon()
                  --print('Using Preset Noon on Grand Bazaar')
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
                  print('Blue-Filter enabled')
              elseif Map['Shield.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              --elseif Settings.Map[1] == (true, 'noon') then
                  --Presets.Preset.Noon()
                  --print('Using Preset Noon on Grand Bazaar')
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
                  print('Blue-Filter enabled')
              elseif Map['Bandar.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              --elseif Settings.Map[1] == (true, 'noon') then
                  --Presets.Preset.Noon()
                  --print('Using Preset Noon on Grand Bazaar')
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
                  print('Blue-Filter enabled')
              elseif Map['Death.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              --elseif Settings.Map[1] == (true, 'noon') then
                  --Presets.Preset.Noon()
                  --print('Using Preset Noon on Grand Bazaar')
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
                  print('Blue-Filter enabled')
              elseif Map['Azadi.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              --elseif Settings.Map[1] == (true, 'noon') then
                  --Presets.Preset.Noon()
                  --print('Using Preset Noon on Grand Bazaar')
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
                  print('Blue-Filter enabled')
              elseif Map['Epicenter.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              --elseif Settings.Map[1] == (true, 'noon') then
                  --Presets.Preset.Noon()
                  --print('Using Preset Noon on Grand Bazaar')
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
                  print('Blue-Filter enabled')
              elseif Map['Markaz.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              --elseif Settings.Map[1] == (true, 'noon') then
                  --Presets.Preset.Noon()
                  --print('Using Preset Noon on Grand Bazaar')
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
                  print('Blue-Filter enabled')
              elseif Map['Talah.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              --elseif Settings.Map[1] == (true, 'noon') then
                  --Presets.Preset.Noon()
                  --print('Using Preset Noon on Grand Bazaar')
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
                  print('Blue-Filter enabled')
              elseif Map['Riverside.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              --elseif Settings.Map[1] == (true, 'noon') then
                  --Presets.Preset.Noon()
                  --print('Using Preset Noon on Grand Bazaar')
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
                  print('Blue-Filter enabled')
              elseif Map['Nebandan.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              --elseif Settings.Map[1] == (true, 'noon') then
                  --Presets.Preset.Noon()
                  --print('Using Preset Noon on Grand Bazaar')
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
                  print('Blue-Filter enabled')
              elseif Map['Kiasar.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              --elseif Settings.Map[1] == (true, 'noon') then
                  --Presets.Preset.Noon()
                  --print('Using Preset Noon on Grand Bazaar')
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
                  print('Blue-Filter enabled')
              elseif Map['Pipeline.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              --elseif Settings.Map[1] == (true, 'noon') then
                  --Presets.Preset.Noon()
                  --print('Using Preset Noon on Grand Bazaar')
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
