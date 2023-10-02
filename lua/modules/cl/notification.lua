--[[
This is coded, but I do not like that I had to pass the player to relay notifcation for chatCommandNotify to work. Refactor how this works. Everything is kinda hard to track. Also fix all other
commands. Currently only works for removerank.
]]--
local NOTIFICATION_PREFIX = "BADMIN: "

local function chatCommandBroadcast()
    local broadcastString = net.ReadString()

    chat.AddText(Color(255,0,0), NOTIFICATION_PREFIX, Color(0,255,34), broadcastString)
end

local function chatCommandNotify()
    local notifyString = net.ReadString()

    chat.AddText(Color(255,0,0), NOTIFICATION_PREFIX, Color(0,255,34), notifyString)
end

net.Receive("bAdmin_broadcastCommand", chatCommandBroadcast )
net.Receive("bAdmin_commandErrorNotify", chatCommandNotify)