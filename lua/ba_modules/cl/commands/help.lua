local bAdmin = bAdmin
local command = bAdmin.command
local _utility = bAdmin.util
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

    for k, permissionName in ipairs(rankObj.permissions) do
        print(permissionName)
        local permission = command.getCommand(permissionName)
        print("------------------------------------")
        print(permission.name)
        print(permission.useCase)
        print(permission.description)
        print(permission.category)
    end
end