pb.callback.register('pb-utils:removeItem', function(source, item, count, inv, metadata, slot)
    return exports.ox_inventory:RemoveItem(inv or source, item, count, metadata, slot)
end)

pb.callback.register('pb:utils:removeObjectNetwork', function(source, netId)
    local entity = NetworkGetEntityFromNetworkId(netId)
    if DoesEntityExist(entity) then DeleteEntity(entity) end
    return true
end)

pb.callback.register('pb-utils:removeBankMoney', function(source, money)
    local qb = exports['qb-core']:GetCoreObject()
    local Player = qb.Functions.GetPlayer(source)
    return Player.Functions.RemoveMoney("bank", money)
end)
