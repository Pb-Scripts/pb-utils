function pb.GetPlayerCid(src)
    local QBCore = exports['qb-core']:GetCoreObject()
    if src then
        return QBCore.Functions.GetPlayer(src).PlayerData.citizenid
    else
        return false
    end
end

return pb.GetPlayerCid