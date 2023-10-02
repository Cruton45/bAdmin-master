print("Server Player Module Intialized.")

local bAdmin = bAdmin
local command = bAdmin.command
local rank = bAdmin.rank

local _player = {}

function _player.setRank(caller, target, rankName)
    possibleRank = rank.getRank(rankName)

    if not(possibleRank) then command.commandError(caller, rankName .. " does not exist.") return false end
    if(target:GetUserGroup() == rankName) then command.commandError(caller, target:Nick() .. " is already " .. rankName .. ".") return false end
    
    target:SetUserGroup(possibleRank.name)

    return true 
end

function _player.setNoclip(target)
    if(target:GetMoveType() == MOVETYPE_WALK ) then
        target:SetMoveType(MOVETYPE_NOCLIP)
    elseif(target:GetMoveType() == MOVETYPE_NOCLIP) then
        target:SetMoveType(MOVETYPE_WALK)
    end
end

bAdmin.player = _player


