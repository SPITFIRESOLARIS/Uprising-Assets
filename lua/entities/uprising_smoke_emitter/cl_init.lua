include("shared.lua")

function ENT:Initialize()

	self.InitTime = self:GetCreationTime()

	self.Emitter = ParticleEmitter(self:GetPos())

end

function ENT:Draw()

	if self.Emitter:GetNumActiveParticles() < 50 then

		local part = self.Emitter:Add("particle/smokesprites_000" .. math.random(1, 9), self:GetPos() + Vector( math.random( -64, 64 ), math.random( -64, 64 ), math.random( 0, 64 ) ) )
		part:SetStartSize(226)
		part:SetEndSize(256)
		part:SetStartAlpha(255)
		part:SetEndAlpha(0)
		part:SetDieTime( 20 )
		part:SetRoll(math.random(0, 360))
		part:SetRollDelta(0.01)
		part:SetColor(120, 120, 250)
		part:SetLighting(true)
		part:SetVelocity(VectorRand() * 4)

	end

end

function ENT:OnRemove()
	self.Emitter:Finish()
end