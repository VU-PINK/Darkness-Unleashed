require '__shared/night'
require '__shared/morning'
require '__shared/settings'

local panoramicTexture = nil
local panoramicAlphaTexture = nil
local SkyGradient = nil
local cEnvmapTexture = nil
local sEnvmapTexture = nil


Events:Subscribe('Level:Finalized', function(levelName, gameMode)

    -- Bazaar
    if string.find(levelName, "MP_001") then
          if Map['Bazaar.Night'] then
              print('Calling Preset Night on Grand Bazaar')
              Night(1, panoramicTexture, panoramicAlphaTexture, SkyGradient, sEnvmapTexture)
          else
              print('Wrong Configuration')
              return
          end
    end

    -- Gulf of Oman
    if string.find(levelName, "XP1_002") then
          if Map['Gulf.Night'] then
              print('Calling Preset Night on Gulf of Oman')
              Night(11, panoramicTexture, panoramicAlphaTexture, SkyGradient, sEnvmapTexture)
          elseif Map['Gulf.Morning'] then
              print('Calling Preset Morning on Gulf of Oman')
              Morning(11, panoramicTexture, panoramicAlphaTexture, SkyGradient, sEnvmapTexture)
          else
              print('Wrong Configuration')
              return
          end
    end

    -- Seine Crossing
    if string.find(levelName, "MP_011") then
          if Map['Seine.Night'] then
              print('Calling Preset Night on Seine Crossing')
              Night(4, panoramicTexture, panoramicAlphaTexture, SkyGradient, sEnvmapTexture)
          elseif Map['Seine.Morning'] then
              print('Calling Preset Morning on Seine Crossing')
              Morning(4, panoramicTexture, panoramicAlphaTexture, SkyGradient, sEnvmapTexture)
          else
              print('Wrong Configuration')
              return
          end
    end

end)

Events:Subscribe('Level:LoadResources', function()

	    --ResourceManager:MountSuperBundle('spchunks')
	    ResourceManager:MountSuperBundle('levels/xp3_valley/xp3_valley')

	end)

	Hooks:Install('ResourceManager:LoadBundles', 100, function(hook, bundles, compartment)
	    if #bundles == 1 and bundles[1] == SharedUtils:GetLevelName() then
	        print('Injecting bundles.')

	       bundles = {
	    'levels/xp3_valley/xp3_valley',
	    --'levels/sp_villa/landing',
	        bundles[1],
	       }

	        hook:Pass(bundles, compartment)


      local partitionID1 = Guid('43BC0BBB-4EC0-4A2A-876A-7EB3660054D3')
      local partitionID2 = Guid('4B2FC2C5-E4E3-4204-AE95-A2A0725F2475')
      local partitionID3 = Guid('586D1156-30FE-44D7-84C6-B1A93402A9ED')
      local partitionID4 = Guid('C69886A8-3674-4D03-A10C-BE712EF0EB34')
      local PanoramicinstanceID1 = Guid('99A3B37E-9A20-4374-8076-938F98BB5FAC')
      local AlphainstanceID2 = Guid('8908D473-2BA4-4797-9809-A8BB18762F49')
      local SkyGradientID3 = Guid('1D3B8920-15B3-4DEF-995A-A9E694FCC23C')
      local sEnvMapID4 = Guid('87B8E087-92C5-4243-BC3C-E26B74BACA7D')

      ResourceManager:RegisterInstanceLoadHandler(partitionID1, PanoramicinstanceID1, function(panoramicTextureInstance)
      panoramicTexture = panoramicTextureInstance
      end)

      ResourceManager:RegisterInstanceLoadHandler(partitionID2, AlphainstanceID2, function(panoramicAlphaTextureInstance)
      panoramicAlphaTexture = panoramicAlphaTextureInstance
      end)

      ResourceManager:RegisterInstanceLoadHandler(partitionID3, SkyGradientID3, function(SkyGradientInstance)
      SkyGradient = SkyGradientInstance
      end)

      ResourceManager:RegisterInstanceLoadHandler(partitionID4, sEnvMapID4, function(sEnvmapTextureInstance)
      sEnvmapTexture = sEnvmapTextureInstance
      end)

	    end
	end)
