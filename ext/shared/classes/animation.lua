local Animation = class("Animation")



function Animation:__init()

end

function Animation:GetTime(time)
    self.currentTime = time
end

function Animation:Lerp()

end

Events:Subscribe('Engine:Update', function(deltaTime, simulationDeltaTime)
    Animation:NVGAnimation()
end)

function Animation:NVGAnimation()

    print("NVG Animation called!")

    local states = VisualEnvironmentManager:GetStates()
    for _, state in pairs(states) do
        print("Searching through states")
        if state.priority == 1000000 then
            print("Found NVG state!")
                if(state.vignette.scale ~= Vec2(2.4, 2.2)) then
                    state.vignette.scale = Vec2(MathUtils:Lerp(0.0, 2.4, 3.0), MathUtils:Lerp(0.0, 2.2, 3.0))
                    VisualEnvironmentManager:SetDirty(true)
                end
        end
    end
end

return Animation