--Settings


---Change Settings here
--Use Time Vote (true/false)
--Activates Voting for Used Time (morning/noon/evening/night)
local TimeVote = false

---Custom Settings
--MapList
if TimeVote == false then
    -- Select Maps and Time:
    local Map = MapName(bool, time)
    Map:MakeWritable()

    --true to use mod, false to not use mod
    --Standard              (   'bool, time '   )
    Map.Bazaar            = (   'true, night'   )
    Map.Teheran           = (   'true, morning' )
    Map.Caspian           = (   'false, noon'   )
    Map.Seine             = (   'true, night'   )
    Map.Firestorm         = (   'true, night'   )
    Map.Davamand          = (   'true, night'   )
    Map.Noshar            = (   'true, night'   )
    Map.Kharg             = (   'true, night'   )
    Map.Metro             = (   'true, night'   )

    --DLC B2K
    Map.Gulf              = (   'true, night'   )
    Map.Karkand           = (   'true, night'   )
    Map.Sharqi            = (   'true, night'   )
    Map.Wake              = (   'true, night'   )

    --DLC CQ
    Map.Donya             = (   'true, night'   )
    Map.Operation925      = (   'true, night'   )
    Map.Scrapmetal        = (   'true, night'   )
    Map.Ziba              = (   'true, night'   )

    --DLC AK
    Map.Alborz            = (   'true, night'   )
    Map.Armored           = (   'true, night'   )
    Map.Bandar            = (   'true, night'   )
    Map.DeathValley       = (   'true, night'   )

    --DLC AF
    Map.Azadi             = (   'true, night'   )
    Map.Epicenter         = (   'true, night'   )
    Map.Markaz            = (   'true, night'   )
    Map.Talah Market      = (   'true, night'   )

    --DLC EG
    Map.Kiasar            = (   'true, night'   )
    Map.Nebandan          = (   'true, night'   )
    Map.Riverside         = (   'true, night'   )
    Map.Pipeline          = (   'true, night'   )

end
