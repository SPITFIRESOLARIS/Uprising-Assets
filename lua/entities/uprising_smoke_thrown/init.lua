AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Think()
	self:SetBodygroup(0,1)
	
	if self.dt.State == self.States.misfired then
		return 
	end
	
	local CT = CurTime()
	
	if CT > self.selfDestructTime then
		if self.safetyBypass and self.missfiredArmTime then return end
		self:selfDestruct()
	elseif CT > self.ArmTime then
		self.dt.State = self.States.armed
	
	end
end

function ENT:Use(activator, caller)
	return false
end

function ENT:OnRemove()
	return false
end 

local vel, len

function ENT:Touch(ent)
	if !IsValid(ent) then return end
	if !ent:IsPlayer() and !ent:IsNPC() then return end
end

function ENT:PhysicsCollide(data, physobj)
	if self.dt.State == self.States.misfired then
		vel = physobj:GetVelocity()
		len = vel:Length()
		
		if len > 500 then
			--physobj:SetVelocity(vel * 0.8)
		end
	
		return
	end

		self:EmitSound("physics/metal/metal_grenade_impact_hard" .. math.random(1, 3) .. ".wav", 80, 100)
		
		vel = physobj:GetVelocity()
		len = vel:Length()
		
		if len > 500 then
			--physobj:SetVelocity(vel * 0.8)
		end
end

function ENT:selfDestruct()
	if self.HadEnough then
		return 
	end
	
	self.HadEnough = true
	
	if self.DontDestroy then return end

	self:EmitSound( Sound( "weapons/uprising_m18/smoke_start_0".. math.random( 1, 6 ) ..".wav" ), 500, 100, 1, CHAN_WEAPON )

	if !self.smokeEmitter then

		self.smokeEmitter = ents.Create( "uprising_smoke_emitter" )

		self.smokeEmitter:SetPos( self:GetPos() )

		self.smokeEmitter:Spawn()
		self.smokeEmitter:Activate()

	end

	SafeRemoveEntity(self)
end

function ENT:OnTakeDamage(dmg)
	self:selfDestruct()
end
	