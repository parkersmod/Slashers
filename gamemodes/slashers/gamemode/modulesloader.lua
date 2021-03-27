-- Utopia Games - Slashers
--
-- @Author: Garrus2142
-- @Date:   2017-07-27 17:07:04
-- @Last Modified by:   Valafi
-- @Last Modified time: 2021-03-27 09:35:12

local modulesPath = "slashers/gamemode/modules"
local _, directories = file.Find(modulesPath .. "/*", "LUA")


if SERVER then print("--- MODULES ---") end
for _, mod in ipairs(directories) do
	if GM.CONFIG["disabled_modules"][mod] then goto cont end
	files = file.Find(modulesPath .. "/" .. mod .. "/*.lua", "LUA")
	if #files > 0 then
		if SERVER then print("LOADING " .. mod) end
	end
	for _, v in ipairs(files) do
		local ext = string.sub(v, 1, 3)
		if ext == "cl_" or ext == "sh_" then
			if SERVER then
				AddCSLuaFile(modulesPath .. "/" .. mod .. "/" .. v)
			else
				include(modulesPath .. "/" .. mod .. "/" .. v)
			end
		end
		if ext == "sv_" or ext == "sh_" then
			if SERVER then
				include(modulesPath .. "/" .. mod .. "/" .. v)
			end
		end
	end

	::cont::
end
