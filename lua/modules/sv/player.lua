print("Server Player Module Intialized.")

local bAdmin = bAdmin
local command = bAdmin.command
local rank = bAdmin.rank

local _player = {}

function _player.setRank(target, rankName)
    possibleRank = rank.getRank(rankName)

    if not(possibleRank) then print("Error: That rank does not exist.") return end
    if(target:GetUserGroup() == rankName) then print("Error: The user is already that rank.") return end
    
    target:SetUserGroup(possibleRank.name)

    print(target:Nick() .. " has been set to the rank: " .. target:GetUserGroup())
end

bAdmin.player = _player


