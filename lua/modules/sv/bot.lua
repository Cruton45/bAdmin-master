print("Bot Module Intialized.")

local bAdmin = bAdmin
local command = bAdmin.command

addBotCmd = command.new("addbot")
addBotCmd.UseCase = "!addbot"
addBotCmd.Description = "Adds a bot to the server."
addBotCmd.Category = "Error"
addBotCmd.Immunity = 7
addBotCmd.hasTarget = false
addBotCmd.CommandFunc = function(ply, args)
    RunConsoleCommand("bot", "1")
end

----------------------------
command.printAllCommands()