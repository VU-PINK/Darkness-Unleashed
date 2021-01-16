require '__shared/presets'
local Settings = require '__shared/settings'


--CustomBrightness = generalbrightnessMultiplier[1] * Bazaar_brightnessMultiplier[1]
--CustomFog = generalfogMultiplier[1] * Bazaar_fogMultiplier[1]
--print(CustomBrightness)
--print(CustomFog)




--Concept:
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
                  Morning(1)
              elseif Map['Bazaar.Bright_Night'] then
                  print('Calling Preset Bright Night on Grand Bazaar')
                  Bright_Night(1)
              elseif Map['Bazaar.Evening'] then
                  print('Calling Preset Evening on Grand Bazaar')
                  Evening(1)
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Teheran Highway
        if string.find(levelName, "MP_003") then
              if Map['Teheran.Night'] then
                  print('Calling Preset Night on Teheran Highway')
                  Night(2)
              elseif Map['Teheran.Morning'] then
                  print('Calling Preset Morning on Teheran Highway')
                  Morning(2)
              elseif Map['Teheran.Bright_Night'] then
                  print('Calling Preset Bright Night on Teheran Highway')
                  Bright_Night(2)
              elseif Map['Teheran.Evening'] then
                  print('Calling Preset Evening on Teheran Highway')
                  Evening(2)
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Caspian Border
        if string.find(levelName, "MP_007") then
              if Map['Caspian.Night'] then
                  print('Calling Preset Night on Caspian Border')
                  Night(3)
              elseif Map['Caspian.Morning'] then
                  print('Calling Preset Morning on Caspian Border')
                  Morning(3)
                elseif Map['Caspian.Bright_Night'] then
                    print('Calling Preset Bright Night on Caspian Border')
                    Bright_Night(3)
                elseif Map['Caspian.Evening'] then
                    print('Calling Preset Evening on Caspian Border')
                    Evening(3)
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
              elseif Map['Seine.Bright_Night'] then
                  print('Calling Preset Bright Night on Seine Crossing')
                  Bright_Night(4)
              elseif Map['Seine.Evening'] then
                  print('Calling Preset Evening on Seine Crossing')
                  Evening(4)
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Operation Firestorm
        if string.find(levelName, "MP_012") then
              if Map['Firestorm.Night'] then
                  print('Calling Preset Night on Operation Firestorm')
                  Night(5)
              elseif Map['Firestorm.Morning'] then
                  print('Calling Preset Morning on Operation Firestorm')
                  Morning(5)
              elseif Map['Firestorm.Bright_Night'] then
                  print('Calling Preset Bright Night on Operation Firestorm')
                  Bright_Night(5)
              elseif Map['Firestorm.Evening'] then
                  print('Calling Preset Evening on Operation Firestorm')
                  Evening(5)
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Davamand Peak
		    if string.find(levelName, "MP_013") then
              if Map['Davamand.Night'] then
                  print('Calling Preset Night on Davamand Peak')
                  Night(6)
              elseif Map['Davamand.Morning'] then
                  print('Calling Preset Morning on Davamand Peak')
                  Morning(6)
              elseif Map['Davamand.Bright_Night'] then
                  print('Calling Preset Bright Night on Davamand Peak')
                  Bright_Night(6)
              elseif Map['Davamand.Evening'] then
                  print('Calling Preset Evening on Davamand Peak')
                  Evening(6)
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Noshahr Canals
		    if string.find(levelName, "MP_017") then
              if Map['Noshahr.Night'] then
                  print('Calling Preset Night on Noshahr Canals')
                  Night(7)
              elseif Map['Noshahr.Morning'] then
                  print('Calling Preset Morning on Noshahr Canals')
                  Morning(7)
              elseif Map['Noshar.Bright_Night'] then
                  print('Calling Preset Bright Night on Noshar Canals')
                  Bright_Night(7)
              elseif Map['Noshar.Evening'] then
                  print('Calling Preset Evening on Noshar Canals')
                  Evening(7)
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Noshahr Canals
        if string.find(levelName, "MP_018") then
              if Map['Kharg.Night'] then
                  print('Calling Preset Night on Kharg Island')
                  Night(8)
              elseif Map['Kharg.Morning'] then
                  print('Calling Preset Morning on Kharg Island')
                  Morning(8)
              elseif Map['Kharg.Bright_Night'] then
                  print('Calling Preset Bright Night on Kharg Island')
                  Bright_Night(8)
              elseif Map['Kharg.Evening'] then
                  print('Calling Preset Evening on Kharg Island')
                  Evening(8)
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Operation Metro
        if string.find(levelName, "MP_Subway") then
              if Map['Metro.Night'] then
                  print('Calling Preset Night on Operation Metro')
                  Night(9)
              elseif Map['Metro.Morning'] then
                  print('Calling Preset Morning on Operation Metro')
                  Morning(9)
              elseif Map['Metro.Bright_Night'] then
                  print('Calling Preset Bright Night on Operation Metro')
                  Bright_Night(9)
              elseif Map['Metro.Evening'] then
                  print('Calling Preset Evening on Operation Metro')
                  Evening(9)
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
                  Night(10)
              elseif Map['Karkand.Morning'] then
                  print('Calling Preset Morning on Strike at Karkand')
                  Morning(10)
              elseif Map['Karkand.Bright_Night'] then
                  print('Using Preset Bright Night on Strike at Karkand')
                  Bright_Night(10)
              elseif Map['Karkand.Evening'] then
                  print('Using Preset Evening on Strike at Karkand')
                  Evening(10)
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
              elseif Map['Gulf.Bright_Night'] then
                  print('Using Preset Bright Night on Gulf of Oman')
                  Bright_Night(11)
              elseif Map['Gulf.Evening'] then
                  print('Using Preset Evening on Gulf of Oman')
                  Evening(11)
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Sharqi Peninsula
        if string.find(levelName, "XP1_003") then
              if Map['Sharqi.Night'] then
                  print('Calling Preset Night on Sharqi Peninsula')
                  Night(12)
              elseif Map['Sharqi.Morning'] then
                  print('Calling Preset Morning on Sharqi Peninsula')
                  Morning(12)
              elseif Map['Sharqi.Bright_Night'] then
                  print('Calling Preset Bright Night on Teheran Highway')
                  Bright_Night(12)
              elseif Map['Sharqi.Evening'] then
                  print('Calling Preset Evening on Teheran Highway')
                  Evening(12)
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Wake Island
        if string.find(levelName, "XP1_004") then
              if Map['Wake.Night'] then
                  print('Calling Preset Night on Wake Island')
                  Night(13)
              elseif Map['Wake.Morning'] then
                  print('Calling Preset Morning on Wake Island')
                  Morning(13)
              elseif Map['Wake.Bright_Night'] then
                  print('Calling Preset Bright Night on Wake Island')
                  Bright_Night(13)
              elseif Map['Wake.Evening'] then
                  print('Calling Preset Evening on Wake Island')
                  Evening(13)
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
                  Night(14)
              elseif Map['Donya.Morning'] then
                  print('Calling Preset Morning on Donya Fortress')
                  Morning(14)
              elseif Map['Donya.Bright_Night'] then
                  print('Calling Preset Bright Night on Donya Fortress')
                  Bright_Night(14)
              elseif Map['Donya.Evening'] then
                  print('Calling Preset Evening on Donya Fortress')
                  Evening(14)
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Operation 925
        if string.find(levelName, "XP2_Office") then
              if Map['Operation925.Night'] then
                  print('Calling Preset Night on Operation 925')
                  Night(15)
              elseif Map['Operation925.Morning'] then
                  print('Calling Preset Morning on Operation 925')
                  Morning(15)
              elseif Map['Operation925.Bright_Night'] then
                  print('Calling Preset Bright Night on Operation 925')
                  Bright_Night(15)
              elseif Map['Operation925.Evening'] then
                  print('Calling Preset Evening on Operation 925')
                  Evening(15)
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Scrapmetal
        if string.find(levelName, "XP2_Factory") then
              if Map['Scrapmetal.Night'] then
                  print('Calling Preset Night on Scrapmetal')
                  Night(16)
              elseif Map['Scrapmetal.Morning'] then
                  print('Calling Preset Morning on Scrapmetal')
                  Morning(16)
              elseif Map['Scrapmetal.Bright_Night'] then
                  print('Calling Preset Bright Night on Scrapmetal')
                  Bright_Night(16)
              elseif Map['Scrapmetal.Evening'] then
                  print('Calling Preset Evening on Scrapmetal')
                  Evening(16)
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Ziba Tower
        if string.find(levelName, "XP2_Skybar") then
              if Map['Ziba.Night'] then
                  print('Calling Preset Night on Ziba Tower')
                  Night(17)
              elseif Map['Ziba.Morning'] then
                  print('Calling Preset Morning on Ziba Tower')
                  Morning(17)
              elseif Map['Ziba.Bright_Night'] then
                  print('Calling Preset Bright Night on Ziba Tower')
                  Bright_Night(17)
              elseif Map['Ziba.Evening'] then
                  print('Calling Preset Evening on Ziba Tower')
                  Evening(17)
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
                  Night(18)
              elseif Map['Alborz.Morning'] then
                  print('Calling Preset Morning on Alborz Mountains')
                  Morning(18)
              elseif Map['Alborz.Bright_Night'] then
                  print('Calling Preset Bright Night on Alborz Mountains')
                  Bright_Night(18)
              elseif Map['Alborz.Evening'] then
                  print('Calling Preset Evening on Alborz Mountains')
                  Evening(18)
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Armored Shield
        if string.find(levelName, "XP3_Shield") then
              if Map['Shield.Night'] then
                  print('Calling Preset Night on Armored Shield')
                  Night(19)
              elseif Map['Shield.Morning'] then
                  print('Calling Preset Morning on Armored Shield')
                  Morning(19)
              elseif Map['Shield.Bright_Night'] then
                  print('Calling Preset Bright Night on Armored Shield')
                  Bright_Night(19)
              elseif Map['Shield.Evening'] then
                  print('Calling Preset Evening on Armored Shield')
                  Evening(19)
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Bandar Desert
        if string.find(levelName, "XP3_Desert") then
              if Map['Bandar.Night'] then
                  print('Calling Preset Night on Bandar Desert')
                  Night(20)
              elseif Map['Bandar.Morning'] then
                  print('Calling Preset Morning on Bandar Desert')
                  Morning(20)
              elseif Map['Bandar.Bright_Night'] then
                  print('Calling Preset Bright Night on Bandar Desert')
                  Bright_Night(20)
              elseif Map['Bandar.Evening'] then
                  print('Calling Preset Evening on Bandar Desert')
                  Evening(20)
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Death Valley
        if string.find(levelName, "XP3_Valley") then
              if Map['Death.Night'] then
                  print('Calling Preset Night on Death Valley')
                  Night(21)
              elseif Map['Death.Morning'] then
                  print('Calling Preset Morning on Death Valley')
                  Morning(21)
              elseif Map['Death.Bright_Night'] then
                  print('Calling Preset Bright Night on Death Valley')
                  Bright_Night(21)
              elseif Map['Death.Evening'] then
                  print('Calling Preset Evening on Death Valley')
                  Evening(21)
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
                  Night(22)
              elseif Map['Azadi.Morning'] then
                  print('Calling Preset Morning on Azadi Palace')
                  Morning(22)
              elseif Map['Azadi.Bright_Night'] then
                  print('Calling Preset Bright Night on Azadi Palace')
                  Bright_Night(22)
              elseif Map['Azadi.Bright_Night'] then
                  print('Calling Preset Evening on Azadi Palace')
                  Evening(22)
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Epicenter
        if string.find(levelName, "XP4_Quake") then
              if Map['Epicenter.Night'] then
                  print('Calling Preset Night on Epicenter')
                  Night(23)
              elseif Map['Epicenter.Morning'] then
                  print('Calling Preset Morning on Epicenter')
                  Morning(23)
              elseif Map['Epicenter.Bright_Night'] then
                  print('Calling Preset Bright Night on Epicenter')
                  Bright_Night(23)
              elseif Map['Epicenter.Evening'] then
                  print('Calling Preset Evening on Epicenter')
                  Evening(23)
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Markaz Monolith
        if string.find(levelName, "XP4_FD") then
              if Map['Markaz.Night'] then
                  print('Calling Preset Night on Markaz Monolith')
                  Night(24)
              elseif Map['Markaz.Morning'] then
                  print('Calling Preset Morning on Markaz Monolith')
                  Morning(24)
              elseif Map['Markaz.Bright_Night'] then
                  print('Calling Preset Bright Night on Markaz Monolith')
                  Bright_Night(24)
              elseif Map['Markaz.Evening'] then
                  print('Calling Preset Evening on Markaz Monolith')
                  Evening(24)
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Talah Market
        if string.find(levelName, "XP4_Rubble") then
              if Map['Talah.Night'] then
                  print('Calling Preset Night on Talah Market')
                  Night(25)
              elseif Map['Talah.Morning'] then
                  print('Calling Preset Morning on Talah Market')
                  Morning(25)
              elseif Map['Talah.Bright_Night'] then
                    print('Calling Preset Bright Night on Talah Market')
                    Bright_Night(25)
              elseif Map['Talah.Evening'] then
                    print('Calling Preset Evening on Talah Market')
                    Evening(25)
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
                  Night(26)
              elseif Map['Riverside.Morning'] then
                  print('Calling Preset Morning on Operation Riverside')
                  Morning(26)
              elseif Map['Riverside.Bright_Night'] then
                    print('Calling Preset Bright Night on Operation Riverside')
                    Bright_Night(26)
              elseif Map['Riverside.Evening'] then
                    print('Calling Preset Evening on Operation Riverside')
                    Evening(26)
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Nebandan Flats
        if string.find(levelName, "XP5_002") then
              if Map['Nebandan.Night'] then
                  print('Calling Preset Night on Nebandan Flats')
                  Night(27)
              elseif Map['Nebandan.Morning'] then
                  print('Calling Preset Morning on Nebandan Flats')
                  Morning(27)
              elseif Map['Nebandan.Bright_Night'] then
                    print('Calling Preset Bright Night on Nebandan Flats')
                    Bright_Night(27)
              elseif Map['Nebandan.Evening'] then
                    print('Calling Preset Evening on Nebandan Flats')
                    Evening(27)
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Kiasar Railroad
        if string.find(levelName, "XP5_003") then
              if Map['Kiasar.Night'] then
                  print('Calling Preset Night on Kiasar Railroad')
                  Night(28)
              elseif Map['Kiasar.Morning'] then
                  print('Calling Preset Morning on Kiasar Railroad')
                  Morning(28)
              elseif Map['Kiasar.Bright_Night'] then
                    print('Calling Preset Bright Night on Kiasar Railroad')
                    Bright_Night(28)
              elseif Map['Kiasar.Evening'] then
                    print('Calling Preset Evening on Kiasar Railroad')
                    Evening(28)
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Sabalan Pipeline
        if string.find(levelName, "XP5_004") then
              if Map['Pipeline.Night'] then
                  print('Calling Preset Night on Sabalan Pipeline')
                  Night(29)
              elseif Map['Pipeline.Morning'] then
                  print('Calling Preset Morning on Sabalan Pipeline')
                  Morning(29)
              elseif Map['Pipeline.Bright_Night'] then
                    print('Calling Preset Bright Night on Sabalan Pipeline')
                    Bright_Night(29)
              elseif Map['Pipeline.Evening'] then
                    print('Calling Preset Evening on Sabalan Pipeline')
                    Evening(29)
              else
                  print('Wrong Configuration')
                  return
              end
        end

        ------------------------------------------------------------------------
end)
