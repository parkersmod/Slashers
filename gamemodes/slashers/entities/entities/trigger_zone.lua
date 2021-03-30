ENT.Base = "base_brush"
ENT.Type = "brush"

ENT.PointA = Vector( 815.968750, -1135.968750, -169.968750 )
ENT.PointB = Vector( 703.692627, -1023.303955, -22.290085 )

function ENT:Initialize()
    --[[
    print(self.PointA, self.PointB)
    self.Entities = {}
    --]]

    self:SetSolid( SOLID_BBOX)
    self:SetCollisionBoundsWS( self.PointA, self.PointB )
end

function ENT:StartTouch( ent )
    local GM = GM or GAMEMODE -- TODO: This is not recommended according to old wiki

    --[[
    print("hello there :)", ent:GetName())
    table.insert(self.Entities, ent)
    --]]

    if not GM.ROUND.Escape or not ent:IsPlayer() then return end
    if ent:Team() ~= TEAM_SURVIVORS or not ent:Alive() then return end
    
    ent:SetNWBool("Escaped", true)
    ent:KillSilent()
end

--[[
function ENT:EndTouch( ent ) -- TODO: Gets called when zone is being removed, but might not provide ent
    print("bye for now!", ent:GetName())
    table.RemoveByValue(self.Entities, ent)
end

function ENT:OnRemove()
    print("WHAT THE FUCK DO YOU THINK YOU ARE DOING MATE?")
    --debug.Trace()
    
    PrintTable(self.Entities)
end
--]]
