local QBCore = exports['qb-core']:GetCoreObject()

-- Koordinaten für den Flughafeneingang
local flughafenKoordinaten = vector3(-1035.06, -2732.03, 13.76)

-- Überprüfen, ob der Spieler Adminrechte hat
local function istAdmin(source)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    return xPlayer and xPlayer.PlayerData.job.name == "admin" -- Ersetze "admin" durch deinen Admin-Jobnamen, falls nötig
end

-- /einreise Befehl
QBCore.Commands.Add("einreise", "Teleportiert einen Spieler zum Flughafen", {{name = "id", help = "Die ID des Spielers"}}, true, function(source, args)
    if not args[1] then
        TriggerClientEvent('QBCore:Notify', source, "Bitte gib eine gültige Spieler-ID ein!", "error")
        return
    end

    local targetId = tonumber(args[1])
    if not targetId then
        TriggerClientEvent('QBCore:Notify', source, "Die eingegebene ID ist keine Zahl!", "error")
        return
    end

    local targetPlayer = QBCore.Functions.GetPlayer(targetId)
    if not targetPlayer then
        TriggerClientEvent('QBCore:Notify', source, "Kein Spieler mit dieser ID gefunden!", "error")
        return
    end

    TriggerClientEvent('qb-einreise:teleport', targetPlayer.PlayerData.source, flughafenKoordinaten)
    TriggerClientEvent('QBCore:Notify', source, "Spieler erfolgreich teleportiert!", "success")
end)

-- Clientseitiger Teleport-Handler
RegisterNetEvent('qb-einreise:teleport', function(coords)
    local ped = PlayerPedId()
    SetEntityCoords(ped, coords.x, coords.y, coords.z, false, false, false, true)
end)
