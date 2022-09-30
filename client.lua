RegisterCommand(Config.Start, function(source, args, rawCommand)
    TriggerEvent("chat:addSuggestion", "/"..Config.Start, 'table name')
    local message = table.concat(args, ' ')   
    TriggerServerEvent('k-uitl:printVector', 'start', message)
end)

RegisterCommand(Config.Vector3, function(source)
    local location = GetEntityCoords(PlayerPedId())
    TriggerServerEvent("k-uitl:printVector", 'v3', nil, location, nil)
end)

RegisterCommand(Config.Vector4, function(source)
    local location = GetEntityCoords(PlayerPedId())
    local heading = GetEntityHeading(PlayerPedId())
    TriggerServerEvent("k-uitl:printVector", 'v4', nil, location, heading)
end)

RegisterCommand(Config.End, function(source)
    TriggerServerEvent('k-uitl:printVector', 'end')
end)

RegisterCommand(Config.Next, function(source)
    TriggerServerEvent('k-uitl:printVector', 'next')
end)