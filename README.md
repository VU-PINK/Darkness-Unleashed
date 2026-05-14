# Darkness Unleashed Mod Documentation

## 1. Configuration Overview

All player-customizable settings are located in the `DU_CONFIG` table inside **`Darkness-Unleashed\ext\Shared\Settings.lua`**.  
You no longer need to modify hardcoded values in `Client\__init.lua` or `NVG.lua`.

The mod provides **two independent** map mode control systems (they cannot be enabled at the same time):
- **System A (default)**: Supports map‑fixed mode and generic mode, with random selection.  
- **System B (alternative)**: Uses a `MAPS` table to assign a fixed mode per map (no randomness).

Both systems are described below with their usage and switching instructions.

---

## 2. Preset File Structure & Naming Convention (Must Read)

### 2.1 What is a Preset File?

Each preset file is a `.lua` file that returns a JSON‑formatted string (or a Lua table) containing all visual parameters (color grading, lighting, fog, etc.). **Key point**: Inside the file there is a `"Name"` field – this value is what VEManager actually uses to identify the preset. The filename (e.g., `Night.lua`) is only used for `require` in code and does not affect in‑game identification.

**Example:** Beginning of `Presets/Vanilla/MP_003/NVG.lua`
```json
{
    "Name": "DU_MP_003_NVG",
    "Priority": "2",
    ...
}
```
Here `"Name": "DU_MP_003_NVG"` is the name used when enabling the preset.

### 2.2 Preset File Locations and Naming Conventions

| Preset Type               | Path                                                   | Example File                 | Example `"Name"` inside file  | Description                                                                 |
| ------------------------- | ------------------------------------------------------ | ---------------------------- | ----------------------------- | --------------------------------------------------------------------------- |
| **Generic mode preset**   | `Presets/`                                             | `Night.lua`                  | `"DU_Night"`                  | Shared by all maps, usually named `DU_` + mode name.                        |
| **Map‑fixed mode preset** | `Presets/Vanilla/<map_short_name>/`                    | `MP_003/NVG.lua`             | `"DU_MP_003_NVG"`             | Dedicated to a specific map, naming: `DU_` + map_short_name + `_` + mode name. |
| **NVG preset**            | `Presets/Special/`                                     | `FLIR.lua`, `Vehicle_NVG.lua`| `"DU_FLIR"`, `"DU_Vehicle_NVG"`| Visual effects applied when NVG is active, stored separately.              |

**Mode names** are usually `"Night"`, `"NVG"`, `"Morning"`, `"Evening"`, `"Noon"`, etc. – you can customise them.

### 2.3 How to Add a New Preset (Example: `Evening` mode)

1. **Create the preset file**  
   - For generic mode: copy `Presets/Night.lua` to `Presets/Evening.lua`, change the `"Name"` field to `"DU_Evening"`, and adjust visual parameters.  
   - For map‑fixed mode: copy `Presets/Vanilla/MP_003/NVG.lua` to `Presets/Vanilla/MP_003/Evening.lua`, change `"Name"` to `"DU_MP_003_Evening"`, and tweak parameters.

2. **Register the preset** (in `Client\__init.lua`)  
   Open the `DarknessClient:RegisterVars()` function and add the corresponding entries to the `self.m_Presets` table:
   ```lua
   self.m_Presets = {
       -- existing entries...
       ["Evening"] = require("Presets/Evening"),              -- generic mode
       ["MP_003_Evening"] = require("Presets/Vanilla/MP_003/Evening"), -- map‑fixed mode
   }
   ```

3. **Update the configuration**  
   In `DU_CONFIG` inside `Settings.lua`, add `"Evening"` to `MODE_LIST`:
   ```lua
   MODE_LIST = { "Night", "NVG", "Morning", "Evening" }
   ```
   Also add an NVG mapping for `Evening` inside `NVG.MODE_PRESETS` (see Section 5).

---

## 3. System A (Default): Map‑Fixed Mode / Generic Mode + Random Pool

### 3.1 Core Configuration Fields (in `Settings.lua`)

```lua
DU_CONFIG = {
    MODE_TYPE = "fixed_map",   -- "fixed_map" or "generic"
    MODE_LIST = { "Night", "NVG", "Morning" },   -- random mode pool
    -- other settings...
}
```

### 3.2 Behaviour of the Two Modes

#### Map‑Fixed Mode (`MODE_TYPE = "fixed_map"`)

- The system gets the current map short name (e.g., `MP_007`).  
- It **randomly** selects a mode name from `MODE_LIST` (e.g., `"Night"`).  
- It builds the preset name: `DU_` + map name + `_` + mode name, e.g. `DU_MP_007_Night`.  
- Then it looks for a corresponding entry in `self.m_Presets` (which must have `require`d the correct file) and enables it if found.  
- **If that preset does not exist (not registered), no visual effect is applied** – the game uses original lighting.

#### Generic Mode (`MODE_TYPE = "generic"`)

- Ignores the map name and directly picks a random mode name from `MODE_LIST`.  
- Builds the preset name: `DU_` + mode name, e.g. `DU_Night`.  
- Enables the corresponding generic preset (must be registered in `self.m_Presets` as e.g. `["Night"] = require("Presets/Night")`).

### 3.3 How to Disable Randomness (Fix a Single Mode)

Simply set `MODE_LIST` to contain only one element, for example:

```lua
MODE_LIST = { "Night" }   -- Always uses Night mode
```

Then both map‑fixed and generic modes will always use `"Night"`.

### 3.4 Configuration Example: Use the Same Preset for All Maps (e.g., all night vision)

```lua
MODE_TYPE = "generic"
MODE_LIST = { "NVG" }   -- or "Night"
```
Make sure `Presets/NVG.lua` or `Presets/Night.lua` exists and its `"Name"` is correct.

---

## 4. System B (Alternative): Per‑Map Fixed Mode (MAPS)

### 4.1 When to Use

You want each map to always use a specific mode, with no randomness. This scheme ignores `MODE_TYPE` and `MODE_LIST`.

### 4.2 Configuration Steps

1. **Copy the backup configuration**  
   Overwrite `Shared\Settings.lua` with the contents of `Shared\SettingsDev.lua` (that file already contains a complete `MAPS` example).

2. **Modify the MAPS table** (in `Settings.lua`)
   ```lua
   DU_CONFIG = {
       -- keep other fields...
       MAPS = {
           MP_001 = "Night",    -- Grand Bazaar uses Night
           MP_007 = "NVG",      -- Caspian Border uses NVG
           MP_017 = "Morning",  -- Noshahr Canals uses Morning
           -- Maps not listed will have no preset enabled
       },
   }
   ```

3. **Enable the MAPS logic** (in `Client\__init.lua`)  
   - Locate the `DarknessClient:OnPresetsLoaded()` function.  
   - Comment out all code of Version A (two modes), uncomment Version B (MAPS mode).  
   - Save the file.

### 4.3 Behaviour of MAPS Mode

- The system reads the `DU_CONFIG.MAPS` table, looks up the current map short name to get the corresponding mode (e.g., `MP_007` → `"NVG"`).  
- Builds the preset name: `DU_` + map name + `_` + mode name, e.g. `DU_MP_007_NVG`.  
- If that preset is registered, it is enabled; otherwise no preset is applied.  
- Maps not listed in `MAPS` also have no preset enabled.

### 4.4 Switching Back to System A

- Restore `Settings.lua` to a version that contains `MODE_TYPE` and `MODE_LIST`.  
- In `Client\__init.lua`: comment out Version B and uncomment Version A.

---

## 5. NVG (Night Vision Goggles) Configuration

All NVG‑related parameters are in `DU_CONFIG.NVG`.

### 5.1 Battery Parameters

```lua
NVG = {
    BATTERY_MAX = 120,           -- Maximum battery (seconds)
    BATTERY_MIN = 10,            -- Minimum battery required to activate
    BATTERY_COOLDOWN = 10,       -- Cooldown seconds after depletion
    FADE_LENGTH_MS = 2000,       -- Fade duration (milliseconds)
}
```

### 5.2 NVG Visual Effects per Mode

`MODE_PRESETS` defines, for each game mode (e.g., `"Night"`), which VEManager preset names are activated when you press `7`. These preset files are typically placed in `Presets/Special/`.

Default configuration:
```lua
MODE_PRESETS = {
    Night = {
        Soldier = "DU_FLIR",              -- Infantry NVG effect
        Vehicle = "DU_Vehicle_NVG",       -- NVG effect inside a vehicle
        Vehicle_Thermal = "DU_Vehicle_Thermal",   -- Thermal effect when spawning inside a vehicle
    },
    NVG = { ... },    -- same as above
    Morning = { ... },
}
```

**Note:** These preset names (e.g., `DU_FLIR`) must match the `"Name"` field inside the corresponding file (e.g., `Presets/Special/FLIR.lua`). You can change them freely, but ensure the files exist and are registered.

### 5.3 Adding NVG Mapping for a New Mode

If you added an `Evening` mode, add an entry to `NVG.MODE_PRESETS`:
```lua
Evening = {
    Soldier = "DU_Evening_FLIR",
    Vehicle = "DU_Evening_Vehicle_NVG",
    Vehicle_Thermal = "DU_Evening_Vehicle_Thermal",
}
```
Then create the corresponding preset files (e.g., `Presets/Special/Evening_FLIR.lua`) with `"Name"` set to `"DU_Evening_FLIR"`, etc.

---

## 6. Notification Features (Yell)

- On respawn, a **yell** message shows the currently enabled preset name (e.g., `Current preset: DU_MP_007_Night`).  
- When activating NVG, if battery is sufficient you will be notified: `"Battery sufficient"`; if battery drops below 10%, you will see `"Battery below 10%, use sparingly"`.  
- Code locations:  
  - Client: `Client\__init.lua` → `DarknessClient:OnYellPreset`  
  - Server: `Server\__init.lua` → `DarknessServer:OnBatteryStatus` and `OnPlayerRespawn`

---

## 7. Other Configuration Options

- **Vehicle headlights**: `DU_CONFIG.VEHICLES.USE_VEHICLE_LIGHTS = true/false`  
- **NVG master switch**: `DU_CONFIG.GENERAL.USE_NIGHTVISION_GADGET = true/false`  
- **Logging**: `DU_CONFIG.LOGGER_ENABLED` and `LOGGER_PRINT_ALL`

---

## 8. Frequently Asked Questions (FAQ)

**Q1: I modified `Settings.lua` but it doesn't take effect.**  
A: Make sure the server has been fully restarted and that the file is saved as UTF‑8 without BOM.

**Q2: In map‑fixed mode, some maps don't enable any preset.**  
A: Check whether you have created the corresponding preset file (e.g., `Presets/Vanilla/MP_007/Night.lua`) and correctly registered `MP_007_Night` in `self.m_Presets` inside `Client\__init.lua`. Also ensure the file's `"Name"` field is `DU_MP_007_Night`.

**Q3: In generic mode, why doesn't `DU_Night` work?**  
A: Make sure `Presets/Night.lua` exists and its internal `"Name"` is `"DU_Night"`. Also check that `self.m_Presets["Night"]` is properly `require`d.

**Q4: How can I make NVG use completely different visual effects for a certain mode?**  
A: Modify the corresponding preset names in `DU_CONFIG.NVG.MODE_PRESETS`, then create or edit the preset files in `Presets/Special/` to have matching `"Name"` fields.

**Q5: In the MAPS scheme, can I assign the same mode to different maps?**  
A: Yes. For example: `MAPS = { MP_001 = "Night", MP_007 = "Night" }`.

---

## 9. Dependencies & Compatibility

- Requires **VEManager** 0.5.7 or higher.  
- Compatible with the `fun‑bots` mod.  
- Fixes UI issues for official client versions 20079 and above.

---

**Version History**  
- Refactored configuration system: all behaviour controlled by `Shared/Settings.lua`.  
- Added map‑fixed mode / generic mode + random pool (System A).  
- Retained per‑map MAPS mode (System B) as an alternative.  
- NVG battery and visual effects are fully configurable.
