print("Bot Module Intialized.")

local bAdmin = bAdmin
local command = bAdmin.command

bringCmd = command.new("addbot")
bringCmd.Description = "Adds a bot to the server."
bringCmd.Category = "Error"
bringCmd.Immunity = 7
bringCmd.CommandFunc = function(ply, args)
    RunConsoleCommand("bot", "1")
end

----------------------------
command.printAllCommands()