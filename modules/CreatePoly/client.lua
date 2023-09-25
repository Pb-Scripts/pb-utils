function pb.CreatePoly(id, shape, minZ, maxZ, debugPoly)
    local zone = PolyZone:Create(shape, {
        name = id,
        minZ = minZ,
        maxZ = maxZ,
        debugPoly = debugPoly
    })
    return zone
end

return pb.CreatePoly