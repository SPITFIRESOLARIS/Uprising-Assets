ENT.Type = "anim"
ENT.Base = "base_entity"
ENT.PrintName = "PG-7V Grenade"
ENT.Author = "L337N008"
ENT.Information = "A 40MM grenade modified to be launched from RPG7"
ENT.Spawnable = false
ENT.AdminSpawnable = false 

ENT.Editable = true

-- ENT.BlastDamage = 200
-- ENT.BlastRadius = 400

ENT.BlastDamage = 230
ENT.BlastRadius = 500

ENT.safetyBypass = false

-- ENT.DontDestroy = true

function ENT:SetupDataTables()
	-- self:NetworkVar("Int", 0, "State")
	self:NetworkVar("Int", 0, "State", {
		KeyName = "state", 
		Edit = {
			type = "Int", 
			min = 1, 
			max = 3, 
			order = 1
		} 
	})

	self:NetworkVar( "Float", 0, "NadeTimer" )
	self:NetworkVar( "Float", 1, "CookTime" )
	self:NetworkVar( "Vector", 0, "TargetSpot" )

end

function ENT:Initialize()
	if SERVER then
		self:SetModel( "models/uprising/lethals/w_smoke.mdl" ) 
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)
		self:SetCollisionGroup(COLLISION_GROUP_PROJECTILE)
		
		local phys = self:GetPhysicsObject()

		if phys and phys:IsValid() then
			phys:Wake()
		end

		self:GetPhysicsObject():SetBuoyancyRatio(0)

		self.dt.State = self.States.initialized

		self.smokeEmitter = false
		
		util.SpriteTrail( self, 0, Color( 255, 255, 255 ), false, 4, 0, 1, 2, "uprising/trails/nade_trail.vmt" )

	end
	
	local CT = CurTime()
	
	self.ArmTime = CT + 0.1
	self.selfDestructTime = CT + ( self:GetNadeTimer() - self:GetCookTime() )

end

ENT.States = {
	initialized = 1,
	armed = 2,
	misfired = 3
}
