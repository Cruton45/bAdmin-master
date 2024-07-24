if (bAdmin_IsLoaded) then return end

local version = 1

bAdmin = {}
bAdmin.version = version

local ClientModules = file.Find("ba_modules/cl/*.lua", "LUA")
local SharedModules = file.Find("ba_modules/sh/*.lua", "LUA")
local ServerModules = file.Find("ba_modules/sv/*.lua", "LUA")
local CommandModules = file.Find("ba_modules/sh/commands/*.lua", "LUA")

Msg("\n")
MsgC(Color(255, 0, 0), "///////////////////////////////\n")
MsgC(Color(255, 0, 0), "//    Bloody Admin System    //\n")
MsgC(Color(255, 0, 0), "///////////////////////////////\n")
MsgC(Color(255, 0, 0), "// Loading Modules...        //\n")


----------------------------- Module Loading -------------------------------------------
-- Shared ------------------------------------------------------------------------------
MsgC(Color(255, 0, 0), "// Shared Modules:           //\n")
for _, modFile in ipairs(SharedModules) do
    local modulePath = "ba_modules/sh/" .. modFile
    MsgC(Color(255, 0, 0), "// " .. modFile .. string.rep( " ", 26 - modFile:len() ) .. "//\n")
    if (SERVER) then
        AddCSLuaFile(modulePath)
    end
    include(modulePath)
end
-- Server ------------------------------------------------------------------------------
MsgC(Color(255, 0, 0), "// Server Modules:           //\n")
for _, modFile in ipairs(ServerModules) do
    local modulePath = "ba_modules/sv/" .. modFile
    MsgC(Color(255, 0, 0), "// " .. modFile .. string.rep( " ", 26 - modFile:len() ) .. "//\n")
    if (SERVER) then
        include(modulePath)
    end
end
-- Client ------------------------------------------------------------------------------
MsgC(Color(255, 0, 0), "// Client Modules:           //\n")
for _, modFile in ipairs(ClientModules) do
    local modulePath = "ba_modules/cl/" .. modFile
    MsgC(Color(255, 0, 0), "// " .. modFile .. string.rep( " ", 26 - modFile:len() ) .. "//\n")
    if (SERVER) then
        AddCSLuaFile(modulePath)
    end
    if (CLIENT) then
        include(modulePath)
    end
end
-- Command ------------------------------------------------------------------------------
MsgC(Color(255, 0, 0), "// Commands:                 //\n")
for _, modFile in ipairs(CommandModules) do
    local modulePath = "ba_modules/sh/commands/" .. modFile
    MsgC(Color(255, 0, 0), "// " .. modFile .. string.rep( " ", 26 - modFile:len() ) .. "//\n")
    if (SERVER) then
        AddCSLuaFile(modulePath)
    end
    include(modulePath)
end
-----------------------------------------------------------------------------------------
MsgC(Color(255, 0, 0), "///////////////////////////////\n")
Msg("\n")

bAdmin_IsLoaded = true