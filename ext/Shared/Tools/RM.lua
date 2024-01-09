local m_Logger = DULogger("ResourceManager", false)
RM = class('RM')

-- Easier Loading of different VU / Battlefield Components
function RM:__init()
    m_Logger:Write("Initializing DU-RM")
end

--- Common
-- TextureAsset
---@param p_Partition string
---@param p_Instance string
function RM:Find(p_Partition, p_Instance)
    return ResourceManager:FindInstanceByGuid(Guid(p_Partition), Guid(p_Instance))
end

---@param p_Partition string
function RM:GetPartition(p_Partition)
    return ResourceManager:FindDatabasePartition(Guid(p_Partition))
end

---@param p_Partition string
---@param p_Instance string
function RM:Tex(p_Partition, p_Instance)
    local s_TextureAsset = RM:Find(p_Partition, p_Instance)
    if s_TextureAsset == nil then return nil end
    return TextureAsset(s_TextureAsset)
end

function RM:Flashlight()
    local s_FlashLightTexture = RM:Find('04C62561-2236-11DF-A528-EA655525F02D', '2EE018E8-1451-908C-0974-DB7676407D61')
    if not s_FlashLightTexture then
        return nil
    else
        return TextureAsset(s_FlashLightTexture)
    end
end

-- LensFlareEntityData
function RM:LFED(p_Partition, p_Instance)
    local s_LensFlareEntityData = RM:Find(p_Partition, p_Instance)
    if s_LensFlareEntityData == nil then return nil end
    return LensFlareEntityData(s_LensFlareEntityData)
end

--- Vehicles
-- VehicleComponentData
function RM:VCD(p_Partition, p_Instance)
    local s_VehicleComponentData = RM:Find(p_Partition, p_Instance)
    if s_VehicleComponentData == nil then return nil end
    return VehicleComponentData(s_VehicleComponentData)
end

-- VehicleEntityData
function RM:VED(p_Partition, p_Instance)
    local s_VehicleEntityData = RM:Find(p_Partition, p_Instance)
    if s_VehicleEntityData == nil then return nil end
    return VehicleEntityData(s_VehicleEntityData)
end

-- ChassisComponentData
function RM:CCD(p_Partition, p_Instance)
    local s_ChassisComponentData = RM:Find(p_Partition, p_Instance)
    if s_ChassisComponentData == nil then return nil end
    return ChassisComponentData(s_ChassisComponentData)
end

--- Weapons
-- WeaponComponentData
function RM:WCP(p_Partition, p_Instance)
    local s_WeaponComponentData = RM:Find(p_Partition, p_Instance)
    if s_WeaponComponentData == nil then return nil end
    return WeaponComponentData(s_WeaponComponentData)
end

return RM()
