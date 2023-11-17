ESX.RegisterCommand("Weather", Config.ServerGroup, function(source, args)
        TriggerClientEvent("weather", -1, args)
end, false)

ESX.RegisterCommand("time", Config.ServerGroup, function(source, args)
    if args[1] ~= nil and args[2] ~= nil and args[1] < "23" then
        TriggerClientEvent("time", -1, args)
    else
        print("Ungültige zeitangabe, es können nur zeiten zwischen 1 - 23 genommen werden.")
    end
end, false)