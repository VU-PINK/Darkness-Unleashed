local RM = class('RM')


-- Easier Loading of different VU / Battlefield Components

function RM:__init() 

end

-- VehicleComponentData
-- takes 2 Guids as strings
function RM:VC(partition, instance)
    ResourceManager:FindInstanceByGuid(Guid(partition), (instance))
end

-- TextureAsset
function RM:Tex(partition, instance)
    ResourceManager:FindInstanceByGuid(Guid(partition), (instance))
end

