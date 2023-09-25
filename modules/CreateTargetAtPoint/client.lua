local function CreationLoop(id, label, icon, event, args)
    local coords
    while true do
        if IsControlJustPressed('keyboard', 18) then
            _, coords, _ = pb.RayCastGamePlayCamera(1000.0)
            break
        elseif IsControlJustPressed('keyboard', 200) then
            return false
        end
        Wait(0)
    end
    local target_id = exports.ox_target:addSphereZone({
        coords = vector3(coords.x, coords.y, coords.z),
        radius = 0.5,
        debug = true,
        drawSprite = true,
        options = {
            {
                name = id,
                icon = icon,
                label = label,
            }
        }
    })
    Wait(3000)
    lib.registerContext({
        id = "confirm_menu",
        title = "Confirmação",
        options = {
            {
                title = "Confirmar",
                onSelect = function()
                    exports.ox_target:removeZone(target_id)
                    TriggerServerEvent(event, coords, args)
                end,
            },
            {
                title = "Refazer",
                onSelect = function()
                    exports.ox_target:removeZone(target_id)
                    CreationLoop(id, label, icon, event, args)
                end,
            },
            {
                title = "Cancelar",
                onSelect = function()
                    exports.ox_target:removeZone(target_id)
                end,
            }
        }
    })
    lib.showContext('confirm_menu')
end

function pb.CreateTargetAtPoint(id, label, icon, event, args)
    CreationLoop(id, label, icon, event, args)
end

return pb.CreateTargetAtPoint --Pb == Burro (true)