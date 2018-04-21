DEFINE_BASECLASS("tfa_gun_base")
SWEP.Type = "Grenade"
SWEP.MuzzleFlashEffect = ""
SWEP.data = {}
SWEP.data.ironsights = 0
SWEP.Delay = 0.15 -- Delay to fire entity
SWEP.Delay_Underhand = 0.15 -- Delay to fire entity
SWEP.Primary.Round = "" -- Nade Entity
SWEP.Velocity = 550 -- Entity Velocity
SWEP.Underhanded = false
SWEP.DisableIdleAnimations = true
SWEP.IronSightsPos = Vector(5,0,0)
SWEP.IronSightsAng = Vector(0,0,0)
SWEP.NadeTimer = 5
SWEP.Callback = {}
SWEP.Primary.Sound = ""

SWEP.AllowSprintAttack = true

local nzombies = nil

function SWEP:Initialize()
	if nzombies == nil then
		nzombies = engine.ActiveGamemode() == "nzombies"
	end
	self.ProjectileEntity = self.Primary.Round --Entity to shoot
	self.ProjectileVelocity = self.Primary.ProjectileVelocity --Entity to shoot's velocity
	self.ProjectileModel = nil --Entity to shoot's model
	self:SetNW2Bool("Ready", false)
	self:SetNW2Bool("Underhanded", false)
	self:SetNW2Float("CookStart", 0)
	self.VElements = {}
	BaseClass.Initialize(self)
end

function SWEP:Deploy()
	if self:Clip1() <= 0 then
		if self:Ammo1() <= 0 then
			timer.Simple(0, function()
				if IsValid(self) and self:OwnerIsValid() and SERVER and not nzombies then
					self:GetOwner():StripWeapon(self:GetClass())
				end
			end)
		else
			self:TakePrimaryAmmo(1,true)
			self:SetClip1(1)
		end
	end

	self:SetNW2Bool("Ready", false)
	self:SetNW2Bool("Underhanded", false)
	self.oldang = self:GetOwner():EyeAngles()
	self.anga = Angle()
	self.angb = Angle()
	self.angc = Angle()
	self:CleanParticles()
	BaseClass.Deploy(self)
end

--[[
Function Name:  ShootBulletInformation
Syntax: self:ShootBulletInformation( ).
Returns:   Nothing.
Notes:    Used to generate a self.MainBullet table which is then sent to self:ShootBullet, and also to call shooteffects.
Purpose:  Bullet
]]
--
local cv_dmg_mult = GetConVar("sv_tfa_damage_multiplier")
local cv_dmg_mult_min = GetConVar("sv_tfa_damage_mult_min")
local cv_dmg_mult_max = GetConVar("sv_tfa_damage_mult_max")
local dmg, con, rec

function SWEP:ShootBulletInformation()
	self:UpdateConDamage()
	self.lastbul = nil
	self.lastbulnoric = false
	self.ConDamageMultiplier = cv_dmg_mult:GetFloat()
	if not IsFirstTimePredicted() then return end
	con, rec = self:CalculateConeRecoil()
	local tmpranddamage = math.Rand(cv_dmg_mult_min:GetFloat(), cv_dmg_mult_max:GetFloat())
	basedamage = self.ConDamageMultiplier * self:GetStat("Primary.Damage")
	dmg = basedamage * tmpranddamage
	local ns = self:GetStat("Primary.NumShots")
	local clip = (self:GetStat("Primary.ClipSize") == -1) and self:Ammo1() or self:Clip1()
	ns = math.Round(ns, math.min(clip / self:GetStat("Primary.NumShots"), 1))
	self:ShootBullet(dmg, rec, ns, con)
end

--[[
Function Name:  ShootBullet
Syntax: self:ShootBullet(damage, recoil, number of bullets, spray cone, disable ricochet, override the generated self.MainBullet table with this value if you send it).
Returns:   Nothing.
Notes:    Used to shoot a self.MainBullet.
Purpose:  Bullet
]]
--
local TracerName
local cv_forcemult = GetConVar("sv_tfa_force_multiplier")

function SWEP:ShootBullet(damage, recoil, num_bullets, aimcone, disablericochet, bulletoverride)
	if not IsFirstTimePredicted() and not game.SinglePlayer() then return end
	num_bullets = num_bullets or 1
	aimcone = aimcone or 0

	if self:GetStat("Primary.Projectile") then
		if SERVER then
			for i = 1, num_bullets do
				local ent = ents.Create(self:GetStat("Primary.Projectile"))
				local dir
				local ang = self:GetOwner():EyeAngles()
				ang:RotateAroundAxis(ang:Right(), -aimcone / 2 + math.Rand(0, aimcone))
				ang:RotateAroundAxis(ang:Up(), -aimcone / 2 + math.Rand(0, aimcone))
				dir = ang:Forward()
				ent:SetPos(self:GetOwner():GetShootPos())
				ent:SetOwner( self:GetOwner() )
				ent:SetAngles(self:GetOwner():EyeAngles())
				ent.damage = self:GetStat("Primary.Damage")
				ent.mydamage = self:GetStat("Primary.Damage")

				if self:GetStat("Primary.ProjectileModel") then
					ent:SetModel(self:GetStat("Primary.ProjectileModel"))
				end

				if self:GetNW2Float( "CookStart" ) then

					ent:SetNadeTimer( self.NadeTimer )
					ent:SetCookTime( CurTime() - self:GetNW2Float( "CookStart" ) )

				end

				ent:Spawn()
				ent:SetVelocity(dir * self:GetStat("Primary.ProjectileVelocity"))
				local phys = ent:GetPhysicsObject()

				if IsValid(phys) then
					phys:SetVelocity(dir * self:GetStat("Primary.ProjectileVelocity"))
				end

				if self.ProjectileModel then
					ent:SetModel(self:GetStat("Primary.ProjectileModel"))
				end

				ent:SetOwner(self:GetOwner())
			end
		end
	end
end

function SWEP:ChoosePullAnim()
	if not self:OwnerIsValid() then return end

	if self.Callback.ChoosePullAnim then
		print( "huh")
		self.Callback.ChoosePullAnim(self)
	end

	self:GetOwner():SetAnimation(PLAYER_RELOAD)
	--self:ResetEvents()
	local tanim = ACT_VM_PULLPIN
	local success = true
	self:SendViewModelAnim(ACT_VM_PULLPIN)

	if game.SinglePlayer() then
		self:CallOnClient("AnimForce", tanim)
	end

	self.lastact = tanim

	return success, tanim
end

function SWEP:ChooseShootAnim()
	if not self:OwnerIsValid() then return end

	if self.Callback.ChooseShootAnim then
		self.Callback.ChooseShootAnim(self)
	end

	self:GetOwner():SetAnimation(PLAYER_ATTACK1)
	--self:ResetEvents()
	local mybool = self:GetNW2Bool("Underhanded", false)
	local tanim = mybool and ACT_VM_RELEASE or ACT_VM_THROW
	if not self.SequenceEnabled[ACT_VM_RELEASE] then
		tanim = ACT_VM_THROW
	end
	local success = true
	self:SendViewModelAnim(tanim)

	if game.SinglePlayer() then
		self:CallOnClient("AnimForce", tanim)
	end

	self.lastact = tanim

	return success, tanim
end

function SWEP:ThrowStart()
	if self:Clip1() > 0 then
		local _, tanim = self:ChooseShootAnim()
		self:SetStatus( TFA.GetStatus("grenade_throw") )
		self:SetStatusEnd( CurTime() + (self.SequenceLengthOverride[tanim] or self.OwnerViewModel:SequenceDuration()) )
		local bool = self:GetNW2Bool("Underhanded", false)

		if bool then
			timer.Simple(self.Delay_Underhand, function()
				if IsValid(self) and self:OwnerIsValid() then
					self:Throw()
				end
			end)
		else
			timer.Simple(self.Delay, function()
				if IsValid(self) and self:OwnerIsValid() then
					self:Throw()
				end
			end)
		end
	end
end

function SWEP:Throw()
	if self:Clip1() > 0 then
		local bool = self:GetNW2Bool("Underhanded", false)

		self:TakePrimaryAmmo(1)
		self:ShootBulletInformation()
		self:DoAmmoCheck()
	end
end

function SWEP:DoAmmoCheck()
	if IsValid(self) and SERVER then
		local vm = self:GetOwner():GetViewModel()
		if not IsValid(vm) then return end
		local delay = vm:SequenceDuration()
		delay = delay * 1 - math.Clamp(vm:GetCycle(), 0, 1)

		timer.Simple(delay, function()
			if IsValid(self) then
				self:Deploy()
			end
		end)
	end
end

local stat

function SWEP:Think2()
	if not self:OwnerIsValid() then return end
	stat = self:GetStatus()
	if stat == TFA.GetStatus("grenade_pull") then
		if self:GetOwner():KeyDown(IN_ATTACK2) then
			self:SetNW2Bool("Underhanded", true)
		end
		if CurTime() > self:GetStatusEnd() then
			stat = TFA.GetStatus("grenade_ready")
			self:SetStatus( stat )
			self:SetStatusEnd(math.huge)
		end
	end
	if stat == TFA.GetStatus("grenade_ready") then

		if CLIENT then

			self.Primary.Spread = math.sin( CurTime() * 3.3 ) / self.NadeTimer 

		end

		if CurTime() - self:GetNW2Float( "CookStart" ) > self.NadeTimer then

			self:Throw()

		end

		if self:GetOwner():KeyDown(IN_ATTACK2) then
			self:SetNW2Bool("Underhanded", true)
		end
		if not self:GetOwner():KeyDown(IN_ATTACK2) and not self:GetOwner():KeyDown(IN_ATTACK) then
			self:ThrowStart()
		end
	else


		self.Primary.Spread = 0.05

	end
	BaseClass.Think2(self)
end

function SWEP:PrimaryAttack()
	if self:Clip1() > 0 and self:OwnerIsValid() and self:CanFire() then
		local _,tanim = self:ChoosePullAnim()
		self:SetStatus(TFA.GetStatus("grenade_pull"))
		self:SetStatusEnd( CurTime() + (self.SequenceLengthOverride[tanim] or self.OwnerViewModel:SequenceDuration()) )
		self:SetNW2Bool("Charging", true)
		self:SetNW2Bool("Underhanded", false)
		self:SetNW2Float( "CookStart", CurTime() )

		if IsFirstTimePredicted() then
			timer.Simple(self:GetOwner():GetViewModel():SequenceDuration(), function()
				if IsValid(self) then
					self:SetNW2Bool("Ready", true)
				end
			end)
		end
	end
end

function SWEP:SecondaryAttack()
	if self:Clip1() > 0 and self:OwnerIsValid() and self:CanFire() then
		local _,tanim = self:ChoosePullAnim()
		self:SetNW2Bool("Ready", false)
		self:SetNW2Bool("Underhanded", true)
		self:SetNW2Float( "CookStart", CurTime() )
		self:SetStatus(TFA.GetStatus("grenade_pull"))
		self:SetStatusEnd( CurTime() + (self.SequenceLengthOverride[tanim] or self.OwnerViewModel:SequenceDuration()) )
	end
end

function SWEP:Reload()
	if self:Clip1() <= 0 and self:OwnerIsValid() and self:CanFire() then
		self:Deploy()
	end
end

function SWEP:CanFire()
	if not self:CanPrimaryAttack() then return false end
	return true
end

function SWEP:ChooseIdleAnim( ... )
	if self:GetNW2Bool("Ready") then return end
	BaseClass.ChooseIdleAnim(self,...)
end

SWEP.AllowSprintAttack = true