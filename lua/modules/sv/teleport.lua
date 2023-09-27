print("Teleport Module Intialized.")

local bAdmin = bAdmin
local command = bAdmin.command

local ALLOWED_RANKS = {
    ["tmod"] = 1,
    ["moderator"] = 2,
    ["admin"] = 3,
    ["senioradmin"] = 4,
    ["headadmin"] = 5,
    ["staffmanager"] = 6,
    ["superadmin"] = 7
}

local TP_OFFSET = Vector(1,50,10)

local function bring(caller, target)
    futurePosition = caller:GetPos() + TP_OFFSET
    target:SetPos(futurePosition)
end

local function getPlayers(name)
    local found = {}
    for k, v in ipairs(player.GetAll()) do
        if string.find(string.lower(v:Nick()), string.lower(name)) then
            table.insert(found, v)
        end
    end

    return found
end

function rankCheck(ply)
	for key, value in pairs(ALLOWED_RANKS)
	do
		rank = ply:GetUserGroup()
		if(rank == key) then
			return true
		end
	end
end

local function immunityCheck(caller, target)
	
	callerRank = caller:GetUserGroup()
	targetRank = target:GetUserGroup()
	callerImmunity = JS_ALLOWED_RANKS[callerRank]
	targetImmunity = JS_ALLOWED_RANKS[targetRank]
	if(targetImmunity == nil) then
		return true
	elseif(callerImmunity >= targetImmunity) then
		return true
	else
		return false
	end
end

local function bringCommandHandler(ply, args)
    possibleTarget = getPlayers(args[1])
    if(#possibleTarget > 1) then print("Error: Found two targets.") return end
    if(#possibleTarget < 1) then print("Error: Found no targets.") return end
    if not(rankCheck(ply)) then print("Error: " .. ply:GetUserGroup() .. " does not have permisions to use this command.") return end

    target = possibleTarget[1]
    bring(ply, target)

    print("Target is: " .. " " .. target:Nick())
end

bringCmd = command.new("bring")
bringCmd.Description = "Brings a player."
bringCmd.Category = "Error"
bringCmd.Immunity = 7
bringCmd.CommandFunc = function(ply, args)
    bringCommandHandler(ply, args)
end

command.printAllCommands()



--------------------------------------------------------

local function chatCommandHandler(len, ply)
    local chatCommand = net.ReadString()
    local args = net.ReadTable()
    if not(command.CommandExist(chatCommand)) then print("Error: Command does not exist.") return end

    command.Execute(chatCommand, ply, args)
end

net.Receive( "sendCommandToServer",  chatCommandHandler)
util.AddNetworkString("sendCommandToServer")