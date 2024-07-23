local bAdmin = bAdmin
local _command = bAdmin.command

local function commandHandler(ply, cmd, args)
	local chatCommand = args[1]

	table.remove(args, 1)

	net.Start("sendCommandToServer")
	net.WriteString(chatCommand)
	net.WriteTable(args)
	net.SendToServer()
end

hook.Add( "OnPlayerChat", "mjailcommandcheck", function( ply, text)
	if (string.sub(text, 1, 1):lower() == "!") then
		local args = string.Explode(" ", string.sub(text, 2))
		commandHandler(ply, "", args)
		return true
	end
end)

concommand.Add("badmin", commandHandler)