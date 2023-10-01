function pb.playAnim(dict, anim, flag, time, stopOnly)
    local ped = PlayerPedId()
    while (not HasAnimDictLoaded(dict)) do RequestAnimDict(dict) Wait(0) end
    TaskPlayAnim(ped, dict, anim, 8.0, -8, -1, flag, 0, 0, 0, 0)
    if time then Wait(time) 
        if stopOnly then
            StopAnimTask(ped, dict, anim, 500) 
        else
            ClearPedTasks(ped)
        end
    end
    return
end

return pb.playAnim