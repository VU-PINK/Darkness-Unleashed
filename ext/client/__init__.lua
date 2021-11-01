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
    Events:Subscribe("Level:Destroy", self, self.OnLevelDestroyed)
    Events:Subscribe("Player:Respawn", self, self.OnPlayerRespawn)
    Events:Subscribe('Level:RegisterEntityResources', self, self.OnEntityRegister)
end

function DarknessClient:RegisterPresets()
    for l_Name, l_Preset in pairs(self.m_Presets) do
        local s_Prefix = "Darkness_Unleashed_"
        local s_Preset = s_Prefix .. l_Preset
        Events:Dispatch("VEManager:Register", tostring(l_Name), s_Preset)
        m_Logger:Write("Registering Preset: " .. l_Name)
        m_Logger:Write(s_Preset)
    end
end

function DarknessClient:OnLevelLoaded(p_LevelName, p_GameMode)
    -- Self
    self:RegisterPresets()

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




