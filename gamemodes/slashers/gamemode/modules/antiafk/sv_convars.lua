-- Utopia Games - Slashers
--
-- @Author: Garrus2142
-- @Date:   2017-07-27 00:03:40
-- @Last Modified by:   Valafi
-- @Last Modified time: 2021-03-23 06:46:48

CreateConVar("slash_antiafk_enable", 1, {FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE}, "Enable / Disable antiafk")
CreateConVar("slash_antiafk_afktime", 60, {FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE}, "Set afktime duration in seconds")
CreateConVar("slash_antiafk_afkmsgtime", 15, {FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE}, "Set afk message duration before being kicked")
