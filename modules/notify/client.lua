function pb.notify(type, title, label)
    lib.notify({
        type = 'error',
        title = locale('error'),
        description = locale('not_enough_money')
    })
end

return pb.notify