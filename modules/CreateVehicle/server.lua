pb.CreateVehicle(source, model, coords, warp, plate)
    model = type(model) == 'string' and joaat(model) or model

    if not CreateVehicleServerSetter then
        error('^1CreateVehicleServerSetter is not available on your artifact, please use artifact 5904 or above to be able to use this^0')
        return
    end

    local tempVehicle = CreateVehicle(model, 0, 0, 0, 0, true, true)
    while not DoesEntityExist(tempVehicle) do
        Wait(0)
    end
    local vehicleType = GetVehicleType(tempVehicle)
    DeleteEntity(tempVehicle)

    local ped = GetPlayerPed(source)
    if not coords then
        coords = GetCoordsFromEntity(ped)
    end

    local veh = CreateVehicleServerSetter(model, vehicleType, coords.x, coords.y, coords.z, coords.w)

    while not DoesEntityExist(veh) do
        Wait(0)
    end

    while GetVehicleNumberPlateText(veh) == "" do
        Wait(0)
    end

    if plate then SetVehicleNumberPlateText(veh, plate) end

    if warp then SetPedIntoVehicle(ped, veh, -1) end
    TriggerClientEvent('vehiclekeys:client:SetOwner', source, GetPlate(veh))
    Entity(veh).state:set('initVehicle', true, true)
    return NetworkGetNetworkIdFromEntity(veh)
end

return pb.CreateVehicle