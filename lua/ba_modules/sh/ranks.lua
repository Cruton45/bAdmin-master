local bAdmin = bAdmin
local _command = bAdmin.command
local utility = bAdmin.util
local rank = {}
local ranks = {}

local _rankStruct = {
    name = "error",
    immunity = 0,
    inherit = "error",
    permissions = {}
}

---- Initialize default ranks ---------------
local user = {
    name = "user",
    immunity = 1,
    inherit = "user",
    permissions = {"help"}
}

local admin = {
    name = "admin",
    immunity = 50,
    inherit = "user",
    permissions = {"help","bring", "noclip"}
}

local superadmin = {
    name = "superadmin",
    immunity = 100,
    inherit = "admin",
    permissions = {"help", "bring", "addbot", "addrank", "removerank", "setuser", "noclip"}
}

ranks[user.name] = user
ranks[admin.name] = admin
ranks[superadmin.name] = superadmin
---------------------------------------------

function rank.printAllRanks()
    PrintTable(ranks)
end

-- Move to server side rank file.
function rank.addRank(name, immunity, inherit)
    if not(utility.isAlpha(name)) then return false, (name .. " is an invalid rank name. Names can only have letters in them.") end
    if (ranks[name]) then return false, (name .. " already exists.") end
    if not(ranks[inherit]) then return false, ("Cannont inherit from " .. inherit .. "." ..  " It does not exist.") end

    local newRank = {
        name = name,
        immunity = immunity,
        inherit = inherit,
        permissions = ranks[inherit].permissions
    }
    ranks[newRank.name] = newRank

    return true
end

function rank.removeRank(name)
    if not(ranks[name]) then return false, ( name .. " does not exist.") end
    if (name == user.name or name == superadmin.name) then return false, ("You can not remove " .. name .. ". It is a default rank.") end

    ranks[name] = nil

    return true
end
--------------------------------------------------------

function rank.getAllRanks()
    return ranks
end

function rank.hasPermision(rankName, permission)
    local userRank = ranks[rankName]
    if not(userRank) then print("Error: Rank hasPermision could not find rank. sv/ranks.lua") return false end
    if not(table.HasValue(userRank.permissions, permission.name)) then return false end

    return true
end

function rank.getRank(rankName)
    return ranks[rankName]
end

bAdmin.rank = rank