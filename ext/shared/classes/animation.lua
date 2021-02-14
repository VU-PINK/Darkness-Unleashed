local Animation = class("Animation")

--[[local t = 0.0
local running = false
local deltaTimeRunningNVGOFF = false
local deltaTimeRunningNVGON = false
local NVGOffState = nil
local NVGOnState = nil]]

function Animation:__init()
--
end

--[[Events:Subscribe('DeltaTime', function(deltaTime)
  if(deltaTimeRunningNVGOFF) then
    if(elapsedTime >= last200ms + 0.2) then
      last200ms = last200ms + 0.2

      if Animation:NVGAnimationRunOFF(NVGOffState) == "Done" then
        running = false
        deltaTimeRunningNVGOFF = false
        --Events:Unsubscribe('DeltaTime')
        --print("Unsubscribed form DeltaTime")
        return
      end

    end

  elseif(deltaTimeRunningNVGON) then
    --elapsedTime = elapsedTime + deltaTime
    print(elapsedTime)
    if(elapsedTime >= last200ms + 0.2) then
      last200ms = last200ms + 0.2

      if Animation:NVGAnimationRunON(NVGOnState) == "Done" then
        running = false
        deltaTimeRunningNVGON = false
        return
      end
    end

  end
end)

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
      if state.priority == 1000000 and deltaTimeRunningNVGON == false then
          deltaTimeRunningNVGON = true
          NVGOnState = state
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
      if state.priority == 999999 and deltaTimeRunningNVGOFF == false then
          deltaTimeRunningNVGOFF = true
          NVGOffState = state
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


return Animation]]

done = false
local firstloop = nil
local states = nil
nvgEnable = false
nvgDisable = false
local currentstate = nil
local t = 0.0
local dTime = 0
local animationSmoothness = 1

Events:Subscribe('DeltaTime', function(deltaTime)

    dTime = deltaTime

    if nvgRunner == true then
      Animation:nvg()
    else
      return
    end

end)

function Animation:GetFramePercentage(frameTime, totalTime)

  return (frameTime / totalTime)

end

function Animation:nvg()
  if done ~= true and nvgEnable == true and nvgDisable ~= true then
    Animation:nvgEnableLoop()
  elseif done ~= true and nvgDisable == true and nvgEnable ~= true then
    Animation:nvgDisableLoop()
  else
    return
  end
end


function Animation:nvgEnableLoop()
    if firstloop ~= false then
        firstloop = false
        print("NVG Animation called!")
        ApplySpecialVisualEnvironment("NightVision")
        states = VisualEnvironmentManager:GetStates()

        for _, state in pairs(states) do
          print("Searching through states")
          if state.priority == 1000000 then
            print("Found NVG State")
            currentstate = state
          end

        end

    elseif firstloop == false then
            if t <= 1.0 then
              print(dTime)
              t = t + (animationSmoothness * Animation:GetFramePercentage(0.01, animationSmoothness)) --Total time before it's done
              print("Lerping... " .. t)
              local lerp1 = MathUtils:Lerp(0.2, 1.0, t)--lerp(0, 1, t)
              local lerp2 = MathUtils:Lerp(0.0, 2.0, t)--lerp(0, 2, t)
              currentstate.colorCorrection.brightness = Vec3((1.25*lerp1), (1.25*lerp1), (1.25*lerp1))
              currentstate.vignette.exponent = lerp2
              VisualEnvironmentManager:SetDirty(true)
            elseif t >= 1.0 then
              done = true
              nvgRunner = false
              firstloop = true
              nvgEnable = false
              t = 0.0
              print("Reached End")
              return
            end
    end
end

function Animation:nvgDisableLoop()
  print("Disable Animation")
  if firstloop ~= false then
      firstloop = false
      print("NVG Disable Animation called!")
      ResetSpecialVisualEnvironment("NightVision")
      states = VisualEnvironmentManager:GetStates()

      for _, state in pairs(states) do
        print("Searching through states")
        if state.priority == 999999 then
          print("Found NVG State")
          currentstate = state
        end

      end

  elseif firstloop == false then
      --print("Found NVG state!")
          if t <= 1.0 then
            print("Lerping... " .. t)
            t = t + (animationSmoothness * Animation:GetFramePercentage(0.01, animationSmoothness)) --Total time before it's done
            local lerp1 = MathUtils:Lerp(0.2, 1.0, t)--lerp(0, 1, t)
            currentstate.colorCorrection.brightness = Vec3((1.25*lerp1), (1.25*lerp1), (1.25*lerp1))
            VisualEnvironmentManager:SetDirty(true)
          elseif t >= 1.0 then
            done = true
            nvgRunner = false
            firstloop = true
            nvgDisable = false
            t = 0.0
            print("Reached End")
            return
          end
  end
end

return Animation
