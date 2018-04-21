SWEP.Base = "tfa_melee_base"
SWEP.Category = "TFA Uprising"
SWEP.PrintName = "Strider"
SWEP.ViewModel = "models/uprising/melees/c_strider.mdl"
SWEP.ViewModelFOV = 70
SWEP.Slot	= 2	
--SWEP.VMPos = Vector(-1, -2, -1)
SWEP.UseHands = true
SWEP.CameraOffset = Angle(0, 0, 0)
--SWEP.InspectPos = Vector(17.184, -4.891, -11.902) - SWEP.VMPos
--SWEP.InspectAng = Vector(70, 46.431, 70)
SWEP.WorldModel = "models/uprising/melees/w_strider.mdl"
SWEP.HoldType = "knife"
SWEP.Primary.Directional = false
SWEP.Spawnable = true
SWEP.AdminOnly = false
SWEP.DisableIdleAnimations = false
SWEP.MoveSpeed = 1.2

SWEP.Primary.Attacks = {
	-- {
	-- 	["act"] = ACT_VM_HITLEFT, -- Animation; ACT_VM_THINGY, ideally something unique per-sequence
	-- 	["len"] = 16 * 4.5, -- Trace distance
	-- 	["dir"] = Vector(100, 0, 0), -- Trace arc cast
	-- 	["dmg"] = 20 * 1, --Damage
	-- 	["dmgtype"] = DMG_SLASH, --DMG_SLASH,DMG_CRUSH, etc.
	-- 	["delay"] = 0.3, --Delay
	-- 	["spr"] = true, --Allow attack while sprinting?
	-- 	["snd"] = "TFA_BREAD_AXE.Swing", -- Sound ID
	-- 	["snd_delay"] = 0.22,
	-- 	["viewpunch"] = Angle(1, -1, 0), --viewpunch angle
	-- 	["end"] = 0.9, --time before next attack
	-- 	["hull"] = 16, --Hullsize
	-- 	["direction"] = "R", --Swing dir,
	-- 	["hitflesh"] = "TFA_BREAD_AXE.HitFlesh",
	-- 	["hitworld"] = "TFA_BREAD_AXE.HitWorld",
	-- 	["combotime"] = 0.1
	-- },
	{
		["act"] = ACT_VM_PRIMARYATTACK, -- Animation; ACT_VM_THINGY, ideally something unique per-sequence
		["len"] = 19 * 4.5, -- Trace distance
		["dir"] = Vector(-2, 0, 0), -- Trace arc cast
		["dmg"] = 55, --Damage
		["dmgtype"] = DMG_SLASH, --DMG_SLASH,DMG_CRUSH, etc.
		["delay"] = 0.1, --Delay
		["spr"] = true, --Allow attack while sprinting?
		["snd"] = "UPRISING_STRIDER.Slashair", -- Sound ID
		["snd_delay"] = 0,
		["viewpunch"] = Angle(1, 5, 0), --viewpunch angle
		["end"] = 0.7, --time before next attack
		["hull"] = 16, --Hullsize
		["direction"] = "L", --Swing dir,
		["hitflesh"] = "UPRISING_STRIDER.Slash",
		["hitworld"] = "UPRISING_STRIDER.Slashobject",
		["combotime"] = 0.1
	}
	--[[,
	{
		["act"] = ACT_VM_HITCENTER, -- Animation; ACT_VM_THINGY, ideally something unique per-sequence
		["len"] = 16 * 4.5, -- Trace distance
		["dir"] = Vector(0, 30, 10), -- Trace arc cast
		["dmg"] = 100, --Damage
		["dmgtype"] = DMG_SLASH, --DMG_SLASH,DMG_CRUSH, etc.
		["delay"] = 0.2, --Delay
		["spr"] = true, --Allow attack while sprinting?
		["snd"] = "TFA_BREAD_AXE.Swing", -- Sound ID
		["snd_delay"] = 0.1,
		["viewpunch"] = Angle(-5, 0, 2), --viewpunch angle
		["end"] = 0.9, --time before next attack
		["hull"] = 16, --Hullsize
		["direction"] = "FB", --Swing dir,
		["hitflesh"] = "TFA_BREAD_AXE.HitFlesh",
		["hitworld"] = "TFA_BREAD_AXE.HitWorld"
	}]]--
}

SWEP.Secondary.Attacks = {
{
		["act"] = ACT_VM_SWINGHARD, -- Animation; ACT_VM_THINGY, ideally something unique per-sequence
		["len"] = 19 * 4.5, -- Trace distance
		["dir"] = Vector(0, 0, 0), -- Trace arc cast
		["dmg"] = 150, --Damage
		["dmgtype"] = DMG_SLASH, --DMG_SLASH,DMG_CRUSH, etc.
		["delay"] = 0.2, --Delay
		["spr"] = true, --Allow attack while sprinting?
		["snd"] = "UPRISING_STRIDER.Slashair", -- Sound ID
		["snd_delay"] = 0,
		["viewpunch"] = Angle(5, 0, 0), --viewpunch angle
		["end"] = 1.2, --time before next attack
		["hull"] = 0, --Hullsize
		["direction"] = "F", --Swing dir,
		["hitflesh"] = "UPRISING_STRIDER.Slash",
		["hitworld"] = "UPRISING_STRIDER.Slashobject",
		["combotime"] = 0.1
	}
}

SWEP.AllowSprintAttack = false

SWEP.Sprint_Mode = TFA.Enum.LOCOMOTION_ANI-- ANI = mdl, HYBRID = ani + lua, Lua = lua only
SWEP.Idle_Mode = TFA.Enum.IDLE_BOTH --TFA.Enum.IDLE_DISABLED = no idle, TFA.Enum.IDLE_LUA = lua idle, TFA.Enum.IDLE_ANI = mdl idle, TFA.Enum.IDLE_BOTH = TFA.Enum.IDLE_ANI + TFA.Enum.IDLE_LUA
SWEP.Idle_Blend = 0.25 --Start an idle this far early into the end of a transition
SWEP.Idle_Smooth = 0.05 --Start an idle this far early into the end of another animation
SWEP.SprintAnimation = {
	["loop"] = {
		["type"] = TFA.Enum.ANIMATION_SEQ, --Sequence or act
		["value"] = "sprint", --Number for act, String/Number for sequence
		["is_idle"] = true
	}
}

SWEP.RunSightsPos = Vector(0, 0, 0)
SWEP.RunSightsAng = Vector(-10, -2.5, 2.5)


SWEP.CanBlock = false
-- SWEP.BlockAnimation = {
	-- ["in"] = {
		-- ["type"] = TFA.Enum.ANIMATION_ACT, --Sequence or act
		-- ["value"] = ACT_VM_DEPLOY, --Number for act, String/Number for sequence
		-- ["transition"] = true
	-- }, --Inward transition
	-- ["loop"] = {
		-- ["type"] = TFA.Enum.ANIMATION_ACT, --Sequence or act
		-- ["value"] = ACT_VM_IDLE_DEPLOYED, --Number for act, String/Number for sequence
		-- ["is_idle"] = true
	-- },--looping animation
	-- ["hit"] = {
		-- ["type"] = TFA.Enum.ANIMATION_ACT, --Sequence or act
		-- ["value"] = ACT_VM_RELOAD_DEPLOYED, --Number for act, String/Number for sequence
		-- ["is_idle"] = true
	-- },--when you get hit and block it
	-- ["out"] = {
		-- ["type"] = TFA.Enum.ANIMATION_ACT, --Sequence or act
		-- ["value"] = ACT_VM_UNDEPLOY, --Number for act, String/Number for sequence
		-- ["transition"] = true
	-- } --Outward transition
-- }
SWEP.BlockCone = 100 --Think of the player's view direction as being the middle of a sector, with the sector's angle being this
SWEP.BlockDamageMaximum = 0.0 --Multiply damage by this for a maximumly effective block
SWEP.BlockDamageMinimum = 0.5 --Multiply damage by this for a minimumly effective block
SWEP.BlockTimeWindow = 0.5 --Time to absorb maximum damage
SWEP.BlockTimeFade = 0.5 --Time for blocking to do minimum damage.  Does not include block window
SWEP.BlockSound = "TFA.Block"
SWEP.BlockDamageCap = 80
SWEP.BlockDamageTypes = {
	DMG_SLASH,DMG_CLUB
}

SWEP.Secondary.CanBash = false
SWEP.Secondary.BashDamage = 60
SWEP.Secondary.BashDelay = 0.1
SWEP.Secondary.BashLength = 16 * 3

SWEP.SequenceLengthOverride = {
	[ACT_VM_HITCENTER] = 0.8
}

-- SWEP.ViewModelBoneMods = {
-- 		["ValveBiped.weapon_bone"] = {
-- 		scale = Vector(1, 1, 1),
-- 		pos = Vector(0, 0, 0),
-- 		angle = Angle(0, 0, 0)
-- 	}
-- }

SWEP.Offset = {
	Pos = {
		Up = -3,
		Right = 1.5,
		Forward = 3
	},
	Ang = {
		Up = 0,
		Right = -90,
		Forward = 175
	},
	Scale = 1
}

