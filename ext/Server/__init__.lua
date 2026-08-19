---@class DarknessServer
---@overload fun(): DarknessServer
DarknessServer = class("DarknessServer")
local m_Logger = DULogger("DarknessServer", false)

-- Load server vehicle controller to handle light toggle net events from clients
require("__shared/Settings")
if DU_CONFIG.VEHICLES.USE_VEHICLE_LIGHTS then
  require("ServerVehicleController")
end

function DarknessServer:__init()
  self:RegisterEvents()
end

function DarknessServer:RegisterEvents()
  NetEvents:Subscribe("VEManager:PresetsLoaded", self, self._OnPresetsLoaded)
  -- The ClientVehicleController:ToggleLights net event is handled by ServerVehicleController.
  Events:Subscribe('Vehicle:Enter', self, self._OnVehicleInteract)

  -- Listen for battery status from client
  NetEvents:Subscribe("BatteryStatus", self, self.OnBatteryStatus)
  -- Listen for "current preset name" from client
  NetEvents:Subscribe("Darkness:SyncPresetName", self, self.OnSyncPresetName)
  -- Yell when player respawns
  Events:Subscribe("Player:Respawn", self, self.OnPlayerRespawn)
end

---@function ToggleForPlayer@DarknessServer
--- Performs the actual logic to fire the 'ToggleLights' event on a player's vehicle.
--- @param player Player The player who issued the command.
function DarknessServer:ToggleForPlayer(player)
  if player and player.controlledControllable then
    local vehicleEntity = ControllableEntity(player.controlledControllable)
    if not vehicleEntity or vehicleEntity.data.partition == nil then
      print("Darkness-Unleashed Error: Could not get components for " .. player.name .. "'s vehicle.")
      return
    end

    local interface = VehicleBlueprint(vehicleEntity.data.partition.primaryInstance).descriptor
    vehicleEntity.bus:FireEvent(interface, 'ToggleLights')
  else
    print("Darkness-Unleashed Error: Chat received toggle command from invalid or non-vehicular player session.")
  end
    self:RegisterEvents()
    self.m_CurrentPreset = nil
end


-- Required for day/night cycle maps, but not recommended
--[[function DarknessServer:setDayNightCycle(p_StartingTime, p_LengthOfCycle)
    -- Is time static?
    if p_LengthOfCycle <= 0 then
        ---@diagnostic disable-next-line: cast-local-type
        p_LengthOfCycle = nil
    end

  -- Fix incorrect time
  if p_StartingTime < 0 or p_StartingTime >= 24 then
    p_StartingTime = 0
  end

  local l_OnlyDynamicPresets = DU_CONFIG.TIME.ONLY_DYNAMIC_PRESETS

  Events:Dispatch('TimeServer:Enable', p_StartingTime, p_LengthOfCycle, l_OnlyDynamicPresets)
end

function DarknessServer:_OnPresetsLoaded()
    -- This causes crashes when some maps start loading and spawning bots. Delegating this responsability to VEManager directly.
    if DU_CONFIG.TIME.ENABLED then
        self:setDayNightCycle(DU_CONFIG.TIME.START_HOUR, DU_CONFIG.TIME.DAY_DURATION)
    end
end]]

-- Client sends preset name
function DarknessServer:OnSyncPresetName(p_Player, p_PresetName)
    self.m_CurrentPreset = p_PresetName
    m_Logger:Write("Received current preset from client " .. p_Player.name .. ": " .. tostring(p_PresetName))
end

-- Tell the player when respawning
function DarknessServer:OnPlayerRespawn(p_Player)
    if self.m_CurrentPreset ~= nil then
        ChatManager:Yell("Current visual preset: " .. tostring(self.m_CurrentPreset), 5.0, p_Player)
    end
end

-- Receive battery status from client and Yell
function DarknessServer:OnBatteryStatus(p_Player, status)
    if status == "Sufficient" then
        ChatManager:Yell("Battery sufficient, NVG ready", 5, p_Player)
    elseif status == "Low" then
        ChatManager:Yell("Battery below 10%, use sparingly", 5, p_Player)
    end
    m_Logger:Write("Yelled battery status to player: " .. p_Player.name .. " Status: " .. status)
end

DarknessServer = DarknessServer()

return DarknessServer