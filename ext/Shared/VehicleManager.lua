---@class VehicleManager
---@overload fun(): VehicleManager
VehicleManager = class('VehicleManager')

local m_Logger = DULogger("VehicleManager", true)

function VehicleManager:__init()
end

---@param p_Partition DatabasePartition
function VehicleManager:OnEntityRegister(p_Partition)
    if not DU_CONFIG.VEHICLES.USE_VEHICLE_LIGHTS then
        return
    end

    local s_PartitionGuid = tostring(p_Partition.guid)

    -- Iterate through all vehicle settings and modify only those matching this partition
    for l_VehicleType, l_Vehicles in pairs(VEHICLESETTINGS) do
        for l_VehicleName, l_VehicleSettings in pairs(l_Vehicles) do
            if l_VehicleSettings.partitionGUID == s_PartitionGuid then
                self:ModifyVehicle(l_VehicleName, l_VehicleSettings)
            end
        end
    end

    m_Logger:Write("Processed partition: " .. s_PartitionGuid)
end

---@param p_VehicleName string
---@param p_VehicleSettings table
function VehicleManager:ModifyVehicle(p_VehicleName, p_VehicleSettings)
    local s_Partition = RM:GetPartition(Guid(p_VehicleSettings.partitionGUID))
    if s_Partition == nil then
        print("Vehicle not loaded: " .. p_VehicleName)
        return
    end

    local s_VehicleBlueprint = VehicleBlueprint(s_Partition.primaryInstance)
    s_VehicleBlueprint:MakeWritable()
    local s_VehicleEntityData = VehicleEntityData(s_VehicleBlueprint.object)
    s_VehicleEntityData:MakeWritable()
    local s_ChassisComponentData = ChassisComponentData(s_VehicleEntityData.components[1])
    s_ChassisComponentData:MakeWritable()

    -- Create SyncedBool for lights toggle (uses Toggle which works for SpotLightEntityData).
    -- inValue = true because vehicle lights are ON by default in vanilla BF3 blueprints.
    -- This ensures the first T press turns lights OFF (toggles from true -> false).
    local s_LightSyncedBool = SyncedBoolEntityData(MathUtils:RandomGuid())
    s_LightSyncedBool.inValue = true
    s_LightSyncedBool.isEventConnectionTarget = Realm.Realm_ClientAndServer
    s_VehicleEntityData.components:add(s_LightSyncedBool)
    s_Partition:AddInstance(s_LightSyncedBool)

    m_Logger:Write("Created SyncedBool GUID: " .. tostring(s_LightSyncedBool))

    -- Wrap the blueprint descriptor and add 'ToggleLights' input event.
    local s_Descriptor = nil
    if s_VehicleBlueprint.descriptor then
        s_Descriptor = InterfaceDescriptorData(s_VehicleBlueprint.descriptor)
        s_Descriptor:MakeWritable()

        -- Check if ToggleLights input already exists using :size() and :get(i) methods
        local l_HasToggleInput = false
        for i = 0, s_Descriptor.inputEvents:size() - 1 do
            local l_Event = s_Descriptor.inputEvents:get(i)
            if l_Event ~= nil and MathUtils:FNVHash('ToggleLights') == l_Event.id then
                l_HasToggleInput = true
                break
            end
        end

        if not l_HasToggleInput then
            local s_ToggleInput = DynamicEvent()
            s_ToggleInput.id = MathUtils:FNVHash('ToggleLights')
            s_Descriptor.inputEvents:add(s_ToggleInput)
        end

        -- Connect ToggleLights -> SyncedBool.Toggle (for lights + lens flares).
        self:AddEventConnection(
            s_VehicleBlueprint,
            EventConnectionTargetType.EventConnectionTargetType_Server,
            s_Descriptor,
            'ToggleLights',
            s_LightSyncedBool,
            'Toggle'
        )

        m_Logger:Write("Connected ToggleLights -> SyncedBool.Toggle")
    end

    local s_ComponentCount = 1

    m_Logger:Write("=== Processing vehicle: " .. p_VehicleName .. " ===")
    m_Logger:Write("Total components to process: " .. #p_VehicleSettings.Components)

    -- Iterate table of settings for each light to add (use named index variable).
    for l_Index, l_ComponentSettings in pairs(p_VehicleSettings.Components) do
        if l_ComponentSettings.description then
            m_Logger:Write("  Processing component: " ..
                l_ComponentSettings.description ..
                " (type=" ..
                l_ComponentSettings.type .. ", weaponmounted=" .. tostring(l_ComponentSettings.weaponmounted) .. ")")
            if l_ComponentSettings.transform and l_ComponentSettings.transform.trans then
                m_Logger:Write("    Transform trans: x=" ..
                    l_ComponentSettings.transform.trans.x ..
                    ", y=" .. l_ComponentSettings.transform.trans.y .. ", z=" .. l_ComponentSettings.transform.trans.z)
            end
        end

        -- Mount the light to either the weapon or the chassis
        local s_ParentComponent = nil
        if l_ComponentSettings.weaponmounted then
            local s_Key = nil
            if l_ComponentSettings.weapon2 then
                s_Key = 'weaponGUID2'
            else
                s_Key = 'weaponGUID'
            end
            -- TODO: improve this in VehicleSettings
            s_ParentComponent = ComponentData(s_Partition:FindInstance(Guid(p_VehicleSettings[s_Key])))
            s_ParentComponent:MakeWritable()
        else
            s_ParentComponent = s_ChassisComponentData
        end

        -- Create the light related instances
        local s_Instances = self:CreateLightInstances(l_ComponentSettings)
        s_ParentComponent.components:add(s_Instances['light-component'])
        s_ComponentCount = s_ComponentCount + 1

        -- Add all instances to partition
        for _, l_Instance in pairs(s_Instances) do
            s_Partition:AddInstance(l_Instance)
        end

        -- Collect light-data and mesh-component targets (these support Enable/Disable events).
        local s_Targets = { s_Instances['light-data'] }

        local s_MeshComponentData = s_Instances['mesh-component']
        if s_MeshComponentData ~= nil then
            s_ParentComponent.components:add(s_MeshComponentData)
            table.insert(s_Targets, s_MeshComponentData)
        end

        -- Add Enable/Disable event connections for light-data and mesh-component targets.
        -- These fire when the SyncedBool toggles OnTrue/OnFalse on clients.
        for _, l_Target in ipairs(s_Targets) do
            self:AddEventConnection(
                s_VehicleBlueprint,
                EventConnectionTargetType.EventConnectionTargetType_Client,
                s_LightSyncedBool,
                'OnTrue',
                l_Target,
                'Enable'
            )

            self:AddEventConnection(
                s_VehicleBlueprint,
                EventConnectionTargetType.EventConnectionTargetType_Client,
                s_LightSyncedBool,
                'OnFalse',
                l_Target,
                'Disable'
            )
        end

        -- Create lens flare for SpotLight components (type=2) only.
        -- PointLights (type=1) are just visible glow sources and don't need lens flares.
        if p_VehicleName ~= 'SU35BM' and p_VehicleName ~= 'F35' then
            if l_ComponentSettings.type == 2 then
                local s_FlareComponentData = self:CreateLensFlare(l_ComponentSettings)
                if s_FlareComponentData ~= nil then
                    m_Logger:Write("    Lens flare CREATED for spotlight: " ..
                        (l_ComponentSettings.description or "unknown"))
                    if l_ComponentSettings.transform and l_ComponentSettings.transform.trans then
                        m_Logger:Write("    Lens flare position from transform: x=" ..
                            l_ComponentSettings.transform.trans.x ..
                            ", y=" ..
                            l_ComponentSettings.transform.trans.y .. ", z=" .. l_ComponentSettings.transform.trans.z)
                    end
                    s_ParentComponent.components:add(s_FlareComponentData)
                    s_Partition:AddInstance(s_FlareComponentData)

                    -- Connect SyncedBool.OnTrue -> LensFlare.Enable (same pattern as lights).
                    self:AddEventConnection(
                        s_VehicleBlueprint,
                        EventConnectionTargetType.EventConnectionTargetType_Client,
                        s_LightSyncedBool,
                        'OnTrue',
                        s_FlareComponentData,
                        'Enable'
                    )

                    -- Connect SyncedBool.OnFalse -> LensFlare.Disable (same pattern as lights).
                    self:AddEventConnection(
                        s_VehicleBlueprint,
                        EventConnectionTargetType.EventConnectionTargetType_Client,
                        s_LightSyncedBool,
                        'OnFalse',
                        s_FlareComponentData,
                        'Disable'
                    )

                    m_Logger:Write("Connected SyncedBool -> LensFlareComponentData.Enable/Disable")
                else
                    m_Logger:Write("    Lens flare creation failed for spotlight: " ..
                        (l_ComponentSettings.description or "unknown"))
                end
            end
        end
    end

    -- Patch runtimeComponentCount
    s_VehicleEntityData.runtimeComponentCount =
        s_VehicleEntityData.runtimeComponentCount + s_ComponentCount

    m_Logger:Write("Modified vehicle: " .. p_VehicleName)
end

---@param p_Settings table
function VehicleManager:CreateLightInstances(p_Settings)
    local s_CreatedInstances = {}

    local s_LightDataType = ({
        [1] = 'PointLightEntityData',
        [2] = 'SpotLightEntityData'
    })[p_Settings.type]

    -- Set shared properties
    local s_LightData = _G[s_LightDataType](MathUtils:RandomGuid())
    s_LightData.radius = p_Settings.radius
    s_LightData.color = p_Settings.color
    s_LightData.intensity = p_Settings.intensity
    s_LightData.isEventConnectionTarget = Realm.Realm_Client
    s_CreatedInstances['light-data'] = s_LightData

    -- Set additional settings and add mesh for SpotLightEntities
    if p_Settings.type == 2 then
        s_LightData.shape = p_Settings.shape
        s_LightData.frustumFov = p_Settings.frustumFov
        s_LightData.frustumAspect = p_Settings.frustumAspect
        s_LightData.texture = RM:GetFlashlightTextureAsset()
        s_LightData.castShadowsMinLevel = 0
        s_LightData.castShadowsEnable = false

        -- RM:Find() returns a DataContainer, cast it to RigidMeshAsset using the constructor
        local s_MeshData = RM:Find(
            "77C2CBE6-9180-C6CB-8282-6235F2B9AC2E",
            "587C9B0B-B8A1-2675-0CC8-20D6F0F14347")
        local s_LightBeamMesh = nil
        if s_MeshData ~= nil then
            s_LightBeamMesh = RigidMeshAsset(s_MeshData)
        end

        -- Use a mesh component to mount the mesh to the vehicle (only if mesh was found)
        if s_LightBeamMesh ~= nil then
            local s_MeshComponentData = MeshComponentData(MathUtils:RandomGuid())
            s_MeshComponentData.mesh = s_LightBeamMesh
            s_MeshComponentData.isEventConnectionTarget = Realm.Realm_Client
            s_MeshComponentData.transform = LinearTransform(
                p_Settings.lightbeamTransform.left,
                p_Settings.lightbeamTransform.up,
                p_Settings.lightbeamTransform.forward,
                p_Settings.lightbeamTransform.trans
            )
            s_CreatedInstances['mesh-component'] = s_MeshComponentData
        end
    end

    -- Use a light component to mount the light to a vehicle
    local s_LightComponentData = LightComponentData(MathUtils:RandomGuid())
    s_LightComponentData.light = s_LightData
    s_LightComponentData.transform = LinearTransform(
        p_Settings.transform.left,
        p_Settings.transform.up,
        p_Settings.transform.forward,
        p_Settings.transform.trans
    )
    s_CreatedInstances['light-component'] = s_LightComponentData

    return s_CreatedInstances
end

---@param p_Settings table The light settings containing transform information for positioning
function VehicleManager:CreateLensFlare(p_Settings)
    -- Get lens flare data from VeniceEXT flashlight accessory partition.
    local s_LensFlareData = RM:GetLensFlareEntityData("65A5BFD9-028A-4D4F-8B89-3A60B2E06F83",
        "D8DB98E1-AEBA-485E-9AA4-D5F55C5CDECE")

    if s_LensFlareData == nil then
        return nil
    end

    s_LensFlareData:MakeWritable()

    -- Adjust lens flare curves for optimal visibility at vehicle distances.
    for l_Key, l_Value in pairs(s_LensFlareData.elements) do
        local dist = 80  -- Max distance for size (80m range)
        local dist2 = 60 -- Max distance for alpha (60m range)
        local sizeAngle = Vec4(0.13, 1, 0, 0)
        local alphaAngle = Vec4(0.04, 1, 0, 0)

        l_Value.sizeCamDistMax = dist
        l_Value.alphaCamDistMax = dist2
        l_Value.sizeAngleCurve = sizeAngle
        l_Value.alphaAngleCurve = alphaAngle
        l_Value.sizeScreenPosCurve = l_Value.sizeScreenPosCurve
        l_Value.alphaScreenPosCurve = l_Value.alphaScreenPosCurve
        l_Value.size = l_Value.size * 0.92
        l_Value.sizeOccluderCurve = l_Value.sizeOccluderCurve * 1
        l_Value.alphaCamDistCurve = l_Value.alphaCamDistCurve * 1
        l_Value.alphaOccluderCurve = l_Value.alphaOccluderCurve * 1
    end

    local s_ComponentData = LensFlareComponentData(MathUtils:RandomGuid())
    s_ComponentData.lensFlare = s_LensFlareData
    -- CRITICAL: Mark as event connection target so Enable/Disable events work.
    s_ComponentData.isEventConnectionTarget = Realm.Realm_Client

    m_Logger:Write("Created LensFlareComponentData GUID: " .. tostring(s_ComponentData))

    -- Invert the forward vector (point away from light emission direction)
    local l_Forward = Vec3(
        -p_Settings.transform.forward.x,
        -p_Settings.transform.forward.y,
        -p_Settings.transform.forward.z
    )

    s_ComponentData.transform = LinearTransform(
        p_Settings.transform.left,
        p_Settings.transform.up,
        l_Forward,                 -- INVERTED forward direction!
        p_Settings.transform.trans -- Same position as light
    )

    return s_ComponentData
end

function VehicleManager:AddEventConnection(p_Blueprint, p_ConnectionType, p_Source, p_SourceEvent, p_Target,
                                           p_TargetEvent)
    local s_EventConnection = EventConnection()
    s_EventConnection.source = p_Source -- FIXED: Use the descriptor/source GUID provided
    s_EventConnection.target = p_Target
    s_EventConnection.sourceEvent.id = tonumber(p_SourceEvent) or MathUtils:FNVHash(p_SourceEvent)
    s_EventConnection.targetEvent.id = tonumber(p_TargetEvent) or MathUtils:FNVHash(p_TargetEvent)
    s_EventConnection.targetType = p_ConnectionType

    m_Logger:Write("Added EventConnection: " .. tostring(s_EventConnection.source) .. "." .. p_SourceEvent ..
        " -> " .. tostring(s_EventConnection.target) .. "." .. p_TargetEvent ..
        " (TargetType=" .. tostring(p_ConnectionType) .. ")")

    p_Blueprint.eventConnections:add(s_EventConnection)
end

return VehicleManager()
