-- Default MapVE Configuration
DU_CONFIG = {
    VEHICLES = {
        USE_VEHICLE_LIGHTS = true
    },
    GENERAL = {
        USE_NIGHTVISION_GADGET = true
    },
    LOGGER_ENABLED = true,
    LOGGER_PRINT_ALL = false,

    -- ========== Mode Selection (Two Modes) ==========
    MODE_TYPE = "fixed_map",   -- "fixed_map" or "generic"
    MODE_LIST = { "Night", "NVG", "Morning" },

    -- ========== NVG Configuration ==========
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