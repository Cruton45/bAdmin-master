print("Bot Module Intialized.")

local bAdmin = bAdmin
local command = bAdmin.command

local addBotCmd = command.new("addbot")
addBotCmd.useCase = "!addbot"
addBotCmd.description = "Adds a bot to the server."
addBotCmd.category = "Error"
addBotCmd.immunity = 7
addBotCmd.hasTarget = false
addBotCmd.commandFunc = function(ply, args)
    RunConsoleCommand("bot", "1")    
end
