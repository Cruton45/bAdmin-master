print("Teleport Module Intialized.")

local bAdmin = bAdmin
local command = bAdmin.command
local utility = bAdmin.util

local TP_OFFSET = Vector(1,50,10)

local bringCmd = command.new("bring")
bringCmd.useCase = "!bring <playername>"
bringCmd.description = "Brings a player."
bringCmd.category = "Error"
bringCmd.immunity = 7
bringCmd.hasTarget = true 
bringCmd.commandFunc = function(ply, target, args)
    futurePosition = ply:GetPos() + TP_OFFSET
    target:SetPos(futurePosition)

    utility.logCommand(bringCmd, ply:Nick() .. " has brought " .. target:Nick() .. ".")
end
