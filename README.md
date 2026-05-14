# Darkness Unleashed Mod Documentation

## 1. Configuration Overview

All player-customizable settings are located in the `DU_CONFIG` table inside **`Darkness-Unleashed\ext\Shared\Settings.lua`**.  
You no longer need to modify hardcoded values in `Client\__init.lua` or `NVG.lua`.

**Note:** The mod provides two independent map mode control systems – you can choose which one to use (**they cannot be enabled at the same time**).  
- **System A (default)**: Supports map‑fixed mode and generic mode, with random selection.  
- **System B (alternative)**: Uses a `MAPS` table to assign a fixed mode per map (no randomness).  
Both systems are described below with their usage and switching instructions.

---

## 2. System A (Default): Map‑Fixed Mode / Generic Mode + Random Pool

### 2.1 Core Configuration Fields

Locate and modify these fields in `Settings.lua`:

```lua
DU_CONFIG = {
    -- Mode selection
    MODE_TYPE = "fixed_map",   -- Options: "fixed_map" (map‑fixed) or "generic"
    MODE_LIST = { "Night", "NVG", "Morning" },   -- Random pool (one mode is chosen randomly)

    -- Other settings (vehicles, NVG, etc.) ...
}
```

### 2.2 Behaviour of the Two Modes

#### Map‑Fixed Mode (`MODE_TYPE = "fixed_map"`)

- The system first gets the short map name (e.g., `MP_007`).  
- It **randomly** selects a mode name from `MODE_LIST` (e.g., `"Night"`).  
- Then it tries to enable the preset: `DU_` + map name + `_` + mode name, e.g. `DU_MP_007_Night`.  
- If that preset does not exist (you haven't created a dedicated preset for that map), **no visual effect is applied** – the game uses its original lighting.

#### Generic Mode (`MODE_TYPE = "generic"`)

- Ignores the map name and directly picks a random mode from `MODE_LIST`.  
- Enables the preset: `DU_` + mode name, e.g. `DU_Night`.  
- Suitable when you want all maps to share the same visual configuration (e.g., a universal night mode).

### 2.3 How to Disable Randomness (Fix a Single Mode)

Simply set `MODE_LIST` to contain only one element, for example:

```lua
MODE_LIST = { "Night" }   -- Always uses Night mode
```

Then both map‑fixed and generic modes will always use `"Night"`.

### 2.4 Example: Adding a New Mode `Evening`

Suppose you want to add a "Evening" mode. Steps:

1. **Create the preset files**  
   - For generic mode: create `Presets/Special/Evening.lua` (you can copy `Night.lua` and adjust lighting parameters).  
   - For map‑fixed mode: create map‑specific presets, e.g. `Presets/Vanilla/MP_007/Evening.lua`.

2. **Register the presets**  
   Open `Client\__init.lua`, inside `DarknessClient:RegisterVars()` add to the `self.m_Presets` table:
   ```lua
   ["Evening"] = require("Presets/Special/Evening"),   -- generic mode
   ["MP_007_Evening"] = require("Presets/Vanilla/MP_007/Evening"), -- map‑fixed (if created)
   ```

3. **Update the configuration**  
   In `Settings.lua`:
   ```lua
   MODE_LIST = { "Night", "NVG", "Morning", "Evening" }
   ```
   Also add an NVG mapping for `Evening` inside `NVG.MODE_PRESETS` (see Section 4).

---

## 3. System B (Alternative): Per‑Map Fixed Mode (MAPS)

If you want each map to always use a specific mode without any randomness, use the **MAPS** approach.  
This system ignores `MODE_TYPE` and `MODE_LIST` and determines the mode directly from a lookup table based on the map name.

### 3.1 How to Configure

1. **Copy the backup configuration file**  
   The mod provides `Shared\SettingsDev.lua` (which contains a complete `MAPS` configuration example).  
   **Copy its entire content** and overwrite `Shared\Settings.lua` with it.

2. **Modify the MAPS table**  
   Your `Settings.lua` should then contain something like:
   ```lua
   DU_CONFIG = {
       VEHICLES = { ... },      -- keep as is
       GENERAL = { ... },
       LOGGER_ENABLED = true,
       
       -- MAPS table: assign a mode to each map
       MAPS = {
           MP_001 = "Night",    -- Grand Bazaar uses Night
           MP_007 = "NVG",      -- Caspian Border uses NVG
           MP_017 = "Morning",  -- Noshahr Canals uses Morning
           -- Maps not listed will have no preset enabled
       },
   }
   ```

3. **Enable the MAPS logic**  
   - Open `Client\__init.lua`.  
   - Find the `DarknessClient:OnPresetsLoaded()` function. You will see two code blocks separated by comments:  
     - Version A (two modes): currently active by default.  
     - Version B (MAPS mode): commented out.  
   - **Comment out all code of Version A** (in Lua, wrap it with `--[[ ... ]]`).  
   - **Uncomment Version B** (remove the `--[[` and `--]]`).  
   - Save the file.

### 3.2 Behaviour of MAPS Mode

- The system reads the `DU_CONFIG.MAPS` table, looks up the current map (e.g., `MP_007`) and gets the corresponding mode (e.g., `"NVG"`).  
- It then tries to enable the preset: `DU_` + map name + `_` + mode name, e.g. `DU_MP_007_NVG`.  
- If that preset does not exist, **no visual effect is applied** – the game uses original lighting.  
- Maps not listed in `MAPS` also have no preset enabled.

### 3.3 Switching Back to System A

To revert to the two‑mode + random pool system:
- Restore `Settings.lua` to a version that contains `MODE_TYPE` and `MODE_LIST` (you can get it from the backup `SettingsDev.lua` or from the original mod archive).  
- In `Client\__init.lua`: comment out Version B and uncomment Version A.

---

## 4. NVG (Night Vision Goggles) Configuration

All NVG‑related parameters are now centralised in `DU_CONFIG.NVG` – no need to modify `NVG.lua`.

### 4.1 Battery Parameters Example

```lua
NVG = {
    BATTERY_MAX = 120,           -- Maximum battery (seconds), e.g. 120 seconds
    BATTERY_MIN = 10,            -- Minimum battery required to activate NVG
    BATTERY_COOLDOWN = 10,       -- Cooldown seconds after battery is fully depleted before recharging starts
    FADE_LENGTH_MS = 2000,       -- Fade duration when toggling NVG (milliseconds)
}
```

### 4.2 NVG Visual Effects per Mode

`MODE_PRESETS` defines which VEManager preset is activated when you press `7` in each game mode (`Night`, `NVG`, `Morning`, etc.).

Default configuration:

```lua
MODE_PRESETS = {
    Night = {
        Soldier = "DU_FLIR",              -- Infantry NVG effect
        Vehicle = "DU_Vehicle_NVG",       -- NVG effect when inside a vehicle
        Vehicle_Thermal = "DU_Vehicle_Thermal",   -- Thermal effect when spawning inside a vehicle
    },
    NVG = { ... },    -- same as above (usually shares with Night)
    Morning = { ... },
}
```

You can freely change the preset names (as long as you have created the corresponding preset files in the `Presets` folder).  
For example, if you want a brighter infantry NVG preset for `Night` mode called `DU_BrightFLIR`, just change it to `Soldier = "DU_BrightFLIR"`.

### 4.3 Adding NVG Mapping for a New Mode

Assuming you added an `Evening` mode (see 2.4), you can add an entry to `NVG.MODE_PRESETS`:

```lua
MODE_PRESETS = {
    -- existing Night, NVG, Morning ...
    Evening = {
        Soldier = "DU_Evening_FLIR",
        Vehicle = "DU_Evening_Vehicle_NVG",
        Vehicle_Thermal = "DU_Evening_Vehicle_Thermal",
    },
}
```

Make sure those preset files (e.g., `DU_Evening_FLIR.lua`) are placed in `Presets/Special/` or the appropriate map folder, and have been registered in `Client\__init.lua`.

---

## 5. Preset File Directories and Naming Convention

| Mode Type                    | Preset File Location                 | Preset Naming Format               | Example                          |
| ---------------------------- | ------------------------------------ | ---------------------------------- | -------------------------------- |
| Generic mode preset          | `Presets/Special/`                   | `DU_` + mode name                  | `DU_Night.lua`                   |
| Map‑fixed mode preset        | `Presets/Vanilla/<mapname>/`         | `DU_` + map name + `_` + mode name | `DU_MP_007_Night.lua`            |
| NVG infantry effect preset   | `Presets/Special/`                   | any (but must match the config)    | `DU_FLIR.lua`                    |
| NVG in‑vehicle effect preset | `Presets/Special/`                   | any                                | `DU_Vehicle_NVG.lua`             |
| NVG vehicle thermal preset   | `Presets/Special/`                   | any                                | `DU_Vehicle_Thermal.lua`         |

**Note:** Map‑fixed mode presets must be registered in the `self.m_Presets` table in `Client\__init.lua`. Generic mode presets also need to be registered (the default ones like `Night`, `NVG`, `Morning` are already there; new ones must be added manually).

---

## 6. Notification Features (Yell)

- When you enter a game or respawn, a **yell** message appears showing the currently enabled visual preset (e.g., `Current preset: DU_MP_007_Night`).  
- When activating NVG, if battery is sufficient you will be notified: `"Battery sufficient, NVG ready"`; if battery drops below **10%**, you will see `"Battery below 10%, use sparingly"`.  
- Code locations for these notifications:  
  - Client: `Client\__init.lua` → `DarknessClient:OnYellPreset`  
  - Server: `Server\__init.lua` → `DarknessServer:OnBatteryStatus` and `OnPlayerRespawn`

---

## 7. Other Configuration Options

- **Vehicle headlights**: `DU_CONFIG.VEHICLES.USE_VEHICLE_LIGHTS = true/false`  
- **NVG master switch**: `DU_CONFIG.GENERAL.USE_NIGHTVISION_GADGET = true/false`  
- **Logging**: `DU_CONFIG.LOGGER_ENABLED = true/false` and `LOGGER_PRINT_ALL = true/false`

---

## 8. Dependencies & Compatibility

- Requires **VEManager** 0.5.7 or higher.  
- Compatible with the `fun‑bots` mod.  
- Fixes UI issues for official client versions 20079 and above.  
- The console may print client logs – this does not affect gameplay performance or stability.

---

## 9. Frequently Asked Questions (FAQ)

**Q1: I modified `Settings.lua` but it doesn't take effect.**  
A: Make sure the server has been fully restarted (or the mod reloaded), and that the file is saved as UTF‑8 without BOM.

**Q2: In map‑fixed mode, some maps don't enable any preset.**  
A: Check whether you have created a dedicated preset for that map, and that you have correctly registered the `mapname_modename` entry in the `self.m_Presets` table inside `Client\__init.lua`.

**Q3: How can I make all maps use the same preset (e.g., all night)?**  
A: Set `MODE_TYPE = "generic"`, `MODE_LIST = { "Night" }` (or whichever mode you want), and ensure that `Presets/Special/Night.lua` exists.

**Q4: I want each map to have a fixed mode but don't want to use the MAPS system. Is that possible?**  
A: Yes. Use System A with map‑fixed mode, but set `MODE_LIST` to contain only one mode (e.g., `{ "Night" }`). Then create a dedicated preset for each map for that mode. This way every map will always use Night, and you can change the global mode by editing `MODE_LIST`.

**Q5: How do I completely disable the NVG feature?**  
A: In `Settings.lua`, set `GENERAL.USE_NIGHTVISION_GADGET = false`.

---

**Version History**  
- Configuration system refactored: all behaviour is now controlled by `Shared/Settings.lua`.  
- Added two‑mode + random pool (System A).  
- Retained per‑map MAPS mode (System B) as an alternative.  
- NVG battery parameters and visual effect presets are fully configurable.  
- Documentation includes detailed examples and switching instructions.

---

*Feel free to adjust the paths and details to match your actual mod version and file structure. If you need more examples (e.g., a complete walkthrough for adding a new map‑specific preset), please let us know.*

---
