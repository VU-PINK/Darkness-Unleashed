---SkyboxRotation

local SkyboxRotation = class('SkyboxRotation')

rotation = nil

--function SkyboxRotation:__init()
--  self.rotation = 0
--end

function SkyboxRotation:Rotate(mapid)

      if mapid == 1 then
          rotation = 0
      end

      if mapid == 2 then
          rotation = 0
      end

      if mapid == 3 then
          rotation = 0
      end

      if mapid == 4 then
          rotation = 0
      end

      if mapid == 5 then
          rotation = 170
      end

      if mapid == 6 then
          rotation = 0
      end

      if mapid == 7 then
          rotation = 170
      end

      if mapid == 8 then
          rotation = 0
      end

      if mapid == 9 then
          rotation = 0
      end

      if mapid == 10 then
          rotation = 0
      end

      if mapid == 11 then
          rotation = 0
      end

      if mapid == 12 then
          rotation = 0
      end

      if mapid == 13 then
          rotation = 300
      end

      if mapid == 14 then
          rotation = 80
      end

      if mapid == 15 then
          rotation = 0
      end

      if mapid == 16 then
          rotation = 0
      end

      if mapid == 17 then
          rotation = 0
      end

      if mapid == 18 then
          rotation = 0
      end

      if mapid == 19 then
          rotation = 0
      end

      if mapid == 20 then
          rotation = 0
      end

      if mapid == 21 then
          rotation = 0
      end

      if mapid == 22 then
          rotation = 0
      end

      if mapid == 23 then
          rotation = 0
      end

      if mapid == 24 then
          rotation = 0
      end

      if mapid == 25 then
          rotation = 0
      end

      if mapid == 26 then
          rotation = 0
      end

      if mapid == 27 then
          rotation = 0
      end

      if mapid == 28 then
          rotation = 70
      end

      if mapid == 29 then
          rotation = 0
      end



      print('Skybox rotated by '..rotation..' degrees')
end
