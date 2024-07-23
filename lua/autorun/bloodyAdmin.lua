if (bAdmin_IsLoaded) then return end

local version = 1

bAdmin = {}
bAdmin.version = version

local ClientModules = file.Find("ba_modules/cl/*.lua", "LUA")
local SharedModules = file.Find("ba_modules/sh/*.lua", "LUA")
local ServerModules = file.Find("ba_modules/sv/*.lua", "LUA")
local CommandModules = file.Find("ba_modules/sh/commands/*.lua", "LUA")

----------------------------- Module Loading -------------------------------------------
-- Shared ------------------------------------------------------------------------------
for _, modFile in ipairs(SharedModules) do
    local modulePath = "ba_modules/sh/" .. modFile
    if (SERVER) then
        AddCSLuaFile(modulePath)
    end
    include(modulePath)
end

for _, modFile in ipairs(CommandModules) do
    local modulePath = "ba_modules/sh/commands/" .. modFile
    if (SERVER) then
        AddCSLuaFile(modulePath)
    end
    include(modulePath)
end
-- Server ------------------------------------------------------------------------------
for _, modFile in ipairs(ServerModules) do
    local modulePath = "ba_modules/sv/" .. modFile
    if (SERVER) then
        include(modulePath)
    end
end
-- Client ------------------------------------------------------------------------------
for _, modFile in ipairs(ClientModules) do
    local modulePath = "ba_modules/cl/" .. modFile
    if (SERVER) then
        AddCSLuaFile(modulePath)
    end
    if (CLIENT) then
        include(modulePath)
    end
end
-----------------------------------------------------------------------------------------
bAdmin_IsLoaded = true