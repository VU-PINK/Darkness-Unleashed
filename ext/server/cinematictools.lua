local Preset = {}


NetEvents:Subscribe('CinetoolsSave', function(name, preset)

    Preset.preset = {}
    ChatManager:SendMessage('Saved Preset')

end)

NetEvents:Subscribe('CinetoolsLoad', function(preset, player)

    NetEvents:SendTo('CinetoolsSendToClient', player, Preset.preset)
    ChatManager:SendMessage('Loaded Preset')

end)
