--Settings
local debugPrints = {

        ['enable'] = true,
        ['adding'] = true,
        ['removing'] = true, 
        ['altering'] = true,
        ['player'] = true,
        ['common'] = true,

}

-- Standard Setting, decides if bluefilter is to be used with Standard Preset Maps [true/false]
local lensflareEnabled = false
local sunflareEnabled = true
local standardusebluefilter = false

-- Vehicle Lights
local useVehicleLights_Airborne = true
local useVehicleLights_Ground = true

local mapPresets = {
    MP_001 = 'Night', -- Grand Bazaar
    MP_003 = 'Night', -- Teheran Highway
    MP_007 = 'Night', -- Caspian Border
    MP_011 = 'Night', -- Seine Crossing
    MP_012 = 'Night', -- Operation Firestorm
    MP_013 = 'Night', -- Damavand Peak
    MP_017 = 'Night', -- Noshahr Canals
    MP_018 = 'Night', -- Kharg Island
    MP_Subway = 'Night', -- Operation Metro
    XP1_001 = 'Night', -- Strike at Karkand
    XP1_002 = 'Night', -- Gulf of Oman
    XP1_003 = 'Night', -- Sharqi Peninsula
    XP1_004 = 'Night', -- Wake Island
    XP2_Palace = 'Night', -- Donya Fortress
    XP2_Office = 'Night', -- Operation 925
    XP2_Factory = 'Night', -- Scrapmetal
    XP2_Skybar = 'Night', -- Ziba Tower
    XP3_Alborz = 'Night', -- Alborz Mountains
    XP3_Shield = 'Night', -- Armored Shield
    XP3_Desert = 'Night', -- Bandar Desert
    XP3_Valley = 'Night', -- Death Valley
    XP4_Parl = 'Night', -- Azadi Palace
    XP4_Quake = 'Night', -- Epicenter
    XP4_FD = 'Night', -- Markaz Monolith
    XP4_Rubble = 'Night', -- Talah Market
    XP5_001 = 'Night', -- Operation Riverside
    XP5_002 = 'Night', -- Nebandan Flats
    XP5_003 = 'Night', -- Kiasar Railroad
    XP5_004 = 'Night' -- Sabalan Pipeline
}


-- Fog and Brightness Settings - Night Preset
-- Brightness: recommended max: {1.5} | higher values will raise brightness
-- Fog: recommended: {1} | lower values increase fog, higher values decrease fog

local generalbrightness                             = 1.0
local generalfog                                    = 1.0

local mapBrightnessMultipliers = {
    MP_001 = 1.0, -- Grand Bazaar
    MP_003 = 1.0, -- Teheran Highway
    MP_007 = 1.0, -- Caspian Border
    MP_011 = 1.0, -- Seine Crossing
    MP_012 = 1.0, -- Operation Firestorm
    MP_013 = 1.0, -- Damavand Peak
    MP_017 = 1.0, -- Noshahr Canals
    MP_018 = 1.0, -- Kharg Island
    MP_Subway = 1.35, -- Operation Metro
    XP1_001 = 1.0, -- Strike at Karkand
    XP1_002 = 1.0, -- Gulf of Oman
    XP1_003 = 1.1, -- Sharqi Peninsula
    XP1_004 = 1.0, -- Wake Island
    XP2_Palace = 1.0, -- Donya Fortress
    XP2_Office = 1.0, -- Operation 925
    XP2_Factory = 1.0, -- Scrapmetal
    XP2_Skybar = 1.0, -- Ziba Tower
    XP3_Alborz = 1.0, -- Alborz Mountains
    XP3_Shield = 10.0, -- Armored Shield
    XP3_Desert = 1.0, -- Bandar Desert
    XP3_Valley = 1.0, -- Death Valley
    XP4_Parl = 1.0, -- Azadi Palace
    XP4_Quake = 1.0, -- Epicenter
    XP4_FD = 1.0, -- Markaz Monolith
    XP4_Rubble = 1.0, -- Talah Market
    XP5_001 = 1.0, -- Operation Riverside
    XP5_002 = 0.35, -- Nebandan Flats
    XP5_003 = 1.0, -- Kiasar Railroad
    XP5_004 = 1.0 -- Sabalan Pipeline
}

local mapFogMultipliers = {
    MP_001 = 1.0, -- Grand Bazaar
    MP_003 = 1.0, -- Teheran Highway
    MP_007 = 1.0, -- Caspian Border
    MP_011 = 1.0, -- Seine Crossing
    MP_012 = 1.0, -- Operation Firestorm
    MP_013 = 1.0, -- Damavand Peak
    MP_017 = 1.0, -- Noshahr Canals
    MP_018 = 1.0, -- Kharg Island
    MP_Subway = 1.15, -- Operation Metro
    XP1_001 = 1.0, -- Strike at Karkand
    XP1_002 = 0.1, -- Gulf of Oman
    XP1_003 = 0.5, -- Sharqi Peninsula
    XP1_004 = 1.0, -- Wake Island
    XP2_Palace = 1.0, -- Donya Fortress
    XP2_Office = 1.0, -- Operation 925
    XP2_Factory = 1.0, -- Scrapmetal
    XP2_Skybar = 1.0, -- Ziba Tower
    XP3_Alborz = 1.0, -- Alborz Mountains
    XP3_Shield = 1.0, -- Armored Shield
    XP3_Desert = 1.0, -- Bandar Desert
    XP3_Valley = 1.0, -- Death Valley
    XP4_Parl = 1.0, -- Azadi Palace
    XP4_Quake = 1.0, -- Epicenter
    XP4_FD = 1.0, -- Markaz Monolith
    XP4_Rubble = 1.0, -- Talah Market
    XP5_001 = 1.0, -- Operation Riverside
    XP5_002 = 0.9, -- Nebandan Flats
    XP5_003 = 1.0, -- Kiasar Railroad
    XP5_004 = 1.0 -- Sabalan Pipeline
}





return {
    LensflareEnabled = lensflareEnabled,
    SunflareEnabled = sunflareEnabled,
    Standardusebluefilter = standardusebluefilter,
    MapPresets = mapPresets,
    Generalbrightness = generalbrightness,
    Generalfog = generalfog,
    MapBrightnessMultipliers = mapBrightnessMultipliers,
    MapFogMultipliers = mapFogMultipliers,
    useVehicleLights_Airborne = useVehicleLights_Airborne,
    useVehicleLights_Ground = useVehicleLights_Airborne,
    DebugPrints = debugPrints
}