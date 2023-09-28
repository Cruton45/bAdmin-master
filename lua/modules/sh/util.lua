local bAdmin = bAdmin
local utility = {}

utility.__index = utility

function utility.isAlpha(str)
    return str:match("%a") ~= nil
end
function utility.isAlphaNumeric(str)
    return str:match("%w") ~= nil
end

bAdmin.util = utility
