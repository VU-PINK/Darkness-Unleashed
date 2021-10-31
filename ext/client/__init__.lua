[[
TODO:
-   Store and Register VEs
-   Animations
-   NV
]]
-- Requires
require("Systems/UI")
require("Systems/MapManager")

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
end

function DarknessClient:RegisterPresets()
    for l_Name, l_Preset in pairs(self.m_Presets) do
        NetEvents:Send("VEManager:Register", tostring(l_Name), l_Preset)
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

-- Singleton
if g_DarknessClient == nil then
    g_DarknessClient = DarknessClient()
end

return g_DarknessClient




