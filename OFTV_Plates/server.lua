RegisterNetEvent('OFTV_Plates:SyncPlate')
AddEventHandler('OFTV_Plates:SyncPlate', function(vehicleNetId)
    local vehicle = NetworkGetEntityFromNetworkId(vehicleNetId)
    if DoesEntityExist(vehicle) then
        TriggerClientEvent('OFTV_Plates:ApplyPlate', -1, vehicleNetId)
    end
end)