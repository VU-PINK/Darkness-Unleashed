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
                  print('Calling Preset Night on Grand Bazaar')
                  Night()
              elseif Map['Bazaar.Morning'] then
                  print('Calling Preset Morning on Grand Bazaar')
                  Morning()
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
                  print('Calling Preset Night on Teheran Highway')
                  Night()
              elseif Map['Teheran.Morning'] then
                  print('Calling Preset Morning on Teheran Highway')
                  Morning()
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
                  print('Calling Preset Night on Caspian Border')
                  Night()
              elseif Map['Caspian.Morning'] then
                  print('Calling Preset Morning on Caspian Border')
                  Morning()
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
                  print('Calling Preset Night on Seine Crossing')
                  Night()
              elseif Map['Seine.Morning'] then
                  print('Calling Preset Morning on Seine Crossing')
                  Morning()
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
                  print('Calling Preset Night on Operation Firestorm')
                  Night()
              elseif Map['Firestorm.Morning'] then
                  print('Calling Preset Morning on Operation Firestorm')
                  Morning()
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
                  print('Calling Preset Night on Davamand Peak')
                  Night()
              elseif Map['Davamand.Morning'] then
                  print('Calling Preset Morning on Davamand Peak')
                  Morning()
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
                  print('Calling Preset Night on Noshahr Canals')
                  Night()
              elseif Map['Noshahr.Morning'] then
                  print('Calling Preset Morning on Noshahr Canals')
                  Morning()
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
                  print('Calling Preset Night on Kharg Island')
                  Night()
              elseif Map['Kharg.Morning'] then
                  print('Calling Preset Morning on Kharg Island')
                  Morning()
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
                  print('Calling Preset Night on Operation Metro')
                  Night()
              elseif Map['Metro.Morning'] then
                  print('Calling Preset Morning on Operation Metro')
                  Morning()
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
                  print('Calling Preset Night on Strike at Karkand')
                  Night()
              elseif Map['Karkand.Morning'] then
                  print('Calling Preset Morning on Strike at Karkand')
                  Morning()
              elseif Map['Karkand.Bright_Night'] then
                  print('Using Preset Bright Night on Strike at Karkand')
                  Bright_Night()
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
                  print('Calling Preset Night on Gulf of Oman')
                  Night()
              elseif Map['Gulf.Morning'] then
                  print('Calling Preset Morning on Gulf of Oman')
                  Morning()
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
                  print('Calling Preset Night on Sharqi Peninsula')
                  Night()
              elseif Map['Sharqi.Morning'] then
                  print('Calling Preset Morning on Sharqi Peninsula')
                  Morning()
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
                  print('Calling Preset Night on Wake Island')
                  Night()
              elseif Map['Wake.Morning'] then
                  print('Calling Preset Morning on Wake Island')
                  Morning()
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
                  print('Calling Preset Night on Donya Fortress')
                  Night()
              elseif Map['Donya.Morning'] then
                  print('Calling Preset Morning on Donya Fortress')
                  Morning()
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
                  print('Calling Preset Night on Operation 925')
                  Night()
              elseif Map['Operation925.Morning'] then
                  print('Calling Preset Morning on Operation 925')
                  Morning()
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
                  print('Calling Preset Night on Scrapmetal')
                  Night()
              elseif Map['Scrapmetal.Morning'] then
                  print('Calling Preset Morning on Scrapmetal')
                  Morning()
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
                  print('Calling Preset Night on Ziba Tower')
                  Night()
              elseif Map['Ziba.Morning'] then
                  print('Calling Preset Morning on Ziba Tower')
                  Morning()
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
                  print('Calling Preset Night on Alborz Mountains')
                  Night()
              elseif Map['Alborz.Morning'] then
                  print('Calling Preset Morning on Alborz Mountains')
                  Morning()
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
                  print('Calling Preset Night on Armored Shield')
                  Night()
              elseif Map['Shield.Morning'] then
                  print('Calling Preset Morning on Armored Shield')
                  Morning()
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
                  print('Calling Preset Night on Bandar Desert')
                  Night()
              elseif Map['Bandar.Morning'] then
                  print('Calling Preset Morning on Bandar Desert')
                  Morning()
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
                  print('Calling Preset Night on Death Valley')
                  Night()
              elseif Map['Death.Morning'] then
                  print('Calling Preset Morning on Death Valley')
                  Morning()
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
                  print('Calling Preset Night on Azadi Palace')
                  Night()
              elseif Map['Azadi.Morning'] then
                  print('Calling Preset Morning on Azadi Palace')
                  Morning()
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
                  print('Calling Preset Night on Epicenter')
                  Night()
              elseif Map['Epicenter.Morning'] then
                  print('Calling Preset Morning on Epicenter')
                  Morning()
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
                  print('Calling Preset Night on Markaz Monolith')
                  Night()
              elseif Map['Markaz.Morning'] then
                  print('Calling Preset Morning on Markaz Monolith')
                  Morning()
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
                  print('Calling Preset Night on Talah Market')
                  Night()
              elseif Map['Talah.Morning'] then
                  print('Calling Preset Morning on Talah Market')
                  Morning()
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
                  print('Calling Preset Night on Operation Riverside')
                  Night()
              elseif Map['Riverside.Morning'] then
                  print('Calling Preset Morning on Operation Riverside')
                  Morning()
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
                  print('Calling Preset Night on Nebandan Flats')
                  Night()
              elseif Map['Nebandan.Morning'] then
                  print('Calling Preset Morning on Nebandan Flats')
                  Morning()
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
                  print('Calling Preset Night on Kiasar Railroad')
                  Night()
              elseif Map['Kiasar.Morning'] then
                  print('Calling Preset Morning on Kiasar Railroad')
                  Morning()
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
                  print('Calling Preset Night on Sabalan Pipeline')
                  Night()
              elseif Map['Pipeline.Morning'] then
                  print('Calling Preset Morning on Sabalan Pipeline')
                  Morning()
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
