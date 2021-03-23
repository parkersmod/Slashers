-- Utopia Games - Slashers
--
-- @Author: Garrus2142
-- @Date:   2017-07-25 16:15:45
-- @Last Modified by:   Valafi
-- @Last Modified time: 2021-03-21 03:27:00

include("shared.lua")
include("config.lua")
include("core/_includes.lua")
include("modulesloader.lua")

local hide = {
	CHudHealth = true,
	CHudBattery = true,
	CHudAmmo = true,
	CHudDamageIndicator = true
	--CHudWeaponSelection = true
}

hook.Add( "HUDShouldDraw", "HideHUD", function( name )
	if ( hide[ name ] ) then return false end

	-- Don't return anything here, it may break other addons that rely on this hook.
end )

-- Remove the names of the players
function GM:HUDDrawTargetID()

end

function GM:HUDWeaponPickedUp()

end

function GM:HUDAmmoPickedUp()

end

function GM:DrawDeathNotice(x, y)

end
