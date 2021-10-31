local Animation = class("Animation")

function Animation:__Init()

    Animation:RegisterVars()

end


function Animation:RegisterVars()

	self.nvgState = nil
	self.lerpFactor = 0
    self.currentState = nil
    self.fadeType = 1

    self.animationSmoothness = 1
    self.animationSmoothnessMultiplierON = 0.5
    self.animationSmoothnessMultiplierOFF = 0.25
    self.animationFinish = false
    self.animationRunning = false
    self.animationFirstLoop = true
    self.weatherFirstLoop = false

    self.localPlayer = nil
    self.states = nil
    self.type = nil
    self.deltaTime = 0

end

function Animation:printAnimationState()
    print("Lerp Factor: " .. tostring(self.lerpFactor))
    print("Fade Type: " .. tostring(self.fadeType))
    print("Animation Finished: " .. tostring(self.animationFinish))
    print("Animation Running: " .. tostring(self.animationRunning))
    print("Animation First Loop: " .. tostring(self.animationFirstloop))
end


function Animation:LerpLoop(deltaTime)

    self.deltaTime = deltaTime

    if self.animationFinish ~= true and self.animationRunning == true and self.fadeType == 1 then

        Animation:FadeIn('nightvision')

    elseif self.animationFinish ~= true and self.animationRunning == true and self.fadeType == 2 then

        Animation:FadeOut('nightvision')

    end

end


function Animation:GetFramePercentage(frameTime, totalTime)

	return frameTime / totalTime

end


function Animation:FadeIn(type, weatherPreset)

    if self.type == nil then
        self.type = type
    end

    self.fadeType = 1

    print("Type: " .. self.type)
    print("Fade Type: " .. self.fadeType)

    if self.type == 'nightvision' then

        self.animationRunning = true
        self.animationFinish = false

        if self.animationFirstLoop == true then

            Tool:DebugPrint('Animation: ' .. self.type .. ' called.', 'animation')

            self.localPlayer = PlayerManager:GetLocalPlayer()

            if self.localPlayer.inVehicle == true then

                Main:ApplyVisualEnvironment('NightVisionVehicle', 'special')
                self.nvgState = Tool:GetVisualEnvironmentState(1000001)

                if self.nvgState == nil then

                    Tool:DebugPrint('[ERROR] NightVisionVehicle VisualEnvironmentState could not be found for nvgEnableLoop', 'error')
                    self.animationRunning = false
                    self.animationFinish = true
                    return

                end

            else

                Main:ApplyVisualEnvironment('NightVision', 'special')
                self.nvgState = Tool:GetVisualEnvironmentState(1000001)

                if self.nvgState == nil then

                    Tool:DebugPrint('[ERROR] NightVision VisualEnvironmentState could not be found for nvgEnableLoop', 'error')
                    self.animationRunning = false
                    self.animationFinish = true
                    return

                end

            end

            self.animationFirstLoop = false

        elseif self.animationFirstLoop == false then

            if self.lerpFactor <= 1.0 then

                self.lerpFactor = self.lerpFactor + (self.animationSmoothnessMultiplierON * self.animationSmoothness * Animation:GetFramePercentage(self.deltaTime, self.animationSmoothness)) --Total time before it's done
                --print(self.nvgState.priority)
                local lerp1 = MathUtils:Lerp(0.2, 1.0, self.lerpFactor)--lerp(0, 1, t)
                local lerp2 = MathUtils:Lerp(0.0, 2.0, self.lerpFactor)--lerp(0, 2, t)
                self.nvgState.colorCorrection.brightness = Vec3((1.25*lerp1), (1.25*lerp1), (1.25*lerp1))
                self.nvgState.vignette.exponent = lerp2
                VisualEnvironmentManager:SetDirty(true)

            elseif self.lerpFactor >= 1.0 then

                self.lerpFactor = 0
                self.type = nil
                self.fadeType = 2
                self.animationFinish = true
                self.animationRunning = false
                self.animationFirstLoop = true
                Tool:DebugPrint('Lerping ended', 'nvg')
                return

            end

        end

    elseif self.type == 'weather' then

        self.animationRunning = true
        self.animationFinish = false

        if self.weatherFirstLoop ~= false then

            self.weatherFirstLoop = false
            Tool:DebugPrint('Weather Fade In Animation called!', 'weather')

            Main:ApplyVisualEnvironment(weatherPreset, 'weather')

            self.weatherState = Tool:GetVisualEnvironmentState(1000000)

            if self.weatherState == nil then

                Tool:DebugPrint('[ERROR] Weather VisualEnvironmentState could not be found for nvgEnableLoop', 'error')
                self.animationRunning = false
                self.animationFinish = true
                return

            end

        elseif self.weatherFirstLoop == false then

            if self.lerpFactor <= 1.0 then

                self.lerpFactor = self.lerpFactor + (self.weatherAnimationSmoothness * self.animationSmoothnessMultiplierON * self.animationSmoothness * Animation:GetFramePercentage(self.deltaTime, self.animationSmoothness)) --Total time before it's done
                local lerp1 = MathUtils:Lerp(0.0, 0.99, self.lerpFactor)--lerp(0, 1, t)
                self.weatherState.visibility = lerp1
                VisualEnvironmentManager:SetDirty(true)

            elseif self.lerpFactor >= 1.0 then

                self.animationFinish = true
                self.animationRunning = false
                self.weatherFirstLoop = true
                self.lerpFactor = 0
                Tool:DebugPrint('Lerping ended', 'weather')
                return

            end

        end

    end

end


function Animation:FadeOut(type, weatherPreset)

    if type == nil then
        return
    elseif type == 'weather' and weatherPreset == nil then
        return
    end

    self.type = type
    self.fadeType = 2

    if self.type == 'nightvision' then

        self.animationRunning = true
        self.animationFinish = false

        if self.animationFirstLoop == true then

            self.animationFirstLoop = false
            Tool:DebugPrint('Animation: ' .. self.type .. ' Fade Out called.', 'animation')

            self.localPlayer = PlayerManager:GetLocalPlayer()

            if self.localPlayer.inVehicle == true then

                Main:ResetVisualEnvironment('special')
                self.nvgState = Tool:GetVisualEnvironmentState(999998)

                if self.nvgState == nil then

                    Tool:DebugPrint('[ERROR] NightVisionVehicle VisualEnvironmentState could not be found for nvgDisableLoop', 'error')
                    self.animationRunning = false
                    self.animationFinish = true
                    return

                end

            else

                Main:ResetVisualEnvironment('special')
                self.nvgState = Tool:GetVisualEnvironmentState(999998)

                if self.nvgState == nil then

                    Tool:DebugPrint('[ERROR] NightVision VisualEnvironmentState could not be found for nvgEnableLoop', 'error')
                    self.animationRunning = false
                    self.animationFinish = true
                    return

                end

            end

        elseif self.animationFirstLoop == false then

            if self.lerpFactor <= 1.0 then



                self.lerpFactor = self.lerpFactor + (self.animationSmoothnessMultiplierOFF * self.animationSmoothness * Animation:GetFramePercentage(self.deltaTime, self.animationSmoothness)) --Total time before it's done
                local lerp1 = MathUtils:Lerp(0.2, 1.0, self.lerpFactor)--lerp(0, 1, t)
                self.nvgState.colorCorrection.brightness = Vec3((1.25*lerp1), (1.25*lerp1), (1.25*lerp1))
                VisualEnvironmentManager:SetDirty(true)

            elseif self.lerpFactor >= 1.0 then

                self.firstloopNVG = true
                self.lerpFactor = 0
                self.fadeType = 1
                Tool:DebugPrint('Lerping ended', 'nvg')
                self.animationRunning = false
                self.animationFinish = true
                self.animationFirstLoop = true
                return

            end

        end

    elseif self.type == 'weather' then

        self.animationRunning = true
        self.animationFinish = false

        if self.weatherFirstLoop ~= false then

            self.weatherFirstLoop = false
            Tool:DebugPrint('Weather Fade In Animation called!', 'weather')

            Main:ApplyVisualEnvironment(weatherPreset, 'weather')

            self.weatherState = Tool:GetVisualEnvironmentState(1000000)

            if self.weatherState == nil then

                Tool:DebugPrint('[ERROR] Weather VisualEnvironmentState could not be found for nvgEnableLoop', 'error')
                self.animationRunning = false
                return

            end

        elseif self.weatherFirstLoop == false then

            if self.lerpFactor <= 1.0 then

                self.lerpFactor = self.lerpFactor + (self.weatherAnimationSmoothness * self.animationSmoothnessMultiplierON * self.animationSmoothness * Animation:GetFramePercentage(self.deltaTime, self.animationSmoothness)) --Total time before it's done
                local lerp1 = MathUtils:Lerp(0.0, 0.99, self.lerpFactor)--lerp(0, 1, t)
                self.weatherState.visibility = lerp1
                VisualEnvironmentManager:SetDirty(true)

            elseif self.lerpFactor >= 1.0 then

                self.firstloopWeather = true
                self.lerpFactor = 0
                Tool:DebugPrint('Lerping ended', 'weather')
                self.animationRunning = false
                self.animationFinish = true
                return

            end

        end

    end

end


return Animation