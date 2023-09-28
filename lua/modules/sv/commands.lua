print("Server Commands Module Intialized.")

local bAdmin = bAdmin
local command = bAdmin.command
local rank = bAdmin.rank

local function getPlayersByName(name)
    local found = {}

    if not(name) then return nil end
    
    for k, v in ipairs(player.GetAll()) do
        if string.find(string.lower(v:Nick()), string.lower(name)) then
            table.insert(found, v)
        end
    end

    return found
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
    local plyRank = ply:GetUserGroup()

    if not(command.CommandExist(chatCommand)) then print("Error: Command does not exist.") return end

    local possibleTarget = getPlayersByName(args[1])

    if(possibleTarget and #possibleTarget > 1) then print("Error: Found more than one targets.") return end
    if(possibleTarget and #possibleTarget < 1) then print("Error: Found no targets.") return end
    if not(rank.hasPermision(plyRank, chatCommand)) then print("Error: Do not have permision for this command.") return end

    if(possibleTarget) then
        local target = possibleTarget[1]
        command.Execute(chatCommand, ply, target, args)
    else
        command.Execute(chatCommand, ply, args)
    end
end

net.Receive( "sendCommandToServer",  chatCommandHandler)
util.AddNetworkString("sendCommandToServer")