local bAdmin = bAdmin
local command = bAdmin.command
local utility = bAdmin.util

local addBotCmd = command.new("addbot")
addBotCmd.useCase = "!addbot"
addBotCmd.description = "Adds a bot to the server."
addBotCmd.category = "Error"
addBotCmd.immunity = 7
addBotCmd.hasTarget = false
addBotCmd.canServerConsole = true
addBotCmd.commandFunc = function(ply, args)
    RunConsoleCommand("bot", "1")
    -- Could make this unnecessary if I format this into util.logCommand 
    local callerName = utility.getConsoleOrPlayerName(ply)
    command.logCommand(addBotCmd, callerName .. " has spawned a bot.") 
end
