require 'presets'
require 'settings'

--Concept:
Events:Subscribe('Level:LoadingInfo', function(screenInfo)

        -- Bazaar
        if SharedUtils:GetLevelName():match("MP_001") then
              if Map.Bazaar == ('true, night') then
                  Preset.Night
                  print('Using Preset Night on Grand Bazaar')
              elseif Map.Bazaar == ('true, morning') then
                  Preset.Morning
                  print('Using Preset Morning on Grand Bazaar')
              elseif Map.Bazaar == ('true, noon') then
                  Preset.Noon
                  print('Using Preset Noon on Grand Bazaar')
              elseif Map.Bazaar == ('true, evening') then
                  Preset.Evening
                  print('Using Preset Evening on Grand Bazaar')
              elseif Map.Bazaar == (false, none) then
                  print('Not Changing Map Time')
                  return end
              else
                  print('Wrong Configuration')
                  return end
              end
        end






end)
