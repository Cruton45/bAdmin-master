print("Notification Module Intialized.")

local function commandBroadcast(broadcastString)
    if not(broadcastString) then print("Error: Server broadcast failed. Broadcast string is nil.") return end
    if not(isstring(broadcastString)) then print("Error: Server broadcast failed. Passed a values that wasn't a string.") return end

    net.Start("bAdmin_broadcastCommand")
    net.WriteString(broadcastString)
    net.Broadcast()
end


hook.Add("bAdmin_commandSuccess", "bAdmin_broadcastCommand", commandBroadcast)
util.AddNetworkString("bAdmin_broadcastCommand")