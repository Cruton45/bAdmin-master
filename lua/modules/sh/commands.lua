if bAdmin_IsLoaded then return end

local bAdmin = bAdmin
local commands = {}
local command = {}

command.__index = command

function command.new(cmdName)
    local self = setmetatable(self or {},command)
    self.Name = cmdName:lower() or "unamed"
    self.Description = self.Description or "Error"
    self.Category = self.Category or "Error"
    self.Immunity = self.Immunity or 0
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

function command.CommandExist(commandName)
    if(commands[commandName]) then
        return true
    else
        return false
    end
end

function command.Execute(commandName, ply, target)
    commands[commandName].CommandFunc(ply, target)
end

bAdmin.command = command
bAdmin.commands = commands
