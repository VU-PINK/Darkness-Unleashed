-- Requires
---@type UI
local m_UI = require("Systems/UI")
---@type MapVEManager
local m_MapVEManager = require("Systems/MapVEManager")
---@type VehicleManager
local m_VehicleManager = require("Systems/VehicleManager")
---@type NVG
local m_NVG = require("Systems/NVG")

require("Systems/Patches")

-- Logger
local m_Logger = Logger("DarknessClient", true)

---@class DarknessClient
---@overload fun(): DarknessClient
DarknessClient = class("DarknessClient")

function DarknessClient:__init()
    self:RegisterVars()
    self:RegisterEvents()
end

function DarknessClient:RegisterVars()
    self.m_Presets = {
        ["Night"] = require("Presets/Night"),
        ["NVG"] = require("Presets/NVG"),

        ["MP_001_Night"] = require("Presets/Vanilla/MP_001/Night"),
        ["MP_003_Night"] = require("Presets/Vanilla/MP_003/Night"),
        ["MP_007_Night"] = require("Presets/Vanilla/MP_007/Night"),
        ["MP_011_Night"] = require("Presets/Vanilla/MP_011/Night"),
        ["MP_012_Night"] = require("Presets/Vanilla/MP_012/Night"),
        ["MP_013_Night"] = require("Presets/Vanilla/MP_013/Night"),
        ["MP_017_Night"] = require("Presets/Vanilla/MP_017/Night"),
        ["MP_018_Night"] = require("Presets/Vanilla/MP_018/Night"),
        ["MP_Subway_Night"] = require("Presets/Vanilla/MP_Subway/Night"),

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

    self.m_Prefix = "DU_"
    self.m_PlayerName = PlayerManager:GetLocalPlayer().name
end

function DarknessClient:RegisterEvents()
    Events:Subscribe("Level:Loaded", self, self.OnLevelLoaded)
    Events:Subscribe("Level:LoadResources", self, self.OnLoadResources)
    Events:Subscribe("Level:Destroy", self, self.OnLevelDestroyed)
    Events:Subscribe('Level:RegisterEntityResources', self, self.OnEntityRegister)
    Events:Subscribe("Engine:Update", self, self.OnEngineUpdate)
    Events:Subscribe("Client:UpdateInput", self, self.OnUpdateInput)
    Events:Subscribe('Player:Killed', self, self.OnPlayerKilled)
    Events:Subscribe("VEManager:PresetsLoaded", self, self.OnPresetsLoaded)
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

        if string.find(s_Name, s_LevelName) or l_Name == "Night" or l_Name == "NVG" then
            m_Logger:Write("Registering Preset: " .. s_Name)
            Events:Dispatch("VEManager:RegisterPreset", s_Name, l_Preset)
        end
    end
end

---@param p_LevelName string
---@param p_GameMode string
---@param p_IsDedicatedServer boolean
function DarknessClient:OnLoadResources(p_LevelName, p_GameMode, p_IsDedicatedServer)
    -- Self
    self:RegisterPresets(p_LevelName, p_GameMode, p_IsDedicatedServer)
    -- Distribute
    m_MapVEManager:OnLoadResources(p_LevelName, p_GameMode, p_IsDedicatedServer)
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
    m_UI:OnPlayerRespawn(p_Player)
    m_NVG:Deactivate(m_MapVEManager.m_LoadedPreset[1])
end

---@param p_Player Player
function DarknessClient:OnPlayerKilled(p_Player)
    -- Distribute
    m_NVG:Deactivate(m_MapVEManager.m_LoadedPreset[1])
end

---@param p_LevelData LevelData
function DarknessClient:OnEntityRegister(p_LevelData)
    -- Distribute
    m_VehicleManager:OnEntityRegister(p_LevelData)
end

---@param p_DeltaTime integer
function DarknessClient:OnUpdateInput(p_DeltaTime)
    -- Self
    self:NVGPlayerInput(p_DeltaTime)
end

function DarknessClient:OnPresetsLoaded()
    -- Distribute
    m_MapVEManager:OnPresetsLoaded()
end

-- Night Vision Gadget
---@param p_DeltaTime integer
function DarknessClient:NVGPlayerInput(p_DeltaTime)
    -- Night Vision Goggles
    if InputManager:WentKeyDown(8) then
        m_Logger:Write('NVG Key detected!')

        if CONFIG.GENERAL.USE_NIGHTVISION_GADGET and UI.m_HudActive then

            if not m_NVG.m_Activated then
                m_Logger:Write('Calling NVG:Activate()')
                m_NVG:Activate(m_MapVEManager.m_LoadedPreset[1])
			else
                m_Logger:Write('Calling NVG:Deactivate()')
                m_NVG:Deactivate(m_MapVEManager.m_LoadedPreset[1])
            end
        else
            m_Logger:Write('Failed to enable NVG. useNightVisionGadget = ' .. tostring(CONFIG.GENERAL.USE_NIGHTVISION_GADGET) .. ' | isHud = ' .. tostring(m_UI.m_HudActive) .. ' | isKilled = ' .. tostring(m_UI.m_PlayerDead))
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

local s_ElapsedTime = 0
local s_LastSecond = 0
---@param p_DeltaTime integer
---@param p_SimulationDeltaTime integer
function DarknessClient:OnEngineUpdate(p_DeltaTime, p_SimulationDeltaTime)
    s_ElapsedTime = s_ElapsedTime + p_DeltaTime

    if s_ElapsedTime >= s_LastSecond + 1 then
        s_LastSecond = s_LastSecond + 1

        if m_NVG.m_Activated and CONFIG.GENERAL.USE_NIGHTVISION_GADGET then
            m_NVG:Depleting(s_ElapsedTime)
        elseif m_NVG.m_BatteryLifeCurrent ~= m_NVG.m_BatteryLifeMax and CONFIG.GENERAL.USE_NIGHTVISION_GADGET then
            m_NVG:Recharging(s_ElapsedTime)
        end
    end
end

DarknessClient = DarknessClient()

return DarknessClient






