-- Slashers
--
-- @Author: Valafi
-- @Date:   2021-03-30 11:13:59
-- @Last modified by:   Valafi
-- @Last modified time: 2021-03-30 11:13:59

ENT.Base = "base_brush"
ENT.Type = "brush"

ENT.PointA = Vector( 815.968750, -1135.968750, -169.968750 ) -- Small section on gm_construct
ENT.PointB = Vector( 703.692627, -1023.303955, -22.290085 )

function ENT:SetEnabled( enable ) -- TODO: Untested
    if enable then
        self:SetSolid( SOLID_BBOX )
    else
        self:SetSolid( SOLID_NONE ) -- Probably triggers EndTouch
    end
end

function ENT:Initialize()
    --[[
    print( self.PointA, self.PointB )
    self.Entities = {}
    --]]

    self:SetSolid( SOLID_BBOX )
    self:SetCollisionBoundsWS( self.PointA, self.PointB )
end

function ENT:OnEnter( ent )
end
function ENT:StartTouch( ent )
    --[[
    print( "StartTouch", ent )
    self.Entities[ent:EntIndex()] = true
    --]]

    self:OnEnter( ent )
end

function ENT:OnLeave( ent )
end
function ENT:EndTouch( ent ) -- Slashers note: After escaping, the player entity is still in the zone
    --[[
    print( "EndTouch", ent )
    self.Entities[ent:EntIndex()] = nil -- Hopefully more CPU efficient than table.remove
    --]]

    self:OnLeave( ent )
end

-- For now, override Think yourself if you need it
--[[
function ENT:DoThink()
end
function ENT:Think()
    self:DoThink()
end
--]]

--[[
function ENT:OnRemove()
    print("OnRemove")
    PrintTable( self.Entities )
end
--]]
