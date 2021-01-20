require '__shared/presets'
require '__shared/settings'
require '__client/__init__'

Events:Subscribe('Level:LoadResources', function(levelName, gameMode, isDedicatedServer)

        print(levelName)

        -- Vanilla Maps
        ------------------------------------------------------------------------

        -- Bazaar
        if string.find(levelName, "MP_001") then
              if Map['Bazaar.Night'] then
                  print('Calling Preset Night on Grand Bazaar')
                  Night(1)
              elseif Map['Bazaar.Morning'] then
                  print('Calling Preset Morning on Grand Bazaar')
                  --Morning(1)
              elseif Map['Bazaar.Bright_Night'] then
                  print('Calling Preset Bright Night on Grand Bazaar')
                  --Bright_Night(1)
              elseif Map['Bazaar.Evening'] then
                  print('Calling Preset Evening on Grand Bazaar')
                  --Evening(1)
              elseif Map[1] == nil then
                  print('Using Standard')
                  --Standard(1)
              else
                  print('Wrong Configuration')
                  return
              end
        end

        ------------------------------------------------------------------------
end)
