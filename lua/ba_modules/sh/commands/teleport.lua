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
    target.ba_previousPosition = target:GetPos()
    target.ba_previousAngle = target:EyeAngles()

    futurePosition = ply:GetPos() + TP_OFFSET
    target:SetPos(futurePosition)
    target:SetEyeAngles((ply:GetPos() - futurePosition):Angle())

    utility.logCommand(bringCmd, ply:Nick() .. " has brought " .. target:Nick() .. ".")
end 

local returnCmd = command.new("return")
returnCmd.useCase = "!return <playername>"
returnCmd.description = "Brings a player."
returnCmd.category = "Error"
returnCmd.immunity = 7
returnCmd.hasTarget = true 
returnCmd.canServerConsole = false
returnCmd.commandFunc = function(ply, target, args)
    if not(target.ba_previousPosition) then
        print("Does not have a return point.")
        return
    end
    
    target:SetPos(target.ba_previousPosition)
    target:SetEyeAngles(target.ba_previousAngle)

    target.ba_previousPosition, target.ba_previousAngle = nil, nil
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