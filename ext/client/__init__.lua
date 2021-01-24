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

    -- Gulf of Oman
    if string.find(levelName, "XP1_002") then
          if Map['Gulf.Night'] then
              print('Calling Preset Night on Gulf of Oman')
              Night(11)
          elseif Map['Gulf.Morning'] then
              print('Calling Preset Morning on Gulf of Oman')
              Morning(11)
          else
              print('Wrong Configuration')
              return
          end
    end


end)
