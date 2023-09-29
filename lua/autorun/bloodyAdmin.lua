bAdmin = {}
bAdmin.player = {}

----------------------------- Module Loading -------------------------------------------
-- Shared ------------------------------------------------------------------------------
if SERVER then
    AddCSLuaFile("modules/sh/commands.lua")
    AddCSLuaFile("modules/sh/cami.lua")
    AddCSLuaFile("modules/sh/util.lua")
end
include("modules/sh/commands.lua")
include("modules/sh/cami.lua")
include("modules/sh/util.lua")
-- Server ------------------------------------------------------------------------------
if SERVER then
    include("modules/sv/teleport.lua")
    include("modules/sv/bot.lua")
    include("modules/sv/ranks.lua")
    include("modules/sv/rankCommands.lua")
    include("modules/sv/commands.lua")
end
-- Client ------------------------------------------------------------------------------
if SERVER then
    AddCSLuaFile("modules/cl/chatCommand.lua")
end
if CLIENT then
    include("modules/cl/chatCommand.lua")
end
-----------------------------------------------------------------------------------------
bAdmin_IsLoaded = true