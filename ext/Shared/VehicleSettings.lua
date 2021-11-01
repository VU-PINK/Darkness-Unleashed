local SPOTLIGHTMULTIPLICATOR = 2
-- AIRBORNE Vehicles
VEHICLESETTINGS = {
    AIRBORNE = {
        AH1Z = {
            -- AH1Z (VIPER)
            -- https://github.com/EmulatorNexus/Venice-EBX/blob/ead5472e20bbcfed9a4dbd677bc31547f2607a3d/Vehicles/AH1Z/AH1Z.txt
            name = 'AH1Z',
            partitionGUID = '643135EA-6CA7-11DF-B6FA-F715AA601362',
            chassisGUID = 'D959DF11-EA30-D238-A0D5-5687735963E4',
            weaponGUID = 'DF0AEBA7-A3D6-4CCA-9572-E6FBAB9569C5',
            vehicleDataGUID = '81D83886-888B-3962-61B1-4A1FC1AD49DB',
            Components = {
                Spotlight_1 = {
                    enabled = true,
                    description = 'Gunner Searchlight',
                    type = 2, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = true,
                    shape = 1,
                    frustumFov = 35.6789,
                    frustumAspect = 1.0,
                    castShadowsMinLevel = 0,
                    castShadowsEnable = true,
                    intensity = 5 * SPOTLIGHTMULTIPLICATOR,
                    radius = 200,
                    color = Vec3(1, 0.9, 0.8),
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(0, 0, 0)
                    }
                },
                Pointlight_1 = {
                    enabled = true,
                    description = 'Gunner Searchlight Pointlight',
                    type = 1, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = true,
                    radius = 2.55,
                    width = 1,
                    intensity = 10.75,
                    color = Vec3(1, 0.9, 0.9),
                    visible = true,
                    enlightenEnable = false,
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(0, 0.35, 0)
                    }
                },
                Pointlight_2 = {
                    enabled = true,
                    description = 'Top Red Blinker',
                    type = 1, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = false,
                    radius = 2.35,
                    width = 2,
                    intensity = 1,
                    color = Vec3(1, 0, 0),
                    intensity = 5.25,
                    visible = true,
                    enlightenEnable = false,
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(0, 1, -2.25)
                    }
                },
                Pointlight_3 = {
                    enabled = true,
                    description = 'Cockpit Green Light',
                    type = 1, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = false,
                    radius = 3,
                    width = 2,
                    color = Vec3(0, 1, 0),
                    intensity = 5.5,
                    visible = true,
                    enlightenEnable = false,
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(0, 0.25, 2.5)
                    }
                },
                Pointlight_4 = {
                    enabled = true,
                    description = 'Bottom Red Blinker',
                    type = 1, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = false,
                    radius = 120,
                    width = 1,
                    color = Vec3(1, 0, 0),
                    intensity = 0.0125,
                    visible = true,
                    enlightenEnable = true,
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(0, -1.45, -2.0)
                    }
                }
            }
        },
        Mi28 = {
            --MI28
            -- https://github.com/EmulatorNexus/Venice-EBX/blob/ead5472e20bbcfed9a4dbd677bc31547f2607a3d/Vehicles/Mi28/Mi28.txt
            name = 'Mi28',
            partitionGUID = '89BE53B6-2FF4-11DE-8C23-DAB1D69416DE',
            chassisGUID = '89BEA1F6-2FF4-11DE-8C23-DAB1D69416DE',
            weaponGUID = '89BEA24B-2FF4-11DE-8C23-DAB1D69416DE',
            vehicleDataGUID = '89BEA1D7-2FF4-11DE-8C23-DAB1D69416DE',
            Components = {
                Spotlight_1 = {
                    enabled = true,
                    description = 'Gunner Searchlight',
                    type = 2, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = true,
                    shape = 1,
                    frustumFov = 35.6789,
                    frustumAspect = 1.0,
                    castShadowsMinLevel = 0,
                    castShadowsEnable = true,
                    intensity = 5 * SPOTLIGHTMULTIPLICATOR,
                    radius = 200,
                    color = Vec3(1, 0.9, 0.9),
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(0, 0, 0)
                    }
                },
                Pointlight_1 = {
                    enabled = true,
                    description = 'Gunner Searchlight Pointlight',
                    type = 1, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = true,
                    radius = 2.85,
                    width = 1,
                    intensity = 10.75,
                    color = Vec3(1, 0.9, 0.9),
                    visible = true,
                    enlightenEnable = false,
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(0, 0.35, 0)
                    }
                },
                Pointlight_2 = {
                    enabled = true,
                    description = 'Top Red Blinker',
                    type = 1, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = false,
                    radius = 6.25,
                    width = 6,
                    intensity = 1,
                    color = Vec3(1, 0, 0),
                    intensity = 6,
                    visible = true,
                    enlightenEnable = false,
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(0, 1.2, -2.25)
                    }
                },
                Pointlight_3 = {
                    enabled = true,
                    description = 'Cockpit Green Light Lower',
                    type = 1, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = false,
                    radius = 4,
                    width = 3,
                    color = Vec3(0, 1, 0),
                    intensity = 1.1,
                    visible = true,
                    enlightenEnable = false,
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(0, 0.20, 2.85)
                    }
                },
                Pointlight_4 = {
                    enabled = true,
                    description = 'Cockpit Green Light 2',
                    type = 1, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = false,
                    radius = 4,
                    width = 3,
                    color = Vec3(0, 1, 0),
                    intensity = 1.1,
                    visible = true,
                    enlightenEnable = false,
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(0, 0.55, 1.55)
                    }
                },
                Pointlight_5 = {
                    enabled = true,
                    description = 'Bottom Red Blinker',
                    type = 1, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = false,
                    radius = 115,
                    width = 1,
                    color = Vec3(1, 0, 0),
                    intensity = 0.0115,
                    visible = true,
                    enlightenEnable = false,
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(0, -1.90, -1.70)
                    }
                }
            }
        },
        Venom = {
            -- Venom
            -- https://github.com/EmulatorNexus/Venice-EBX/blob/master/Vehicles/Venom/Venom.txt
            name = 'Venom',
            partitionGUID = '97945D87-011D-11E0-B97C-FC495C335A52',
            chassisGUID = '6C62B15D-848D-BDF3-BD66-218AD0554C14',
            weaponGUID = '39663C49-6C7F-429B-A00F-4885D0BBEDB8',
            weaponGUID2 = 'C0F6F51D-0F12-41DE-8003-6252C78BE9E2',
            vehicleDataGUID = '88F274DD-7C84-1EE5-6EE7-DD1D980148B3',
            Components = {
                Spotlight_1 = {
                    enabled = true,
                    description = 'Gunner 1 Searchlight',
                    weapon2 = false,
                    type = 2, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = true,
                    shape = 1,
                    frustumFov = 35.6789,
                    frustumAspect = 1.0,
                    castShadowsMinLevel = 0,
                    castShadowsEnable = true,
                    intensity = 5 * SPOTLIGHTMULTIPLICATOR,
                    radius = 200,
                    color = Vec3(1, 0.9, 0.8),
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(0, -0.035, 0.075),
                    }
                },
                Spotlight_2 = {
                    enabled = true,
                    description = 'Gunner 2 Searchlight',
                    weapon2 = true,
                    type = 2, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = true,
                    shape = 1,
                    frustumFov = 35.6789,
                    frustumAspect = 1.0,
                    castShadowsMinLevel = 0,
                    castShadowsEnable = true,
                    intensity = 2.5 * SPOTLIGHTMULTIPLICATOR,
                    radius = 200,
                    color = Vec3(1, 0.9, 0.8),
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(0, -0.025, 0.075)
                    }
                },
                Pointlight_1 = {
                    enabled = true,
                    description = 'Top Red Blinker',
                    type = 1, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = false,
                    radius = 5,
                    width = 2,
                    color = Vec3(1, 0, 0),
                    intensity = 5,
                    visible = true,
                    enlightenEnable = false,
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(0, 1, -2.25),
                    }
                },
                Pointlight_2 = {
                    enabled = true,
                    description = 'Passenger Green Light',
                    type = 1, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = false,
                    radius = 5.5,
                    width = 1,
                    color = Vec3(0, 1, 0),
                    intensity = 1,
                    visible = true,
                    enlightenEnable = true,
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(0, -0.6, 1.07),
                    }
                },
                Pointlight_3 = {
                    enabled = true,
                    description = 'Bottom Red Blinker',
                    type = 1, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = false,
                    radius = 100,
                    width = 1,
                    color = Vec3(1, 0, 0),
                    intensity = 0.01,
                    visible = true,
                    enlightenEnable = true,
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(0, -1.45, -2.0)
                    }
                },
                Pointlight_4 = {
                    enabled = true,
                    description = 'Cockpit Green Light',
                    type = 1, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = false,
                    radius = 6.25,
                    width = 1,
                    color = Vec3(0, 1, 0),
                    intensity = 0.9,
                    visible = true,
                    enlightenEnable = true,
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(0, -0.6, 2.75)
                    }
                },
            }
        },
        SU35BM = {
            -- SU-35BM-E RUS
            -- https://github.com/EmulatorNexus/Venice-EBX/blob/master/Vehicles/SU-35BM-E/SU-35BM-E.txt
            name = 'SU35BM',
            partitionGUID = '76806015-4BE2-11E0-B502-9B84AFF94A89',
            chassisGUID = 'AE6C201B-88CD-EAC2-D25B-8DA23A16B4A0',
            vehicleDataGUID = 'F2CD2BE1-4B72-59F0-A715-AA8E73F71751',
            Components = {
                Spotlight_1 = {
                    enabled = true,
                    description = 'Front Spotlight',
                    weapon2 = false,
                    type = 2,-- Pointlight [1] ; Spotlight [2]
                    weaponmounted = false,
                    shape = 1,
                    frustumFov = 40,
                    frustumAspect = 1.0,
                    castShadowsMinLevel = 0,
                    castShadowsEnable = true,
                    intensity = 35 * SPOTLIGHTMULTIPLICATOR,
                    radius = 120,
                    color = Vec3(1, 0.9, 0.8),
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(0, 0.5, 10)
                    }
                },
                Pointlight_1 = {
                    enabled = true,
                    description = 'Top Red Blinker',
                    type = 1, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = false,
                    radius = 130,
                    width = 1,
                    intensity = 1.325,
                    color = Vec3(1, 0, 0),
                    intensity = 0.01,
                    visible = true,
                    enlightenEnable = false,
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(0, 1.75, -2.25)
                    }
                },
                Pointlight_2 = {
                    enabled = true,
                    description = 'Cockpit Green Light',
                    type = 1, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = false,
                    radius = 5.575,
                    width = 1,
                    color = Vec3(0, 1, 0),
                    intensity = 4.15,
                    visible = true,
                    enlightenEnable = true,
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(0, 2, 8)
                    }
                },
                Pointlight_3 = {
                    enabled = true,
                    description = 'Bottom Red Blinker',
                    type = 1, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = false,
                    radius = 115,
                    width = 1,
                    color = Vec3(1, 0, 0),
                    intensity = 0.0115,
                    visible = true,
                    enlightenEnable = true,
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(0, -1, -2.0)
                    }
                }
            }
        },
        F35 = {
            -- F35B US
            -- https://github.com/EmulatorNexus/Venice-EBX/blob/master/Vehicles/XPack01/F35/F35B.txt
            name = 'F35',
            partitionGUID = 'EB06DA1E-4B21-11E0-AC22-92ED36F00269',
            chassisGUID = '73EB0373-2F17-6305-05BF-952BED53A0E7',
            vehicleDataGUID = '922E0FF3-5BEA-78C1-4FD1-EDAE142D2289',
            Components = {
                Spotlight_1 = {
                    enabled = true,
                    description = 'Front Spotlight',
                    weapon2 = false,
                    type = 2, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = false,
                    shape = 1,
                    frustumFov = 40,
                    frustumAspect = 1.0,
                    castShadowsMinLevel = 0,
                    castShadowsEnable = true,
                    intensity = 32.5 * SPOTLIGHTMULTIPLICATOR,
                    radius = 120,
                    color = Vec3(1, 0.9, 0.8),
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(0, -0.225, 9.25)
                    }
                },
                Pointlight_1 = {
                    enabled = true,
                    description = 'Top Red Blinker',
                    type = 1, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = false,
                    radius = 6.35,
                    width = 1,
                    intensity = 5.15,
                    color = Vec3(1, 0, 0),
                    visible = true,
                    enlightenEnable = false,
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(0, 1.5, -2.25),
                    }
                },
                Pointlight_2 = {
                    enabled = true,
                    description = 'Cockpit Green Light',
                    type = 1, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = false,
                    radius = 4.75,
                    width = 1,
                    color = Vec3(0, 1, 0),
                    intensity = 4.4,
                    visible = true,
                    enlightenEnable = true,
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(0, 1.175, 6.35)
                    }
                },
                Pointlight_3 = {
                    enabled = true,
                    description = 'Bottom Red Blinker',
                    type = 1, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = false,
                    radius = 7.25,
                    width = 1,
                    color = Vec3(1, 0, 0),
                    intensity = 5,
                    visible = true,
                    enlightenEnable = true,
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(0, -1, -2.0)
                    }
                }
            }
        }
    },
    -- Humvee Armored
    -- https://github.com/EmulatorNexus/Venice-EBX/blob/master/Vehicles/HumveeArmored/HumveeArmored.txt
    GROUND = {
        HMMVWV = {
            name = 'HMMVWV Standard',
            partitionGUID = '611F48A3-0919-11E0-985D-C512734E48AF',
            chassisGUID = 'DA89EB6C-A824-A813-A6C5-E2DEF9D4F4FF',
            vehicleDataGUID = '34ADD228-7E03-C4A4-665F-E0F0955098EE',

            Components = {
                Spotlight_1 = {
                    enabled = true,
                    description = 'Left Main Light',
                    type = 2, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = false,
                    shape = 1,
                    frustumFov = 100,
                    frustumAspect = 1.25,
                    castShadowsMinLevel = 0,
                    castShadowsEnable = true,
                    intensity = 5*SPOTLIGHTMULTIPLICATOR,
                    radius = 50,
                    color = Vec3(1, 0.9, 0.8),
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(-0.525, 0.65, 3),
                        mirrored = true
                    },
                },
                Spotlight_2 = {
                    enabled = true,
                    description = 'Left Main Light Far',
                    type = 2, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = false,
                    shape = 1,
                    frustumFov = 55,
                    frustumAspect = 1,
                    castShadowsMinLevel = 0,
                    castShadowsEnable = true,
                    intensity = 1.5 * SPOTLIGHTMULTIPLICATOR,
                    radius = 70,
                    color = Vec3(1, 0.9, 0.8),
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(-0.525, 0.65, 3),
                        mirrored = true
                    }
                },
                Pointlight_1 = {
                    enabled = true,
                    description = 'Main Light Pointlight',
                    type = 1, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = false,
                    radius = 2,
                    width = 1,
                    intensity = 10 * SPOTLIGHTMULTIPLICATOR,
                    color = Vec3(1, 0.9, 0.9),
                    visible = true,
                    enlightenEnable = false,
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(0, 1, 5)
                    }
                }
            }
        },
        HMMVWV_A = {
            -- HMMVMV Asrad
            -- https://github.com/EmulatorNexus/Venice-EBX/blob/master/Vehicles/XP5/Humvee_ASRAD/Humvee_ASRAD.txt
            name = 'HMMVWV ASRAD',
            partitionGUID = 'F7C250D2-ECEB-481F-A130-D91FE8B693E0',
            chassisGUID = '5D10A701-196F-4DA9-8D83-610ABF56124B',
            vehicleDataGUID = '1DE37416-42D8-461E-B727-2159DB141204',
            Components = {
                Spotlight_1 = {
                    enabled = true,
                    description = 'Left Main Light',
                    type = 2, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = false,
                    shape = 1,
                    frustumFov = 100,
                    frustumAspect = 1.25,
                    castShadowsMinLevel = 0,
                    castShadowsEnable = true,
                    intensity = 5 * SPOTLIGHTMULTIPLICATOR,
                    radius = 50,
                    color = Vec3(1, 0.9, 0.8),
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(-0.525, 0.65, 3),
                        mirrored = true
                    }
                },
                Spotlight_2 = {
                    enabled = true,
                    description = 'Left Main Light Far',
                    type = 2, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = false,
                    shape = 1,
                    frustumFov = 55,
                    frustumAspect = 1,
                    castShadowsMinLevel = 0,
                    castShadowsEnable = true,
                    intensity = 5 * SPOTLIGHTMULTIPLICATOR,
                    radius = 70,
                    color = Vec3(1, 0.9, 0.8),
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(-0.525, 0.65, 3),
                        mirrored = true,
                    }
                },
                Pointlight_1 = {
                    enabled = true,
                    description = 'Main Light Pointlight',
                    type = 1, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = false,
                    radius = 2,
                    width = 1,
                    intensity = 10,
                    color = Vec3(1, 0.9, 0.9),
                    visible = true,
                    enlightenEnable = false,
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(0, 1, 5)
                    }
                }
            }
        },
        M1 = {
            -- M1 Tank US
            -- https://github.com/EmulatorNexus/Venice-EBX/blob/master/Vehicles/M1A2/M1Abrams.txt
            name = 'M1',
            partitionGUID = 'B069BA89-EECF-11DD-8117-9421284A74E5',
            chassisGUID = 'B06A08AD-EECF-11DD-8117-9421284A74E5',
            vehicleDataGUID = 'B06A08AC-EECF-11DD-8117-9421284A74E5',
            Components = {
                Spotlight_1 = {
                    enabled = true,
                    description = 'Left Main Light',
                    type = 2, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = false,
                    shape = 1,
                    frustumFov = 80,
                    frustumAspect = 1.25,
                    castShadowsMinLevel = 0,
                    castShadowsEnable = true,
                    intensity = 5 * SPOTLIGHTMULTIPLICATOR,
                    radius = 50,
                    color = Vec3(1, 0.9, 0.8),
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(-0.85, 1.265, 3.65),
                        mirrored = true
                    }
                },
                Pointlight_1 = {
                    enabled = true,
                    description = 'Left Main Light Pointlight',
                    type = 1, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = false,
                    radius = 8,
                    width = 1,
                    intensity = 5,
                    color = Vec3(1, 0.9, 0.9),
                    visible = true,
                    enlightenEnable = false,
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(0, 1, 6.75)
                    }
                }
            }
        },
        T90 = {
            -- Tank T90 RUS
            -- https://github.com/EmulatorNexus/Venice-EBX/blob/master/Vehicles/T90/T90.txt
            name = 'T90',
            partitionGUID = '60106974-DD7D-11DD-A030-B04E425BA11E',
            chassisGUID = '7A858CD2-DD7D-11DD-A030-B04E425BA11E',
            vehicleDataGUID = '60106976-DD7D-11DD-A030-B04E425BA11E',
            Components = {
                Spotlight_1 = {
                    enabled = true,
                    description = 'Main Light',
                    type = 2, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = false,
                    shape = 1,
                    frustumFov = 65,
                    frustumAspect = 1.25,
                    castShadowsMinLevel = 0,
                    castShadowsEnable = true,
                    intensity = 6.25 * SPOTLIGHTMULTIPLICATOR,
                    radius = 50,
                    color = Vec3(1, 0.9, 0.8),
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(-0.825, 1.14, 2.9),
                        mirrored = true
                    }
                },
                Pointlight_1 = {
                    enabled = true,
                    description = 'Main Light Pointlight',
                    type = 1, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = false,
                    radius = 2,
                    width = 1,
                    intensity = 10,
                    color = Vec3(1, 0.9, 0.9),
                    visible = true,
                    enlightenEnable = false,
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(0, 1, 6)
                    }
                }
            }
        },
        Growler = {
        -- Growler Jeep US
        -- https://github.com/EmulatorNexus/Venice-EBX/blob/master/Vehicles/GrowlerITV/GrowlerITV.txt
            name = 'Growler',
            partitionGUID = 'CF5166FD-6B60-11E0-8ACE-C75FA07B1C42',
            chassisGUID = '50505716-343D-B27D-26DE-BF914B9A05A0',
            vehicleDataGUID = '02158D2F-08AC-EC79-EE0D-15F41D9D59A2',
            Components = {
                Spotlight_1 = {
                    enabled = true,
                    description = 'Left Main Light',
                    type = 2, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = false,
                    shape = 1,
                    frustumFov = 80,
                    frustumAspect = 1.25,
                    castShadowsMinLevel = 0,
                    castShadowsEnable = true,
                    intensity = 5 * SPOTLIGHTMULTIPLICATOR,
                    radius = 50,
                    color = Vec3(1, 0.9, 0.8),
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(-0.6476, 1.13, 2.245),
                        mirrored = true
                    }
                },
                Spotlight_2 = {
                    enabled = true,
                    description = 'Left Main Light Far',
                    type = 2, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = false,
                    shape = 1,
                    frustumFov = 40,
                    frustumAspect = 1.25,
                    castShadowsMinLevel = 0,
                    castShadowsEnable = true,
                    intensity = 6 * SPOTLIGHTMULTIPLICATOR,
                    radius = 80,
                    color = Vec3(1, 0.9, 0.8),
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(-0.4376, 1.13, 2.245),
                        mirrored = true
                    }
                },
                Pointlight_1 = {
                    enabled = true,
                    description = 'Main Light Pointlight',
                    type = 1, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = false,
                    radius = 5,
                    width = 2,
                    intensity = 10,
                    color = Vec3(1, 0.9, 0.9),
                    visible = true,
                    enlightenEnable = false,
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(0, 1.15, 6)
                    }
                },
            }
        },
        VDV = {
            -- VDV Jeep RUS
            -- https://github.com/EmulatorNexus/Venice-EBX/blob/master/Vehicles/VDV_Buggy/VDV_Buggy.txt
            name = 'VDV',
            partitionGUID = '2EA804A7-8232-11E0-823A-BD52CA6DC6B3',
            chassisGUID = '3EEBB2A5-3097-F378-A32D-2E4447D0C9E1',
            vehicleDataGUID = '21987A58-FF12-90E7-3B02-5122E534A06B',
            Components = {
                Spotlight_1 = {
                    enabled = true,
                    description = 'Left Main Light',
                    type = 2, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = false,
                    shape = 1,
                    frustumFov = 75,
                    frustumAspect = 1.25,
                    castShadowsMinLevel = 0,
                    castShadowsEnable = true,
                    intensity = 5.25 * SPOTLIGHTMULTIPLICATOR,
                    radius = 60,
                    color = Vec3(1, 0.9, 0.8),
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(-0.44, 0.85, 1.572),
                        mirrored = true
                    }
                },
                Pointlight_1 = {
                    enabled = true,
                    description = 'Main Light Pointlight',
                    type = 1, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = false,
                    radius = 5.75,
                    width = 2,
                    intensity = 8 * SPOTLIGHTMULTIPLICATOR,
                    color = Vec3(1, 0.9, 0.9),
                    visible = true,
                    enlightenEnable = false,
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(0, 1, 6)
                    }
                }
            }
        },
        DPV = {
            -- DPV Jeep RUS
            -- https://github.com/EmulatorNexus/Venice-EBX/tree/master/Vehicles/XPack01/DPV
            name = 'DPV',
            partitionGUID = '6F91A4CF-344D-11E0-930F-E8BE623140CB',
            chassisGUID = 'B0563CD8-5A05-A9AF-CB92-5BB127EBF60C',
            vehicleDataGUID = 'E5D5D798-E452-0E56-1132-D7C85AB29402',
            Components = {
                Spotlight_1 = {
                    enabled = true,
                    description = 'Left Main Light',
                    type = 2, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = false,
                    shape = 1,
                    frustumFov = 80,
                    frustumAspect = 1.25,
                    castShadowsMinLevel = 0,
                    castShadowsEnable = true,
                    intensity = 5.75 * SPOTLIGHTMULTIPLICATOR,
                    radius = 40,
                    color = Vec3(1, 0.9, 0.8),
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(-0.3125, 0.765, 2.07),
                        mirrored = true
                    }
                },
                Pointlight_1 = {
                    enabled = true,
                    description = 'Left Main Light Pointlight',
                    type = 1, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = false,
                    radius = 6.25,
                    width = 2,
                    intensity = 7.5,
                    color = Vec3(1, 0.9, 0.9),
                    visible = true,
                    enlightenEnable = false,
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(0, 1, 6),
                    },
                },
                Spotlight_2 = {
                    enabled = true,
                    description = 'Left Main Far Light',
                    type = 2, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = false,
                    shape = 1,
                    frustumFov = 35,
                    frustumAspect = 1.25,
                    castShadowsMinLevel = 0,
                    castShadowsEnable = true,
                    intensity = 5.75*SPOTLIGHTMULTIPLICATOR,
                    radius = 80,
                    color = Vec3(1, 0.9, 0.8),
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(-0.1025, 0.765, 2.045),
                        mirrored = true,
                    }
                }
            }
        },

        BTR = {
            -- ATV BTR
            -- https://github.com/EmulatorNexus/Venice-EBX/blob/master/Vehicles/XPack01/BTR-90/BTR90.txt
            name = 'BTR',
            partitionGUID = '22CFC313-4DD1-49E6-B45F-A8B1194105C5',
            chassisGUID = '9B10AC62-36E3-4DDA-A43B-D24CC384C907',
            weaponGUID = 'E392AE5A-9733-4A3E-AC58-258275E4BDBE',
            vehicleDataGUID = '687DB918-EBC5-4445-9CEF-911981203EB1',
            Components = {
                Spotlight_1 = {
                    enabled = true,
                    description = 'Left Main Light',
                    type = 2, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = false,
                    shape = 1,
                    frustumFov = 80,
                    frustumAspect = 1.25,
                    castShadowsMinLevel = 0,
                    castShadowsEnable = true,
                    intensity = 18.75*SPOTLIGHTMULTIPLICATOR,
                    radius = 40,
                    color = Vec3(1, 0.9, 0.7),
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(-0.8, 1.75, 3.5),
                        mirrored = true,
                    },
                },
                Spotlight_2 = {
                    enabled = true,
                    description = 'Main Weapon Light',
                    type = 2, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = true,
                    shape = 1,
                    frustumFov = 35,
                    frustumAspect = 1.25,
                    castShadowsMinLevel = 0,
                    castShadowsEnable = true,
                    intensity = 20*SPOTLIGHTMULTIPLICATOR,
                    radius = 30,
                    color = Vec3(1, 0.9, 0.7),
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(-0.50, 0.09, -1.20),
                    }
                },
                Pointlight_1 = {
                    enabled = true,
                    description = 'Left Main Light Pointlight',
                    type = 1, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = false,
                    radius = 5,
                    width = 5,
                    intensity = 10,
                    color = Vec3(1, 0.9, 0.7),
                    visible = true,
                    enlightenEnable = false,
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(0, 2.5, 9.5),
                    }
                }
            }
        },
        LAV = {
            -- LAV 25 US
            -- https://github.com/EmulatorNexus/Venice-EBX/blob/master/Vehicles/LAV25/LAV25.txt
            name = 'LAV25',
            partitionGUID = 'D124CDD4-FE2A-11DF-BB74-FD1A26B74EE5',
            chassisGUID = '4F0DD4BF-A2B3-3980-AB37-2B7A3642F1BE',
            weaponGUID = 'BC13D6E6-DE0A-46A4-B969-3EF2E1968A59',
            vehicleDataGUID = '0AA2C0B7-6B2C-76F5-B7CE-50276A615E3A',
            Components = {
                Spotlight_1 = {
                    enabled = true,
                    description = 'Left Main Light',
                    type = 2, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = false,
                    shape = 1,
                    frustumFov = 80,
                    frustumAspect = 1.25,
                    castShadowsMinLevel = 0,
                    castShadowsEnable = true,
                    intensity = 17.5*SPOTLIGHTMULTIPLICATOR,
                    radius = 50,
                    color = Vec3(1, 0.9, 0.7),
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(-0.845, 1.765, 3.43),
                        mirrored = true,
                    }
                },
                Spotlight_3 = {
                    enabled = true,
                    description = 'Main Weapon Light',
                    type = 2, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = true,
                    shape = 1,
                    frustumFov = 60,
                    frustumAspect = 1.25,
                    castShadowsMinLevel = 0,
                    castShadowsEnable = true,
                    intensity = 20*SPOTLIGHTMULTIPLICATOR,
                    radius = 30,
                    color = Vec3(1, 0.9, 0.7),
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(-0.3525, 0.585, -1.49),
                    }
                },
                Pointlight_1 = {
                    enabled = true,
                    description = 'Left Main Light Pointlight',
                    type = 1, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = false,
                    radius = 5,
                    width = 5,
                    intensity = 10,
                    color = Vec3(1, 0.9, 0.7),
                    visible = true,
                    enlightenEnable = false,
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(0, 2.5, 9.5),   -- left/right x, height y, front/back z
                    }
                }
            }
        },
        Skidloader = {
            -- Skidloader
            -- https://github.com/EmulatorNexus/Venice-EBX/blob/master/Vehicles/XPack01/SkidLoader/SkidLoader.txt
            name = 'Skidloader',
            partitionGUID = 'EB384F9B-929B-11E0-8E2E-9D80798C8C1C',
            chassisGUID = '6EBD292A-078C-046D-167B-D6B9BF557111',
            vehicleDataGUID = 'D531D9AC-6FB4-DF6E-26DE-32D3E2471779',
            Components = {
                Spotlight_1 = {
                    enabled = true,
                    description = 'Left Main Light',
                    type = 2, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = false,
                    shape = 1,
                    frustumFov = 120,
                    frustumAspect = 1.0,
                    castShadowsMinLevel = 0,
                    castShadowsEnable = true,
                    intensity = 1*SPOTLIGHTMULTIPLICATOR,
                    radius = 30,
                    color = Vec3(1, 0.9, 0.7),
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(-0.40, 2, 0.66),
                        mirrored = true,
                    }
                },
                Pointlight_1 = {
                    enabled = true,
                    description = 'God sent',
                    type = 1, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = false,
                    radius = 3,
                    width = 1,
                    intensity = 5000,
                    color = Vec3(1, 0.8, 0.4),
                    visible = true,
                    enlightenEnable = false,
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(0, 2.5, 4.75),
                    },
                }
            }
        },
        KLR650 = {
            -- KLR650 Dirtbike
            -- https://github.com/EmulatorNexus/Venice-EBX/blob/master/Vehicles/XPack01/SkidLoader/SkidLoader.txt
            name = 'KLR650',
            partitionGUID = '38FA36CC-22C8-4624-89BF-1D95C7CE7815',
            chassisGUID = '74DB41C3-A464-4AFF-B60F-C7B460F3D1E2',
            vehicleDataGUID = '33960E31-BB2A-4CAD-80B9-FBDA32E36745',
            Components = {
                Spotlight_1 = {
                    enabled = true,
                    description = 'Main Light',
                    type = 2, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = false,
                    shape = 1,
                    frustumFov = 50,
                    frustumAspect = 1.0,
                    castShadowsMinLevel = 0,
                    castShadowsEnable = true,
                    intensity = 1*SPOTLIGHTMULTIPLICATOR,
                    radius = 140,
                    color = Vec3(1, 0.9, 0.7),
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(0, 0.85, 1),
                    }
                }
            }
        },
        Tunguska = {
            -- Tank 9K22 Tunguska RUS
            -- https://github.com/EmulatorNexus/Venice-EBX/blob/master/Vehicles/T90/T90.txt
            name = '9K22 Tunguska-M',
            partitionGUID = '3DB73059-32BD-11E0-931D-8D7AAE81C8B7',
            chassisGUID = 'B297FCC2-B094-5AEC-0933-162CF949032D',
            vehicleDataGUID = 'AA668FE2-903B-62A9-13DB-6CA72BF63729',
            Components = {
                Spotlight_1 = {
                    enabled = true,
                    description = 'Main Light',
                    type = 2, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = false,
                    shape = 1,
                    frustumFov = 80,
                    frustumAspect = 1.25,
                    castShadowsMinLevel = 0,
                    castShadowsEnable = true,
                    intensity = 5*SPOTLIGHTMULTIPLICATOR,
                    radius = 50,
                    color = Vec3(1, 0.9, 0.8),
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(-1.2335, 1.2865, 3.17),
                        mirrored = true
                    }
                },
                Pointlight_1 = {
                    enabled = true,
                    description = 'Main Light Pointlight',
                    type = 1, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = false,
                    radius = 2,
                    width = 1,
                    intensity = 10,
                    color = Vec3(1, 0.9, 0.9),
                    visible = true,
                    enlightenEnable = false,
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(0, 1, 6),
                    }
                },
                Pointlight_2 = {
                    enabled = true,
                    description = 'Top Red Blinker Pointlight',
                    type = 1, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = false,
                    radius = 8,
                    width = 1,
                    intensity = 5,
                    color = Vec3(1, 0.1, 0.1),
                    visible = true,
                    enlightenEnable = false,
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(0, 2.5, 0),
                    }
                }
            }
        },
        Quad = {
            name = 'Quad Bike',
            partitionGUID = '08D3686F-A96A-11E1-9047-F3806E4ECBA6',
            chassisGUID = '5BA1F26D-894A-BBAC-7E32-587645354615',
            vehicleDataGUID = '0E347B4B-B579-F65D-BC97-D11B28D7EDC8',
            Components = {
                Spotlight_1 = {
                    enabled = true,
                    description = 'Main Light',
                    type = 2, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = false,
                    shape = 1,
                    frustumFov = 55,
                    frustumAspect = 1.25,
                    castShadowsMinLevel = 0,
                    castShadowsEnable = true,
                    intensity = 5.25*SPOTLIGHTMULTIPLICATOR,
                    radius = 65,
                    color = Vec3(1, 0.9, 0.8),
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(-0.25, 0.8775, 1.1325),
                        mirrored = true,
                    }
                }
            }
        },
        Sprut = {
                -- Tank T90 RUS
                -- https://github.com/EmulatorNexus/Venice-EBX/blob/master/Vehicles/T90/T90.txt
            name = 'Sprut-SD',
            partitionGUID = 'A069F34C-3AE9-4030-8808-29882A555FA1',
            chassisGUID = '6ACD9A3B-FA8D-40F0-9F8A-F108EAF721F4',
            vehicleDataGUID = '00839CC5-087D-48B5-A3CE-15290FABF83D',
            Components = {
                Spotlight_1 = {
                    enabled = true,
                    description = 'Main Light',
                    type = 2, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = false,
                    shape = 1,
                    frustumFov = 80,
                    frustumAspect = 1.25,
                    castShadowsMinLevel = 0,
                    castShadowsEnable = true,
                    intensity = 5*SPOTLIGHTMULTIPLICATOR,
                    radius = 50,
                    color = Vec3(1, 0.9, 0.8),
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(-1.1535, 1.3265, 2.0575),
                        mirrored = true,
                    }
                },
                Pointlight_1 = {
                    enabled = true,
                    description = 'Main Light Pointlight',
                    type = 1, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = false,
                    radius = 2,
                    width = 1,
                    intensity = 10,
                    color = Vec3(1, 0.9, 0.9),
                    visible = true,
                    enlightenEnable = false,
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(0, 1, 5),
                    },
                }
            }
        },
        LAVAD = {
            -- LAV-AD US
            -- https://github.com/EmulatorNexus/Venice-EBX/blob/master/Vehicles/LAV25/LAV_AD.txt
            name = 'LAV-AD',
            partitionGUID = '0E23F40F-CDB3-4B9E-A36B-BD338CFA35BC',
            chassisGUID = '0A4A1019-A682-4F7F-B2C5-42D83ABD2DCD',
            vehicleDataGUID = '86A71B49-87A7-4A4D-B7E2-7C835B2F27C9',
            Components = {
                Spotlight_1 = {
                    enabled = true,
                    description = 'Left Main Light',
                    type = 2, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = false,
                    shape = 1,
                    frustumFov = 80,
                    frustumAspect = 1.25,
                    castShadowsMinLevel = 0,
                    castShadowsEnable = true,
                    intensity = 17.5*SPOTLIGHTMULTIPLICATOR,
                    radius = 50,
                    color = Vec3(1, 0.9, 0.7),
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(-0.875, 1.75, 3.49115),
                        mirrored = true,
                    }
                },
                Pointlight_1 = {
                    enabled = true,
                    description = 'Left Main Light Pointlight',
                    type = 1, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = false,
                    radius = 5,
                    width = 5,
                    intensity = 10,
                    color = Vec3(1, 0.9, 0.7),
                    visible = true,
                    enlightenEnable = false,
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(0, 2.5, 9.44),
                    }
                },
                Pointlight_2 = {
                    enabled = true,
                    description = 'Top Blinker Pointlight',
                    type = 1, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = false,
                    radius = 3.75,
                    width = 5,
                    intensity = 12.5,
                    color = Vec3(1, 0.1, 0.1),
                    visible = true,
                    enlightenEnable = false,
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(0, 2.65, -2),
                    },
                }
            }
        },
        M1128 = {
            -- M1128 Stryker US
            -- https://github.com/EmulatorNexus/Venice-EBX/blob/master/Vehicles/XP3/M1128-Stryker/M1128-Stryker.txt
            name = 'LAV-AD',
            partitionGUID = '3EE37540-9833-11E1-A26B-A2AC6EC60B20',
            chassisGUID = '5159CD83-B46E-D7CA-F4B9-27C884280E7A',
            vehicleDataGUID = 'CA5E19E7-AD7B-D91D-5F7F-D5A9843FF2D1',
            Components = {
                Spotlight_1 = {
                    enabled = true,
                    description = 'Left Main Light',
                    type = 2, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = false,
                    shape = 1,
                    frustumFov = 80,
                    frustumAspect = 1.25,
                    castShadowsMinLevel = 0,
                    castShadowsEnable = true,
                    intensity = 17.5*SPOTLIGHTMULTIPLICATOR,
                    radius = 50,
                    color = Vec3(1, 0.9, 0.7),
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(-0.86, 1.55, 3.39),
                        mirrored = true,
                    }
                },
                Pointlight_1 = {
                    enabled = true,
                    description = 'Left Main Light Pointlight',
                    type = 1, -- Pointlight [1] ; Spotlight [2]
                    weaponmounted = false,
                    radius = 5,
                    width = 5,
                    intensity = 10,
                    color = Vec3(1, 0.9, 0.7),
                    visible = true,
                    enlightenEnable = false,
                    transform = {
                        left = Vec3(-1, 0, 0),
                        up = Vec3(0, 1, 0),
                        forward = Vec3(0, 0, 1),
                        trans = Vec3(0, 2.4, 9.5),
                    },
                }
            }
        }
    }
}


return VEHICLESETTINGS