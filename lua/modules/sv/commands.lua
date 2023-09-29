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
    local commandString = net.ReadString()
    local chatCommand = command.getCommand(commandString)
    local args = net.ReadTable()
    local plyRank = ply:GetUserGroup()

    if not(chatCommand) then print("Error: Command does not exist.") return end
    if not(rank.hasPermision(plyRank, chatCommand)) then print("Error: Do not have permision for this command.") return end

    if(chatCommand.hasTarget) then
        local possibleTarget = getPlayersByName(args[1])

        if(possibleTarget and #possibleTarget > 1) then print("Error: Found more than one targets.") return end
        if(possibleTarget and #possibleTarget < 1) then print("Error: Found no targets.") return end

        local target = possibleTarget[1]
        -- Remove target from args
        table.remove(args, 1)

        chatCommand.commandFunc(ply, target, args)
    else
        chatCommand.commandFunc(ply, args)
    end
end

command.printAllCommands()

net.Receive( "sendCommandToServer",  chatCommandHandler)
util.AddNetworkString("sendCommandToServer")