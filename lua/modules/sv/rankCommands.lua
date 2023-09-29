print("Rank Commands Module Intialized.")

local bAdmin = bAdmin
local command = bAdmin.command
local _player = bAdmin.player
local rank = bAdmin.rank

local addRankCmd = command.new("addrank")
addRankCmd.useCase = "!addrank <rank_name> <rank_immunity> <rank_inheritance>"
addRankCmd.description = "Add a new user rank."
addRankCmd.category = "Error"
addRankCmd.immunity = 7
addRankCmd.hasTarget = false
addRankCmd.commandFunc = function(ply, args)
    -- Run check on args to make sure there are strings and ints where needed
    local name = args[1]
    local immunity = tonumber(args[2])
    local inherit = args[3]

    if not(name or immunity or inherit) then print("Error: You did not use adduser correctly.\nCorrect use: " .. addRankCmd.useCase) return end

    rank.addRank(name, immunity, inherit)
end

local removeRankCmd = command.new("removerank")
removeRankCmd.useCase = "!removerank <rank_name>"
removeRankCmd.description = "Remove a user rank."
removeRankCmd.category = "Error"
removeRankCmd.immunity = 7
removeRankCmd.hasTarget = false
removeRankCmd.commandFunc = function(ply, args)
    local name = args[1]
    if not(name) then print("Error: You did not use adduser correctly.\nCorrect use: " .. removeRankCmd.useCase) return end

    rank.removeRank(name)
end

local addUserCmd = command.new("adduser")
addUserCmd.useCase = "!adduser <player_name><rank_name>"
addUserCmd.description = "Add a user to the rank."
addUserCmd.category = "Error"
addUserCmd.immunity = 7
addUserCmd.hasTarget = true
addUserCmd.commandFunc = function(ply, target, args)
    local name = args[1]
    if not(name) then print("Error: You did not use adduser correctly.\nCorrect use: " .. addUserCmd.useCase) return end

    _player.setRank(target, name)
end