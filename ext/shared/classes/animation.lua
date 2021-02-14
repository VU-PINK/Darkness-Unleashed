local Animation = class("Animation")

local last200ms = 0.0
local t = 1.0

function Animation:__init()
--
end

function Animation:NVGAnimationON()
  print("NVG Animation called!")
  local states = VisualEnvironmentManager:GetStates()

  for _, state in pairs(states) do
    --print("Searching through states")
    if state.priority == 1000000 then

        Events:Subscribe('Engine:Update', function(deltaTime, simulationDeltaTime)

          elapsedTime = elapsedTime + deltaTime
          print(elapsedTime)
          if(elapsedTime >= last200ms + 0.2) then
            last200ms = last200ms + 0.2

            if Animation:NVGAnimationRunON(state) == "Done" then
              Events:Unsubscribe('Engine:Update')
            end

          end
        end)
    end
  end
end

function Animation:NVGAnimationRunON(state)
        --print("Found NVG state!")
        if t <= 1.0 then
        t = t + 0.01
        local lerp1 = MathUtils:Lerp(0.2, 1.0, t)--lerp(0, 1, t)
        local lerp2 = MathUtils:Lerp(0.0, 1.0, t)--lerp(0, 2, t)
        state.colorCorrection.brightness = Vec3((1.25*lerp1), (1.25*lerp1), (1.25*lerp1))
        state.vignette.exponent = lerp2
        VisualEnvironmentManager:SetDirty(true)
        elseif t >= 1.0 then
          t = 0.0
          return "Done"
        end
end

function Animation:NVGAnimationOFF()
  print("NVG Animation called!")
  ResetSpecialVisualEnvironment('NightVision')
  local states = VisualEnvironmentManager:GetStates()

  for _, state in pairs(states) do
    --print("Searching through states")
    if state.priority == 1000000 then

        Events:Subscribe('Engine:Update', function(deltaTime, simulationDeltaTime)

          elapsedTime = elapsedTime + deltaTime
        
          if(elapsedTime >= last200ms + 0.2) then
            last200ms = last200ms + 0.2

            if Animation:NVGAnimationRunOFF(state) == "Done" then
              Events:Unsubscribe('Engine:Update')
            end
            
          end
        end)
    end
  end
end

function Animation:NVGAnimationRunOFF(state)
  --print("Found NVG state!")
  if t <= 1.0 then
  t = t + 0.01
  local lerp1 = MathUtils:Lerp(0.0, 1.0, t)--lerp(0, 1, t)
  state.colorCorrection.brightness = Vec3((1.25*lerp1), (1.25*lerp1), (1.25*lerp1))
  VisualEnvironmentManager:SetDirty(true)
  elseif t >= 1.0 then
    t = 0.0
    return "Done"
  end
end


return Animation
