local Animation = class("Animation")

function Animation:__init()

	self.nvgState = nil
	self.lerpFactor = 0
	self.firstloopNVG = nil
	self.firstloopWeather = nil
	self.weatherFadeDone = nil
--
end

done = false
local states = nil
nvgEnable = false
nvgDisable = false
local currentstate = nil
local animationSmoothness = 1
local animationSmoothnessMultiplierON = 0.5
local animationSmoothnessMultiplierOFF = 0.25
local weatherAnimationSmoothness = 0.25
local localPlayer = nil
local dTime = nil

Events:Subscribe('DeltaTime', function(deltaTime)
	dTime = deltaTime
end)

function Animation:GetFramePercentage(frameTime, totalTime)

	return (frameTime / totalTime)

end

function Animation:nvg()
	
	if done ~= true and nvgEnable == true and nvgDisable ~= true then
		Animation:nvgEnableLoop()
	elseif done ~= true and nvgDisable == true and nvgEnable ~= true then
    	Animation:nvgDisableLoop()
	end

end

function Animation:nvgEnableLoop()

	if self.firstloopNVG ~= false then
		self.firstloopNVG = false
		Tool:DebugPrint('NVG Animation called!', 'nvg')

		local localPlayer = PlayerManager:GetLocalPlayer()

		if localPlayer.inVehicle == true then 

			ApplySpecialVisualEnvironment('NightVisionVehicle')
			--print('Hola')
			self.nvgState = Tool:GetVisualEnvironmentState(1000001)
			--print(self.nvgState)

			if self.nvgState == nil then

				Tool:DebugPrint('[ERROR] VisualEnvironmentState could not be found for nvgEnableLoop', 'error')
				return

			end

		else

			ApplySpecialVisualEnvironment('NightVision')
			--print('Hola2')
			self.nvgState = Tool:GetVisualEnvironmentState(1000001)
			--print(self.nvgState)

			if self.nvgState == nil then

				Tool:DebugPrint('[ERROR] wisualEnvironmentState could not be found for nvgEnableLoop', 'error')
				return

			end

		end

	elseif self.firstloopNVG == false then

		if self.lerpFactor <= 1.0 then

			self.lerpFactor = self.lerpFactor + (animationSmoothnessMultiplierON * animationSmoothness * Animation:GetFramePercentage(dTime, animationSmoothness)) --Total time before it's done
			--print(self.nvgState.priority)
			local lerp1 = MathUtils:Lerp(0.2, 1.0, self.lerpFactor)--lerp(0, 1, t)
			local lerp2 = MathUtils:Lerp(0.0, 2.0, self.lerpFactor)--lerp(0, 2, t)
			self.nvgState.colorCorrection.brightness = Vec3((1.25*lerp1), (1.25*lerp1), (1.25*lerp1))
			self.nvgState.vignette.exponent = lerp2 
			VisualEnvironmentManager:SetDirty(true)

		elseif self.lerpFactor >= 1.0 then

			done = true
			nvgRunner = false
			self.firstloopNVG = true
			nvgEnable = false
			self.lerpFactor = 0
			Tool:DebugPrint('Lerping ended', 'nvg')
			return

		end

	end
end

function Animation:nvgDisableLoop()
	-- ToDo: save VE state and use that

	if self.firstloopNVG ~= false then
		self.firstloopNVG = false
		Tool:DebugPrint('NVG Disable Animation called!', 'nvg')

		localPlayer = PlayerManager:GetLocalPlayer()

		ResetSpecialVisualEnvironment()
		self.nvgState = Tool:GetVisualEnvironmentState(999999)

		if self.nvgState == nil then

			Tool:DebugPrint('[ERROR] VisualEnvironmentState could not be found for nvgDisableLoop', 'error')
			return

		end

	elseif self.firstloopNVG == false then

		if self.lerpFactor <= 1.0 then

			self.lerpFactor = self.lerpFactor + (animationSmoothnessMultiplierOFF * animationSmoothness * Animation:GetFramePercentage(dTime, animationSmoothness)) --Total time before it's done
			--print(self.nvgState.priority)
			local lerp1 = MathUtils:Lerp(0.2, 1.0, self.lerpFactor)--lerp(0, 1, t)
			self.nvgState.colorCorrection.brightness = Vec3((1.25*lerp1), (1.25*lerp1), (1.25*lerp1))
			VisualEnvironmentManager:SetDirty(true)

		elseif self.lerpFactor >= 1.0 then

			done = true
			nvgRunner = false
			self.firstloopNVG = true
			nvgDisable = false
			self.lerpFactor = 0
			Tool:DebugPrint('Lerping ended', 'nvg')
			return

		end

	end
end


function Animation:Weather(weatherType)

	if weatherFadeIn == true then
		Animation:WeatherFadeIn(weatherType) 
	elseif weatherFadeOut == true then
		Animation:WeatherFadeOut() 
	end 

end


function Animation:WeatherFadeIn(weatherType) 

	if self.firstloopWeather ~= false then

		self.firstloopWeather = false
		Tool:DebugPrint('Weather Fade In Animation called!', 'weather')

		ApplySpecialVisualEnvironment(weatherType)

		self.weatherState = Tool:GetVisualEnvironmentState(1000000)

		if self.weatherState == nil then

			Tool:DebugPrint('[ERROR] visualEnvironmentState could not be found for nvgEnableLoop', 'error')
			return

		end

	elseif self.firstloopWeather == false then

		if self.lerpFactor <= 1.0 then

			self.lerpFactor = self.lerpFactor + (weatherAnimationSmoothness * animationSmoothnessMultiplierON * animationSmoothness * Animation:GetFramePercentage(dTime, animationSmoothness)) --Total time before it's done
			local lerp1 = MathUtils:Lerp(0.0, 0.99, self.lerpFactor)--lerp(0, 1, t)
			self.weatherState.visibility = lerp1
			VisualEnvironmentManager:SetDirty(true)

		elseif self.lerpFactor >= 1.0 then

			weatherRunner = false
			self.firstloopWeather = true
			self.lerpFactor = 0
			Tool:DebugPrint('Lerping ended', 'weather')
			return

		end

	end

end 

function Animation:WeatherFadeOut() 

	if self.firstloopWeather ~= false then

		self.firstloopWeather = false
		Tool:DebugPrint('Weather Fade Animation called!', 'weather')

		if self.weatherState == nil then

			Tool:DebugPrint('[ERROR] visualEnvironmentState could not be found for nvgEnableLoop', 'error')
			return

		end

	elseif self.firstloopWeather == false then

		if self.lerpFactor <= 1.0 then

			self.lerpFactor = self.lerpFactor + (weatherAnimationSmoothness * animationSmoothnessMultiplierON * animationSmoothness * Animation:GetFramePercentage(dTime, animationSmoothness)) --Total time before it's done
			local lerp1 = MathUtils:Lerp(0.99, 0, self.lerpFactor)--lerp(0, 1, t)
			self.weatherState.visibility = lerp1
			VisualEnvironmentManager:SetDirty(true)

		elseif self.lerpFactor >= 1.0 then

			weatherRunner = false
			self.firstloopWeather = true
			self.lerpFactor = 0
			Tool:DebugPrint('Lerping ended', 'weather')
			return

		end

	end

end 


return Animation
