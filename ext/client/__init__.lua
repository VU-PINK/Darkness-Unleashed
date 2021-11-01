-- Requires
require("Systems/UI")
require("Systems/MapVEManager")
require("Systems/VehicleManager")

-- Logger
local m_Logger = Logger("DarknessClient", true)

-- Class
class("DarknessClient")

function DarknessClient:__init()
    self:RegisterVars()
    self:RegisterEvents()
end

function DarknessClient:RegisterVars()
    self.m_Presets = {
        Night = require("Presets/Night")
    }

    self.m_PlayerName = PlayerManager:GetLocalPlayer().name
end

function DarknessClient:RegisterEvents()
    Events:Subscribe("Level:Loaded", self, self.OnLevelLoaded)
    Events:Subscribe("Level:LoadResources", self, self.OnLoadResources)
    Events:Subscribe("Level:Destroy", self, self.OnLevelDestroyed)
    Events:Subscribe('Level:RegisterEntityResources', self, self.OnEntityRegister)
    Events:Subscribe("Player:Respawn", self, self.OnPlayerRespawn)
end

function DarknessClient:RegisterPresets()
    for l_Name, l_Preset in pairs(self.m_Presets) do
        local s_Prefix = "DU_"
        local s_Name = s_Prefix .. l_Name
        Events:Dispatch("VEManager:RegisterPreset", s_Name, l_Preset)
    end
end

function DarknessClient:OnLoadResources(p_LevelName, p_GameMode, p_IsDedicatedServer)
    -- Self
    self:RegisterPresets()
end

function DarknessClient:OnLevelLoaded(p_LevelName, p_GameMode)
    -- Distribute
    g_MapVEManager:OnLevelLoaded(p_LevelName, p_GameMode)
end

function DarknessClient:OnPlayerRespawn(p_Player)
    -- Distribute
    g_UI:OnPlayerRespawn(p_Player)
end

function DarknessClient:OnEntityRegister(p_LevelData)
    -- Distribute
    g_VehicleManager:OnEntityRegister(p_LevelData)
end


-- Singleton
if g_DarknessClient == nil then
    g_DarknessClient = DarknessClient()
end

return g_DarknessClient




