function pb.FrontVector(entity)
    return GetEntityCoords(entity) + (GetEntityForwardVector(entity) * 1.0)
end

return pb.FrontVector