require 'night'
require '__shared/settings'

Events:Subscribe('Level:LoadResources', function(levelName, gameMode, isDedicatedServer)

    -- Bazaar
    if string.find(levelName, "MP_001") then
          if Map['Bazaar.Night'] then
              print('Calling Preset Night on Grand Bazaar')
              Night(1)
          else
              print('Wrong Configuration')
              return
          end
    end

end)
