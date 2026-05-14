# Darkness Unleashed

> **A true darkness mod – and so much more**  
> Now featuring fully customisable settings, random mode switching, and a complete night vision system. The new features and configuration system are inspired by *Insurgency: Sandstorm*.

## What is this mod?

**Darkness Unleashed** transforms the world of *Battlefield 3*:  
Maps that were once bright daylight can now become genuine night, dusk, dawn, or anything in between.  
You no longer see the same lighting over and over – instead, you experience:

- 🌙 **True darkness** – you'll need flashlights and night vision to fight
- 🌅 **Day‑to‑night transitions** – morning mist, warm evening light
- 🔦 **Enhanced light sources** – vehicle headlights, searchlights, and weapon flashlights all work and have been added where missing
- 🥽 **Complete night vision system** – battery, recharging, cooldown – as realistic as in *Insurgency: Sandstorm*
- 🎲 **Random mode selection** – each map can automatically cycle through different lighting presets

The core functionality was originally built by **Lesley and IllustrisJack**.  
Later, **AugustaKit** extended it with a **fully configurable system**, **random modes**, a **night vision battery system**, and many other new features.

> 💡 **Inspiration**: The night vision design and battery mechanics are based on the *Nightfall* update of **Insurgency: Sandstorm**. NV is not just a green filter – it’s a tactical tool that needs to be managed.

## ✨ Key Features

### 🌓 Brand New Visual Experience

- **4 base presets**: Night, NVG (night vision style), Morning, Evening
- **Easily extendable** – you can add your own presets like Noon, Sunset, etc.
- **Global + per‑map control** – brightness, fog, contrast, colour tint can be tweaked individually
- **Enhanced specular reflections** and dynamic lighting

### 🚗 Vehicle Lighting System

- Headlights / searchlights have been added to **all vehicles** (tanks, helicopters, Humvees, etc.) and they work properly
- Supports **light beams + flood lights + lens flares**
- Drivers can toggle lights with **`T`**

### 🔦 Weapon Flashlight Enhancement

- Flashlight **radius / intensity / cone angle / shadows** completely rebalanced
- Realistic beam model + cast shadows + lens flare
- Muzzle flash, tracers, sparks and other particle effects enhanced and now emit point lights

### 🥽 Complete Night Vision System (NVG)

- Toggle with **`7`**
- **Battery system** – drains on foot, recharges inside vehicles (works in air vehicles too)
- Low‑battery warning (<10%) + cooldown after depletion
- **Three visual modes** – infantry / inside vehicle / vehicle thermal, each independently configurable
- Fade‑in / fade‑out effect with sound when toggling

### 🎲 Flexible Mode Selection

| Mode Type | Behaviour | Use Case |
|-----------|-----------|----------|
| **Map‑fixed mode** (`fixed_map`) | Each map uses its own dedicated preset, with optional random selection from a list | You want independent lighting styles per map, with some randomness |
| **Generic mode** (`generic`) | All maps share the same preset (still supports random selection) | A unified server style (e.g., all‑night) |
| **MAPS alternative** | Manually assign one fixed preset per map, no randomness | For old‑school users who want absolute control |

> The random list and all switches are configured in a single line inside `Settings.lua`.

### 🛠 Other Visual Enhancements

- **Improved tracer visibility** + point lights attached
- **Reduced sun glare / no lens flare** (kept only for flashlights)
- **Enhanced smoke, dust, explosion debris particles**
- **Fixed UI issues** for VU 20079+

## 📁 Installation & File Structure

### 1️⃣ Download & Place

| Step | Action |
|------|--------|
| 1 | Download the mod (the `Darkness-Unleashed` folder) |
| 2 | Put it into your VU server’s `Mods` directory |
| 3 | Add a line `Darkness-Unleashed` to your `ModList.txt` |
| 4 | (Optional) Edit `Settings.lua` according to the configuration guide |
| 5 | Start your server and enjoy the darkness! |

### 2️⃣ Key File Structure (paths you need to know)

```
Darkness-Unleashed/
├── ext/
│   ├── Shared/
│   │   ├── Settings.lua          ← ★ All configuration lives here (core!)
│   │   └── SettingsDev.lua       ← MAPS backup configuration template
│   ├── Client/
│   │   ├── __init__.lua          ← Main logic (usually no need to touch)
│   │   ├── Presets/              ← Preset files directory
│   │   │   ├── Vanilla/          ← Map‑fixed presets (one subfolder per map)
│   │   │   │   ├── MP_001/
│   │   │   │   ├── MP_003/
│   │   │   │   └── ...
│   │   │   ├── Special/          ← NVG visual presets
│   │   │   ├── Night.lua
│   │   │   ├── NVG.lua
│   │   │   └── Morning.lua
│   │   └── Systems/              ← NVG, vehicle lights, UI subsystems
│   └── Server/
│       └── __init__.lua          ← Server‑side sync logic
└── ModList.txt                   ← Your mod list
```

### 3️⃣ Preset File Naming Rules (very important!)

Inside each preset file (e.g., `Night.lua`) there is a **`"Name"` field**. This field is what VEManager actually recognises – **not the filename**.

| Preset Type | Path | Example `"Name"` inside file |
|-------------|------|------------------------------|
| Generic mode preset | `Presets/Night.lua` | `"DU_Night"` |
| Map‑fixed preset | `Presets/Vanilla/MP_007/Night.lua` | `"DU_MP_007_Night"` |
| NVG infantry preset | `Presets/Special/FLIR.lua` | `"DU_FLIR"` |
| NVG vehicle preset | `Presets/Special/Vehicle_NVG.lua` | `"DU_Vehicle_NVG"` |

> 💡 In short: **the filename is only used for `require`; the `"Name"` field is the real name used in‑game.**

## ⚙️ Configuration Guide (`Settings.lua`)

All configurable options are inside the `DU_CONFIG` table.

### 🔧 Basic Mode Selection

```lua
DU_CONFIG = {
    MODE_TYPE = "fixed_map",   -- "fixed_map" or "generic"
    MODE_LIST = { "Night", "NVG", "Morning" },  -- random pool
}
```

**Explanation**:
- `MODE_TYPE = "fixed_map"` enables map‑fixed mode (each map uses its own preset). The system gets the current map short name (e.g., `MP_007`), randomly picks a mode from `MODE_LIST` (e.g., `"Night"`), then tries to enable the preset `DU_MP_007_Night`. If that preset does not exist, no visual effect is applied.
- `MODE_TYPE = "generic"` enables generic mode. All maps share the same preset. The system randomly picks a mode from `MODE_LIST` (e.g., `"Night"`) and enables the preset `DU_Night`.
- If `MODE_LIST` contains only one element (e.g., `{ "Night" }`), there is no randomness – that mode is always used.

### 🥽 Night Vision Configuration

```lua
NVG = {
    BATTERY_MAX = 120,          -- Maximum battery (seconds)
    BATTERY_MIN = 10,           -- Minimum battery required to activate
    BATTERY_COOLDOWN = 10,      -- Cooldown after depletion (seconds)
    FADE_LENGTH_MS = 2000,      -- Fade duration (milliseconds)
    MODE_PRESETS = {
        Night = {
            Soldier = "DU_FLIR",
            Vehicle = "DU_Vehicle_NVG",
            Vehicle_Thermal = "DU_Vehicle_Thermal",
        },
        NVG = { ... },
        Morning = { ... },
    },
}
```

**Explanation**:
- `BATTERY_MAX`: How many seconds the NVG can run when fully charged.
- `BATTERY_MIN`: The battery level must be at least this value to activate NVG when pressing `7`.
- `BATTERY_COOLDOWN`: Seconds to wait after battery is completely empty before recharging starts.
- `FADE_LENGTH_MS`: Fade duration when toggling NVG (milliseconds).
- `MODE_PRESETS`: For each game mode (e.g., `Night`), defines which VEManager preset names are used when NVG is active.  
  `Soldier` – infantry night vision, `Vehicle` – inside a vehicle, `Vehicle_Thermal` – when spawning inside a vehicle (usually brighter). These preset names must match the `"Name"` field inside the actual preset files located in `Presets/Special/`.

### 🌍 MAPS – Per‑Map Fixed Mode (Alternative)

If you prefer to manually assign which preset each map uses (no randomness), use the **MAPS** scheme.

**Steps**:
1. **Overwrite** `Settings.lua` with the contents of `SettingsDev.lua`.
2. In `Client/__init.lua`, locate the `OnPresetsLoaded` function. You will see two code blocks:
   - Version A (two‑mode system): currently active by default.
   - Version B (MAPS mode): commented out.
3. **Comment out Version A**, **uncomment Version B** (remove `--[[` and `--]]`).
4. Save the file.

**Configuration example** (inside `Settings.lua`):
```lua
MAPS = {
    MP_001 = "Night",
    MP_007 = "NVG",
    MP_017 = "Morning",
    -- Maps not listed will have no preset
}
```

**Behaviour**: The system looks up the current map (e.g., `MP_007`), gets the assigned mode (`"NVG"`), then tries to enable the preset `DU_MP_007_NVG`. If the preset does not exist, no visual effect is applied.

> ✅ The two systems are completely independent and you can switch between them at any time.

## 🖼️ Preset Preview (original screenshots)

The following are in‑game screenshots showing the visual differences:

### 🌙 Preset Night

![Night 1](https://cdn.discordapp.com/attachments/799963847842070568/799987928565678120/unknown.png)
![Night 2](https://cdn.discordapp.com/attachments/799963847842070568/800000645703794688/unknown.png)
![Night 3](https://cdn.discordapp.com/attachments/799963847842070568/800001895249739786/unknown.png)
![Night 4](https://cdn.discordapp.com/attachments/799963847842070568/800075716334845952/unknown.png)
![Night 5](https://cdn.discordapp.com/attachments/799963847842070568/800075843278995496/unknown.png)

### ☀️ Preset Bright Night

![Bright Night 1](https://cdn.discordapp.com/attachments/799963847842070568/800027108066983986/unknown.png)
![Bright Night 2](https://cdn.discordapp.com/attachments/799963847842070568/800027233296187392/unknown.png)

### 🌅 Preset Morning

![Morning 1](https://cdn.discordapp.com/attachments/799963847842070568/800083453579231292/Client_Screenshot_2021.01.16_-_20.23.56.55.png)
![Morning 2](https://cdn.discordapp.com/attachments/799963847842070568/800092188288876554/Client_Screenshot_2021.01.16_-_20.58.05.46.png)
![Morning 3](https://cdn.discordapp.com/attachments/799963847842070568/800094068323123210/Client_Screenshot_2021.01.16_-_21.07.41.64.png)
![Morning 4](https://cdn.discordapp.com/attachments/799963847842070568/800094333159997470/Client_Screenshot_2021.01.16_-_21.09.03.09.png)

### 🌆 Preset Evening

![Evening 1](https://cdn.discordapp.com/attachments/799963847842070568/799963940088053760/unknown.png)
![Evening 2](https://cdn.discordapp.com/attachments/799963847842070568/799977404390965278/unknown.png)
![Evening 3](https://cdn.discordapp.com/attachments/799963847842070568/799972039539949598/unknown.png)
![Evening 4](https://cdn.discordapp.com/attachments/799963847842070568/799971215510601728/unknown.png)

## 🧪 Compatibility & Dependencies

| Item | Description |
|------|-------------|
| **VEManager** | Requires version `0.5.7` or higher |
| **fun‑bots** | ✅ Fully compatible |
| **VU version** | Latest stable recommended; if you need VEEditor, downgrade to `20079` |
| **UI** | Fixed UI issues for versions 20079+ |

## 🛠 Advanced: Using VEEditor to Edit Presets

If you want to **fine‑tune or create new visual presets** (e.g., change brightness, fog, colour grading), you can use **VEEditor**.

### 🔗 What is VEEditor?

> VEEditor is a visual editor for creating and modifying VE presets that VEManager can load.  
> GitHub: [https://github.com/BF3RM/VEEditor](https://github.com/BF3RM/VEEditor)

It allows you to **adjust lighting, fog, colour correction, and other parameters in real time** inside the game, then save them directly as `.lua` preset files.

### ⚠️ Important Compatibility Note

Due to VU updates, **VEEditor may not work on the latest VU version**.  
If you need to edit presets, **it is recommended to downgrade your VU server/client to version `20079`** – VEEditor works correctly with that version. See VU community guides for downgrade instructions.

> 📌 The built‑in presets (Night, NVG, Morning, etc.) are already well configured. Most users **do not need to use VEEditor**.

## 📝 Version History

- **v1.2.0 (current)** – Complete configuration system refactor: two‑mode + random pool, fully configurable NVG, MAPS alternative, vehicle lights, enhanced Yell notifications, clarified preset naming
- **v1.1.0** – Previous version (initial config migration)
- **v1.0.0** – Original version (Lesley & IllustrisJack)

## 🙏 Credits & Links

- **Original authors**: Lesley and IllustrisJack
- **Configuration system extension & NVG overhaul**: AugustaKit
- **Inspiration**: *Insurgency: Sandstorm* – Nightfall update

### 🔗 Related Links

- GitHub repository: [https://github.com/VU-PINK/Darkness-Unleashed](https://github.com/VU-PINK/Darkness-Unleashed)
- VU community thread: [https://community.veniceunleashed.net/t/darkness-unleashed-...](https://community.veniceunleashed.net/t/darkness-unleashed-a-true-dark-night-mod-and-more-v1-0-0-v1-0-9-in-testing/2298)
- VEEditor (preset editor): [https://github.com/BF3RM/VEEditor](https://github.com/BF3RM/VEEditor)
- Original mod repository (IllustrisJack): [https://github.com/IllustrisJack/Darkness-Unleashed](https://github.com/IllustrisJack/Darkness-Unleashed)

---

> 🖤 **Enjoy the darkness.**
> 
> If you have any questions, suggestions, or want to contribute, please open an Issue on GitHub or reach out via the community thread / Discord.
