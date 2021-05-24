local RM = class('RM')


-- Easier Loading of different VU / Battlefield Components

function RM:__init()

end

--- Common
-- TextureAsset
function RM:Find(partition, instance)
    return ResourceManager:FindInstanceByGuid(Guid(partition), Guid(instance))
end

function RM:Tex(partition, instance)
    return TextureAsset(RM:Find(partition, instance))
end

function RM:Flashlight()
    if FlashlightTexture == nil then
        local FlashlightTexture = TextureAsset(RM:Find('04C62561-2236-11DF-A528-EA655525F02D', '2EE018E8-1451-908C-0974-DB7676407D61'))
        return FlashlightTexture
    else
        return FlashlightTexture
    end
end

-- LensFlareEntityData
function RM:LFED(partition, instance)
    return LensFlareEntityData(RM:Find(partition, instance))
end

--- Vehicles
-- VehicleComponentData
function RM:VCD(partition, instance)
    return VehicleComponentData(RM:Find(partition, instance))
end

-- VehicleEntityData
function RM:VED(partition, instance)
    return VehicleEntityData(RM:Find(partition, instance))
end

-- ChassisComponentData
function RM:CCD(partition, instance)
    return ChassisComponentData(RM:Find(partition, instance))
end

--- Weapons
-- WeaponComponentData
function RM:WCP(partition, instance)
    return WeaponComponentData(RM:Find(partition, instance))
end


return RM