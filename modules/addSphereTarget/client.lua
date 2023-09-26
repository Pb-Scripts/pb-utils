function pb.addSphereTarget(loc, radius, options)
    return exports.ox_target:addSphereZone({
        coords = loc,
        radius = radius,
        debug = false,
        drawSprite = true,
        options = options
    })
end

return pb.addSphereTarget