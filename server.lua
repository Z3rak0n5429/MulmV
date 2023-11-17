ESX = exports["es_extended"]:getSharedObject()

ServerWeather = "clear"


-- Sets Weather: /weather YOURWEATHERTYPE. See Valid Weathertypes in Config
ESX.RegisterCommand("weather", Config.ServerGroups, function(source, args)
    if args[1] ~= nil then
        for number, weatherName in pairs(Config.WeatherTypes) do
            local WeatherTypes = string.upper(args[1])
            if weatherName == WeatherTypes then 
                ServerWeather = WeatherTypes
                TriggerClientEvent("mulmv:weather", -1, WeatherTypes)
            end
        end
    else
        print("Du hast keine Berechtigung")
    end
end, false)


-- Sync weather when player spawned
RegisterNetEvent("mulmv:NewPlayerWeather", function()
    TriggerClientEvent("mulmv:weather", -1, ServerWeather)
    TriggerClientEvent("mulmv:time", -1, ServerTime)
end)