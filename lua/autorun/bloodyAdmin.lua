bAdmin = {}
bAdmin.ranks = {}
bAdmin.player = {}

if SERVER then
    AddCSLuaFile("modules/sh/commands.lua")
end
include("modules/sh/commands.lua")

----------------------------- Module Loading -------------------------------------------
-- Server ------------------------------------------------------------------------------
if SERVER then
    include("modules/sv/teleport.lua")
    include("modules/sv/bot.lua")
end
-- Client ------------------------------------------------------------------------------
if SERVER then
    AddCSLuaFile("modules/cl/chatCommand.lua")
end
if CLIENT then
    include("modules/cl/chatCommand.lua")
end
-- Shared ------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
bAdmin_IsLoaded = true