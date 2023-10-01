local function import(object, module_name)
    local file = LoadResourceFile('pb-utils', 'modules/'..module_name..'/'..object.context..'.lua')
    if not file then file = LoadResourceFile('pb-utils', 'modules/'..module_name..'/shared.lua') end
    if file then
        local funct, err = load(file)
        if funct then
            local nonerror, err = pcall(funct)
            if nonerror then
                return object[module_name]
            else
                print("You have an error while executing the file: "..err)
                return
            end
        else
            print("You have an error while compiling the file: "..err)
            return
        end
    end

end

local function import_module(object, module_name)
    local module = rawget(object, module_name)
    if not module then
        module = import(object, module_name)
    end
    return module
end

pb = setmetatable({
    context = IsDuplicityVersion() and 'server' or 'client',
    resname = GetCurrentResourceName()
}, {
    __index = import_module,
    __call =  import_module
})