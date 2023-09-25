function pb.hasItem(name, need, metadata, strict)
    local count = exports.ox_inventory:GetItemCount(name, metadata, strict)
    return count >= need, count
end

return pb.hasItem