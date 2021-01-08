function RemoveFx()
-- Remove cardboard boxes when destroyed and remove ambient effects like flying trash
entityFactoryCreateFromBlueprint = Hooks:Install('EntityFactory:CreateFromBlueprint', 1, function(hook, blueprint, transform, variation, parentRepresentative)

        blueprint = Blueprint(blueprint)

        if blueprint.name:match("FX/Ambient") then

            hook:Return()

        end


        if blueprint.name:match("FX/DLC/XP1/Ambient") then

            hook:Return()

        end


        if blueprint.name:match("FX/DLC/XP2/Ambient") then

            hook:Return()

        end

        if blueprint.name:match("XP_Raw/Surrounding/Mountains") then

            hook:Return()

        end

        if blueprint.name:match("FX/DLC/XP4/Ambient") then

            hook:Return()

        end

        if blueprint.name:match("FX/DLC/XP5/Ambient") then

            hook:Return()

        end


        if blueprint.name:match("Props/InteriorProps/CardboardBoxes_02") then

            hook:Return()

        end

        if blueprint.name:match("Objects/ElectricWire_01") then

            hook:Return()

    end

end)

flagProgress = ResourceManager:RegisterInstanceLoadHandler(Guid('37281D8D-BB5A-11DF-B69D-B42F116347F5'), Guid('DD387B90-E2E8-1408-A934-9ADEC54F54B1'), function(instance)

local tagCompData = UICapturepointtagCompData(instance)
    tagCompData:MakeWritable()
    tagCompData.updatesPerSecond = 200
    tagCompData.iconSize = 0.0
    tagCompData.drawDistance = 600.0
    tagCompData.scaleDistance = 0.0
end)

end

return RemoveFx
 
