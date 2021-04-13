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

    --Vehicles_OnPlayerUpdateInput(p_Player, p_DeltaTime)

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

        local clonedData = createdEntity.data:Clone()

        if Tool:FindInArray(lightEntities, clonedData) then 

            print('Entity already in Table')
            index = Tool:GetArrayItemIndex(bufferedLights, clonedData)
            table.remove(bufferedLights, index)
            entityList:Uninstall()
            return 

        end 

        if createdEntity.uniqueId == 0 then 

            table.insert(lightEntities, clonedData)
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

--[[Hooks:Install('EntityFactory:CreateFromBlueprint', 100, function(hookCtx, blueprint, transform, variation, parentRepresentative)

    local createdBus = hookCtx:Call()

    for _, entity in pairs(createdBus.entities) do

        if entity.uniqueId == 0 then 

            print(entity.data)

        end

    end

end)]]

function Vehicles_OnPlayerUpdateInput(p_Player, p_DeltaTime)
    
    --Vehicle lights toggle
    if InputManager:WentKeyDown(InputDeviceKeys.IDK_T) then

        print(lightEntities)

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

        if controllableEntity:Is('EntityBusPeer') then
            print('1' .. controllableEntity.entities)
            print('2' .. controllableEntity.parent.entities)
            return 
        end  

        print('-------------------------------------------------------')

        print('Vehicle Controllable Entity: ')

        print(controllableEntity)

        --print('Vehicle Controllable Entity Bus: ')

        --print(controllableEntity.bus.entities)

        print('-------------------------------------------------------')


        for index, entity in pairs(lightEntities) do 

            --print(entity.bus.parent)
            --print(entity.bus.parent.entities)

            for _, busentity in pairs(entity.bus.parent.entities) do 


                    if busentity:Is('ClientVehicleEntity') then


                        if busentity == controllableEntity and Tool:FindInArray(bufferedLights, entity) == true then

                            print('Enabling entity...')

                            indexItem = Tool:GetArrayItemIndex(bufferedLights, entity)
                            table.remove(bufferedLights, indexItem)

                            if Tool:FindInArray(bufferedLights, entity) ~= true then 

                                entity:FireEvent('Enable')  
                                print('Enabled Lights')
                                print(bufferedLights)

                            end 

                        elseif busentity == controllableEntity and Tool:FindInArray(bufferedLights, entity) ~= true then

                            table.insert(bufferedLights, entity)
                            print('Disabling entity...')

                            if Tool:FindInArray(bufferedLights, entity) == true then 

                                entity:FireEvent('Disable')
                                print('Disabled Lights')
                                print(bufferedLights)

                            end 

                        end


                    end 


            end 



        end



    end
end
