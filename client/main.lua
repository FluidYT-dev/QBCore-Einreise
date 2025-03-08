-- Clientseitige Events für das qb-einreise Skript

-- Teleport-Event
RegisterNetEvent('qb-einreise:teleport', function(coords)
    local ped = PlayerPedId()
    SetEntityCoords(ped, coords.x, coords.y, coords.z, false, false, false, true)
    TriggerEvent('QBCore:Notify', "Du wurdest Eingereist!", "success")
end)
