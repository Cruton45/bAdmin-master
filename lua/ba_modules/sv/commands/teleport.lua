print("Teleport Module Intialized.")

local bAdmin = bAdmin
local command = bAdmin.command
local utility = bAdmin.util
local _player = bAdmin.player

local TP_OFFSET = Vector(1,50,10)

local bringCmd = command.new("bring")
bringCmd.useCase = "!bring <playername>"
bringCmd.description = "Brings a player."
bringCmd.category = "Error"
bringCmd.immunity = 7
bringCmd.hasTarget = true
bringCmd.canServerConsole = false
bringCmd.commandFunc = function(ply, target, args)
    futurePosition = ply:GetPos() + TP_OFFSET
    target:SetPos(futurePosition)

    utility.logCommand(bringCmd, ply:Nick() .. " has brought " .. target:Nick() .. ".")
end

-- Find a better place for noclip command.
local noclipCommand = command.new("noclip")
noclipCommand.useCase = "!noclip"
noclipCommand.description = "Noclips a player."
noclipCommand.category = "Error"
noclipCommand.immunity = 7
noclipCommand.hasTarget = false
noclipCommand.canServerConsole = false
noclipCommand.commandFunc = function(ply, args)
    _player.setNoclip(ply)
end