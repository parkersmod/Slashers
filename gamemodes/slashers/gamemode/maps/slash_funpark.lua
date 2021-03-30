-- Utopia Games - Slashers
--
-- @Author: Garrus2142
-- @Date:   2017-08-09 13:41:40
-- @Last Modified by:   Valafi
-- @Last Modified time: 2021-03-27 09:35:12

local GM = GM or GAMEMODE

GM.MAP.Name = "Funpark"
GM.MAP.EscapeDuration = 90
GM.MAP.StartMusic = "slashers_start_game_jason.wav"
GM.MAP.ChaseMusic = "slashers/ambient/chase_jason.wav"
GM.MAP.Goal = {
	Generator = {
	--[[setpos -1623.627441 -682.468262 64.031250;setang 16.488054 -81.840904 0.000000
		setpos -1659.302856 -1624.982300 84.293152;setang 3.112056 179.054764 0.000000
		setpos 478.172150 691.932800 68.031250;setang 53.800030 -86.785286 0.000000
	setpos 1653.654663 1359.968750 0.031250;setang 89.000000 39.934925 0.000000
	setpos 5778.616211 -566.650879 224.031250;setang 6.456031 91.326843 0.000000
setpos 4989.496094 1050.315552 224.031250;setang 19.480042 3.950892 0.000000
setpos 2447.508057 -2396.037354 192.031250;setang 34.792038 -177.505142 0.000000
setpos 1283.981201 -2564.649902 192.031250;setang 34.088070 -97.248840 0.000000
setpos 1174.602783 -2547.905518 192.031250;setang 75.448067 176.591156 0.000000
	setpos 180.412994 -3287.223633 208.737442;setang 89.000000 100.031906 0.000000
setpos 17.320007 -2513.909912 192.031250;setang 43.944004 -49.919819 0.000000
setpos 858.664307 -2112.626465 192.031250;setang 53.447948 -174.448059 0.000000
setpos -464.098999 964.909729 64.031250;setang 54.328030 126.416641 0.000000]]




		{type="sls_generator", pos=Vector( 	-207.968750, -2886.434082, 182.031250	 ), ang=Angle(	0, 89.904541, 0.000000	),spw=false ,},
		{type="sls_generator", pos=Vector( 	283.537292, 47.705811, 54.031250	 ), ang=Angle(	0, -145.055359, 0.000000	),spw=false,},
		{type="sls_generator", pos=Vector( 	2618.575928, 1310.550293, 70.031250	 ), ang=Angle(	0, 90.592140, 0.000000	),spw=false,},
		{type="sls_generator", pos=Vector( 	-1306.075562, 1534.261719, 182.031250	 ), ang=Angle(	0, -89.200371, 0.000000	),spw=false,},
		{type="sls_generator", pos=Vector( 	-4417.766113, 354.654053,85.031250	 ), ang=Angle(	0, 91.694855, 0.000000	),spw=false,},
		{type="sls_generator", pos=Vector( 	1488.680664, -209.027054, 533.031250	 ), ang=Angle(	0.888039, 161.137146, 0.000000	),spw=false,},
	},

	Jerrican = {
		{type="sls_jerrican", pos=Vector( 	-1623.627441, -682.468262, 59.031250	 ), ang=Angle(	-31.284, 3.741, -0.192	), spw = false,},
		{type="sls_jerrican", pos=Vector( 	-1659.302856, -1624.982300, 879.293152	 ), ang=Angle(	-0.148, -179.006, -0.115	),spw = false,},
		{type="sls_jerrican", pos=Vector( 	478.172150, 691.932800, 63.031250	 ), ang=Angle(	0.577, -0.022, -0.115	),spw = false,},
		{type="sls_jerrican", pos=Vector( 	1653.654663, 1359.968750, 0.031250	 ), ang=Angle(	0.472, -0.027, -0.093	),spw = false,},
		{type="sls_jerrican", pos=Vector( 	5778.616211, -566.650879, 218.031250	 ), ang=Angle(	0.445, -0.027, -0.088	),spw = false,},
		{type="sls_jerrican", pos=Vector( 	4989.496094, 1050.315552, 218.031250	 ), ang=Angle(	-0.236, -0.044, 0.401	),spw = false,},
		{type="sls_jerrican", pos=Vector( 	2447.508057, -2396.037354, 187.031250	 ), ang=Angle(	0.066, 44.324, 0.000	),spw = false,},
		{type="sls_jerrican", pos=Vector( 	1283.981201, -2564.649902, 187.031250	 ), ang=Angle(	0.797, 0.000, -0.088	),spw = false,},
		{type="sls_jerrican", pos=Vector( 	1174.602783, -2547.905518, 187.031250	 ), ang=Angle(	-0.352, 0.027, -0.071	),spw = false,},
		{type="sls_jerrican", pos=Vector( 	180.412994, -3287.223633, 203.737442	 ), ang=Angle(	-0.170, 0.027, -0.033	),spw = false,},
		{type="sls_jerrican", pos=Vector( 	17.320007, -2513.909912, 187.031250	 ), ang=Angle(	0.604, -0.022, -0.121	),spw = false,},
		{type="sls_jerrican", pos=Vector( 	858.664307, -2112.626465, 187.031250	 ), ang=Angle(	0.434, -0.027, -0.082	),spw = false,},
		{type="sls_jerrican", pos=Vector( 	-464.098999, 964.909729, 58.031250	 ), ang=Angle(	0.428, -0.027, -0.082	),spw = false,},
		--[[{type="sls_jerrican", pos=Vector( 	-780.021362, -929.935791, 19.447821	 ), ang=Angle(	1.807, 56.799, 0.324	),spw = false,},
		{type="sls_jerrican", pos=Vector( 	8045.914551, -1821.616089, 32.290798	 ), ang=Angle(	0.593, -39.265, 0.000	),spw = false,},
		{type="sls_jerrican", pos=Vector( 	5475.315918, 3365.187500, 223.280289	 ), ang=Angle(	-0.747, 7.454, -0.005	),spw = false,},
		{type="sls_jerrican", pos=Vector( 	-792.936462, 5763.221191, 263.126678	 ), ang=Angle(	82.183, -179.995,169.547	),spw = false,},]]
	},

	Radio = {
		{type="sls_radio", pos=Vector( 	-3077.713135, -200.104660, 160.881653	 ), ang=Angle(	0, 176.384995, 0.000000	),spw = false,},
		{type="sls_radio", pos=Vector( 	-1584.564941, -1784.855713, 62.031250	 ), ang=Angle(	0, 89.777039, 0.000000	),spw = false,},
		{type="sls_radio", pos=Vector( 	495.080048, -3379.891846, 198.031250	 ), ang=Angle(	0, -178.878922, 0.000000	),spw = false,},
		{type="sls_radio", pos=Vector( 	2671.414063, -1139.618530, 555.031250	 ), ang=Angle(	0, -85.518822, 0.000000	),spw = false,},
	}
}






-- Killer
GM.MAP.Killer.Name = "Pennywise"
GM.MAP.Killer.Model = "models/auditor/com/clown/pennywise_pm.mdl"
GM.MAP.Killer.WalkSpeed = 200
GM.MAP.Killer.RunSpeed = 200
GM.MAP.Killer.ExtraWeapons = {}

if CLIENT then
	GM.MAP.Killer.Desc = GM.LANG:GetString("class_desc_penny")
	GM.MAP.Killer.Icon = Material("icons/icon_penny.png")
end

-- Convars
--CreateConVar("slashers_jason_step_duration", 30, {FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE, FCVAR_REPLICATED}, "Set duration when the footstep is displayed for Jason.")

-- Ability

--[[if CLIENT then
	local ICON_STEP = Material("icons/footsteps.png")
	local steps = {}

	local function AddStep()
		local ply, pos, ang, endtime

		ply = net.ReadEntity()
		pos = net.ReadVector()
		ang = net.ReadAngle()
		endtime = net.ReadInt(16)

		ang.p = 0
		ang.r = 0

		local fpos = pos
		if ply.LastFoot then
			fpos = fpos + ang:Right() * 5
		else
			fpos = fpos + ang:Right() * -5
		end
		ply.LastFoot = not ply.LastFoot

		local trace = {}
		trace.start = fpos
		trace.endpos = trace.start + Vector(0, 0, -10)
		trace.filter = ply
		local tr = util.TraceLine(trace)

		if tr.Hit then
			local tbl = {}
			tbl.pos = tr.HitPos
			tbl.foot = foot
			tbl.endtime = endtime
			tbl.angle = ang.y
			tbl.normal = Vector(0, 0, 1)
			table.insert(steps, tbl)
		end
	end
	net.Receive("sls_kability_AddStep", AddStep)

	local maxDistance = 600 ^ 2
	local function PostDrawTranslucentRenderables()
		local pos = EyePos()

		cam.Start3D(pos, EyeAngles())
			render.SetMaterial(ICON_STEP)
			for k, v in ipairs(steps) do
				if CurTime() > v.endtime then
					table.remove(steps, k)
					goto cont
				end
				if (v.pos - pos):LengthSqr() < maxDistance then
					render.DrawQuadEasy(v.pos + v.normal, v.normal, 10, 20, Color(255, 255, 255), v.angle)
				end

				::cont::
			end
		cam.End3D()
	end
	hook.Add("PostDrawTranslucentRenderables", "sls_kability_PostDrawTranslucentRenderables", PostDrawTranslucentRenderables)

	local function Reset()
		steps = {}
	end
	hook.Add("sls_round_PreStart", "sls_kability_PreStart", Reset)
	hook.Add("sls_round_End", "sls_kability_End", Reset)

else
	util.AddNetworkString("sls_kability_AddStep")

	local function PlayerFootstep(ply, pos, foot, sound, volume, filter)
		if ply:GetColor() == Color(255,255,255,0) then return true end
		if not GM.ROUND.Active or not IsValid(GM.ROUND.Killer) then return end
		if ply:Team() ~= TEAM_SURVIVORS then return end
		if ply.ClassID == CLASS_SURV_SHY then return end

		net.Start("sls_kability_AddStep")
			net.WriteEntity(ply)
			net.WriteVector(pos)
			net.WriteAngle(ply:GetAimVector():Angle())
			net.WriteInt(CurTime() + GetConVar("slashers_jason_step_duration"):GetFloat(), 16)
		net.Send(GM.ROUND.Killer)
	end
	hook.Add("PlayerFootstep", "sls_kability_PlayerFootstep", PlayerFootstep)
end

hook.Add( "PlayerFootstep", "sls_kability_CDisableSoundFootStepsUnique", function( ply, pos, foot, sound, volume, filter )
	if ply:GetColor().a == 0  then
		return true
	else
		return
	end
end )]]
