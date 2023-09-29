if bAdmin_IsLoaded then return end

local bAdmin = bAdmin
local commands = {}
local command = {}

command.__index = command

---- Add hasTarget as boolean for commands class

function command.new(cmdName)
    local self = setmetatable(self or {},command)
    self.Name = cmdName:lower() or "Unamed"
    self.UseCase = self.UseCase or "Error" 
    self.Description = self.Description or "Error"
    self.Category = self.Category or "Error"
    self.Immunity = self.Immunity or 0
    self.hasTarget = self.hasTarget or true
    self.CommandFunc = function()
        print("Error: Command Func Nil")
    end

    commands[self.Name] = self

    return self
end

function command.printAllCommands()
    for k, v in pairs(commands) do
        print(k, v.Description)
    end
end

function command.commandExist(commandName)
    if(commands[commandName]) then
        return true
    else
        return false
    end
end

function command.getCommand(commandName)
    local possibleCommand = commands[commandName]

    if(possibleCommand) then
        return possibleCommand
    else
        return nil
    end
end

bAdmin.command = command
bAdmin.commands = commands
