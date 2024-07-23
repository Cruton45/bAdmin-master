local version = 1

bAdmin = {}
bAdmin.version = version

----------------------------- Module Loading -------------------------------------------
-- Shared ------------------------------------------------------------------------------
if SERVER then
    AddCSLuaFile("ba_modules/sh/commands.lua")
    AddCSLuaFile("ba_modules/sh/cami.lua")
    AddCSLuaFile("ba_modules/sh/util.lua")
    AddCSLuaFile("ba_modules/sh/ranks.lua")
    AddCSLuaFile("ba_modules/sh/commands/teleport.lua")
    AddCSLuaFile("ba_modules/sh/commands/rank.lua")
    AddCSLuaFile("ba_modules/sh/commands/bot.lua")
end
include("ba_modules/sh/commands.lua")
include("ba_modules/sh/cami.lua")
include("ba_modules/sh/util.lua")
include("ba_modules/sh/ranks.lua")
include("ba_modules/sh/commands/teleport.lua")
include("ba_modules/sh/commands/rank.lua")
include("ba_modules/sh/commands/bot.lua")
-- Server ------------------------------------------------------------------------------
if SERVER then
    include("ba_modules/sv/player.lua")
    include("ba_modules/sv/commands.lua")
    include("ba_modules/sv/notification.lua")
end
-- Client ------------------------------------------------------------------------------
if SERVER then
    AddCSLuaFile("ba_modules/cl/command.lua")
    AddCSLuaFile("ba_modules/cl/notification.lua")
    AddCSLuaFile("ba_modules/cl/commands/help.lua")
end
if CLIENT then
    include("ba_modules/cl/command.lua")
    include("ba_modules/cl/notification.lua")
    include("ba_modules/cl/commands/help.lua")
end
-----------------------------------------------------------------------------------------
bAdmin_IsLoaded = true