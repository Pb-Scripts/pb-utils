local locales = {}

function pb.locales()
    local resname = GetCurrentResourceName()
    local locale_file = LoadResourceFile(resname, 'locales/'..GetConvar('pb:locale', 'en')..'.json')
    
    if not locale_file then
        locale_file = LoadResourceFile(resname, 'locales/en.json')
        if not locale_file then return end
    end

    for key, label in pairs(json.decode(locale_file)) do
        locales[key] = label
    end
end

function getlocales()
    return locales
end

function locale(key, ...)
    local label = locales[key]
    if label then
        if ... then
            label = label:format(...)
            return label
        else
            return label 
        end
    end
    return
end

return pb.locales