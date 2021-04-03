local Settings = require '__shared/settings'
require 'version'

if Settings.dayNightEnabled == true then 
require 'time'
end

if Settings.dayNightEnabled ~= true and Settings.cineTools == true then 
require 'cinematictools'
end 

local presetValues = require '__shared/presets'

-- Code from https://gitlab.com/n4gi0s/vu-mapvote by N4gi0s
function getCurrentVersion()
    options = HttpOptions({}, 10);
    options.verifyCertificate = false;
    res = Net:GetHTTP("https://raw.githubusercontent.com/IllustrisJack/Darkness-Unleashed/development/mod.json", options);
    if res.status ~= 200 then
        return null;
    end
    json = json.decode(res.body);
    return json.Version;
end
function checkVersion()
    if getCurrentVersion() ~= localModVersion then
        print("Version: "..localModVersion)
        print("This mod seems to be out of date! Please visit https://github.com/IllustrisJack/Darkness-Unleashed/");
        print(json.Version .. ' is the latest version!')
      else
        print("Version: "..localModVersion)
        print("You're running the lastest version!")
    end
end
--

checkVersion();

local customMapNames = {
    MP_001 = 'Bazaar',
    MP_003 = 'Teheran',
    MP_007 = 'Caspian',
    MP_011 = 'Seine',
    MP_012 = 'Firestorm',
    MP_013 = 'Damavand',
    MP_017 = 'Noshahr',
    MP_018 = 'Kharg',
    MP_Subway = 'Metro',
    XP1_001 = 'Karkand',
    XP1_002 = 'Gulf',
    XP1_003 = 'Sharqi',
    XP1_004 = 'Wake',
    XP2_Palace = 'Donya',
    XP2_Office = 'Operation 925',
    XP2_Factory = 'Scrapmetal',
    XP2_Skybar = 'Ziba',
    XP3_Alborz = 'Alborz',
    XP3_Shield = 'Armored',
    XP3_Desert = 'Bandar',
    XP3_Valley = 'Death',
    XP4_Parl = 'Azadi',
    XP4_Quake = 'Epicenter',
    XP4_FD = 'Markaz',
    XP4_Rubble = 'Talah',
    XP5_001 = 'Riverside',
    XP5_002 = 'Nebandan',
    XP5_003 = 'Kiasar',
    XP5_004 = 'Sabalan'
}

local presetParameters = {
    Night = {
        colorCorrectionEnabled = false,
        sunFlareEnabled = false
    },
    Bright_Night = {
        colorCorrectionEnabled = true,
        sunFlareEnabled = true
    }
}

Events:Subscribe('Level:LoadResources', function(levelName, gameMode, isDedicatedServer)
    local mapName = levelName:match('/[^/]+'):sub(2) -- MP_001
    local mapPreset = Settings.MapPresets[mapName]
    local selectedPreset = presetValues[mapPreset]

    if selectedPreset ~= nil then
        local mapParameters = presetParameters[mapPreset]
        RCON:SendCommand('vu.ColorCorrectionEnabled', {tostring(mapParameters.colorCorrectionEnabled)})
        RCON:SendCommand('vu.SunFlareEnabled', {tostring(mapParameters.sunFlareEnabled)})
        print('Using Preset Blue-Filter Setting: ' .. tostring(tostring(mapParameters.colorCorrectionEnabled)))

        local customMapName = nil
        if mapPreset == 'Bright_Night' then
          customMapName = customMapNames[mapName] .. ' Bright Night'
        else
          customMapName = customMapNames[mapName] .. ' ' .. mapPreset
        end
        ServerUtils:SetCustomMapName(customMapName)
    else
        RCON:SendCommand('vu.ColorCorrectionEnabled', {tostring(Settings.Standardusebluefilter)})
        print('Using Standard Blue-Filter Setting: ' .. tostring(tostring(Settings.Standardusebluefilter)))
    end
end)

Events:Subscribe('Level:Destroy', function(levelName, gameMode, isDedicatedServer)
    ServerUtils:ClearCustomMapName()
end)



--[[Events:Subscribe('Vehicle:Destroyed', function(vehicle, vehiclePoints, hotTeam)

    print(vehicle)
    ChatManager:SendMessage('Destroyed Vehicle ID: ' .. tostring(vehicle.uniqueId))
    NetEvents:Broadcast('Vehicle:DestroyedID', vehicle.uniqueId)

end)
]]