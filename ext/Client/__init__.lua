-- Requires
require("Systems/UI")
require("Systems/MapVEManager")
require("Systems/VehicleManager")
require("Systems/NVG")
require("Systems/Patches")

-- Logger
local m_Logger = Logger("DarknessClient", false)

-- Class
class("DarknessClient")

function DarknessClient:__init()
    self:RegisterVars()
    self:RegisterEvents()
end

function DarknessClient:RegisterVars()
    self.m_Presets = {
        Night = require("Presets/Night"),
        NVG = require("Presets/NVG"),
        MP_001_Night = require("Presets/Vanilla/MP_001/Night")
    }

    self.m_PlayerName = PlayerManager:GetLocalPlayer().name
    self.m_Prefix = "DU_"
end

function DarknessClient:RegisterEvents()
    Events:Subscribe("Level:Loaded", self, self.OnLevelLoaded)
    Events:Subscribe("Level:LoadResources", self, self.OnLoadResources)
    Events:Subscribe("Level:Destroy", self, self.OnLevelDestroyed)
    Events:Subscribe('Level:RegisterEntityResources', self, self.OnEntityRegister)
    Events:Subscribe("Engine:Update", self, self.OnEngineUpdate)
    Events:Subscribe("Client:UpdateInput", self, self.OnUpdateInput)
    Events:Subscribe("VEManager:PresetsLoaded", self, self.OnPresetsLoaded)
end

function DarknessClient:RegisterPresets(p_LevelName, p_GameMode, p_IsDedicatedServer)
    for l_Name, l_Preset in pairs(self.m_Presets) do
        local s_Prefix = self.m_Prefix
        local s_Name = s_Prefix .. "_" .. l_Name
        Events:Dispatch("VEManager:RegisterPreset", s_Name, l_Preset)
    end
end

function DarknessClient:OnLoadResources(p_LevelName, p_GameMode, p_IsDedicatedServer)
    -- Self
    self:RegisterPresets(p_LevelName, p_GameMode, p_IsDedicatedServer)
    -- Distribute
    g_MapVEManager:OnLoadResources(p_LevelName, p_GameMode, p_IsDedicatedServer)
end

function DarknessClient:OnLevelLoaded(p_LevelName, p_GameMode)

end

function DarknessClient:OnPlayerRespawn(p_Player)
    -- Distribute
    g_UI:OnPlayerRespawn(p_Player)
end

function DarknessClient:OnEntityRegister(p_LevelData)
    -- Distribute
    g_VehicleManager:OnEntityRegister(p_LevelData)
end

function DarknessClient:OnUpdateInput(p_Player, p_DeltaTime)
    -- Self
    self:NVGPlayerInput(p_Player, p_DeltaTime)
end

function DarknessClient:OnPresetsLoaded()
    -- Distribute
    g_MapVEManager:OnPresetsLoaded()
end

-- Night Vision Gadget --
function DarknessClient:NVGPlayerInput(p_Player, p_DeltaTime)
    -- Night Vision Goggles
    if InputManager:WentKeyDown(8) then
        m_Logger:Write('NVG Key detected!')

        if CONFIG.GENERAL.USE_NIGHTVISION_GADGET and g_UI.m_HudActive then

            if not g_NVG.m_Activated then
                m_Logger:Write('Calling NVG:Activate()')
                g_NVG:Activate()
			else
                m_Logger:Write('Calling NVG:Deactivate()')
                g_NVG:Deactivate()
            end
        else
            m_Logger:Write('Failed to enable NVG. useNightVisionGadget = ' .. tostring(CONFIG.GENERAL.USE_NIGHTVISION_GADGET) .. ' | isHud = ' .. tostring(g_UI.m_HudActive) .. ' | isKilled = ' .. tostring(g_UI.m_PlayerDead))
        end
    end
end

local s_ElapsedTime = 0
local s_LastSecond = 0
function DarknessClient:OnEngineUpdate(p_DeltaTime, p_SimulationDeltaTime)
    s_ElapsedTime = s_ElapsedTime + p_DeltaTime

    if s_ElapsedTime >= s_LastSecond + 1 then
        s_LastSecond = s_LastSecond + 1

        if g_NVG.m_Activated and CONFIG.GENERAL.USE_NIGHTVISION_GADGET then
            g_NVG:Depleting(s_ElapsedTime)
        elseif g_NVG.m_BatteryLifeCurrent ~= g_NVG.m_BatteryLifeMax and CONFIG.GENERAL.USE_NIGHTVISION_GADGET then
            g_NVG:Recharging(s_ElapsedTime)
        end
    end
end


-- Singleton
if g_DarknessClient == nil then
    g_DarknessClient = DarknessClient()
end

return g_DarknessClient






