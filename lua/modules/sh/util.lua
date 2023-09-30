local bAdmin = bAdmin
local utility = {}

utility.__index = utility

function utility.isAlpha(str)
    return str:match("%a") ~= nil
end
function utility.isAlphaNumeric(str)
    return str:match("%w") ~= nil
end

-- Refactor and add more functionality here. Add custom formating with string.
-- Don't like calling this function in every command function, figure something else out.
function utility.logCommand(usedCommand, str)
    hook.Run( "bAdmin_commandSuccess", str)
end

bAdmin.util = utility
