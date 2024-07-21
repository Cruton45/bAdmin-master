bAdmin = {}

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
    include("modules/sv/commands/bot.lua")
    include("modules/sv/ranks.lua")
    include("modules/sv/player.lua")
    include("modules/sv/commands/teleport.lua")
    include("modules/sv/commands/rank.lua")
    include("modules/sv/commands.lua")
    include("modules/sv/notification.lua")
end
-- Client ------------------------------------------------------------------------------
if SERVER then
    AddCSLuaFile("modules/cl/command.lua")
    AddCSLuaFile("modules/cl/notification.lua")
end
if CLIENT then
    include("modules/cl/command.lua")
    include("modules/cl/notification.lua")
end
-----------------------------------------------------------------------------------------
bAdmin_IsLoaded = true