local Animation = class("Animation")

function Animation:__Init()

    Animation:RegisterVars()

end 


function Animation:RegisterVars()

	self.nvgState = nil
	self.lerpFactor = 0
    self.currentState = nil 

    self.animationSmoothness = 1 
    self.animationSmoothnessMultiplierON = 0.5
    self.animationSmoothnessMultiplierOFF = 0.25
    self.animationFinish = false 
    self.animationRunning = false
    self.animationFirstLoop = false 
    self.weatherFirstLoop = false 

    self.localPlayer = nil
    self.states = nil
    self.type = nil
    self.deltaTime = 0

end


function Animation:Lerper(deltaTime)

    self.deltaTime = deltaTime

    if self.animationFinish ~= true and self.animationRunning == true then
        
        Animation:FadeIn()

    end 

end


function Animation:GetFramePercentage(frameTime, totalTime)

	return frameTime / totalTime

end


function Animation:FadeIn(type, weatherPreset)

    self.type = type

    if self.type == 'nightvision' then 

        self.animationRunning = true 

        if self.animationFirstLoop ~= false then 

            self.animationFirstLoop = false 
            Tool:DebugPrint('Animation: ' .. self.type .. ' called.', 'animation')

            self.localPlayer = PlayerManager:GetLocalPlayer()

            if self.localPlayer.inVehicle == true then

                Main:ApplyVisualEnvironment('NightVisionVehicle', 'special')
                self.nvgState = Tool:GetVisualEnvironmentState(1000001)

                if self.nvgState == nil then

                    Tool:DebugPrint('[ERROR] VisualEnvironmentState could not be found for nvgEnableLoop', 'error')
                    return

                end

            else

                Main:ApplyVisualEnvironment('NightVision', 'special')
                self.nvgState = Tool:GetVisualEnvironmentState(1000001)

                if self.nvgState == nil then

                    Tool:DebugPrint('[ERROR] wisualEnvironmentState could not be found for nvgEnableLoop', 'error')
                    return

                end

            end

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
    
                self.animationFinish = true
                self.animationRunning = false
                self.animationFirstLoop = true
                self.lerpFactor = 0
                Tool:DebugPrint('Lerping ended', 'nvg')
                return
    
            end
    
        end

    elseif self.type == 'weather' then  

        self.animationRunning = true 

        if self.weatherFirstLoop ~= false then

            self.weatherFirstLoop = false
            Tool:DebugPrint('Weather Fade In Animation called!', 'weather')
    
            Main:ApplyVisualEnvironment(weatherPreset, 'weather')
    
            self.weatherState = Tool:GetVisualEnvironmentState(1000000)
    
            if self.weatherState == nil then
    
                Tool:DebugPrint('[ERROR] visualEnvironmentState could not be found for nvgEnableLoop', 'error')
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

    if type == nil or preset == nil then 
        return 
    end 

    self.type = type

    if self.type == 'nightvision' then 

        self.animationRunning = true 

        if self.animationFirstLoop ~= false then 

            self.animationFirstLoop = true 
            Tool:DebugPrint('Animation: ' .. self.type .. ' called.', 'animation')

            self.localPlayer = PlayerManager:GetLocalPlayer()

            if self.localPlayer.inVehicle == true then

                Main:ResetVisualEnvironment('NightVisionVehicle', 'special')
                self.nvgState = Tool:GetVisualEnvironmentState(999999)

                if self.nvgState == nil then

                    Tool:DebugPrint('[ERROR] VisualEnvironmentState could not be found for nvgDisableLoop', 'error')
                    return
        
                end

            end

        elseif self.animationFirstLoop == false then

            if self.lerpFactor <= 1.0 then
    
                self.lerpFactor = self.lerpFactor + (animationSmoothnessMultiplierOFF * animationSmoothness * Animation:GetFramePercentage(dTime, animationSmoothness)) --Total time before it's done
                local lerp1 = MathUtils:Lerp(0.2, 1.0, self.lerpFactor)--lerp(0, 1, t)
                self.nvgState.colorCorrection.brightness = Vec3((1.25*lerp1), (1.25*lerp1), (1.25*lerp1))
                VisualEnvironmentManager:SetDirty(true)
    
            elseif self.lerpFactor >= 1.0 then
    
                self.firstloopNVG = true
                self.lerpFactor = 0
                Tool:DebugPrint('Lerping ended', 'nvg')
                return
    
            end
    
        end

    elseif self.type == 'weather' then  

        self.animationRunning = true 

        if self.weatherFirstLoop ~= false then

            self.weatherFirstLoop = false
            Tool:DebugPrint('Weather Fade In Animation called!', 'weather')
    
            Main:ApplyVisualEnvironment(weatherPreset, 'weather')
    
            self.weatherState = Tool:GetVisualEnvironmentState(1000000)
    
            if self.weatherState == nil then
    
                Tool:DebugPrint('[ERROR] visualEnvironmentState could not be found for nvgEnableLoop', 'error')
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
                return
    
            end
    
        end
    
    end

end


return Animation