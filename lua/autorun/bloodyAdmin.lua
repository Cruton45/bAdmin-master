bAdmin = {}

----------------------------- Module Loading -------------------------------------------
-- Shared ------------------------------------------------------------------------------
if SERVER then
    AddCSLuaFile("ba_modules/sh/commands.lua")
    AddCSLuaFile("ba_modules/sh/cami.lua")
    AddCSLuaFile("ba_modules/sh/util.lua")
end
include("ba_modules/sh/commands.lua")
include("ba_modules/sh/cami.lua")
include("ba_modules/sh/util.lua")
-- Server ------------------------------------------------------------------------------
if SERVER then
    include("ba_modules/sv/commands/bot.lua")
    include("ba_modules/sv/ranks.lua")
    include("ba_modules/sv/player.lua")
    include("ba_modules/sv/commands/teleport.lua")
    include("ba_modules/sv/commands/rank.lua")
    include("ba_modules/sv/commands.lua")
    include("ba_modules/sv/notification.lua")
end
-- Client ------------------------------------------------------------------------------
if SERVER then
    AddCSLuaFile("ba_modules/cl/command.lua")
    AddCSLuaFile("ba_modules/cl/notification.lua")
end
if CLIENT then
    include("ba_modules/cl/command.lua")
    include("ba_modules/cl/notification.lua")
end
-----------------------------------------------------------------------------------------
bAdmin_IsLoaded = true