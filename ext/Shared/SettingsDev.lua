-- This is SettingsDev.lua, a backup containing the MAPS functionality
-- If you want to assign a fixed mode per map using MAPS, copy the content of this file to Settings.lua
-- and comment out the "Two Modes" code block in client/__init.lua, then uncomment the "MAPS Mode" code block

DU_CONFIG = {
    VEHICLES = {
        USE_VEHICLE_LIGHTS = true
    },
    GENERAL = {
        USE_NIGHTVISION_GADGET = true
    },
    LOGGER_ENABLED = true,
    LOGGER_PRINT_ALL = false,

    -- MAPS table: assign a fixed mode to each map (mode name must exist in Presets)
    MAPS = {
        MP_001 = "Night",      -- Grand Bazaar
        MP_003 = "Night",      -- Teheran Highway
        MP_007 = "Night",      -- Caspian Border
        MP_011 = "Night",      -- Seine Crossing
        MP_012 = "Night",      -- Operation Firestorm
        MP_013 = "Night",      -- Damavand Peak
        MP_017 = "Night",      -- Noshahr Canals
        MP_018 = "Night",      -- Kharg Island
        MP_Subway = "Night",   -- Operation Metro
        XP1_001 = "Night",     -- Strike at Karkand
        XP1_002 = "Night",     -- Gulf of Oman
        XP1_003 = "Night",     -- Sharqi Peninsula
        XP1_004 = "Night",     -- Wake Island
        XP2_Palace = "Night",  -- Donya Fortress
        XP2_Office = "Night",  -- Operation 925
        XP2_Factory = "Night", -- Scrapmetal
        XP2_Skybar = "Night",  -- Ziba Tower
        XP3_Alborz = "Night",  -- Alborz Mountains
        XP3_Shield = "Night",  -- Armored Shield
        XP3_Desert = "Night",  -- Bandar Desert
        XP3_Valley = "Night",  -- Death Valley
        XP4_Parl = "Night",    -- Azadi Palace
        XP4_Quake = "Night",   -- Epicenter
        XP4_FD = "Night",      -- Markaz Monolith
        XP4_Rubble = "Night",  -- Talah Market
        XP5_001 = "Night",     -- Operation Riverside
        XP5_002 = "Night",     -- Nebandan Flats
        XP5_003 = "Night",     -- Kiasar Railroad
        XP5_004 = "Night"      -- Sabalan Pipeline
    },

    NVG = {
        -- Battery parameters (unit: seconds, matching in-game time)
        BATTERY_MAX = 120,           -- Maximum battery (full charge)
        BATTERY_MIN = 10,            -- Minimum battery required to activate NVG
        BATTERY_COOLDOWN = 10,       -- Cooldown seconds after battery is fully depleted
        FADE_LENGTH_MS = 2000,       -- Fade duration for NVG effect on/off (milliseconds)

        -- VEManager preset names for NVG visual effects in different modes
        -- Note: These preset names must exist in your Presets folder (e.g., DU_FLIR, DU_Vehicle_NVG, DU_Vehicle_Thermal)
        MODE_PRESETS = {
            Night = {
                Soldier = "DU_FLIR",
                Vehicle = "DU_Vehicle_NVG",
                Vehicle_Thermal = "DU_Vehicle_Thermal",
            },
            NVG = {
                Soldier = "DU_FLIR",
                Vehicle = "DU_Vehicle_NVG",
                Vehicle_Thermal = "DU_Vehicle_Thermal",
            },
            Morning = {
                Soldier = "DU_FLIR",
                Vehicle = "DU_Vehicle_NVG",
                Vehicle_Thermal = "DU_Vehicle_Thermal",
            },
            -- If you have other modes (e.g., Evening, Noon), you can add them here
        },
    },

}