local bAdmin = bAdmin
local utility = bAdmin.util
local rank = {}
local ranks = {}

local rankStruct = {
    name = "error",
    immunity = 0,
    inherit = "error"
}

---- Initialize default ranks ---------------
local user = {
    name = "user",
    immunity = 1,
    inherit = "user",
    permissions = {}
}

local admin = {
    name = "admin",
    immunity = 50,
    inherit = "user",
    permissions = {"bring"}
}

local superadmin = {
    name = "superadmin",
    immunity = 100,
    inherit = "admin",
    permissions = {"bring", "addbot", "addrank", "removerank", "adduser"}
}

ranks[user.name] = user
ranks[admin.name] = admin
ranks[superadmin.name] = superadmin
---------------------------------------------

function rank.printAllRanks()
    PrintTable(ranks)
end


function rank.addRank(name, immunity, inherit)
    if not(utility.isAlpha(name)) then print("Error: rank names can only have letters in them.") return end
    if(ranks[name]) then print("Error: that rank already exists.") return end
    if not(ranks[inherit]) then print("Error: cannont inherit from that rank. It does not exist.") return end

    local newRank = {
        name = name,
        immunity = immunity,
        inherit = inherit,
        permissions = ranks[inherit].permissions
    }
    ranks[newRank.name] = newRank

    rank.printAllRanks()
end

function rank.removeRank(name)
    if not(ranks[name]) then print("Error: that rank does not exist.") return end
    if(name == user.name or name == superadmin.name) then print("Error you can not remove that rank.") return end

    ranks[name] = nil

    rank.printAllRanks()
end

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
    print(rankName)
    print(ranks[rankName].name)
    return ranks[rankName]
end

bAdmin.rank = rank