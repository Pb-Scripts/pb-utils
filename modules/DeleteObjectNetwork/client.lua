function pb.DeleteObjectNetwork(netId)
    pb.callback('pb:utils:removeObjectNetwork', false, function(source, removed) end, netId)
    return true
end

return pb.DeleteObjectNetwork