print("Server Commands Module Intialized.")

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

local function getPlayersByName(name)
    local found = {}

    if not(name) then return nil end
    
    -------------------- Bot is recived by player.GetAll
    PrintTable( player.GetAll() )

    -------------------- Not in the for loop though
    for k, v in ipairs(player.GetAll()) do
        print(v:Nick())
        if string.find(string.lower(v:Nick()), string.lower(name)) then
            table.insert(found, v)
        end
    end

    return found
end

local function rankCheck(ply)
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

local function chatCommandHandler(len, ply)
    local chatCommand = net.ReadString()
    local args = net.ReadTable()
    if not(command.CommandExist(chatCommand)) then print("Error: Command does not exist.") return end

    local possibleTarget = getPlayersByName(args[1])

    if(possibleTarget and #possibleTarget > 1) then print("Error: Found two targets.") return end
    if(possibleTarget and #possibleTarget < 1) then print("Error: Found no targets.") return end
    --if not(rankCheck(ply)) then print("Error: Do not have permision for this command.") return end

    if(possibleTarget) then
        local target = possibleTarget[1]
        command.Execute(chatCommand, ply, target, args)
    else
        command.Execute(chatCommand, ply, args)
    end
end

net.Receive( "sendCommandToServer",  chatCommandHandler)
util.AddNetworkString("sendCommandToServer")