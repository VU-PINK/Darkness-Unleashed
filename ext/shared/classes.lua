---SkyboxRotation

local SkyboxRotation = class('SkyboxRotation')

--function SkyboxRotation:__init()
--  self.rotation = 0
--end

function SkyboxRotation:Rotate(mapid)

  if mapid == 1 then
      rotation = 100
  else if mapid == 2 then
      rotation = 125
  else if mapid == 3 then
      rotation = 145
  else if mapid == 4 then
      rotation = 165
  else if mapid == 5 then
      rotation = 175
  else if mapid == 6 then
      rotation = 200
  end
  print('Skybox rotated by '..rotation..' degrees')
end

return SkyboxRotation
