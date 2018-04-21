include("shared.lua")

function ENT:OnRemove()
	self:StopSound("CW_KK_INS2_RPG_PROJECTILE")
end

function ENT:Think()
	self:SetBodygroup(1, 1)
		
	-- if CurTime() > self.ArmTime and self.dt.State != self.States.misfired then
		-- if not self.NextSoundTime or self.NextSoundTime < CT then
			-- self:EmitSound("CW_KK_INS2_RPG_PROJECTILE", 105, 100)
			-- self.NextSoundTime = CT + 3
		-- end
	-- end
end 

function ENT:Draw()
	self:DrawModel()

end
