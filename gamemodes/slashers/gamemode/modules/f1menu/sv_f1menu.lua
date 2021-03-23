-- Utopia Games - Slashers
--
-- @Author: Guilhem PECH
-- @Date:   2017-07-26T13:50:55+02:00
-- @Last Modified by:   Valafi
-- @Last Modified time: 2021-03-21 03:27:00



util.AddNetworkString("sls_f1_menu")

local function F1Menu(ply)
	if ply:Alive() and GAMEMODE.ROUND.Active then
		net.Start("sls_f1_menu")
		net.Send(ply)
	end
end
hook.Add( "ShowHelp", "sls_F1MenuShow", F1Menu )
