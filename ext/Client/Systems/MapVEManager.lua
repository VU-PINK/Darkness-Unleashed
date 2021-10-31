local m_Logger = Logger("MapVEManager", false)
class("MapManager")


function MapVEManager:__init()
    m_Logger:Write("Initialize MapVEManager")
    MapVEManager:RegisterVars()
end

function MapVEManager:RegisterVars()
    self.m_CurrentMapPreset = nil
end

function MapVEManager:OnLevelLoaded(p_LevelName, p_GameMode)
    for l_Category, l_CategoryTable in pairs(CONFIG) do
        if l_Category["MAPS"] and l_CategoryTable[p_LevelName] then
            local s_ConfiguredPreset = l_Category[p_LevelName]
            MapVEManager:ApplyPreset(p_LevelName, s_ConfiguredPreset)
        end
    end
end

function MapVEManager:OnLevelDestroyed()
    MapVEManager:RemovePreset(self.m_CurrentMapPreset)
end

function MapVEManager:ApplyPreset(p_LevelName, p_Preset)
    local s_Prefix = "Darkness_Unleashed_"
    local s_Preset = s_Prefix .. p_Preset
    NetEvents:Send("VEManager:EnablePreset", s_Preset)
    self.m_CurrentMapPreset = s_Preset
    m_Logger:Write("Applying Preset: " .. self.m_CurrentMapPreset)
end

function MapVEManager:RemovePreset(p_Preset)
    NetEvents:Send("VEManager:DisablePreset", s_Preset)
    self.m_CurrentMapPreset = nil
    m_Logger:Write("Removed Active Preset")
end


-- Singleton
if g_MapVEManager == nil then
    g_MapVEManager = MapVEManager()
end

return g_MapVEManager