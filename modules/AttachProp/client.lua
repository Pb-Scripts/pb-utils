function pb.AttachProp(model, bone, network, xPos, yPos, zPos, xRot, yRot, zRot)
    local object = CreateObject(GetHashKey(model), 1.0, 1.0, 1.0, network, true, false)
	AttachEntityToEntity(object, PlayerPedId(), bone, xPos, yPos, zPos, xRot, yRot, zRot, 0, 1, 0, 1, 0, 1) --https://docs.fivem.net/natives/?_0x6B9BBD38AB0796DF
    return object
end

return pb.AttachProp