-- Utopia Games - Slashers
--
-- @Author: Garrus2142
-- @Date:   2017-07-25 16:15:51
-- @Last Modified by:   Valafi
-- @Last Modified time: 2021-03-21 03:27:00

local GM = GM or GAMEMODE

local ICON_SC_LINE = Material("icons/scoreboard_line.png")
local ICON_CROSS = Material("icons/icon_cross.png")
local ICON_CHECK = Material("icons/icon_safe.png")

local scrW, scrH = ScrW(), ScrH()
local bgWidth, bgHeight = 512, 80
local showScoreboard = false
local canScoreboard = true

local opacity = 0
local function HUDDrawScoreBoard()
	if showScoreboard and opacity < 255 then
		opacity = Lerp(0.1, opacity, 255)
	elseif not showScoreboard and opacity > 0 then
		opacity = Lerp(0.1, opacity, 0)
	end
	if opacity == 0 then return end
	local players = {}
	local playerscount
	local yStartInit

	table.Add(players, team.GetPlayers(TEAM_KILLER))
	table.Add(players, team.GetPlayers(TEAM_SURVIVORS))
	for _, v in ipairs(player.GetAll()) do
		if not table.HasValue(players, v) then
			table.insert(players, v)
		end
	end
	playerscount = #players
	yStartInit = scrH / 2 - ((playerscount * bgHeight) / 2)

	for k, v in ipairs(players) do
		if not IsValid(v) then continue end

		-- BG
		surface.SetDrawColor(Color(255, 255, 255, opacity))
		surface.SetMaterial(ICON_SC_LINE)
		surface.DrawTexturedRect(scrW / 2 - bgWidth / 2, yStartInit + ((k - 1) * bgHeight), bgWidth, 128)

		-- ICON
		local drawIcon = false
		if v:Team() == TEAM_KILLER then
			surface.SetMaterial(GM.MAP.Killer.Icon)
			drawIcon = true
		elseif v:Team() == TEAM_SURVIVORS and v.ClassID ~= 0 and GM.CLASS.Survivors[v.ClassID] then
			surface.SetMaterial(GM.CLASS.Survivors[v.ClassID].icon)
			drawIcon = true
		end
		if drawIcon then
			surface.DrawTexturedRect(scrW / 2 - bgWidth / 2 + 30, yStartInit + ((k - 1) * bgHeight + 3), 64, 64)
			if v:GetNWBool("Escaped") then
				surface.SetMaterial(ICON_CHECK)
				surface.DrawTexturedRect(scrW / 2 - bgWidth / 2 + 30, yStartInit + ((k - 1) * bgHeight + 3), 64, 64)
			elseif not v:Alive() and v:Team() ~= TEAM_KILLER then
				surface.SetMaterial(ICON_CROSS)
				surface.DrawTexturedRect(scrW / 2 - bgWidth / 2 + 30, yStartInit + ((k - 1) * bgHeight + 3), 64, 64)
			end
		end

		-- Pseudo
		local nick = v:Name()
		surface.SetFont("horrortext")
		surface.SetTextColor(Color(255, 255, 255, opacity))
		local tw, th = surface.GetTextSize(nick)
		while tw > 350 do
			nick = string.sub(nick, 1, string.len(nick) - 2)
			tw, th = surface.GetTextSize(nick)
		end
		surface.SetTextPos(scrW / 2 - bgWidth / 2 + 104, yStartInit + ((k - 1) * bgHeight + 35 - th / 2))
		surface.DrawText(nick)
	end
end
hook.Add("HUDDrawScoreBoard", "scoreboard_HUDDrawScoreBoard", HUDDrawScoreBoard)

local function ScoreboardShow()
	if canScoreboard then
		showScoreboard = true
	end
	return false
end
hook.Add("ScoreboardShow", "scoreboard_ScoreboardShow", ScoreboardShow)

local function ScoreboardHide()
	if canScoreboard then
		showScoreboard = false
	end
	return false
end
hook.Add("ScoreboardHide", "scoreboard_ScoreboardHide", ScoreboardHide)

local function PostStart()
	canScoreboard = true
end
hook.Add("sls_round_PostStart", "sls_scoreboard_PostStart", PostStart)

local function OnTeamWin(winner)
	canScoreboard = false
	timer.Simple(11, function()
		if not GM.ROUND.Active then
			canScoreboard = false
			showScoreboard = true
			timer.Simple(GM.CONFIG["round_duration_end"] - 13, function()
				if not GM.ROUND.Active then
					showScoreboard = false
					canScoreboard = true
				end
			end)
		end
	end)
end
hook.Add("sls_round_OnTeamWin", "sls_scoreboard_OnTeamWin", OnTeamWin)
