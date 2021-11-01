local m_Logger = Logger("MapVEManager", true)
class("MapVEManager")

function MapVEManager:__init()
    m_Logger:Write("Initialize MapVEManager")
    MapVEManager:RegisterVars()
end

function MapVEManager:RegisterVars()
    self.m_CurrentMapPreset = nil
end

function MapVEManager:OnLevelLoaded(p_LevelName, p_GameMode)
    for l_Category, l_CategoryData in pairs(CONFIG) do
        if type(l_CategoryData) == "table" then
            for l_CategoryKey, l_Value in pairs(l_CategoryData) do
                if string.find(p_LevelName, l_CategoryKey) then
                    MapVEManager:ApplyPreset(p_LevelName, l_Value)
                    break
                end
            end
        end
    end
end

function MapVEManager:OnLevelDestroyed()
    MapVEManager:RemovePreset(self.m_CurrentMapPreset)
end

function MapVEManager:ApplyPreset(p_LevelName, p_Preset)
    local s_Prefix = "Darkness_Unleashed_"
    local s_Preset = s_Prefix .. p_Preset
    Events:Dispatch("VEManager:EnablePreset", s_Preset)
    self.m_CurrentMapPreset = s_Preset
    m_Logger:Write("Applying Preset: " .. self.m_CurrentMapPreset)
end

function MapVEManager:RemovePreset(p_Preset)
    Events:Dispatch("VEManager:DisablePreset", s_Preset)
    self.m_CurrentMapPreset = nil
    m_Logger:Write("Removed Active Preset")
end


-- Singleton
if g_MapVEManager == nil then
    g_MapVEManager = MapVEManager()
end

return g_MapVEManager