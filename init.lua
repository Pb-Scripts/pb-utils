local lib_name = 'pb-utils'
local context = IsDuplicityVersion() and 'server' or 'client'
function nothing() return end

local function loadModule(self, module)
    local dir = ('modules/%s'):format(module)
    local chunk = LoadResourceFile(lib_name, ('%s/%s.lua'):format(dir, context))
    local shared = LoadResourceFile(lib_name, ('%s/shared.lua'):format(dir))

    if shared then
        chunk = (chunk and ('%s\n%s'):format(shared, chunk)) or shared
    end

    if chunk then
        local fn, err = load(chunk, ('@@'..lib_name..'/modules/%s/%s.lua'):format(module, context))

        if not fn or err then
            return error(('\n^1Error importing module (%s): %s^0'):format(dir, err), 3)
        end

        local result = fn()
        self[module] = result or noop
        return self[module]
    end
end

local function call(self, index, ...)
    local module = rawget(self, index)

    if not module then
        self[index] = nothing()
        module = loadModule(self, index)
    end

    return module
end

pb = setmetatable({
    name = lib_name,
    context = context,
}, {
    __index = call,
    __call =  call
})