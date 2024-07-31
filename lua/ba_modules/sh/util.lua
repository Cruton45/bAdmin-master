local bAdmin = bAdmin
local utility = {}

utility.__index = utility

function utility.isAlpha(str)
    return str:match("%a") ~= nil
end
function utility.isAlphaNumeric(str)
    return str:match("%w") ~= nil
end

function utility.isCallerServerConsole(caller)
    -- Caller will be a null ent if console
    if not(caller[1]) then
        return true
    end
    return false
end

function utility.getConsoleOrPlayerName(caller)
    local callerName
    if (caller[1]) then
        callerName = ply:Nick()
    else
        callerName = "CONSOLE"
    end

    return callerName
end

bAdmin.util = utility
