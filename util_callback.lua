pb.callback.register('pb-utils:removeItem', function(source, item, count, inv, metadata, slot)
    return exports.ox_inventory:RemoveItem(inv or source, item, count, metadata, slot)
end)
