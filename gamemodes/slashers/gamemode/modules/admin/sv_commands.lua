-- Utopia Games - Slashers
--
-- @Author: Garrus2142
-- @Date:   2017-07-25 16:15:49
-- @Last Modified by:   Valafi
-- @Last Modified time: 2021-03-21 03:27:00

local function FindBySteamID(steamid)
	if not steamid then return end
	for _, v in ipairs(player.GetAll()) do
		if v:SteamID() == steamid then
			return v
		end
	end
end

concommand.Add("sls_restartround", function(ply, cmd, args)
	if not ply:IsSuperAdmin() then return end
	local ply = FindBySteamID(args[1])
	GAMEMODE.ROUND:Start(ply)
end)

concommand.Add("sls_changelevel", function(ply, cmd, args)
	if not ply:IsSuperAdmin() then return end
	if not args or not args[1] then return end
	RunConsoleCommand("changelevel", args[1])
end)