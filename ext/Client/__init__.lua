-- Requires
---@type UI
local m_UI = require("Systems/UI")
---@type MapVEManager
local m_MapVEManager = require("Systems/MapVEManager")
---@type VehicleManager
local m_VehicleManager = require("Systems/VehicleManager")
local m_ClientVehicleController = require("Systems/ClientVehicleController")

---@type NVG
local m_NVG = require("Systems/NVG")

require("Systems/Patches")

-- Logger
local m_Logger = DULogger("DarknessClient", true)

---@class DarknessClient
---@overload fun(): DarknessClient
DarknessClient = class("DarknessClient")

function DarknessClient:__init()
    self:RegisterVars()
    self:RegisterEvents()
end

-- Required files for changing the game environment
function DarknessClient:RegisterVars()
    self.m_Presets = {
        ["Night"] = require("Presets/Night"),
        ["NVG"] = require("Presets/Special/NVG"),
        ["FLIR"] = require("Presets/Special/FLIR"),
        ["Vehicle_NVG"] = require("Presets/Special/Vehicle_NVG"),
        ["Vehicle_Thermal"] = require("Presets/Special/Vehicle_Thermal"),

        ["MP_001_Night"] = require("Presets/Vanilla/MP_001/Night"),
        ["MP_003_Night"] = require("Presets/Vanilla/MP_003/Night"),
        ["MP_007_Night"] = require("Presets/Vanilla/MP_007/Night"),
        ["MP_007_Morning"] = require("Presets/Vanilla/MP_007/Morning"),
        ["MP_011_Night"] = require("Presets/Vanilla/MP_011/Night"),
        ["MP_012_Night"] = require("Presets/Vanilla/MP_012/Night"),
        ["MP_013_Night"] = require("Presets/Vanilla/MP_013/Night"),
        ["MP_017_Night"] = require("Presets/Vanilla/MP_017/Night"),
        ["MP_018_Night"] = require("Presets/Vanilla/MP_018/Night"),
        ["MP_Subway_Night"] = require("Presets/Vanilla/MP_Subway/Night"),
        ["XP1_001_Night"] = require("Presets/Vanilla/XP1_001/Night"),
        ["XP1_002_Night"] = require("Presets/Vanilla/XP1_002/Night"),
        ["XP1_003_Night"] = require("Presets/Vanilla/XP1_003/Night"),

        ["MP_001_NVG"] = require("Presets/Vanilla/MP_001/NVG"),
        ["MP_003_NVG"] = require("Presets/Vanilla/MP_003/NVG"),
        ["MP_007_NVG"] = require("Presets/Vanilla/MP_007/NVG"),
        ["MP_011_NVG"] = require("Presets/Vanilla/MP_011/NVG"),
        ["MP_012_NVG"] = require("Presets/Vanilla/MP_012/NVG"),
        ["MP_013_NVG"] = require("Presets/Vanilla/MP_013/NVG"),
        ["MP_017_NVG"] = require("Presets/Vanilla/MP_017/NVG"),
        ["MP_018_NVG"] = require("Presets/Vanilla/MP_018/NVG"),
        ["MP_Subway_NVG"] = require("Presets/Vanilla/MP_Subway/NVG"),
    }

    self.m_Prefix = "DU_" -- Means if you add a new preset map, the name must start with DU_, otherwise it won't be recognized
end

function DarknessClient:RegisterEvents()
    Events:Subscribe("Level:Loaded", self, self.OnLevelLoaded)
    Events:Subscribe("Level:LoadResources", self, self.OnLoadResources)
    Events:Subscribe("Level:Destroy", self, self.OnLevelDestroyed)
    -- Vehicle modification runs on server only - client does NOT subscribe to Level:RegisterEntityResources
    Events:Subscribe("Engine:Update", self, self.OnEngineUpdate)
    Events:Subscribe("Player:UpdateInput", self, self.OnUpdateInput)
    Events:Subscribe('Player:Killed', self, self.OnPlayerKilled)
    Events:Subscribe("VEManager:PresetsLoaded", self, self.OnPresetsLoaded)
    Events:Subscribe("Player:Respawn", self, self.OnPlayerRespawn)
    NetEvents:Subscribe("Darkness:YellPreset", self, self.OnYellPreset)
end



---@param p_LevelName string
---@param p_GameMode string
---@param p_IsDedicatedServer boolean
function DarknessClient:RegisterPresets(p_LevelName, p_GameMode, p_IsDedicatedServer)
    m_Logger:Write("Registering Presets")
    local s_LevelName = p_LevelName:match('/[^/]+'):sub(2)
    local s_Prefix = self.m_Prefix

    for l_Name, l_Preset in pairs(self.m_Presets) do
        local s_Name = s_Prefix .. l_Name

        if string.find(s_Name, s_LevelName) 
           or l_Name == "Night"
           or l_Name == "NVG"
           or l_Name == "Morning"
           or l_Name == "Evening"
           or l_Name == "Noon"
           or l_Name == "FLIR"
           or l_Name == "Vehicle_NVG"
           or l_Name == "Vehicle_Thermal" then

            m_Logger:Write("Registering Preset: " .. s_Name)
            Events:Dispatch("VEManager:RegisterPreset", s_Name, l_Preset)
        end
    end

  -- Generic mode fallback: if Night/NVG are not in m_Presets, force register generic paths
  --[[if not self.m_Presets["Night"] then
         self:RegisterPreset(s_Prefix .. "Night", "Night")  -- root directory Presets/Night.lua
     end
      if not self.m_Presets["NVG"] then
         self:RegisterPreset(s_Prefix .. "NVG", "Special/NVG") -- Special/NVG.lua
    end]]
end

---@param p_LevelName string
---@param p_GameMode string
---@param p_IsDedicatedServer boolean
function DarknessClient:OnLoadResources(p_LevelName, p_GameMode, p_IsDedicatedServer)
    -- Self
    self:RegisterPresets(p_LevelName, p_GameMode, p_IsDedicatedServer)
    -- Distribute
    -- m_MapVEManager:OnLoadResources(p_LevelName, p_GameMode, p_IsDedicatedServer)
end

---@param p_LevelName string
---@param p_GameMode string
function DarknessClient:OnLevelLoaded(p_LevelName, p_GameMode)

end

---@param p_LevelName string
---@param p_GameMode string
function DarknessClient:OnLevelDestroyed(p_LevelName, p_GameMode)

end

---@param p_Player Player
function DarknessClient:OnPlayerRespawn(p_Player)
    -- Distribute
    local s_localPlayer = PlayerManager:GetLocalPlayer()
    if s_localPlayer == p_Player then
        m_UI:OnPlayerRespawn()
    end
end

---@param p_Player Player
function DarknessClient:OnPlayerKilled(p_Player)
    -- Distribute
    local s_localPlayer = PlayerManager:GetLocalPlayer()
    if s_localPlayer == p_Player then
        m_NVG:Deactivate()
    end
end

-- Removed: OnEntityRegister - vehicle modification now runs on server only

---@param p_DeltaTime integer
function DarknessClient:OnUpdateInput(p_DeltaTime)
    -- Self
    local s_localPlayer = PlayerManager:GetLocalPlayer()
    if s_localPlayer ~= nil and s_localPlayer.soldier ~= nil and s_localPlayer.alive then
        self:NVGPlayerInput(p_DeltaTime)
    end
end

-- ===================== The following code blocks are mutually exclusive. Manually comment/uncomment. =====================

-- ========== Version A: Two Modes (fixed_map / generic + random list) ==========
function DarknessClient:OnPresetsLoaded()
    -- Initialize random seed
    local now = os.time()
    local micro = math.floor((SharedUtils:GetTimeMS() or 0) % 1000)
    math.randomseed(now + micro)

    -- Get short map name, e.g. MP_007
    local currentMap = SharedUtils:GetLevelName():match('/[^/]+'):sub(2)

    -- Read configuration (use defaults if DU_CONFIG is missing or fields are absent)
    local modeType = DU_CONFIG.MODE_TYPE or "fixed_map"
    local modeList = DU_CONFIG.MODE_LIST or { "Night", "NVG", "Morning" }

    -- Ensure mode list is not empty
    if #modeList == 0 then
        m_Logger:Write("Error: MODE_LIST is empty, cannot select mode")
        return
    end

    -- Randomly select a mode from the list
    local selected = modeList[math.random(#modeList)]

    -- Save current mode and notify NVG module
    self.m_CurrentMode = selected
    m_NVG:SetCurrentMode(selected)

    local presetName = nil

    if modeType == "generic" then
        -- Generic mode: directly use prefix + mode name, e.g. DU_Night
        presetName = self.m_Prefix .. selected
        m_Logger:Write("Generic mode, selected preset: " .. presetName)
    else
        -- Map-fixed mode: try to use map name + mode name, e.g. DU_MP_007_Night
        local presetKey = currentMap .. "_" .. selected
        if self.m_Presets[presetKey] then
            presetName = self.m_Prefix .. presetKey
            m_Logger:Write("Map-fixed mode, map " .. currentMap .. " has dedicated preset: " .. presetName)
        else
            -- No dedicated preset for this map, do nothing (don't enable any preset)
            m_Logger:Write("Map-fixed mode, map " .. currentMap .. " has no dedicated preset: " .. presetKey .. ", aborting enable")
            return
        end
    end

    -- Enable preset and sync to server
    if presetName then
        Events:Dispatch("VEManager:EnablePreset", presetName)
        NetEvents:Send("Darkness:SyncPresetName", presetName)
    end
end
-- ========== Version A End ==========



-- ========== Version B: MAPS mode (per-map assignment using DU_CONFIG.MAPS table) ==========
--[[function DarknessClient:OnPresetsLoaded()
    -- Get short map name
    local currentMap = SharedUtils:GetLevelName():match('/[^/]+'):sub(2)

    -- Read MAPS configuration table
    local maps = DU_CONFIG.MAPS
    if not maps then
        m_Logger:Write("Error: DU_CONFIG.MAPS does not exist, cannot use MAPS mode")
        return
    end

    -- Find the mode corresponding to the current map (e.g., maps["MP_007"] returns "Night")
    local selected = maps[currentMap]
    if not selected then
        m_Logger:Write("MAPS mode: Map " .. currentMap .. " has no assigned mode, aborting enable")
        return
    end

    -- Save current mode and notify NVG module
    self.m_CurrentMode = selected
    m_NVG:SetCurrentMode(selected)

    -- Build map-fixed preset name: DU_MP_007_Night
    local presetKey = currentMap .. "_" .. selected
    local presetName = nil

    if self.m_Presets[presetKey] then
        presetName = self.m_Prefix .. presetKey
        m_Logger:Write("MAPS mode: Map " .. currentMap .. " enabling preset: " .. presetName)
    else
        m_Logger:Write("MAPS mode: Map " .. currentMap .. " has mode " .. selected .. " but preset " .. presetKey .. " does not exist, aborting enable")
        return
    end

    -- Enable preset and sync to server
    Events:Dispatch("VEManager:EnablePreset", presetName)
    NetEvents:Send("Darkness:SyncPresetName", presetName)
end
-- ========== Version B End ==========
--]]

-- Method to get current mode
function DarknessClient:GetCurrentMode()
    return self.m_CurrentMode -- Do not assume default; must be assigned in OnPresetsLoaded()
end


-- Night Vision Gadget
---@param p_DeltaTime integer
function DarknessClient:NVGPlayerInput(p_DeltaTime)
    -- Night Vision Goggles
    if InputManager:WentKeyDown(InputDeviceKeys.IDK_7) then
        m_Logger:Write('NVG Key detected!')

        if DU_CONFIG.GENERAL.USE_NIGHTVISION_GADGET and m_UI.m_HudActive then
            if not m_NVG.m_Activated then
                m_Logger:Write('Calling NVG:Activate()')
                m_NVG:Activate()
            else
                m_Logger:Write('Calling NVG:Deactivate()')
                m_NVG:Deactivate()
            end
        else
            m_Logger:Write('Failed to enable NVG. useNightVisionGadget = ' ..
                tostring(DU_CONFIG.GENERAL.USE_NIGHTVISION_GADGET) ..
                ' | isHud = ' .. tostring(m_UI.m_HudActive) .. ' | isKilled = ' .. tostring(m_UI.m_PlayerDead))
        end
    end

    --[[m_NVG.m_AnimationValue = MathUtils:Lerp(0, 2, m_NVG.m_AnimationT)
    if m_NVG.m_Transitioning then
        m_NVG.m_AnimationT = m_NVG.m_AnimationT + (p_DeltaTime / 1)
        Events:Dispatch("VEManager:SetSingleValue", "DU_" .. m_MapVEManager.m_LoadedPreset[1] .. "_NVG", "vignette", "exponent", m_NVG.m_AnimationValue)

        if m_NVG.m_AnimationValue >= 2 then
            m_NVG.m_Transitioning = false
            m_NVG.m_AnimationT = 0
        end
    end]]
end




--[[s_LastSecond essentially records the last execution second
When the condition is met (total time >= last execution time + 1 second), the depletion or recharge logic is executed

p_DeltaTime = real time interval between this frame and the previous frame (seconds)
s_ElapsedTime = total elapsed time (seconds)
if s_ElapsedTime >= s_LastSecond + 1 then
→ The +1 here means the depletion/recharge logic executes every 1 second
→ That is what we call loop frequency = 1Hz
Each time the condition is satisfied:
If NVG is on → m_NVG:Depleting(s_ElapsedTime) (deplete 1 point)
If NVG is off and not fully charged → m_NVG:Recharging(s_ElapsedTime) (recharge 1 point)]]

local s_ElapsedTime = 0
local s_LastSecond = 0
---@param p_DeltaTime integer
---@param p_SimulationDeltaTime integer
function DarknessClient:OnEngineUpdate(p_DeltaTime, p_SimulationDeltaTime)
    s_ElapsedTime = s_ElapsedTime + p_DeltaTime

    if s_ElapsedTime >= s_LastSecond + 1 then
        s_LastSecond = s_LastSecond + 1
        if DU_CONFIG.GENERAL.USE_NIGHTVISION_GADGET then
            if m_NVG.m_Activated then
                m_NVG:Depleting(s_ElapsedTime)
            elseif not m_NVG.m_Activated and m_NVG.m_BatteryLifeCurrent ~= m_NVG.m_BatteryLifeMax then
                m_NVG:Recharging(s_ElapsedTime)
            end
        end
    end
end

-- Receive preset name from server and display
function DarknessClient:OnYellPreset(p_PresetName)
    m_Logger:Write("Received preset message: " .. tostring(p_PresetName))
    ChatManager:Yell("Current preset: " .. tostring(p_PresetName), 5.0)
end

DarknessClient = DarknessClient()

return DarknessClient