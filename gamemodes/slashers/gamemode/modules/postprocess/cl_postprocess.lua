-- Utopia Games - Slashers
--
-- @Author: Garrus2142
-- @Date:   2017-07-25 16:15:50
-- @Last Modified by:   Valafi
-- @Last Modified time: 2021-03-21 03:27:00

local GM = GM or GAMEMODE
local mat_ColorMod = Material( "pp/colour" )

mat_ColorMod:SetTexture( "$fbtexture", render.GetScreenEffectTexture() )


local tab = {}

local function DrawColorModify( tab )
	if LocalPlayer():GetObserverMode() ~= OBS_MODE_NONE then -- Spectate vision (but not for round start/end)
		tab[ "$pp_colour_addr" ] 		= 0
		tab[ "$pp_colour_addg" ] 		= 0
		tab[ "$pp_colour_addb" ] 		= 0
		tab[ "$pp_colour_brightness" ] 	= 0.08
		tab[ "$pp_colour_contrast" ] 	= 1
		tab[ "$pp_colour_colour" ] 		= 0.5
		tab[ "$pp_colour_mulr" ] 		= 0
		tab[ "$pp_colour_mulg" ] 		= 0
		tab[ "$pp_colour_mulb" ] 		= 0
	elseif LocalPlayer():Team() == TEAM_KILLER and GM.ROUND.Active then -- Killer vision
		tab["$pp_colour_addr"] = 0
	    tab["$pp_colour_addg"] = 0
	    tab["$pp_colour_addb"] = 0
	    tab["$pp_colour_brightness"] = -0.02 -- Nerfed from -0.05
	    tab["$pp_colour_contrast"] = 1
	    tab["$pp_colour_colour"] = 1.35
	    tab["$pp_colour_mulr"] = .1
	    tab["$pp_colour_mulg"] = .1
	    tab["$pp_colour_mulb"] = .1
	elseif GM.ROUND.Survivors and GM.ROUND.Active and LocalPlayer().ClassID == CLASS_SURV_JUNKY then -- Weed vision
		tab[ "$pp_colour_addr" ] 		= 0
		tab[ "$pp_colour_addg" ] 		= 0
		tab[ "$pp_colour_addb" ] 		= 0
		tab[ "$pp_colour_brightness" ] 	= 0.1
		tab[ "$pp_colour_contrast" ] 	= 1
		tab[ "$pp_colour_colour" ] 		= 1
		tab[ "$pp_colour_mulr" ] 		= 10
		tab[ "$pp_colour_mulg" ] 		= 60
		tab[ "$pp_colour_mulb" ] 		= 1	
	else -- Survivor vision (also for round start/end)
		tab[ "$pp_colour_addr" ] 		= 0.02
		tab[ "$pp_colour_addg" ] 		= 0.02
		tab[ "$pp_colour_addb" ] 		= 0.02
		tab[ "$pp_colour_brightness" ] 	= -0.02
		tab[ "$pp_colour_contrast" ] 	= 1.2
		tab[ "$pp_colour_colour" ] 		= 1
		tab[ "$pp_colour_mulr" ] 		= 0.1
		tab[ "$pp_colour_mulg" ] 		= 0.1
		tab[ "$pp_colour_mulb" ] 		= 0.1
	end

	render.UpdateScreenEffectTexture()

	for k, v in pairs( tab ) do

		mat_ColorMod:SetFloat( k, v )
		
	end

	render.SetMaterial( mat_ColorMod )
	render.DrawScreenQuad()
end

hook.Add( "Think", "Killer_Light", function()
	if LocalPlayer():Team() ~= TEAM_KILLER or not GM.ROUND.Active then return end
	local dlight = DynamicLight( LocalPlayer():EntIndex() )
	clr = Color(90,20,0,255)
	if ( dlight ) then
		dlight.pos = LocalPlayer():GetShootPos()
		dlight.r = clr.r
		dlight.g = clr.g
		dlight.b = clr.b
		dlight.brightness = 1
		dlight.Decay = 10
		dlight.Size = 1000
		dlight.DieTime = CurTime() + 1
	end
end )

function GM:RenderScreenspaceEffects()
	DrawColorModify( tab )
end
