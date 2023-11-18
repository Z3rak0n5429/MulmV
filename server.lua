ESX = exports["es_extended"]:getSharedObject()

ServerWeather = "clear"
allowgroups = {}

-- Sets Weather: /weather YOURWEATHERTYPE. See Valid Weathertypes in Config also you can Change the user groups in the Config 
ESX.RegisterCommand("weather", 'admin', function(source, args)
    local xPlayer = source
    local Weather = false
    local group = xPlayer.getGroup()

    for _, groups in ipairs(Config.ServerGroups) do
        allowgroups = groups
    end

    if group  == allowgroups then
            if args[1] == nil then
                xPlayer.showNotification("Du musst was Eingeben")
                return
            else
                for _, WeatherNames in ipairs(Config.WeatherTypes) do
                    if WeatherNames == string.upper(args[1]) then
                        Weather = true
                    end
                end
                
                if not Weather then xPlayer.showNotification("Falscher Wetter Typ") return end

                if Weather then
                    ServerWeather = string.upper(args[1])
                    TriggerEvent("mulmv:WeatherSync")
                end
            end
    else
        xPlayer.showNotification("Du hast Keine Berechtigung dafür")
    end
        
end, false)

-- Sync weather when player spawned
RegisterNetEvent("mulmv:WeatherSync", function()
    TriggerClientEvent("mulmv:setWeather", -1, ServerWeather)
end)