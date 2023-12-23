---@class MapVEManager
---@overload fun():MapVEManager
MapVEManager = class("MapVEManager")

local m_Logger = Logger("MapVEManager", true)

function MapVEManager:__init()
    m_Logger:Write("Initialize MapVEManager")
    MapVEManager:RegisterVars()
end

function MapVEManager:RegisterVars()
    self.m_CurrentMapPreset = nil
    self.m_LoadedPreset = nil
end

-- ---@param p_LevelName string
-- ---@param p_GameMode string
-- ---@param p_IsDedicatedServer boolean
-- function MapVEManager:OnLoadResources(p_LevelName, p_GameMode, p_IsDedicatedServer)
--     for l_key, l_Value in pairs(CONFIG.MAPS) do
--         if string.find(p_LevelName, l_key) then
--             self.m_LoadedPreset = {p_LevelName:match('/[^/]+'):sub(2), l_Value}
--             break
--         else
--             self.m_LoadedPreset = {p_LevelName:match('/[^/]+'):sub(2), "Night"}
--         end
--     end
--     m_Logger:WriteTable(self.m_LoadedPreset)
-- end

function MapVEManager:OnPresetsLoaded()
    -- MapVEManager:ApplyPreset(self.m_LoadedPreset[1], self.m_LoadedPreset[2])
end

function MapVEManager:OnLevelDestroyed()
    -- MapVEManager:RemovePreset(self.m_CurrentMapPreset)
    MapVEManager:RegisterVars()
end

-- function MapVEManager:ApplyPreset(p_LevelName, p_Preset)
--     local s_Prefix = DarknessClient.m_Prefix .. p_LevelName
--     local s_Preset = s_Prefix .. "_" .. p_Preset
--     Events:Dispatch("VEManager:EnablePreset", s_Preset)
--     self.m_CurrentMapPreset = s_Preset
--     m_Logger:Write("Applying Preset: " .. self.m_CurrentMapPreset)
-- end

-- function MapVEManager:RemovePreset(p_Preset)
--     Events:Dispatch("VEManager:DisablePreset", p_Preset)
--     self.m_CurrentMapPreset = nil
--     m_Logger:Write("Removed Active Preset")
-- end

return MapVEManager()
