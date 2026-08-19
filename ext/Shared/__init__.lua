require("__shared/Settings")
require("__shared/VehicleSettings")
require("__shared/Tools/Logger")
require("__shared/Tools/RM")
require("__shared/Tools/Functions")
require("__shared/VehicleManager")

-- Register partition load handlers for all vehicles so lights are injected when partitions load.
-- This is the correct VeniceEXT pattern (see ToggleVehicleLight PoC and VU-Docs datamod guide).
-- Shared scripts run on both server and client, ensuring data consistency.

---@type table<string, bool>
local m_ModifiedPartitions = {}

for l_CategoryName, l_Vehicles in pairs(VEHICLESETTINGS) do
    for l_VehicleKey, l_VehicleConfig in pairs(l_Vehicles) do
        local s_PartitionGuid = Guid(l_VehicleConfig.partitionGUID)
        if s_PartitionGuid then
            ResourceManager:RegisterPartitionLoadHandlerOnce(s_PartitionGuid, function(partition)
                -- Mark this partition as processed to avoid duplicate modifications
                m_ModifiedPartitions[tostring(s_PartitionGuid)] = true
                VehicleManager:OnEntityRegister(partition)
            end)
        end
    end
end

---@brief Fallback: listen for Partition:Loaded event to catch vehicles that loaded before handlers registered.
--- This ensures lights are added even if partition loads happen during early level loadout.
Events:Subscribe('Partition:Loaded', function(partition)
    local s_PartitionGuid = tostring(partition.guid)

    -- Skip if we already processed this partition via RegisterPartitionLoadHandlerOnce
    if m_ModifiedPartitions[s_PartitionGuid] then
        return
    end

    -- Check if any vehicle belongs to this partition
    for l_CategoryName, l_Vehicles in pairs(VEHICLESETTINGS) do
        for l_VehicleKey, l_VehicleConfig in pairs(l_Vehicles) do
            local v_PartitionGuid = Guid(l_VehicleConfig.partitionGUID)
            if tostring(v_PartitionGuid) == s_PartitionGuid then
                m_ModifiedPartitions[s_PartitionGuid] = true
                VehicleManager:OnEntityRegister(partition)
                break
            end
        end
    end
end)
