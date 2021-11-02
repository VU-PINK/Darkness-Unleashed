local m_Logger = Logger("NVG", false)
class("NVG")

function NVG:__init()
    self:RegisterVars()
    -- Set value on the UI
	g_UI:Batteries(self.m_BatteryLifeMin, self.m_BatteryLifeMax)
end

function NVG:RegisterVars()
    self.m_Activated = false
    self.m_BatteryLifeMax = 60
    self.m_BatteryLifeMin = 10
    self.m_BatteryEmptyTime = 0
    self.m_BatteryLifeCooldown = 10
    self.m_BatteryLifeCurrent = 60
    self.m_FadeLengthMS = 2500
end

function NVG:Activate()
    m_Logger:Write('NVG Activate called!')
    if self.m_BatteryLifeCurrent >= self.m_BatteryLifeMin then

        if not self.m_Activated then
            self.m_Activated = true
            g_VEManagerClient.m_LerpingSingleValues[#g_VEManagerClient.m_LerpingSingleValues + 1] = self.fogValues
            Events:Dispatch("VEManager:FadeIn", "DU_NVG", self.m_FadeLengthMS)
            WebUI:ExecuteJS('playSound("/sounds/Switch_ON.ogg", 1.0, false);')
            m_Logger:Write('NVG Activate ...')
            g_UI:GoggleIcon(true) -- Update UI battery icon
        else
			if self.m_Activated then
				m_Logger:Write('NVG Already active | NVG:Activate()')
			else
				m_Logger:Write('Animation Running | NVG:Activate()')
			end
        end
    else
        m_Logger:Write('Not enough battery to activate | ' .. tostring(self.m_BatteryLifeCurrent) .. '/' .. tostring(self.m_BatteryLifeMax))
        m_Logger:Write('Needs more than ' .. tostring(self.m_BatteryLifeMin) .. ' to activate!')
    end
end

function NVG:Deactivate()
    m_Logger:Write('NVG Deactivate called!')
    if self.m_Activated then
        self.m_Activated = false
        Events:Dispatch("VEManager:FadeOut", "DU_NVG", self.m_FadeLengthMS)
        --Beep boop sound
        WebUI:ExecuteJS('playSound("/sounds/Switch_OFF.ogg", 1.0, false);')
        m_Logger:Write('Deactivate')
        g_UI:DisableGoggleIcon(true) -- Update UI battery icon
    else
		if not self.m_Activated then
			m_Logger:Write('NVG not active | NVG:Deactivate()')
		else
			m_Logger:Write('Animation Running | NVG:Deactivate()')
		end
    end
end

function NVG:Depleting(p_ElapsedTime)
    local s_LocalPlayer = PlayerManager:GetLocalPlayer()

    if s_LocalPlayer == nil then
        return
    end

    if s_LocalPlayer.inVehicle then
        if self.m_BatteryLifeCurrent + 1 < self.m_BatteryLifeMax then
            self.m_BatteryLifeCurrent = self.m_BatteryLifeCurrent + 1
        end
    elseif self.m_BatteryLifeCurrent > 0 then
		self.m_BatteryLifeCurrent = self.m_BatteryLifeCurrent - 1
    end

	g_UI:Battery(self.m_BatteryLifeCurrent) -- Update UI battery
    m_Logger:Write("Battery Life: " .. self.m_BatteryLifeCurrent)

    if self.m_BatteryLifeCurrent <= 0 then
        m_Logger:Write('Battery has depleted!')

        if self.m_Activated then
            g_UI:DisableGoggleIcon(true) -- Update UI battery icon
            self.m_BatteryEmptyTime = p_ElapsedTime
            m_Logger:Write('Battery Depletion Animation Started')
            self:Deactivate()
        end
    end
end

function NVG:Recharging(p_ElapsedTime)
    if self.m_BatteryEmptyTime + self.m_BatteryLifeCooldown > p_ElapsedTime then
        return
	end

	-- Show Enabled/Disabled Goggles icon
	if self.m_BatteryLifeCurrent >= self.m_BatteryLifeMin then
		g_UI:DisableGoggleIcon(false) -- Update UI battery icon
	end

    if self.m_BatteryLifeCurrent < self.m_BatteryLifeMax then
        self.m_BatteryLifeCurrent = self.m_BatteryLifeCurrent + 1
		g_UI:Battery(self.m_BatteryLifeCurrent) -- Update UI battery
        m_Logger:Write("Battery Charged To: " .. self.m_BatteryLifeCurrent)
    end
end

if g_NVG == nil then
    g_NVG = NVG()
end

return g_NVG