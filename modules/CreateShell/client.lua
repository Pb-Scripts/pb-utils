function pb.CreateShell(model, pos, json)
    model = GetHashKey(model)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(0)
    end
    local shell = CreateObject(model, pos)
    FreezeEntityPosition(shell, true)
    local objects = {}
    if json then
        for prop, info in pairs(json) do
            local obj = CreateObject(GetHashKey(prop), pos + info.pos)
            FreezeEntityPosition(obj, true)
            objects[#objects+1] = obj
        end
    end
    return shell, objects
end

return pb.CreateShell