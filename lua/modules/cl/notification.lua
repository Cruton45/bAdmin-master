local function chatCommandBroadcast()
    local broadcastString = net.ReadString()

    chat.AddText(Color(255,0,0), "BADMIN: ", Color(0,255,34), broadcastString)
end

net.Receive("bAdmin_broadcastCommand", chatCommandBroadcast )