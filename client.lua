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
    local retval = vector4(location.x,location.y,location.x,heading)
    TriggerServerEvent("k-uitl:printVector", 'v3', nil, retval, nil)
    --TriggerServerEvent("k-uitl:printVector", 'v4', nil, location, heading)
end)

RegisterCommand(Config.End, function(source)
    TriggerServerEvent('k-uitl:printVector', 'end')
end)

RegisterCommand(Config.Next, function(source)
    TriggerServerEvent('k-uitl:printVector', 'next')
end)

RegisterCommand('dontuse', function()
    local objects = GetGamePool('CObject')
    local count = 0
    for i = 1,#objects do
        local hash = GetEntityModel(objects[i])
        
        if hash == GetHashKey('prop_letterbox_01') then count = count + 1 print(GetEntityCoords(objects[i])) end
    end
    print(count)
end)