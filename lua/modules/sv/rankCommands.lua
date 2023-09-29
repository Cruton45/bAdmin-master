print("Rank Commands Module Intialized.")

local bAdmin = bAdmin
local command = bAdmin.command
local rank = bAdmin.rank

local addRankCmd = command.new("addrank")
addRankCmd.UseCase = "!addrank <rank_name> <rank_immunity> <rank_inheritance>"
addRankCmd.Description = "Add a new user rank."
addRankCmd.Category = "Error"
addRankCmd.Immunity = 7
addRankCmd.hasTarget = false
addRankCmd.CommandFunc = function(ply, args)
    -- Run check on args to make sure there are strings and ints where needed
    local name = args[1]
    local immunity = tonumber(args[2])
    local inherit = args[3]

    if not(name or immunity or inherit) then print("Error: You did not use adduser correctly.\nCorrect use: " .. addRankCmd.UseCase) return end

    rank.addRank(name, immunity, inherit)
end

local removeRankCmd = command.new("removerank")
removeRankCmd.UseCase = "!removerank <rank_name>"
removeRankCmd.Description = "Remove a user rank."
removeRankCmd.Category = "Error"
removeRankCmd.Immunity = 7
removeRankCmd.hasTarget = false
removeRankCmd.CommandFunc = function(ply, args)
    local name = args[1]
    if not(name) then print("Error: You did not use adduser correctly.\nCorrect use: " .. removeRankCmd.UseCase) return end

    rank.removeRank(name)
end