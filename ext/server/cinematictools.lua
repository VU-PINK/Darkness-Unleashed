local Preset = {}


NetEvents:Subscribe('Cinetools:Save', function(name, preset)

    Preset.name = preset
    ChatManager:SendMessage('Saved Preset')
    print(Preset.name)

end)

NetEvents:Subscribe('Cinetools:Load', function(preset, player)

    print('Load Request by ' .. player.name)
    NetEvents:SendTo('Cinetools:LoadClient', player, Preset.preset)
    ChatManager:SendMessage('Loaded Preset')

end)

NetEvents:Subscribe('Cinetools:Sync', function(clientState)

    print(clientState)
    ChatManager:SendMessage('Synced Server with Preset by ')
    NetEvents:Broadcast('Cinetools:SyncServer', clientState)

end)
