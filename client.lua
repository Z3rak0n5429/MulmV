RegisterNetEvent("weather")
AddEventHandler("weather", function(args)
    SetWeatherTypeNowPersist(tostring(args[1]))
end)

RegisterNetEvent("time")
AddEventHandler("time", function(args)
    NetworkOverrideClockTime(tonumber(args[1]), tonumber(args[2]))
end)