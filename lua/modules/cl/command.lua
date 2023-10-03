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