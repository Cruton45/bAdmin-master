print("Teleport Module Intialized.")

local bAdmin = bAdmin
local command = bAdmin.command

local TP_OFFSET = Vector(1,50,10)

bringCmd = command.new("bring")
bringCmd.UseCase = "!bring <playername>"
bringCmd.Description = "Brings a player."
bringCmd.Category = "Error"
bringCmd.Immunity = 7
bringCmd.hasTarget = true 
bringCmd.CommandFunc = function(ply, target, args)
    futurePosition = ply:GetPos() + TP_OFFSET
    target:SetPos(futurePosition)
end

command.printAllCommands()
