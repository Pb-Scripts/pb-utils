function pb.IsTypeValid(vehcategory, categorys)
    for _,category in pairs(categorys) do
        if vehcategory == category then return true end
    end
    return false
end

return pb.IsTypeValid