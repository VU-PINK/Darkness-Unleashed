local Settings = require '__shared/settings'
local Tool = require '__shared/classes/tools/tool'

function VehicleLights()

    if Settings.useVehicleLights_Airborne == true or Settings.useVehicleLights_Ground == true then

        local vehiclemodifications = require '__shared/classes/vehiclemodifications'

    else

        Tool:DebugPrint('Not using Vehicle Lights', 'altering')

    end
end

VehicleLights()



--[[ResourceManager:RegisterInstanceLoadHandler(Guid('6F91A4CF-344D-11E0-930F-E8BE623140CB'),Guid('A11805B7-0656-4D9A-9226-D746EA0C857C'), function(engineInstance)
    local engine = EngineConfigData(engineInstance)
    engine:MakeWritable()
    engine.rpmMax = engine.rpmMax * 2.5
    engine.enginePowerMultiplier = engine.enginePowerMultiplier * 2.5
end)]]


--Vehicles
Events:Subscribe('UpdateInput', function(p_Player, p_DeltaTime)

    Vehicles_OnPlayerUpdateInput(p_Player, p_DeltaTime)

end)

local lightEntities = {}
local bufferedLights = {}

local controllableEntity
local loopingLights = false
local vehicleIsDead = false
local index = nil

local entityList = Hooks:Install('EntityFactory:Create', 100, function(hookCtx, entityData, transform)


    if entityData:Is('SpotLightEntityData') then

        local createdEntity = hookCtx:Call()

        local entityBus = createdEntity.bus.parent

        if createdEntity.uniqueId == 0 then

            table.insert(lightEntities, entityBus)
            --print('added entity to table')

        end

    end


end)

Events:Subscribe('Vehicle:Destroyed', function(vehicle, vehiclePoints, hotTeam)

    if vehicle == controllableEntity then

        print('Vehicle Destroyed: ' .. lightEntities)
        print('---------------------------------------------------------------')

    end

end)


function Vehicles_OnPlayerUpdateInput(p_Player, p_DeltaTime)
    
    --Vehicle lights toggle
    if InputManager:WentKeyDown(InputDeviceKeys.IDK_T) then

        if p_Player.inVehicle == false then
            Tool:DebugPrint("Not in a vehicle", 'player')
            return
        end
        
        if p_Player.controlledControllable == nil then
            Tool:DebugPrint("Not a driver", 'player')
            return
        end

        controllableEntity = p_Player.controlledControllable

        if controllableEntity == nil then
            return
        end

        if controllableEntity ~= nil then
            --print('C Entity:')
            --print(controllableEntity)
            --print('DATA:')
            --print(controllableEntity.data)
            --print(controllableEntity.bus.entities)
            --print(controllableEntity.bus.parent.entities)
        end

        for _, component in pairs(controllableEntity.bus.parent.entities) do

            if component:Is('SpotlightComponentData') then

                print('Hi')

            else

                print(component)

            end

        end

    end

end

        --print('-------------------------------------------------------')

        --print('Vehicle Controllable Entity: ')

        --print(controllableEntity)

        --print('Vehicle Controllable Entity Bus: ')

        --print(controllableEntity.bus.entities)

        --print('-------------------------------------------------------')

        --[[ iterate through all entities
        local it = EntityManager:GetIterator('SpotLightEntity')

        local entity = it:Next()
        
        while entity ~= nil do

            -- get cloned entityData
            for _, entityParent in pairs(lightEntities) do 


                if entityParent == entity.bus.parent then 

                    -- go to parent entitybus
                    for _, busentity in pairs(entity.bus.parent.entities) do 

                        if busentity:Is('ClientVehicleEntity') then

                            --print('-----------------------')
                            --print('Bus:')
                            --print(busentity)
                            --print('-----------------------')
                            --print('Iterated Entity:')
                            --print(entity)
                            --print('-----------------------')

                            if busentity == controllableEntity and Tool:FindInArray(bufferedLights, entity.bus.parent) == true then
    
                                print('Enabling entity...')
    
                                indexItem = Tool:GetArrayItemIndex(bufferedLights, entity.bus.parent)
                                table.remove(bufferedLights, indexItem)
    
                                if Tool:FindInArray(bufferedLights, entity.bus.parent) ~= true then 
    
                                    print(entity)
                                    entity:FireEvent('Enable')  
                                    print('Enabled Lights')
    
                                end 
    
                            elseif busentity == controllableEntity and Tool:FindInArray(bufferedLights, entity.bus.parent) ~= true then
    
                                table.insert(bufferedLights, entity.bus.parent)
                                print('Disabling entity...')
    
                                if Tool:FindInArray(bufferedLights, entity.bus.parent) == true then 
    
                                    print(entity)
                                    entity:FireEvent('Disable')
                                    print('Disabled Lights')
    
                                end 
    
                            end
    
    
                        end 

                    end 
                end 

            end

        -- iterate to next entity
        entity = it:Next()   
        end    

    end


end]]

