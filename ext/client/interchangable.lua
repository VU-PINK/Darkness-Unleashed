--- Skyboxes
--- Globals to call
-- Death Valley Skybox
  MoonNightSkybox = nil
  MoonNightAlpha = nil
  MoonNightGradient = nil
  MoonNightEnvmap = nil
  MoonNightStars = nil
-- Bandar Desert Skybox
  EveningSkybox = nil
  EveningAlpha = nil
  EveningGradient = nil
  EveningEnvmap = nil

--- Skybox Functions

function MoonNightSky()
    --- Load Bundles | Death Valley Skybox
    -- Mount
    Events:Subscribe('Level:LoadResources', function()

    	    ResourceManager:MountSuperBundle('levels/xp3_valley/xp3_valley') -- Death Valley Bright Night Skybox & Star Clouds

    	end)

    -- Inject
    Hooks:Install('ResourceManager:LoadBundles', 100, function(hook, bundles, compartment)
    	    if #bundles == 1 and bundles[1] == SharedUtils:GetLevelName() then
    	        print('Injecting bundles.')

    	       bundles = {
    	    'levels/xp3_valley/xp3_valley',  -- Death Valley Sky
    	        bundles[1],
    	       }

    	        hook:Pass(bundles, compartment)


    --- Register
          local partitionID1 = Guid('43BC0BBB-4EC0-4A2A-876A-7EB3660054D3')                         -- Panoramic Texture
          local partitionID2 = Guid('4B2FC2C5-E4E3-4204-AE95-A2A0725F2475')                         -- Panoramic Alpha Texture
          local partitionID3 = Guid('586D1156-30FE-44D7-84C6-B1A93402A9ED')                         -- Sky Gradient
          local partitionID4 = Guid('C69886A8-3674-4D03-A10C-BE712EF0EB34')                         -- Static Envmap Texture
          local partitionIDStars = Guid('E7A1C8F3-ABDD-11E1-A309-B3881526995C')                     -- Star Clouds
          local PanoramicinstanceID1 = Guid('99A3B37E-9A20-4374-8076-938F98BB5FAC')                 -- [1]Instance
          local AlphainstanceID2 = Guid('8908D473-2BA4-4797-9809-A8BB18762F49')                     -- [2]Instance
          local SkyGradientID3 = Guid('1D3B8920-15B3-4DEF-995A-A9E694FCC23C')                       -- [3]Instance
          local sEnvMapID4 = Guid('87B8E087-92C5-4243-BC3C-E26B74BACA7D')                           -- [4]Instance
          local Stars = Guid('5472209E-0DA1-60A7-ACA2-D42ECACD4975')                                -- Star Instance

              ResourceManager:RegisterInstanceLoadHandler(partitionID1, PanoramicinstanceID1, function(panoramicTextureInstance)        -- Register Instance
              MoonNightSkybox = panoramicTextureInstance                                                                                -- Make Global For Easy Access
              end)

              ResourceManager:RegisterInstanceLoadHandler(partitionID2, AlphainstanceID2, function(panoramicAlphaTextureInstance)       -- Register Instance
              MoonNightAlpha = panoramicAlphaTextureInstance                                                                            -- Make Global For Easy Access
              end)

              ResourceManager:RegisterInstanceLoadHandler(partitionID3, SkyGradientID3, function(SkyGradientInstance)                   -- Register Instance
              MoonNightGradient = SkyGradientInstance                                                                                   -- Make Global For Easy Access
              end)

              ResourceManager:RegisterInstanceLoadHandler(partitionID4, sEnvMapID4, function(sEnvmapTextureInstance)                    -- Register Instance
              MoonNightEnvmap = sEnvmapTextureInstance                                                                                  -- Make Global For Easy Access
              end)

              ResourceManager:RegisterInstanceLoadHandler(partitionIDStars, Stars, function(StarsInstance)                              -- Register Instance
              MoonNightStars = StarsInstance                                                                                            -- Make Global For Easy Access
              end)

    	    end
    end)
end


function EveningSky()
      --- Load Bundles | Bandar Desert Skybox
      -- Mount
      Events:Subscribe('Level:LoadResources', function()

      	    ResourceManager:MountSuperBundle('levels/xp3_desert/xp3_desert') -- Death Valley Bright Night Skybox & Star Clouds

      	end)

      -- Inject
      Hooks:Install('ResourceManager:LoadBundles', 100, function(hook, bundles, compartment)
      	    if #bundles == 1 and bundles[1] == SharedUtils:GetLevelName() then
      	        print('Injecting bundles.')

      	       bundles = {
      	    'levels/xp3_desert/xp3_desert',  -- Death Valley Sky
      	        bundles[1],
      	       }

      	        hook:Pass(bundles, compartment)


      --- Register
            local partitionID5 = Guid('2C79B362-92A2-43D7-A929-4682B10E42B4')                         -- Panoramic Texture
            local partitionID6 = Guid('9C228323-EED2-428F-B2E6-051A3119ADFC')                         -- Panoramic Alpha Texture
            local partitionID7 = Guid('AC4422AB-431C-4417-A3EE-5BD1B1DD6D00')                         -- Sky Gradient
            local partitionID8 = Guid('D7766140-9B4C-11E1-A175-EFA690A2F651')                         -- Static Envmap Texture
            local PanoramicinstanceID5 = Guid('D09201F5-B89A-4121-972F-1742A73D8F60')                 -- [1]Instance
            local AlphainstanceID6 = Guid('E870E98D-B798-4EB8-B930-49BF477F45A6')                     -- [2]Instance
            local SkyGradientID7 = Guid('C7662BD6-BB47-4C03-9939-DA2EC7EE43E5')                       -- [3]Instance
            local sEnvMapID8 = Guid('22AA9B86-7973-07FF-D7DD-9A69970E7B14')                           -- [4]Instance

                ResourceManager:RegisterInstanceLoadHandler(partitionID5, PanoramicinstanceID5, function(panoramicTextureInstance)        -- Register Instance
                EveningSkybox = panoramicTextureInstance                                                                                  -- Make Global For Easy Access
                end)

                ResourceManager:RegisterInstanceLoadHandler(partitionID6, AlphainstanceID6, function(panoramicAlphaTextureInstance)       -- Register Instance
                EveningAlpha = panoramicAlphaTextureInstance                                                                              -- Make Global For Easy Access
                end)

                ResourceManager:RegisterInstanceLoadHandler(partitionID7, SkyGradientID7, function(SkyGradientInstance)                   -- Register Instance
                EveningGradient = SkyGradientInstance                                                                                     -- Make Global For Easy Access
                end)

                ResourceManager:RegisterInstanceLoadHandler(partitionID8, sEnvMapID8, function(sEnvmapTextureInstance)                    -- Register Instance
                EveningEnvmap = sEnvmapTextureInstance                                                                                    -- Make Global For Easy Access
                end)

        	  end
      end)
end
