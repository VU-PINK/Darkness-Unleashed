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
              elseif Settings.Map['Bazaar.Morning'] then
                  print('Using Preset Morning on Grand Bazaar')
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
