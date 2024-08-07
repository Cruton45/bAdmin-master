if bAdmin_IsLoaded then return end

local bAdmin = bAdmin
local commands = {}
local command = {}

command.__index = command

function command.new(cmdName)
    local self = setmetatable(self or {},command)
    self.name = cmdName:lower() or "Unamed"
    self.useCase = self.useCase or "Error"
    self.description = self.description or "Error"
    self.category = self.category or "Error"
    self.immunity = self.immunity or 0
    self.hasTarget = self.hasTarget or true
    self.canServerConsole = self.canServerConsole or false
    self.commandFunc = function()
        print("Error: Command Func Nil")
    end

    commands[self.name] = self

    return self
end

function command.printAllCommands()
    for k, v in pairs(commands) do
        print(k, v.description)
    end
end

function command.commandExist(commandName)
    if (commands[commandName]) then
        return true
    else
        return false
    end
end

function command.getCommand(commandName)
    return commands[commandName]
end

function command.commandError(caller, errorString)
    hook.Run( "bAdmin_chatCommandFailure", caller, errorString)
end

-- Refactor and add more functionality here. Add custom formating with string.
-- Don't like calling this function in every command function, figure something else out.
function command.logCommand(usedCommand, str)
    hook.Run( "bAdmin_commandSuccess", str)
end

function command.useCaseError(caller, usedCommand)
    --hook.Run( "bAdmin_notifyCommandCaller", "You did not use " .. usedCommand.name .. "correctly.\n Correct use is: " .. usedCommand.useCase)
end

bAdmin.command = command
bAdmin.commands = commands
