local Animation = class("Animation")

local last200ms = 0.0
local t = nil
local running = false

function Animation:__init()
--
end

function Animation:NVGAnimationON()
  if running == true then
    return running
  elseif running ~= true then
    print("NVG Animation called!")
    local states = VisualEnvironmentManager:GetStates()
    t = 0.0
    running = true
    for _, state in pairs(states) do
      --print("Searching through states")
      if state.priority == 1000000 then

          --local elapsedTime

          Events:Subscribe('DeltaTime', function(deltaTime, simulationDeltaTime)

            --elapsedTime = elapsedTime + deltaTime
            print(elapsedTime)
            if(elapsedTime >= last200ms + 0.2) then
              last200ms = last200ms + 0.2

              if Animation:NVGAnimationRunON(state) == "Done" then
                running = false
                Events:Unsubscribe('DeltaTime')
                print("Unsubscribed form DeltaTime")
                return 
              end

            end
          end)
      end
    end
  end
end

function Animation:NVGAnimationRunON(state)
        --print("Found NVG state!")
        if t <= 1.0 then 
          t = t + 0.1 --Total time before it's done
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
  if running == true then
    return running
  elseif running ~= true then
    print("NVG Animation called!")
    ResetSpecialVisualEnvironment('NightVision')
    local states = VisualEnvironmentManager:GetStates()
    t = 0.0
    running = true
    for _, state in pairs(states) do
      print("Searching through states")
      if state.priority == 999999 then
          print("Found night state!")
          Events:Subscribe('DeltaTime', function(deltaTime)

            if(elapsedTime >= last200ms + 0.2) then
              last200ms = last200ms + 0.2

              if Animation:NVGAnimationRunOFF(state) == "Done" then
                running = false
                Events:Unsubscribe('DeltaTime')
                print("Unsubscribed form DeltaTime")
                return 
              end
              
            end
          end)
      end
    end
  end
end

function Animation:NVGAnimationRunOFF(state)
  --print("Found NVG state!")
  if t <= 1.0 then
  t = t + 0.1
  local lerp1 = MathUtils:Lerp(0.0, 1.0, t)--lerp(0, 1, t)
  state.colorCorrection.brightness = Vec3((1.25*lerp1), (1.25*lerp1), (1.25*lerp1))
  VisualEnvironmentManager:SetDirty(true)
  elseif t >= 1.0 then
    t = 0.0
    return "Done"
  end
end


return Animation
