require '__client/presets'
require '__shared/settings'
require('__server/version')

function getCurrentVersion()
    options = HttpOptions({}, 10);
    options.verifyCertificate = false; --ignore cert for wine users
    res = Net:GetHTTP("https://raw.githubusercontent.com/IllustrisJack/Darkness-Unleashed/live/mod.json", options);
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
      else
        print("Version: "..localModVersion)
        print("You're running the lastest version!")
    end
end

checkVersion();

Events:Subscribe('Level:LoadResources', function(levelName, gameMode, isDedicatedServer)

        print(levelName)

        -- Vanilla Maps
        ------------------------------------------------------------------------

        -- Bazaar
        if string.find(levelName, "MP_001") then
              if Map['Bazaar.Night'] then
                  ServerUtils:SetCustomMapName("Bazaar Night")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
              elseif Map['Bazaar.Morning'] then
                  ServerUtils:SetCustomMapName("Bazaar Morning")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              elseif Map['Bazaar.Bright_Night'] then
                  ServerUtils:SetCustomMapName("Bazaar Bright Night")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
              elseif Map['Bazaar.Evening'] then
                  ServerUtils:SetCustomMapName("Bazaar Evening")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              elseif Map[1] == nil then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {standardusebluefilter})
                  print('Using Standard Blue-Filter Setting: ' .. tostring(standardusebluefilter))
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Teheran Highway
        if string.find(levelName, "MP_003") then
              if Map['Teheran.Night'] then
                  ServerUtils:SetCustomMapName("Teheran Night")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
              elseif Map['Teheran.Morning'] then
                  ServerUtils:SetCustomMapName("Teheran Morning")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              elseif Map['Teheran.Bright_Night'] then
                  ServerUtils:SetCustomMapName("Teheran Bright Night")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
              elseif Map['Teheran.Evening'] then
                  ServerUtils:SetCustomMapName("Teheran Evening")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter enabled')
              elseif Map[2] == nil then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {standardusebluefilter})
                  print('Using Standard Blue-Filter Setting: '..standardusebluefilter)
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Caspian Border
        if string.find(levelName, "MP_007") then
              if Map['Caspian.Night'] then
                  ServerUtils:SetCustomMapName("Caspian Night")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
              elseif Map['Caspian.Morning'] then
                  ServerUtils:SetCustomMapName("Caspian Morning")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              elseif Map['Caspian.Bright_Night'] then
                  ServerUtils:SetCustomMapName("Caspian Bright Night")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
              elseif Map['Caspian.Evening'] then
                  ServerUtils:SetCustomMapName("Caspian Evening")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              elseif Map[3] == nil then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {standardusebluefilter})
                  print('Using Standard Blue-Filter Setting: '..standardusebluefilter)
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Seine Crossing
        if string.find(levelName, "MP_011") then
              if Map['Seine.Night'] then
                  ServerUtils:SetCustomMapName("Seine Night")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
              elseif Map['Seine.Morning'] then
                  ServerUtils:SetCustomMapName("Seine Morning")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              elseif Map['Seine.Bright_Night'] then
                  ServerUtils:SetCustomMapName("Seine Bright Night")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
              elseif Map['Seine.Evening'] then
                  ServerUtils:SetCustomMapName("Seine Evening")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              elseif Map[4] == nil then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {standardusebluefilter})
                  print('Using Standard Blue-Filter Setting: '..standardusebluefilter)
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Operation Firestorm
        if string.find(levelName, "MP_012") then
              if Map['Firestorm.Night'] then
                  ServerUtils:SetCustomMapName("Firestorm Night")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
              elseif Map['Firestorm.Morning'] then
                  ServerUtils:SetCustomMapName("Firestorm Morning")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              elseif Map['Firestorm.Bright_Night'] then
                  ServerUtils:SetCustomMapName("Firestorm Bright Night")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
              elseif Map['Firestorm.Evening'] then
                  ServerUtils:SetCustomMapName("Firestorm Evening")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              elseif Map[5] == nil then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {standardusebluefilter})
                  print('Using Standard Blue-Filter Setting: '..standardusebluefilter)
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Davamand Peak
		    if string.find(levelName, "MP_013") then
              if Map['Davamand.Night'] then
                  ServerUtils:SetCustomMapName("Davamand Night")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
              elseif Map['Davamand.Morning'] then
                  ServerUtils:SetCustomMapName("Davamand Morning")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              elseif Map['Davamand.Bright_Night'] then
                  ServerUtils:SetCustomMapName("Davamand Bright Night")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
              elseif Map['Davamand.Evening'] then
                  ServerUtils:SetCustomMapName("Davamand Evening")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              elseif Map[6] == nil then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {standardusebluefilter})
                  print('Using Standard Blue-Filter Setting: '..standardusebluefilter)
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Noshahr Canals
		    if string.find(levelName, "MP_017") then
              if Map['Noshahr.Night'] then
                  ServerUtils:SetCustomMapName("Noshahr Night")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
              elseif Map['Noshahr.Morning'] then
                  ServerUtils:SetCustomMapName("Noshahr Morning")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              elseif Map['Noshar.Bright_Night'] then
                  ServerUtils:SetCustomMapName("Noshahr Bright Night")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
              elseif Map['Noshahr.Evening'] then
                  ServerUtils:SetCustomMapName("Noshahr Evening")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              elseif Map[7] == nil then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {standardusebluefilter})
                  print('Using Standard Blue-Filter Setting: '..standardusebluefilter)
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Noshahr Canals
        if string.find(levelName, "MP_018") then
              if Map['Kharg.Night'] then
                  ServerUtils:SetCustomMapName("Kharg Night")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
              elseif Map['Kharg.Morning'] then
                  ServerUtils:SetCustomMapName("Kharg Morning")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              elseif Map['Kharg.Bright_Night'] then
                  ServerUtils:SetCustomMapName("Kharg Bright Night")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
              elseif Map['Kharg.Evening'] then
                  ServerUtils:SetCustomMapName("Kharg Evening")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              elseif Map[8] == nil then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {standardusebluefilter})
                  print('Using Standard Blue-Filter Setting: '..standardusebluefilter)
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Operation Metro
        if string.find(levelName, "MP_Subway") then
              if Map['Metro.Night'] then
                  ServerUtils:SetCustomMapName("Metro Night")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
              elseif Map['Metro.Morning'] then
                  ServerUtils:SetCustomMapName("Metro Morning")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              elseif Map['Metro.Bright_Night'] then
                  ServerUtils:SetCustomMapName("Metro Bright Night")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
              elseif Map['Metro.Evening'] then
                  ServerUtils:SetCustomMapName("Metro Evening")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter disabled')
              elseif Map[9] == nil then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {standardusebluefilter})
                  print('Using Standard Blue-Filter Setting: '..standardusebluefilter)
              else
                  print('Wrong Configuration')
                  return
              end
        end

        --- Back to Karkand maps | DLC
        ------------------------------------------------------------------------

        -- Back to Karkand
        if string.find(levelName, "XP1_001") then
              if Map['Karkand.Night'] then
                  ServerUtils:SetCustomMapName("Karkand Night")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
              elseif Map['Karkand.Morning'] then
                  ServerUtils:SetCustomMapName("Karkand Morning")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              elseif Map['Karkand.Bright_Night'] then
                  ServerUtils:SetCustomMapName("Karkand Bright Night")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
              elseif Map['Karkand.Evening'] then
                  ServerUtils:SetCustomMapName("Karkand Evening")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              elseif Map[10] == nil then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {standardusebluefilter})
                  print('Using Standard Blue-Filter Setting: '..standardusebluefilter)
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Gulf of Oman
        if string.find(levelName, "XP1_002") then
              if Map['Gulf.Night'] then
                  ServerUtils:SetCustomMapName("Gulf Night")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
              elseif Map['Gulf.Morning'] then
                  ServerUtils:SetCustomMapName("Gulf Morning")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              elseif Map['Gulf.Bright_Night'] then
                  ServerUtils:SetCustomMapName("Gulf Bright Night")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
              elseif Map['Gulf.Evening'] then
                  ServerUtils:SetCustomMapName("Gulf Evening")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              elseif Map[11] == nil then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {standardusebluefilter})
                  print('Using Standard Blue-Filter Setting: '..standardusebluefilter)
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Sharqi Peninsula
        if string.find(levelName, "XP1_003") then
              if Map['Sharqi.Night'] then
                  ServerUtils:SetCustomMapName("Sharqi Night")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
              elseif Map['Sharqi.Morning'] then
                  ServerUtils:SetCustomMapName("Sharqi Morning")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              elseif Map['Sharqi.Bright_Night'] then
                  ServerUtils:SetCustomMapName("Sharqi Bright Night")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
              elseif Map['Sharqi.Evening'] then
                  ServerUtils:SetCustomMapName("Sharqi Evening")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              elseif Map[12] == nil then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {standardusebluefilter})
                  print('Using Standard Blue-Filter Setting: '..standardusebluefilter)
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Wake Island
        if string.find(levelName, "XP1_004") then
              if Map['Wake.Night'] then
                  ServerUtils:SetCustomMapName("Wake Night")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
              elseif Map['Wake.Morning'] then
                  ServerUtils:SetCustomMapName("Wake Morning")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              elseif Map['Wake.Bright_Night'] then
                  ServerUtils:SetCustomMapName("Wake Bright Night")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
              elseif Map['Wake.Evening'] then
                  ServerUtils:SetCustomMapName("Wake Evening")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              elseif Map[13] == nil then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {standardusebluefilter})
                  print('Using Standard Blue-Filter Setting: '..standardusebluefilter)
              else
                  print('Wrong Configuration')
                  return
              end
        end

        --- Close Quarters | DLC
        ------------------------------------------------------------------------

        -- Donya Fortress
        if string.find(levelName, "XP2_Palace") then
              if Map['Donya.Night'] then
                  ServerUtils:SetCustomMapName("Donya Night")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
              elseif Map['Donya.Morning'] then
                  ServerUtils:SetCustomMapName("Donya Morning")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              elseif Map['Donya.Bright_Night'] then
                  ServerUtils:SetCustomMapName("Donya Bright Night")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
              elseif Map['Donya.Evening'] then
                  ServerUtils:SetCustomMapName("Donya Evening")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              elseif Map[14] == nil then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {standardusebluefilter})
                  print('Using Standard Blue-Filter Setting: '..standardusebluefilter)
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Operation 925
        if string.find(levelName, "XP2_Office") then
              if Map['Operation925.Night'] then
                  ServerUtils:SetCustomMapName("Operation 925 Night")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
              elseif Map['Operation925.Morning'] then
                  ServerUtils:SetCustomMapName("Operation 925 Morning")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              elseif Map['Operation925.Bright_Night'] then
                  ServerUtils:SetCustomMapName("Operation 925 Bright Night")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
              elseif Map['Operation925.Evening'] then
                  ServerUtils:SetCustomMapName("Operation 925 Evening")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              elseif Map[15] == nil then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {standardusebluefilter})
                  print('Using Standard Blue-Filter Setting: '..standardusebluefilter)
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Scrapmetal
        if string.find(levelName, "XP2_Factory") then
              if Map['Scrapmetal.Night'] then
                  ServerUtils:SetCustomMapName("Scrapmetal Night")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
              elseif Map['Scrapmetal.Morning'] then
                  ServerUtils:SetCustomMapName("Scrapmetal Morning")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              elseif Map['Scrapmetal.Bright_Night'] then
                  ServerUtils:SetCustomMapName("Scrapmetal Bright Night")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
              elseif Map['Scrapmetal.Bright_Night'] then
                  ServerUtils:SetCustomMapName("Scrapmetal Bright Night")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
              elseif Map[16] == nil then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {standardusebluefilter})
                  print('Using Standard Blue-Filter Setting: '..standardusebluefilter)
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Ziba Tower
        if string.find(levelName, "XP2_Skybar") then
              if Map['Ziba.Night'] then
                  ServerUtils:SetCustomMapName("Ziba Night")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
              elseif Map['Ziba.Morning'] then
                  ServerUtils:SetCustomMapName("Ziba Morning")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              elseif Map['Ziba.Bright_Night'] then
                  ServerUtils:SetCustomMapName("Ziba Bright Night")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
              elseif Map['Ziba.Evening'] then
                  ServerUtils:SetCustomMapName("Ziba Evening")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              elseif Map[17] == nil then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {standardusebluefilter})
                  print('Using Standard Blue-Filter Setting: '..standardusebluefilter)
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Armored Kill | DLC
        ------------------------------------------------------------------------

        -- Alborz Mountains
        if string.find(levelName, "XP3_Alborz") then
              if Map['Alborz.Night'] then
                  ServerUtils:SetCustomMapName("Alborz Night")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
              elseif Map['Alborz.Morning'] then
                  ServerUtils:SetCustomMapName("Alborz Morning")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              elseif Map['Alborz.Bright_Night'] then
                  ServerUtils:SetCustomMapName("Alborz Bright Night")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
              elseif Map['Alborz.Evening'] then
                  ServerUtils:SetCustomMapName("Alborz Evening")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              elseif Map[18] == nil then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {standardusebluefilter})
                  print('Using Standard Blue-Filter Setting: '..standardusebluefilter)
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Armored Shield
        if string.find(levelName, "XP3_Shield") then
              if Map['Shield.Night'] then
                  ServerUtils:SetCustomMapName("Shield Night")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
              elseif Map['Shield.Morning'] then
                  ServerUtils:SetCustomMapName("Shield Morning")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              elseif Map['Shield.Bright_Night'] then
                  ServerUtils:SetCustomMapName("Shield Bright Night")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
              elseif Map['Shield.Evening'] then
                  ServerUtils:SetCustomMapName("Shield Evening")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              elseif Map[19] == nil then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {standardusebluefilter})
                  print('Using Standard Blue-Filter Setting: '..standardusebluefilter)
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Bandar Desert
        if string.find(levelName, "XP3_Desert") then
              if Map['Bandar.Night'] then
                  ServerUtils:SetCustomMapName("Bandar Night")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
              elseif Map['Bandar.Morning'] then
                  ServerUtils:SetCustomMapName("Bandar Morning")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              elseif Map['Bandar.Bright_Night'] then
                  ServerUtils:SetCustomMapName("Bandar Bright Night")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
              elseif Map['Bandar.Evening'] then
                  ServerUtils:SetCustomMapName("Bandar Evening")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              elseif Map[20] == nil then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {standardusebluefilter})
                  print('Using Standard Blue-Filter Setting: '..standardusebluefilter)
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Death Valley
        if string.find(levelName, "XP3_Valley") then
              if Map['Death.Night'] then
                  ServerUtils:SetCustomMapName("Death Night")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
              elseif Map['Death.Morning'] then
                  ServerUtils:SetCustomMapName("Death Morning")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              elseif Map['Death.Bright_Night'] then
                  ServerUtils:SetCustomMapName("Death Bright Night")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
              elseif Map['Death.Evening'] then
                  ServerUtils:SetCustomMapName("Death Evening")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              elseif Map[21] == nil then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {standardusebluefilter})
                  print('Using Standard Blue-Filter Setting: '..standardusebluefilter)
              else
                  print('Wrong Configuration')
                  return
              end
        end

        --- Aftermath | DLC
        ------------------------------------------------------------------------

        -- Azadi Palace
        if string.find(levelName, "XP4_Parl") then
              if Map['Azadi.Night'] then
                  ServerUtils:SetCustomMapName("Azadi Night")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
              elseif Map['Azadi.Morning'] then
                  ServerUtils:SetCustomMapName("Azadi Morning")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              elseif Map['Azadi.Bright_Night'] then
                  ServerUtils:SetCustomMapName("Azadi Bright Night")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
              elseif Map['Azadi.Evening'] then
                  ServerUtils:SetCustomMapName("Azadi Evening")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              elseif Map[22] == nil then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {standardusebluefilter})
                  print('Using Standard Blue-Filter Setting: '..standardusebluefilter)
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Epicenter
        if string.find(levelName, "XP4_Quake") then
              if Map['Epicenter.Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Epicenter Night")
              elseif Map['Epicenter.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
                  ServerUtils:SetCustomMapName("Epicenter Morning")
              elseif Map['Epicenter.Bright_Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Epicenter Bright_Night")
              elseif Map['Epicenter.Evening'] then
                  ServerUtils:SetCustomMapName("Epicenter Evening")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              elseif Map[23] == nil then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {standardusebluefilter})
                  print('Using Standard Blue-Filter Setting: '..standardusebluefilter)
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Markaz Monolith
        if string.find(levelName, "XP4_FD") then
              if Map['Markaz.Night'] then
                  ServerUtils:SetCustomMapName("Markaz Night")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
              elseif Map['Markaz.Morning'] then
                  ServerUtils:SetCustomMapName("Markaz Morning")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              elseif Map['Markaz.Bright_Night'] then
                  ServerUtils:SetCustomMapName("Markaz Bright Night")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
                  print('Blue-Filter enabled')
              elseif Map['Markaz.Evening'] then
                  ServerUtils:SetCustomMapName("Markaz Evening")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              elseif Map[24] == nil then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {standardusebluefilter})
                  print('Using Standard Blue-Filter Setting: '..standardusebluefilter)
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Talah Market
        if string.find(levelName, "XP4_Rubble") then
              if Map['Talah.Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Talah Night")
              elseif Map['Talah.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
                  ServerUtils:SetCustomMapName("Talah Morning")
              elseif Map['Talah.Bright_Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Talah Bright Night")
              elseif Map['Talah.Evening'] then
                ServerUtils:SetCustomMapName("Talah Evening")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              elseif Map[25] == nil then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {standardusebluefilter})
                  print('Using Standard Blue-Filter Setting: '..standardusebluefilter)
              else
                  print('Wrong Configuration')
                  return
              end
        end

        --- End Game | DLC
        ------------------------------------------------------------------------

        -- Operation Riverside
        if string.find(levelName, "XP5_001") then
              if Map['Riverside.Night'] then
                  ServerUtils:SetCustomMapName("Riverside Night")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
              elseif Map['Riverside.Morning'] then
                  ServerUtils:SetCustomMapName("Riverside Morning")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              elseif Map['Riverside.Bright_Night'] then
                  ServerUtils:SetCustomMapName("Riverside Bright Night")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
              elseif Map['Riverside.Evening'] then
                  ServerUtils:SetCustomMapName("Riverside Evening")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              elseif Map[26] == nil then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {standardusebluefilter})
                  print('Using Standard Blue-Filter Setting: '..standardusebluefilter)
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Nebandan Flats
        if string.find(levelName, "XP5_002") then
              if Map['Nebandan.Night'] then
                  ServerUtils:SetCustomMapName("Nebandan Night")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
              elseif Map['Nebandan.Morning'] then
                  ServerUtils:SetCustomMapName("Nebandan Morning")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              elseif Map['Nebandan.Bright_Night'] then
                  ServerUtils:SetCustomMapName("Nebandan Bright Night")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
              elseif Map['Nebandan.Evening'] then
                  ServerUtils:SetCustomMapName("Nebandan Evening")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              elseif Map[27] == nil then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {standardusebluefilter})
                  print('Using Standard Blue-Filter Setting: '..standardusebluefilter)
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Kiasar Railroad
        if string.find(levelName, "XP5_003") then
              if Map['Kiasar.Night'] then
                  ServerUtils:SetCustomMapName("Kiasar Night")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
              elseif Map['Kiasar.Morning'] then
                  ServerUtils:SetCustomMapName("Kiasar Morning")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              elseif Map['Kiasar.Bright_Night'] then
                  ServerUtils:SetCustomMapName("Kiasar Bright Night")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
              elseif Map['Kiasar.Evening'] then
                  ServerUtils:SetCustomMapName("Kiasar Evening")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              elseif Map[28] == nil then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {standardusebluefilter})
                  print('Using Standard Blue-Filter Setting: '..standardusebluefilter)
              else
                  print('Wrong Configuration')
                  return
              end
        end

        -- Sabalan Pipeline
        if string.find(levelName, "XP5_004") then
              if Map['Pipeline.Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  RCON:SendCommand('vu.SunFlareEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Pipeline Night")
              elseif Map['Pipeline.Morning'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
                  ServerUtils:SetCustomMapName("Pipeline Morning")
              elseif Map['Pipeline.Bright_Night'] then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'true'})
                  print('Blue-Filter enabled')
                  ServerUtils:SetCustomMapName("Pipeline Bright Night")
              elseif Map['Pipeline.Evening'] then
                  ServerUtils:SetCustomMapName("Pipeline Evening")
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {'false'})
                  print('Blue-Filter disabled')
              elseif Map[29] == nil then
                  RCON:SendCommand('vu.ColorCorrectionEnabled', {standardusebluefilter})
                  print('Using Standard Blue-Filter Setting: '..standardusebluefilter)
              else
                  print('Wrong Configuration')
                  return
              end
        end

        ------------------------------------------------------------------------
end)

--Check
Events:Subscribe('Player:Created', function(player)

    if player ~= nil then
      if Check() == true then
          return
      else
          player:Kick()
      end
    end

end)


--

function Check()
    if Night()==true or Morning()==true or Bright_Night()==true then
        print("Preset Load OK")
				return true
    else
        print("Preset Load FAIL")
				return false
    end
end
