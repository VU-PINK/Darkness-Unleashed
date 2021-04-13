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
local animationSmoothness = 1
local animationSmoothnessMultiplierON = 0.5
local animationSmoothnessMultiplierOFF = 0.25
local localPlayer = nil
local dTime = nil

local nvgState = nil

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
	if firstloop ~= false then
		firstloop = false
		Tool:DebugPrint('NVG Animation called!', 'nvg')

		localPlayer = PlayerManager:GetLocalPlayer()
		if localPlayer.inVehicle == true then 
			ApplySpecialVisualEnvironment("NightVisionVehicle")
		else
			ApplySpecialVisualEnvironment("NightVision")
		end

		if nvgState == nil then
			nvgState = Tool:GetVisualEnvironmentState(1000000)
			if nvgState == nil then
				Tool:DebugPrint('[ERROR] VisualEnvironmentState could not be found for nvgDisableLoop', 'error')
				return
			end
		end

	elseif firstloop == false then
		if t <= 1.0 then
			t = t + (animationSmoothnessMultiplierON * animationSmoothness * Animation:GetFramePercentage(dTime, animationSmoothness)) --Total time before it's done
			local lerp1 = MathUtils:Lerp(0.2, 1.0, t)--lerp(0, 1, t)
			local lerp2 = MathUtils:Lerp(0.0, 2.0, t)--lerp(0, 2, t)
			nvgState.colorCorrection.brightness = Vec3((1.25*lerp1), (1.25*lerp1), (1.25*lerp1))
			nvgState.vignette.exponent = lerp2 
			VisualEnvironmentManager:SetDirty(true)
		elseif t >= 1.0 then
			done = true
			nvgRunner = false
			firstloop = true
			nvgEnable = false
			t = 0.0
			Tool:DebugPrint('Lerping ended', 'nvg')
			return
		end
	end
end

function Animation:nvgDisableLoop()
	-- ToDo: save VE state and use that

	if firstloop ~= false then
		firstloop = false
		Tool:DebugPrint('NVG Disable Animation called!', 'nvg')
		ResetSpecialVisualEnvironment("NightVision")
		ResetSpecialVisualEnvironment("NightVisionVehicle")

		if nvgState == nil then
			nvgState = Tool:GetVisualEnvironmentState(1000000)
			if nvgState == nil then
				Tool:DebugPrint('[ERROR] VisualEnvironmentState could not be found for nvgDisableLoop', 'error')
				return
			end
		end

	elseif firstloop == false then
		if t <= 1.0 then
			t = t + (animationSmoothnessMultiplierOFF * animationSmoothness * Animation:GetFramePercentage(dTime, animationSmoothness)) --Total time before it's done
			local lerp1 = MathUtils:Lerp(0.2, 1.0, t)--lerp(0, 1, t)
			nvgState.colorCorrection.brightness = Vec3((1.25*lerp1), (1.25*lerp1), (1.25*lerp1))
			VisualEnvironmentManager:SetDirty(true)
		elseif t >= 1.0 then
			done = true
			nvgRunner = false
			firstloop = true
			nvgDisable = false
			t = 0.0
			return
		end
	end
end

return Animation
