AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
	self:SetModel("models/Items/AR2_Grenade.mdl") 
	self:PhysicsInit(SOLID_NONE)
	self:SetMoveType(MOVETYPE_NONE)
	self:SetSolid(SOLID_NONE)
	self:SetCollisionGroup(COLLISION_GROUP_NONE)

	timer.Simple(self.SmokeDuration, function()
		SafeRemoveEntity(self)
	end)
end



function ENT:Use(activator, caller)
	return false
end

function ENT:OnRemove()
	return false
end 