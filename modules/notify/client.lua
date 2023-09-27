function pb.notify(type, title, label)
    lib.notify({
        type = type,
        title = title,
        description = label
    })
end

return pb.notify