local function ApplyCustomPlate(vehicle)
    local plateImage = Config.DefaultPlate
    local textureDict = "plate_" .. plateImage
    
    if not HasStreamedTextureDictLoaded(textureDict) then
        RequestStreamedTextureDict(textureDict, true)
        while not HasStreamedTextureDictLoaded(textureDict) do
            Wait(10)
        end
    end

    if DoesEntityExist(vehicle) then
        SetVehicleNumberPlateText(vehicle, "OFTV")
        SetVehicleNumberPlateTextIndex(vehicle, 0)
        SetVehicleLivery(vehicle, 0)
        SetVehicleCustomPrimaryColour(vehicle, 0, 0, 0)
        
        -- Apply custom plate as texture
        SetVehicleModKit(vehicle, 0)
        SetVehicleLivery(vehicle, 0)
        SetVehicleCustomPrimaryColour(vehicle, 0, 0, 0)
    end
end

-- Apply plate to player's vehicle on enter
AddEventHandler('playerEnteredVehicle', function(vehicle)
    ApplyCustomPlate(vehicle)
end)

-- Automatically apply plates to NPCs if enabled
if Config.ApplyToNPCs then
    CreateThread(function()
        while true do
            Wait(5000)
            local vehicles = GetGamePool('CVehicle')
            for _, vehicle in ipairs(vehicles) do
                if not IsPedAPlayer(GetPedInVehicleSeat(vehicle, -1)) then
                    ApplyCustomPlate(vehicle)
                end
            end
        end
    end)
end
