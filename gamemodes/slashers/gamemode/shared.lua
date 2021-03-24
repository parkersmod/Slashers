-- Utopia Games - Slashers
--
-- @Author: Garrus2142
-- @Date:   2017-07-25 16:15:52
-- @Last Modified by:   Garrus2142
-- @Last Modified time: 2017-07-27 17:08:04

GM.Name = "Slashers";
GM.Author = "Garrus2142";
GM.Version = "1.1.0"
GM.Github = "https://github.com/Garrus2142/Slashers/"
GM.Workshop = "http://steamcommunity.com/sharedfiles/filedetails/?id=1092007703"

TEAM_KILLER = 1;
TEAM_SURVIVORS = 2;

-- Classes
CLASS_KILLER = 1001
CLASS_SURV_SPORTS = 1
CLASS_SURV_POPULAR = 2
CLASS_SURV_NERD = 3
CLASS_SURV_FAT = 4
CLASS_SURV_SHY = 5
CLASS_SURV_JUNKY = 6
CLASS_SURV_EMO = 7
CLASS_SURV_BLACK = 8
CLASS_SURV_SHERIF = 9

team.SetUp(TEAM_KILLER, "Murderer", Color(255, 0, 0), false);
team.SetUp(TEAM_SURVIVORS, "Survivors", Color(0, 0, 255), false);

-- Header message
print("\n### This server run Slashers Gamemode by Utopia-Games ###\n")
print("Version: " .. GM.Version)
print("Workshop: " .. GM.Workshop)
print("Github: " .. GM.Github)
print("\n###                 Thanks for playing                ###\n")

-- TODO: Should probably move this stuff, and should try to find a way to detect ACTs (try examining an addon that plays anims)
local mdl_land_list = {}
-- Survivors
mdl_land_list["models/player/eli.mdl"] = true -- Fallback survivor model
mdl_land_list["models/steinman/slashers/sport_pm.mdl"] = true
mdl_land_list["models/steinman/slashers/popular_pm.mdl"] = false
mdl_land_list["models/steinman/slashers/nerd_pm.mdl"] = false
mdl_land_list["models/steinman/slashers/fat_pm.mdl"] = false
mdl_land_list["models/player/korka007/maxc.mdl"] = false
mdl_land_list["models/steinman/slashers/junky_pm.mdl"] = false
mdl_land_list["models/steinman/slashers/emo_pm.mdl"] = true
mdl_land_list["models/player/spike/lamar.mdl"] = true
mdl_land_list["models/steinman/slashers/sheriff_pm.mdl"] = true
-- Killers
mdl_land_list["models/player/screamplayermodel/scream/scream.mdl"] = true -- Old slash_highschool killer
mdl_land_list["models/error/ghostface/classic_ghostface_pm.mdl"] = true -- New slash_highschool killer
mdl_land_list["models/steinman/slashers/intruder_pm.mdl"] = false -- Old slash_lodge killer
mdl_land_list["models/players/an_shining_jack.mdl"] = true -- New slash_lodge killer
mdl_land_list["models/steinman/slashers/bates_pm.mdl"] = false -- slash_motel killer
mdl_land_list["models/player/dewobedil/mike_myers/default_p.mdl"] = true -- Old slash_selvage killer
mdl_land_list["models/players/mj_dbd_myers.mdl"] = false -- New slash_selvage killer
mdl_land_list["models/slender_arrival/chaser.mdl"] = false -- Old slash_subway killer, appears to have one, but looks fucked up
mdl_land_list["models/player/freddykrueger.mdl"] = true -- New slash_subway killer
mdl_land_list["models/player/mkx_jason.mdl"] = false -- slash_summercamp killer, appears to have one, but looks fucked up
function GM:HandlePlayerLanding( ply, velocity, WasOnGround )

	if ( ply:GetMoveType() == MOVETYPE_NOCLIP ) then return end

	if ( ply:IsOnGround() && !WasOnGround ) then
        if mdl_land_list[ply:GetModel()] then -- When in doubt, leave it out
		    ply:AnimRestartGesture( GESTURE_SLOT_JUMP, ACT_LAND, true )
        end
	end

end
-- TODO: Stop glitch (possibly from prediction?)
--[[hook.Add( "PlayerInitialSpawn", "StopCrouchFuckery", function( ply ) 
    
    ply:SetHullDuck(Vector(-16, -16, 0), Vector(16, 16, 46)) -- TODO: Get better number than 46
    
end )]]
