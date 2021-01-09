local Presets = require '__shared/presets'
local Settings = require '__shared/settings'

--Concept:
Events:Subscribe('Level:LoadResources', function(levelName, gameMode, isDedicatedServer)

        print(levelName)

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

        if string.find(levelName, "MP_011") then
              if Map['Seine.Night'] then
                  print('Calling Preset Night on Seine')
                  Night()
              elseif Map['Seine.Morning'] then
                  print('Calling Preset Morning on Seine')
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


        if string.find(levelName, "MP_012") then
              if Map['Firestorm.Night'] then
                  print('Calling Preset Night on Firestorm')
                  Night()
              elseif Map['Firestorm.Morning'] then
                  print('Calling Preset Morning on Firestorm')
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

        if string.find(levelName, "MP_Subway") then
              if Map['Metro.Night'] then
                  print('Calling Preset Night on Metro')
                  Night()
              elseif Map['Metro.Morning'] then
                  print('Calling Preset Morning on Metro')
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

        if string.find(levelName, "XP1_002") then
              if Map['Gulf.Night'] then
                  print('Calling Preset Night on Gulf')
                  Night()
              elseif Map['Gulf.Morning'] then
                  print('Calling Preset Morning on Gulf')
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
end)
