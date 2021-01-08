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
end)
