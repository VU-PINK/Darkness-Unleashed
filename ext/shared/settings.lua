--Settings

---Change Settings here
--Use Time Vote (true/false)
--Activates Voting for Used Time (morning/noon/evening/night/none)
--TimeVote = false

---Custom Settings
--MapList
---if TimeVote == false then
    -- Select Maps and Time:
        Map = {

        --Standard
        ['Bazaar.Night']                      = true,             --MP_001      | Grand Bazaar
        ['Teheran.Morning']                   = true,             --MP_003      | Teheran Highway
        ['Caspian.Morning']                   = true,             --MP_007      | Caspian Border
        ['Seine.Night']                       = true,             --MP_011      | Seine Crossing
        ['Firestorm.Morning']                 = true,             --MP_012      | Operation Firestorm
        ['Davamand.Night']                    = true,             --MP_013      | Davamand Peak
        ['Noshahr.Night']                     = true,             --MP_017      | Noshahr Canals
        ['Kharg.Night']                       = true,             --MP_018      | Kharg Island
        ['Metro.Night']                       = true,             --MP_Subway   | Operation Metro

        --DLC Back to Karkand
        ['Karkand.Night']                     = true,             --XP1_001     | Strike at Karkand
        ['Gulf.Bright_Night']                 = true,             --XP1_002     | Gulf of Oman
        ['Sharqi.Night']                      = true,             --XP1_003     | Sharqi Peninsula
        ['Wake.Morning']                      = true,             --XP1_004     | Wake Island

        --DLC Close Quarters
        ['Donya.Night']                       = true,             --XP2_Palace  | Donya Fortress
        ['Operation925.Night']                = true,             --XP2_Office  | Operation 925
        ['Scrapmetal.Night']                  = true,             --XP2_Factory | Scrapmetal
        ['Ziba.Night']                        = true,             --XP2_Skybar  | Ziba Tower

        --DLC Armored Kill
        ['Alborz.Night']                      = true,             --XP3_Alborz  | Alborz Mountains
        ['Shield.Bright_Night']               = true,             --XP3_Shield  | Armored Shield
        ['Bandar.Morning']                    = true,             --XP3_Desert  | Bandar Desert
        ['Death.Morning']                     = true,             --XP3_Valley  | Death Valley

        --DLC Aftermath
        ['Azadi.Night']                       = true,             --XP4_Parl    | Azadi Palace
        ['Epicenter.Night']                   = true,             --XP4_Quake   | Epicenter
        ['Markaz.Night']                      = true,             --XP4_FD      | Markaz Monolith
        ['Talah.Night']                       = true,             --XP4_Rubble  | Talah Market

        --DLC End Game
        ['Riverside.Night']                   = true,             --XP5_001     | Operation Riverside
        ['Nebandan.Morning']                  = true,             --XP5_002     | Nebandan Flats
        ['Kiasar.Night']                      = true,             --XP5_003     | Kiasar Railroad
        ['Pipeline.Morning']                  = true,             --XP5_004     | Sabalan Pipeline

        }

--end

-- Fog and Brightness Settings - DarkNight Preset

--generalSetting
--generalbrightnessMultiplier                   = {50}
--generalfogMultiplier                          = {10}

--function BrightnessMultiplier()
generalbrightness                             = {1.0}
generalfog                                    = {1.0}
--return brightness, fog
--end


--CustomMapSettings
--Standard
Bazaar_brightnessMultiplier                   = {1.7}
Bazaar_fogMultiplier                          = {1}

Teheran_brightnessMultiplier                  = {1.0}
Teheran_fogMultiplier                         = {1}

Caspian_brightnessMultiplier                  = {3}
Caspian_fogMultiplier                         = {1}

Seine_brightnessMultiplier                    = {1.2}
Seine_fogMultiplier                           = {1}

Firestorm_brightnessMultiplier                = {1.2}
Firestorm_fogMultiplier                       = {2}

Davamand_brightnessMultiplier                 = {1}
Davamand_fogMultiplier                        = {1}

Noshahr_brightnessMultiplier                  = {2}
Noshahr_fogMultiplier                         = {0.7}

Kharg_brightnessMultiplier                    = {1}
Kharg_fogMultiplier                           = {1}

Metro_brightnessMultiplier                    = {1}
Metro_fogMultiplier                           = {1}

------------------------- DLC - Back to Karkand ----------------------
Karkand_brightnessMultiplier                  = {0.95}
Karkand_fogMultiplier                         = {1}

Gulf_brightnessMultiplier                     = {1.2}
Gulf_fogMultiplier                            = {1}

Sharqi_brightnessMultiplier                   = {1.2}
Sharqi_fogMultiplier                          = {1}

Wake_brightnessMultiplier                     = {1.2}
Wake_fogMultiplier                            = {1}

----------------------- DLC - Close Quarters -------------------------
Donya_brightnessMultiplier                    = {1.2}
Donya_fogMultiplier                           = {1}

Operation925_brightnessMultiplier             = {1.2}
Operation925_fogMultiplier                    = {1}

Scrapmetal_brightnessMultiplier               = {2}
Scrapmetal_fogMultiplier                      = {1}

Ziba_brightnessMultiplier                     = {1.2}
Ziba_fogMultiplier                            = {1}

---------------------- DLC - Armored Kill ----------------------------
Alborz_brightnessMultiplier                   = {0.85}
Alborz_fogMultiplier                          = {1}

Shield_brightnessMultiplier                   = {1.5}
Shield_fogMultiplier                          = {0.8}

Bandar_brightnessMultiplier                   = {1.2}
Bandar_fogMultiplier                          = {1}

Death_brightnessMultiplier                    = {1.2}
Death_fogMultiplier                           = {1}

----------------------- DLC - Aftermath ------------------------------
Azadi_brightnessMultiplier                    = {1.2}
Azadi_fogMultiplier                           = {1}

Epicenter_brightnessMultiplier                = {1.2}
Epicenter_fogMultiplier                       = {1}

Markaz_brightnessMultiplier                   = {1.2}
Markaz_fogMultiplier                          = {1}

Talah_brightnessMultiplier                    = {1.2}
Talah_fogMultiplier                           = {1}

----------------------- DLC - End Game -------------------------------
Riverside_brightnessMultiplier                = {1.2}
Riverside_fogMultiplier                       = {1}

Nebandan_brightnessMultiplier                 = {1.2}
Nebandan_fogMultiplier                        = {1}

Kiasar_brightnessMultiplier                   = {1.2}
Kiasar_fogMultiplier                          = {1}

Pipeline_brightnessMultiplier                 = {1.2}
Pipeline_fogMultiplier                        = {1}
