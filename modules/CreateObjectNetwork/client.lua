function pb.CreateObjectNetwork(modelHash, coords, ground)
    RequestModel(modelHash) while not HasModelLoaded(modelHash) do Citizen.Wait(1) end
    if not coords then local pedcoords = GetEntityCoords(PlayerPedId()) coords = vector3(pedcoords.x, pedcoords.y, pedcoords.z-1) end
    local obj = CreateObject(modelHash, coords, 1, 0, 0)
    local netId = ObjToNet(obj)
    SetNetworkIdCanMigrate(netId, true)
    if ground then PlaceObjectOnGroundProperly_2(obj) end
    FreezeEntityPosition(obj, true)
    return netId
end

return pb.CreateObjectNetwork