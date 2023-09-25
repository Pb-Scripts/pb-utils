local function TabingFormat(tabs)
    local tabing = ""
    for i=1, tabs, 1 do
        tabing = tabing.."\t"
    end
    return tabing
end

local function PbstructJson(json, tabs)
    local tabs = tabs or 1
    local returntext = "["
    if type(json) == 'table' and json ~= "[]" then
        returntext = returntext.."{\n"
        for i,value in pairs(json) do
            local tipo = type(value)
            returntext = returntext..TabingFormat(tabs)..'"'..i..'":'
            if tipo == "string" then
                returntext = returntext..' "'..value..'"\n'
            elseif tipo == "number" then
                returntext = returntext.." "..value..'\n'
            elseif tipo == "table" then
                returntext = returntext.." "..PbstructJson(value, tabs+1).."\n"
            else
                returntext = returntext..' "'..value..'"\n'
            end
        end
        tabs = tabs - 1
        returntext = returntext..TabingFormat(tabs)..'}]'
    else
        return 'error'
    end
    return returntext
end

function pb.PrintJsonStructed(json, log)
    local text = PbstructJson(json)
    if log then
        local resname = GetCurrentResourceName()
        local time = os.time()
        local file = io.open("log-"..resname.."-"..time..".txt", "w")
        file:write(text)
        file:close()
    end
    return text
end

return pb.PrintJsonStructed