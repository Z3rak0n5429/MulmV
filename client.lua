ESX = exports["es_extended"]:getSharedObject()
Weather = "CLEAR"

--Sets the Weather to the Client
RegisterNetEvent("mulmv:setWeather", function(weatherType)
    SetWeatherTypeNowPersist(weatherType)
    Weather = weatherType
end)

--Sets the Weather to the Client when he Spawns 
RegisterNetEvent("playerSpawned", function()
    TriggerServerEvent("mulmv:WeatherSync")
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if Weather == "XMAS" then
            SetForceVehicleTrails(true)
            SetForcePedFootstepsTracks(true)
        else
            SetForceVehicleTrails(false)
            SetForcePedFootstepsTracks(false)
        end
    end
end)