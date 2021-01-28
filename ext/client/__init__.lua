require '__shared/night'
require '__shared/morning'
require '__shared/settings'
require '__shared/interchangable'



Events:Subscribe('Level:Finalized', function(levelName, gameMode)

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

    -- Seine Crossing
    if string.find(levelName, "MP_011") then
          if Map['Seine.Night'] then
              print('Calling Preset Night on Seine Crossing')
              Night(4)
          elseif Map['Seine.Morning'] then
              print('Calling Preset Morning on Seine Crossing')
              Morning(4)
          else
              print('Wrong Configuration')
              return
          end
    end

end)
