local Animation = class("Animation")

function Animation:__init()
--
end

done = false
local firstloop = nil
local states = nil
nvgEnable = false
nvgDisable = false
local currentstate = nil
local t = 0.0
local dTime = 0
local animationSmoothness = 1
local animationSmoothnessMultiplierON = 0.5
local animationSmoothnessMultiplierOFF = 0.25

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
        --print("NVG Animation called!")
        ApplySpecialVisualEnvironment("NightVision")
        states = VisualEnvironmentManager:GetStates()

        for _, state in pairs(states) do
          --print("Searching through states")
          if state.priority == 1000000 then
            --print("Found NVG State")
            currentstate = state
          end

        end

    elseif firstloop == false then
            if t <= 1.0 then
              --print(dTime)
              t = t + (animationSmoothnessMultiplierON * animationSmoothness * Animation:GetFramePercentage(dTime, animationSmoothness)) --Total time before it's done
              --print("Lerping... " .. t)
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
              --print("Reached End")
              return
            end
    end
end

function Animation:nvgDisableLoop()
  --print("Disable Animation")
  if firstloop ~= false then
      firstloop = false
      --print("NVG Disable Animation called!")
      ResetSpecialVisualEnvironment("NightVision")
      states = VisualEnvironmentManager:GetStates()

      for _, state in pairs(states) do
        --rint("Searching through states")
        if state.priority == 999999 then
          --print("Found NVG State")
          currentstate = state
        end

      end

  elseif firstloop == false then
      --print("Found NVG state!")
          if t <= 1.0 then
            --print("Lerping... " .. t)
            t = t + (animationSmoothnessMultiplierOFF * animationSmoothness * Animation:GetFramePercentage(dTime, animationSmoothness)) --Total time before it's done
            local lerp1 = MathUtils:Lerp(0.2, 1.0, t)--lerp(0, 1, t)
            currentstate.colorCorrection.brightness = Vec3((1.25*lerp1), (1.25*lerp1), (1.25*lerp1))
            VisualEnvironmentManager:SetDirty(true)
          elseif t >= 1.0 then
            done = true
            nvgRunner = false
            firstloop = true
            nvgDisable = false
            t = 0.0
            --print("Reached End")
            return
          end
  end
end

return Animation
