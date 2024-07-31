local function commandBroadcast(broadcastString)
    if not(broadcastString) then print("Error: Server broadcast failed. Broadcast string is nil.") return end
    if not(isstring(broadcastString)) then print("Error: Server broadcast failed. Passed a values that wasn't a string.") return end

    if (SERVER) then
        net.Start("bAdmin_broadcastCommand")
        net.WriteString(broadcastString)
        net.Broadcast()
    end
end

local function commandErrorNotify(caller, notifyString)
    if not(notifyString) then print("Error: Server broadcast failed. Broadcast string is nil.") return end
    if not(isstring(notifyString)) then print("Error: Server broadcast failed. Passed a values that wasn't a string.") return end

    if (SERVER) then
        net.Start("bAdmin_commandErrorNotify")
        net.WriteString(notifyString)
        net.Send(caller) 
    elseif (CLIENT) then
        print("Need Command Error string func with client")
    end
end

hook.Add("bAdmin_commandSuccess", "bAdmin_broadcastCommand", commandBroadcast)
hook.Add("bAdmin_chatCommandFailure", "bAdmin_notifyCommandCaller", commandErrorNotify)

// Maybe move this
if (SERVER) then
    util.AddNetworkString("bAdmin_broadcastCommand")
    util.AddNetworkString("bAdmin_commandErrorNotify")
end
