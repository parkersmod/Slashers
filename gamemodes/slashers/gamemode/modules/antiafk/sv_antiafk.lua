-- Utopia Games - Slashers
--
-- @Author: Garrus2142
-- @Date:   2017-07-26 01:30:34
-- @Last Modified by:   Valafi
-- @Last Modified time: 2021-03-27 06:16:57

-- Hooks PlayerSpawn, sets up afk stuff on ply
local function PlayerSpawn(ply)
	ply.afk = {}

	if ply:IsBot() or ply:IsListenServerHost() then -- TODO: Could exclude admins, superadmins, and a custom list
		print("Disabling Anti-AFK for " .. ply:Name())
		ply.afk.allowed = true
	else
		print("Enabling Anti-AFK for " .. ply:Name())
		ply.afk.allowed = false
		ply.afk.lastpos = ply:GetPos()
		ply.afk.lastang = ply:EyeAngles()
		ply.afk.prevtime = CurTime()
	end
end

-- Infinite 1 sec timer, checks AFK properties
local function Timer()
	-- Get convars
	local CV_afktime = GetConVar("slash_antiafk_afktime")
	local CV_afkmsgtime = GetConVar("slash_antiafk_afkmsgtime")

	-- Check convars
	if not CV_afktime or not CV_afkmsgtime then return end

	-- Get data
	local afktime = CV_afktime:GetInt()
	local afkmsgtime = CV_afkmsgtime:GetInt()
	local curtime = CurTime()

	for _, v in ipairs(player.GetAll()) do
		if v.afk == nil then -- AFK values aren't set, probably due to enabling the Anti-AFK system post round start
			PlayerSpawn(v) -- Set those values!
		end

		if v.afk.allowed then goto cont end -- This is a Chad, leave them alone
		if not v:Alive() then goto cont end -- This person is spectating, next!

		if v.afk.lastpos ~= v:GetPos() or v.afk.lastang ~= v:EyeAngles() then
			-- Reset
			v.afk.lastpos = v:GetPos()
			v.afk.lastang = v:EyeAngles()
			v.afk.prevtime = curtime
			v:SetNWInt("afk_warn", 0)
		elseif curtime > v.afk.prevtime + (afktime + afkmsgtime) then
			-- Kick
			v:Kick("You were kicked by the anti-afk system.")
			for _, u in ipairs(player.GetAll()) do
				u:ChatPrint(v:Name() .. " kicked by anti-afk")
			end
		elseif v:GetNWInt("afk_warn") == 0 and curtime > v.afk.prevtime + afktime then
			-- Warning
			v:SetNWInt("afk_warn", v.afk.prevtime + (afktime + afkmsgtime))
		end

		::cont::
	end
end

local function Power(enable)
	if enable then
		hook.Add("PlayerSpawn", "antiafk_PlayerSpawn", PlayerSpawn)
		timer.Create("antiafk_Timer", 1, 0, Timer)
	else
		hook.Remove("PlayerSpawn", "antiafk_PlayerSpawn")
		timer.Remove("antiafk_Timer")
	end
end
cvars.AddChangeCallback("slash_antiafk_enable", function(_, prev, curr)
	local next = tobool(curr)
	if tobool(prev) ~= next then
		Power(next)
	end
end)

hook.Add("PlayerInitialSpawn", "antiafk_PlayerInitialSpawn", function() -- TODO: There is definitely a better way to make sure the convar is set
	local CV_enable = GetConVar("slash_antiafk_enable")
	Power(CV_enable:GetBool()) -- TODO: GetBool probably works different than tobool
end)
