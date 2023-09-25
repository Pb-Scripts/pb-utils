function pb.GetPlayerCid(src)
    if src then
        return QBCore.Functions.GetPlayer(src).PlayerData.citizenid
    else
        return false
    end
end

return pb.GetPlayerCid