ESX = exports["es_extended"]:getSharedObject()
Weather = "CLEAR"

RegisterNetEvent("mulmv:weather", function(weatherType)
    local xPlayer = PlayerPedId()

    if not type(weatherType) then return end


    SetWeatherTypeNowPersist(weatherType)
    Weather = weatherType

end)

RegisterNetEvent("mulmv:time", function(Hour, Mins)
    NetworkOverrideClockTime(Hour, Mins)
end)

RegisterNetEvent("playerSpawned", function()
    TriggerServerEvent("mulmv:NewPlayerWeather")
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