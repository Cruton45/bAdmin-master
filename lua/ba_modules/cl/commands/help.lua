print("Help Module Intialized.")

local bAdmin = bAdmin
local command = bAdmin.command
local utility = bAdmin.util
local rank = bAdmin.rank

local helpCmd = command.new("help")
helpCmd.useCase = "!help"
helpCmd.description = "Lists all available commands to you."
helpCmd.category = "Error"
helpCmd.immunity = 7
helpCmd.hasTarget = false
helpCmd.canServerConsole = true  
helpCmd.commandFunc = function(ply, args)
    local rankObj = rank.getRank(ply:GetUserGroup())
    print("Bloody Admin Permissions")

    for k, permission in ipairs(rankObj.permissions) do
        print("------------------------------------")
        print(permission.name)
        print(permission.useCase)
        print(permission.description)
        print(permissions.category)
    end
end