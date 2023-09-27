hook.Add( "OnPlayerChat", "mjailcommandcheck", function( ply, text)
	if (string.sub(text, 1, 1):lower() == "!") then
		local args = string.Explode(" ", string.sub(text, 2))
		local chatCommand = args[1]

		table.remove(args, 1)

		net.Start("sendCommandToServer")
		net.WriteString(chatCommand)
		net.WriteTable(args)
		net.SendToServer()
		return true
	end
end )


--[[hook.Add( "OnPlayerChat", "mjailcommandcheck", function( ply, text)
	if (string.sub(text, 1, 6):lower() == "!bring") then
		local args = string.Explode(" ", text)
		net.Start("sendTeleportArgs")
		net.WriteTable(args)
		net.SendToServer()
		return true
	--[[elseif (string.sub(text, 1, 8) == "!munjail") then
		local args = string.Explode(" ", text)
		net.Start("munjailServer")
		net.WriteEntity(ply)
		net.WriteString(args[2])
		net.SendToServer()
	end
end]]--