-- Requires
require("Systems/UI")
require("Systems/MapManager")
require("Systems/VehicleManager")

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
        Night = require("Presets/Night")
    }

    self.m_PlayerName = PlayerManager:GetLocalPlayer().name
end

function MapVEManager:RegisterEvents()
    Events:Subscribe("Level:Loaded", self, self.OnLevelLoaded)
    Events:Subscribe("Level:Destroy", self, self.OnLevelDestroyed)
    Events:Subscribe("Player:Respawn", self, self.OnPlayerRespawn)
    Events:Subscribe('Level:RegisterEntityResources', self, self.OnEntityRegister)
end

function DarknessClient:RegisterPresets()
    for l_Name, l_Preset in pairs(self.m_Presets) do
        local s_Prefix = "Darkness_Unleashed_"
        local s_Preset = s_Prefix .. l_Preset
        NetEvents:Send("VEManager:Register", tostring(l_Name), s_Preset)
    end
end

function MapVEManager:OnLevelLoaded(p_LevelName, p_GameMode)
    -- Self
    self:RegisterPresets()

    -- Distribute
    g_MapVEManager:OnLevelLoaded(p_LevelName, p_GameMode)
end

function MapVEManager:OnPlayerRespawn(p_Player)
    -- Distribute
    g_UI:OnPlayerRespawn(p_Player)
end

function MapVEManager:OnEntityRegister(p_LevelData)
    -- Distribute
    g_VehicleManager:OnEntityRegister(p_LevelData)
end


-- Singleton
if g_DarknessClient == nil then
    g_DarknessClient = DarknessClient()
end

return g_DarknessClient




