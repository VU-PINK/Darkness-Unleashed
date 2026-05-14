-- --@type MapVEManager
-- local m_MapVEManager = require("Systems/MapVEManager")

local m_Logger = DULogger("NVG", false)

---@class NVG
---@overload fun(): NVG
local NVG = class("NVG")

function NVG:__init()
    self:RegisterVars()
    -- Set value on the UI
    UI:Batteries(self.m_BatteryLifeMin, self.m_BatteryLifeMax)
    self:RegisterEvents()
end

-- Systems/NVG.lua

function NVG:RegisterVars()
    -- Read NVG configuration from DU_CONFIG, fallback to defaults (maintain original hardcoded values)
    local nvgConfig = DU_CONFIG.NVG or {}
    self.m_Activated = false
    self.m_Transitioning = false
    self.m_BatteryLifeMax = nvgConfig.BATTERY_MAX or 120        -- Maximum battery capacity (full charge), directly determines the longest NVG use time, usually in seconds
    self.m_BatteryLifeMin = nvgConfig.BATTERY_MIN or 10         -- Minimum battery required to activate NVG, also in seconds
    self.m_BatteryEmptyTime = 0
    self.m_BatteryLifeCooldown = nvgConfig.BATTERY_COOLDOWN or 10  -- Cooldown time after battery is fully depleted (unit matches p_ElapsedTime, usually seconds)
    self.m_BatteryLifeCurrent = self.m_BatteryLifeMax           -- Current battery, initial value = full
    self.m_FadeLengthMS = nvgConfig.FADE_LENGTH_MS or 2000      -- Fade duration for NVG effect on/off (milliseconds). Smaller = faster transition, larger = smoother
    self.m_AnimationValue = 0
    self.m_AnimationT = 0
    self.m_CurrentNVGVE = nil
    self.m_Depleted = false  -- Flag indicating whether battery is depleted
    self.m_NVGVES = nil
end

-- DarknessClient will call this method after selecting a mode
function NVG:SetCurrentMode(mode)
    self.m_ModeFromClient = mode

    -- Read mode preset mapping from DU_CONFIG; if missing, fallback to original hardcoded defaults
    local nvgConfig = DU_CONFIG.NVG
    local ModePresets = nil
    if nvgConfig and nvgConfig.MODE_PRESETS then
        ModePresets = nvgConfig.MODE_PRESETS
    else
        -- Default mapping (consistent with original hardcoded values)
        ModePresets = {
            Night = {
                Soldier = "DU_FLIR",
                Vehicle = "DU_Vehicle_NVG",
                Vehicle_Thermal = "DU_Vehicle_Thermal"
            },
            NVG = {
                Soldier = "DU_FLIR",
                Vehicle = "DU_Vehicle_NVG",
                Vehicle_Thermal = "DU_Vehicle_Thermal"
            },
            Morning = {
                Soldier = "DU_FLIR",
                Vehicle = "DU_Vehicle_NVG",
                Vehicle_Thermal = "DU_Vehicle_Thermal"
            }
        }
    end

    self.m_NVGVES = ModePresets[mode] -- If not in table, it will be nil
    m_Logger:Write('NVG current mode set to: '..tostring(mode))
end



function NVG:RegisterEvents()
    Events:Subscribe('Level:Destroy', self, self._OnLevelDestroy)
    NetEvents:Subscribe('DarknessServer:VehicleInteract', self, self._OnVehicleInteract)
    -- Events:Subscribe('TimeServer:TimeInform', self, self._OnTimeInform)
end

function NVG:_OnLevelDestroy()
    self:RegisterVars()
end

-- ---@param p_Hour number
-- function NVG:_OnTimeInform(p_Hour)
--     local player = PlayerManager:GetLocalPlayer()

--     if player.inVehicle and self.m_Activated then
--         if p_Hour > 5 and p_Hour < 20 then
--             Events:Dispatch("VEManager:DisablePreset", self.m_CurrentNVGVE)
--             self.m_CurrentNVGVE = self.m_NVGVES["Vehicle_Thermal"]
--             Events:Dispatch("VEManager:EnablePreset", self.m_CurrentNVGVE)
--         else
--             Events:Dispatch("VEManager:DisablePreset", self.m_CurrentNVGVE)
--             self.m_CurrentNVGVE = self.m_NVGVES["Vehicle"]
--             Events:Dispatch("VEManager:EnablePreset", self.m_CurrentNVGVE)
--         end
--     end
-- end

---@param p_RecievedPlayerName string
function NVG:_OnVehicleInteract(p_RecievedPlayerName)
    -- What to do when a player (local) enters a vehicle, switch the preset being used.
    if not self.m_NVGVES then
        self:RegisterVars()
    end
    local player = PlayerManager:GetLocalPlayer()
    if self.m_Activated and p_RecievedPlayerName == player.name then
        if not player.inVehicle then
            m_Logger:Write('The player entered a Vehicle! Switching to NVG')

            Events:Dispatch("VEManager:DisablePreset", self.m_CurrentNVGVE)
            self.m_CurrentNVGVE = self.m_NVGVES["Vehicle"]
            Events:Dispatch("VEManager:EnablePreset", self.m_CurrentNVGVE)
        else
            m_Logger:Write('The player exited a Vehicle! Switching to Vehicle NVG')

            Events:Dispatch("VEManager:DisablePreset", self.m_CurrentNVGVE)
            self.m_CurrentNVGVE = self.m_NVGVES["Soldier"]
            Events:Dispatch("VEManager:EnablePreset", self.m_CurrentNVGVE)
        end
    end
end

function NVG:Activate(p_LevelName)
    if not self.m_NVGVES then
        self:RegisterVars()
    end
    m_Logger:Write('NVG Activate called!')
    m_Logger:Write(self.m_BatteryLifeCurrent)
    if self.m_BatteryLifeCurrent >= self.m_BatteryLifeMin then

        -- Sufficient battery notification
        NetEvents:SendLocal("BatteryStatus", "Sufficient")
        if not self.m_Activated and self.m_CurrentNVGVE == nil then
            self.m_Activated = true
            local localPlayer = PlayerManager:GetLocalPlayer()
            if not localPlayer.inVehicle then
                self.m_CurrentNVGVE = self.m_NVGVES["Soldier"]
            else
                self.m_CurrentNVGVE = self.m_NVGVES["Vehicle_Thermal"]
                --self.m_CurrentNVGVE = self.m_NVGVES["Vehicle"]
            end
            Events:Dispatch("VEManager:FadeIn", self.m_CurrentNVGVE, self.m_FadeLengthMS)

            WebUI:ExecuteJS('playSound("sounds/Switch_ON.webm", 1.0, false);')
            m_Logger:Write('NVG Activate ...')
            UI:EnableGoggleIcon(true) -- Update UI battery icon
            self.m_Transitioning = true
        else
            if self.m_Activated then
                m_Logger:Write('NVG Already active | NVG:Activate()')
            else
                m_Logger:Write('Animation Running | NVG:Activate()')
            end
        end
    else
        m_Logger:Write('Not enough battery to activate | ' ..
            tostring(self.m_BatteryLifeCurrent) .. '/' .. tostring(self.m_BatteryLifeMax))
        m_Logger:Write('Needs more than ' .. tostring(self.m_BatteryLifeMin) .. ' to activate!')
        WebUI:ExecuteJS('window.showNVGAlert();')
        WebUI:ExecuteJS('playSound("sounds/Switch_EMPTY.webm", 1.0, false);')
    end
end

function NVG:Deactivate()
    m_Logger:Write('NVG Deactivate called!')
    if self.m_Activated and self.m_CurrentNVGVE ~= nil then
        self.m_Activated = false

        --Beep boop sound
        if self.m_Depleted then
            Events:Dispatch("VEManager:FadeOut", self.m_CurrentNVGVE, self.m_FadeLengthMS)
            WebUI:ExecuteJS('playSound("sounds/Switch_EMPTY.webm", 1.0, false);')
        else
            Events:Dispatch("VEManager:FadeOut", self.m_CurrentNVGVE, self.m_FadeLengthMS)
            WebUI:ExecuteJS('playSound("sounds/Switch_OFF.webm", 1.0, false);')
        end

        self.m_CurrentNVGVE = nil

        m_Logger:Write('Deactivate')
        UI:DisableGoggleIcon(true) -- Update UI battery icon
    else
        if not self.m_Activated then
            m_Logger:Write('NVG not active | NVG:Deactivate()')
        else
            m_Logger:Write('Animation Running | NVG:Deactivate()')
        end
    end
end




--[[When the player is on foot → battery decreases by 1 each time
When the player is in a vehicle → battery increases by 1 each time (auto recharges inside the vehicle?)
When battery <= 0 → trigger depletion logic + disable icon
The battery depletion rate is related to how often the game calls Depleting(). Usually called once per second (if your loop is 1Hz), then m_BatteryLifeMax = 200 → drains in 200 seconds]]
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

    UI:Battery(self.m_BatteryLifeCurrent) -- Update UI battery
    m_Logger:Write("Battery Life: " .. self.m_BatteryLifeCurrent)


   -- Low battery warning, only once when battery drops below 10%
    if not self.m_LowBatteryWarned and self.m_BatteryLifeCurrent <= (self.m_BatteryLifeMax * 0.1) then
        NetEvents:SendLocal("BatteryStatus", "Low")
        self.m_LowBatteryWarned = true
    end

    if self.m_BatteryLifeCurrent <= 0 then
        m_Logger:Write('Battery has depleted!')

        if self.m_Activated then
            UI:DisableGoggleIcon(true) -- Update UI battery icon
            self.m_BatteryEmptyTime = p_ElapsedTime
            m_Logger:Write('Battery Depletion Animation Started')
            self.m_Depleted = true
            self:Deactivate()
        end
    end
end

--[[After depletion, wait m_BatteryLifeCooldown seconds before recharging can begin
Recharging increases by +1 each time, same rate as depletion
In-vehicle also seems to recharge instantly (see Depleting)]]
function NVG:Recharging(p_ElapsedTime)
    if self.m_BatteryEmptyTime + self.m_BatteryLifeCooldown > p_ElapsedTime then
        return
    end

    -- Show Enabled/Disabled Goggles icon
    if self.m_BatteryLifeCurrent >= self.m_BatteryLifeMin then
        UI:DisableGoggleIcon(false) -- Update UI battery icon
        self.m_Depleted = false
    end

    if self.m_BatteryLifeCurrent < self.m_BatteryLifeMax then
        self.m_BatteryLifeCurrent = self.m_BatteryLifeCurrent + 1
        UI:Battery(self.m_BatteryLifeCurrent) -- Update UI battery
        m_Logger:Write("Battery Charged To: " .. self.m_BatteryLifeCurrent)
    end
end

return NVG()