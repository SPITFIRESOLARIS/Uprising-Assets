SWEP.Base				= "tfa_gun_base"
SWEP.Category				= "TFA Uprising" --The category.  Please, just choose something generic or something I've already done if you plan on only doing like one swep..
SWEP.Manufacturer = "Colt's Manufacturing Company" --Gun Manufactrer (e.g. Hoeckler and Koch )
SWEP.Author				= "" --Author Tooltip
SWEP.Contact				= "" --Contact Info Tooltip
SWEP.Purpose				= "" --Purpose Tooltip
SWEP.Instructions				= "" --Instructions Tooltip
SWEP.Spawnable				= true --Can you, as a normal user, spawn this?
SWEP.AdminSpawnable			= true --Can an adminstrator spawn this?  Does not tie into your admin mod necessarily, unless its coded to allow for GMod's default ranks somewhere in its code.  Evolve and ULX should work, but try to use weapon restriction rather than these.
SWEP.DrawCrosshair			= true		-- Draw the crosshair?
SWEP.DrawCrosshairIS = false --Draw the crosshair in ironsights?
SWEP.PrintName				= "M82A1"		-- Weapon name (Shown on HUD)
SWEP.Slot				= 0			-- Slot in the weapon selection menu.  Subtract 1, as this starts at 0.
SWEP.SlotPos				= 73			-- Position in the slot
SWEP.AutoSwitchTo			= false		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= false		-- Auto switch from if you pick up a better weapon
SWEP.Weight				= 30			-- This controls how "good" the weapon is for autopickup.

--[[WEAPON HANDLING]]--
SWEP.Primary.Sound = Sound("UPRISING_M82.Fire") -- This is the sound of the weapon, when you shoot.
SWEP.Primary.SilencedSound = Sound("UPRISING_M82.Firesil") -- This is the sound of the weapon, when silenced.
SWEP.Primary.PenetrationMultiplier = 999999999 --Change the amount of something this gun can penetrate through
SWEP.Primary.Damage = 105 -- Damage, in standard damage points.
SWEP.Primary.DamageTypeHandled = true --true will handle damagetype in base
SWEP.Primary.DamageType = DMG_BULLET --See DMG enum.  This might be DMG_SHOCK, DMG_BURN, DMG_BULLET, etc.  Leave nil to autodetect.  DMG_AIRBOAT opens doors.
SWEP.Primary.Force = nil --Force value, leave nil to autocalc
SWEP.Primary.Knockback = 1 --Autodetected if nil; this is the velocity kickback
SWEP.Primary.HullSize = 0 --Big bullets, increase this value.  They increase the hull size of the hitscan bullet.
SWEP.Primary.NumShots = 1 --The number of shots the weapon fires.  SWEP.Shotgun is NOT required for this to be >1.
SWEP.Primary.Automatic = false -- Automatic/Semi Auto
SWEP.Primary.RPM = 150 -- This is in Rounds Per Minute / RPM
SWEP.Primary.RPM_Semi = nil -- RPM for semi-automatic or burst fire.  This is in Rounds Per Minute / RPM
SWEP.Primary.RPM_Burst = nil -- RPM for burst fire, overrides semi.  This is in Rounds Per Minute / RPM
SWEP.Primary.DryFireDelay = nil --How long you have to wait after firing your last shot before a dryfire animation can play.  Leave nil for full empty attack length.  Can also use SWEP.StatusLength[ ACT_VM_BLABLA ]
SWEP.Primary.BurstDelay = nil -- Delay between bursts, leave nil to autocalculate
SWEP.FiresUnderwater = false
--Miscelaneous Sounds
SWEP.IronInSound = nil --Sound to play when ironsighting in?  nil for default
SWEP.IronOutSound = nil --Sound to play when ironsighting out?  nil for default
--Silencing
SWEP.CanBeSilenced = false --Can we silence?  Requires animations.
SWEP.Silenced = false --Silenced by default?
-- Selective Fire Stuff
SWEP.SelectiveFire = true --Allow selecting your firemode?
SWEP.DisableBurstFire = true --Only auto/single?
SWEP.OnlyBurstFire = false --No auto, only burst/single?
SWEP.DefaultFireMode = "Semi" --Default to auto or whatev
SWEP.FireModeName = nil --Change to a text value to override it
--Ammo Related
SWEP.Primary.ClipSize = 10 -- This is the size of a clip
SWEP.Primary.DefaultClip = 30 -- This is the number of bullets the gun gives you, counting a clip as defined directly above.
SWEP.Primary.Ammo = "SniperPenetratedRound" -- What kind of ammo.  Options, besides custom, include pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, and AirboatGun.
SWEP.Primary.AmmoConsumption = 1 --Ammo consumed per shot
--Pistol, buckshot, and slam like to ricochet. Use AirboatGun for a light metal peircing shotgun pellets
SWEP.DisableChambering = false --Disable round-in-the-chamber
--Recoil Related
SWEP.Primary.KickUp = 0.7 -- This is the maximum upwards recoil (rise)
SWEP.Primary.KickDown = 0.32-- This is the maximum downwards recoil (skeet)
SWEP.Primary.KickHorizontal = 0.3 -- This is the maximum sideways recoil (no real term)
SWEP.Primary.StaticRecoilFactor = 0.5 --Amount of recoil to directly apply to EyeAngles.  Enter what fraction or percentage (in decimal form) you want.  This is also affected by a convar that defaults to 0.5.
--Firing Cone Related
SWEP.Primary.Spread = 0.5 --This is hip-fire acuracy.  Less is more (1 is horribly awful, .0001 is close to perfect)
SWEP.Primary.IronAccuracy = .0 -- Ironsight accuracy, should be the same for shotguns
--Unless you can do this manually, autodetect it.  If you decide to manually do these, uncomment this block and remove this line.
SWEP.Primary.SpreadMultiplierMax = 2--How far the spread can expand when you shoot. Example val: 2.5
SWEP.Primary.SpreadIncrement = 0.7 --What percentage of the modifier is added on, per shot.  Example val: 1/3.5
SWEP.Primary.SpreadRecovery = 5--How much the spread recovers, per second. Example val: 3
--Range Related
SWEP.Primary.Range = 5000  -- L96's affective range is 850 Yards. One foot is 16 source units.  850m = 2550ft.  16 * 2550 = 40800   -- The distance the bullet can travel in source units.  Set to -1 to autodetect based on damage/rpm.
SWEP.Primary.RangeFalloff = 0.5 -- The percentage of the range the bullet damage starts to fall off at.  Set to 0.8, for example, to start falling off after 80% of the range.


--Penetration Related
SWEP.MaxPenetrationCounter = 4 --The maximum number of ricochets.  To prevent stack overflows.
--Misc
SWEP.IronRecoilMultiplier = 1 --Multiply recoil by this factor when we're in ironsights.  This is proportional, not inversely.
SWEP.CrouchAccuracyMultiplier = 0.7 --Less is more.  Accuracy * 0.5 = Twice as accurate, Accuracy * 0.1 = Ten times as accurate
--Movespeed
SWEP.MoveSpeed = 0.80 --Multiply the player's movespeed by this.
SWEP.IronSightsMoveSpeed = SWEP.MoveSpeed  * 0.7 --Multiply the player's movespeed by this when sighting.
--[[PROJECTILES]]--
SWEP.ProjectileEntity = nil --Entity to shoot
SWEP.ProjectileVelocity = 0 --Entity to shoot's velocity
SWEP.ProjectileModel = nil --Entity to shoot's model
--[[VIEWMODEL]]--
SWEP.ViewModel			= "models/uprising/snipers/c_m82.mdl" --Viewmodel path
--SWEP.ViewModel			= "models/weapons/c_test_r5.mdl" --Viewmodel path
SWEP.ViewModelFOV			= 70		-- This controls how big the viewmodel looks.  Less is more.
SWEP.ViewModelFlip			= false		-- Set this to true for CSS models, or false for everything else (with a righthanded viewmodel.)
SWEP.UseHands = true --Use gmod c_arms system.
SWEP.VMPos = Vector(0,0,0) --The viewmodel positional offset, constantly.  Subtract this from any other modifications to viewmodel position.
SWEP.VMAng = Vector(0,0,0) --The viewmodel angular offset, constantly.   Subtract this from any other modifications to viewmodel angle.
SWEP.VMPos_Additive = false --Set to false for an easier time using VMPos. If true, VMPos will act as a constant delta ON TOP OF ironsights, run, whateverelse
SWEP.CenteredPos = nil --The viewmodel positional offset, used for centering.  Leave nil to autodetect using ironsights.
SWEP.CenteredAng = nil --The viewmodel angular offset, used for centering.  Leave nil to autodetect using ironsights.
SWEP.Bodygroups_V = nil --{
	--[0] = 1,
	--[1] = 4,
	--[2] = etc.
--}
--[[WORLDMODEL]]--
SWEP.WorldModel			= "models/uprising/snipers/w_m82.mdl" -- Weapon world model path
SWEP.Bodygroups_W = nil --{
--[0] = 1,
--[1] = 4,
--[2] = etc.
--}
SWEP.HoldType = "ar2" -- This is how others view you carrying the weapon. Options include:
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive
-- You're mostly going to use ar2, smg, shotgun or pistol. rpg and crossbow make for good sniper rifles
SWEP.Offset = {
	Pos = {
		Up = -0.6,
		Right = 0.7,
		Forward = 4
	},
	Ang = {
		Up = 0,
		Right = -10,
		Forward = 180
	},
	Scale = 1
} --Procedural world model animation, defaulted for CS:S purposes.

--pos = Vector(5.001, 1.003, 0.781), angle = Angle(-19.494, -9.987, 180), size = Vector(0.75, 0.75, 0.75)

SWEP.ThirdPersonReloadDisable = false --Disable third person reload?  True disables.



--[[SCOPES]]--
SWEP.IronSightsSensitivity = 1 --Useful for a RT scope.  Change this to 0.25 for 25% sensitivity.  This is if normal FOV compenstaion isn't your thing for whatever reason, so don't change it for normal scopes.
SWEP.BoltAction = false --Unscope/sight after you shoot?
SWEP.Scoped = false --Draw a scope overlay?
SWEP.ScopeOverlayThreshold = 0.875 --Percentage you have to be sighted in to see the scope.
SWEP.BoltTimerOffset = 0.25 --How long you stay sighted in after shooting, with a bolt action.
SWEP.ScopeScale = 0.5 --Scale of the scope overlay
SWEP.ReticleScale = 0.7 --Scale of the reticle overlay
--GDCW Overlay Options.  Only choose one.
SWEP.Secondary.UseACOG = false --Overlay option
SWEP.Secondary.UseMilDot = false --Overlay option
SWEP.Secondary.UseSVD = false --Overlay option
SWEP.Secondary.UseParabolic = false --Overlay option
SWEP.Secondary.UseElcan = false --Overlay option
SWEP.Secondary.UseGreenDuplex = false --Overlay option
if surface then
	SWEP.Secondary.ScopeTable = nil --[[
		{
			scopetex = surface.GetTextureID("scope/gdcw_closedsight"),
			reticletex = surface.GetTextureID("scope/gdcw_acogchevron"),
			dottex = surface.GetTextureID("scope/gdcw_acogcross")
		}
	]]--
end
--[[SHOTGUN CODE]]--
SWEP.Shotgun = false --Enable shotgun style reloading.
SWEP.ShotgunEmptyAnim = false --Enable emtpy reloads on shotguns?
SWEP.ShotgunEmptyAnim_Shell = true --Enable insertion of a shell directly into the chamber on empty reload?
SWEP.ShellTime = .35 -- For shotguns, how long it takes to insert a shell.
--[[SPRINTING]]--
SWEP.RunSightsPos = Vector(-0.084, -0.112, -0.856)
SWEP.RunSightsAng = Vector(-13.521, 24.423, -16.689)
--[[IRONSIGHTS]]--
SWEP.data = {}
SWEP.data.ironsights = 1 --Enable Ironsights
SWEP.Secondary.IronFOV = 70 -- How much you 'zoom' in. Less is more!  Don't have this be <= 0.  A good value for ironsights is like 70.
SWEP.IronSightTime = 0.4


	SWEP.IronSightsPos = Vector(-3.8777, -2.6875, 1.5768)
	SWEP.IronSightsAng = Vector(0.1501, 0.0273, 0)


	SWEP.IronSightsPos_M82 = Vector(-4.3333, -2.6824, 1.0938)
	SWEP.IronSightsAng_M82 = Vector()


--[[INSPECTION]]--
SWEP.InspectPos = Vector(9.135, -2.737, 1.985)
SWEP.InspectAng = Vector(15.005, 57.194, 16.266)
--[[VIEWMODEL ANIMATION HANDLING]]--
SWEP.AllowViewAttachment = true --Allow the view to sway based on weapon attachment while reloading or drawing, IF THE CLIENT HAS IT ENABLED IN THEIR CONVARS.
--[[VIEWMODEL BLOWBACK]]--
SWEP.BlowbackEnabled = false --Enable Blowback?
SWEP.BlowbackVector = Vector(0,-1,0) --Vector to move bone <or root> relative to bone <or view> orientation.
SWEP.BlowbackCurrentRoot = 1 --Amount of blowback currently, for root
SWEP.BlowbackCurrent = 0 --Amount of blowback currently, for bones
SWEP.BlowbackBoneMods = nil --Viewmodel bone mods via SWEP Creation Kit
SWEP.Blowback_Only_Iron = true --Only do blowback on ironsights
SWEP.Blowback_PistolMode = false --Do we recover from blowback when empty?
SWEP.Blowback_Shell_Enabled = true --Shoot shells through blowback animations
SWEP.Blowback_Shell_Effect = "ShellEject"--Which shell effect to use
SWEP.ShellScale = 1
--[[VIEWMODEL PROCEDURAL ANIMATION]]--
SWEP.DoProceduralReload = false--Animate first person reload using lua?
SWEP.ProceduralReloadTime = 1 --Procedural reload time?
--[[HOLDTYPES]]--
SWEP.IronSightHoldTypeOverride = "" --This variable overrides the ironsights holdtype, choosing it instead of something from the above tables.  Change it to "" to disable.
SWEP.SprintHoldTypeOverride = "" --This variable overrides the sprint holdtype, choosing it instead of something from the above tables.  Change it to "" to disable.
--[[ANIMATION]]--

SWEP.StatusLengthOverride = {} --Changes the status delay of a given animation; only used on reloads.  Otherwise, use SequenceLengthOverride or one of the others
SWEP.SequenceLengthOverride = { } --Changes both the status delay and the nextprimaryfire of a given animation
SWEP.SequenceRateOverride = { [ACT_VM_HOLSTER] = 0.6, [ACT_VM_DRAW] = 0.8  } --Like above but changes animation length to a target
SWEP.SequenceRateOverrideScaled = {} --Like above but scales animation length rather than being absolute

SWEP.ProceduralHoslterEnabled = nil
SWEP.ProceduralHolsterTime = 0.5
SWEP.ProceduralHolsterPos = Vector(3, 0, -5)
SWEP.ProceduralHolsterAng = Vector(-40, -30, 10)

SWEP.Sights_Mode = TFA.Enum.LOCOMOTION_LUA -- ANI = mdl, HYBRID = lua but continue idle, Lua = stop mdl animation
SWEP.Sprint_Mode = TFA.Enum.LOCOMOTION_ANI -- ANI = mdl, HYBRID = ani + lua, Lua = lua only
SWEP.Idle_Mode = TFA.Enum.IDLE_BOTH --TFA.Enum.IDLE_DISABLED = no idle, TFA.Enum.IDLE_LUA = lua idle, TFA.Enum.IDLE_ANI = mdl idle, TFA.Enum.IDLE_BOTH = TFA.Enum.IDLE_ANI + TFA.Enum.IDLE_LUA
SWEP.Idle_Blend = 0 --Start an idle this far early into the end of a transition
SWEP.Idle_Smooth = 0.05 --Start an idle this far early into the end of another animation
--MDL Animations Below
SWEP.IronAnimation = {
	["shoot"] = {
		["type"] = TFA.Enum.ANIMATION_ACT, --Sequence or act
		["value"] = ACT_VM_PRIMARYATTACK_1, --Number for act, String/Number for sequence
	} --What do you think
}
SWEP.SprintAnimation = {
	["loop"] = {
		["type"] = TFA.Enum.ANIMATION_SEQ, --Sequence or act
		["value"] = "sprint", --Number for act, String/Number for sequence
		["is_idle"] = true
	}
}
-- }
--[[EFFECTS]]--
--Attachments
SWEP.MuzzleAttachment			= "1" 		-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellAttachment			= "2" 		-- Should be "2" for CSS models or "shell" for hl2 models
SWEP.MuzzleFlashEnabled = true --Enable muzzle flash
SWEP.MuzzleAttachmentRaw = nil --This will override whatever string you gave.  This is the raw attachment number.  This is overridden or created when a gun makes a muzzle event.
SWEP.AutoDetectMuzzleAttachment = false --For multi-barrel weapons, detect the proper attachment?
SWEP.MuzzleFlashEffect = nil --Change to a string of your muzzle flash effect.  Copy/paste one of the existing from the base.
SWEP.SmokeParticle = nil --Smoke particle (ID within the PCF), defaults to something else based on holdtype; "" to disable
SWEP.EjectionSmokeEnabled = false --Disable automatic ejection smoke
--Shell eject override
SWEP.LuaShellEject = true --Enable shell ejection through lua?
SWEP.LuaShellEjectDelay = 0 --The delay to actually eject things
SWEP.LuaShellEffect = "ShellEject" --The effect used for shell ejection; Defaults to that used for blowback
--Tracer Stuff
SWEP.TracerName 		= nil 	--Change to a string of your tracer name.  Can be custom. There is a nice example at https://github.com/garrynewman/garrysmod/blob/master/garrysmod/gamemodes/base/entities/effects/tooltracer.lua
SWEP.TracerCount 		= 3 	--0 disables, otherwise, 1 in X chance
--Impact Effects
SWEP.ImpactEffect = nil--Impact Effect
SWEP.ImpactDecal = nil--Impact Decal
--[[EVENT TABLE]]--
SWEP.EventTable = {} --Event Table, used for custom events when an action is played.  This can even do stuff like playing a pump animation after shooting.
--example:
--SWEP.EventTable = {
--	[ACT_VM_RELOAD] = {
--		{ ["time"] = 0.1, ["type"] = "lua", ["value"] = function( wep, viewmodel ) end, ["client"] = true, ["server"] = true},
--		{ ["time"] = 0.1, ["type"] = "sound", ["value"] = Sound("x") }
--	}
--}

--[[AKIMBO]]--
SWEP.Akimbo = false --Akimbo gun?  Alternates between primary and secondary attacks.
SWEP.AnimCycle = 0 -- Start on the right
--[[ATTACHMENTS]]--

-- I'm gay
SWEP.ViewModelBoneMods = {
	["j_shoulder_ri"] = { scale = Vector(1,1,1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["j_shoulder_le"] = { scale = Vector(1,1,1), pos = Vector(0,0,0), angle = Angle(0, 0, 0) }
}

SWEP.WorldModelBoneMods = {
	["muzzle"] = { scale = Vector(0.8,0.8,0.8), pos = Vector(-2, 0, -0), angle = Angle(0, 0, 0) },
	["laser"] = { scale = Vector(1,1,1), pos = Vector(-0, 0, 0), angle = Angle(0, 0, 0) },
	["beam"] = { scale = Vector(1,1,1), pos = Vector(0,1, 0), angle = Angle(0, 0, 0) },
	["sight"] = { scale = Vector(0.9,0.9,0.9), pos = Vector(0,0, -0.3), angle = Angle(0, 0, 0) },
}


SWEP.VElements = {
["acog"] = { type = 'Model', model = "models/uprising/attachments/v/optics/acog.mdl", bone = "tag_eotech", pos = Vector(-0, 0, -0.2), angle = Angle(), size = Vector(1,1,1), color = Color(255, 255, 255, 255), surpresslightning = false, material = '', skin = 0, bodygroup = {},  active = false },
["elcan"] = { type = 'Model', model = "models/uprising/attachments/v/optics/elcan.mdl", bone = "tag_eotech", pos = Vector(-00, 0, -0.1), angle = Angle(), size = Vector(1,1,1), color = Color(255, 255, 255, 255), surpresslightning = false, material = '', skin = 0, bodygroup = {},  active = false },
["hamr"] = { type = 'Model', model = "models/uprising/attachments/v/optics/hybrid.mdl", bone = "tag_eotech", pos = Vector(-0, 0, -0.1), angle = Angle(), size = Vector(1,1,1), color = Color(255, 255, 255, 255), surpresslightning = false, material = '', skin = 0, bodygroup = {},  active = false },
["rds"] = { type = 'Model', model = "models/uprising/attachments/v/rds/bo2rds.mdl", bone = "tag_eotech", pos = Vector(-0, 0, -0.1), angle = Angle(), size = Vector(1,1,1), color = Color(255, 255, 255, 255), surpresslightning = false, material = '', skin = 0, bodygroup = {},  active = false },
["aimpoint"] = { type = 'Model', model = "models/uprising/attachments/v/rds/aimpoint.mdl", bone = "tag_eotech", pos = Vector(0, 0, -0.1), angle = Angle(), size = Vector(1,1,1), color = Color(255, 255, 255, 255), surpresslightning = false, material = '', skin = 0, bodygroup = {},  active = false },
["eotechl3"] = { type = 'Model', model = "models/uprising/attachments/v/rds/eotechl3.mdl", bone = "tag_eotech", pos = Vector(0, 0, -0.1), angle = Angle(), size = Vector(1,1,1), color = Color(255, 255, 255, 255), surpresslightning = false, material = '', skin = 0, bodygroup = {},  active = false },
["targetfinder"] = { type = 'Model', model = "models/uprising/attachments/v/rds/targetfinder.mdl", bone = "tag_eotech", pos = Vector(0, 0, -0.1), angle = Angle(), size = Vector(1,1,1), color = Color(255, 255, 255, 255), surpresslightning = false, material = '', skin = 0, bodygroup = {},  active = false },
["suppressor"] = { type = 'Model', model = "models/uprising/attachments/v/muzzles/riflesilencer.mdl", bone = "tag_flash", pos = Vector(-4, 0, 0.1), angle = Angle(), size = Vector(1,1,1), color = Color(255, 255, 255, 255), surpresslightning = false, material = '', skin = 0, bodygroup = {},  active = false },
["laser"] = { type = 'Model', model = "models/uprising/attachments/v/lams/riflelaser.mdl", bone = "j_gun", pos = Vector(21.5617, -1.3854, 4.0602), angle = Angle(90, 0, -90), size = Vector(1.0973, 1.0973, 1.0973), color = Color(255, 255, 255, 255), surpresslightning = false, material = '', skin = 0, bodygroup = {},  active = false },
["grip"] = { type = 'Model', model = "models/uprising/attachments/v/grips/grip.mdl", bone = "tag_foregrip", pos = Vector(0, 0, -0.3), angle = Angle(), size = Vector(1,1,1), color = Color(255, 255, 255, 255), surpresslightning = false, material = '', skin = 0, bodygroup = {},  active = false },
["afg"] = { type = 'Model', model = "models/uprising/attachments/v/grips/afg.mdl", bone = "tag_foregrip", pos = Vector(0, 0, -0.3), angle = Angle(), size = Vector(1,1,1), color = Color(255, 255, 255, 255), surpresslightning = false, material = '', skin = 0, bodygroup = {},  active = false },
["laser_beam"] = { type = "Model", model = "models/tfa/lbeam.mdl", bone = "beam", rel = "laser", pos = Vector(0.8,0,0.4), angle = Angle(0, 90, 0), size = Vector(2, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = false, active = false }

}






SWEP.WElements = { 
["ref"] = { type = "Model", model = SWEP.WorldModel, bone = "oof", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1.1, 1.1, 1.1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false },
["rds"] = { type = 'Model', model = "models/uprising/attachments/v/rds/bo2rds.mdl", bone = "sight", rel = "ref", pos = Vector(0,0,0), angle = Angle(0,0,0), size = Vector(1,1,1), color = Color(255, 255, 255, 255), surpresslightning = false, material = '', skin = 0, bodygroup = {}, bonemerge = true,  active = false },
["aimpoint"] = { type = 'Model', model = "models/uprising/attachments/v/rds/aimpoint.mdl", bone = "sight", rel = "ref", pos = Vector(0,0,0), angle = Angle(0,0,0), size = Vector(1,1,1), color = Color(255, 255, 255, 255), surpresslightning = false, material = '', skin = 0, bodygroup = {}, bonemerge = true,  active = false },
["eotechl3"] = { type = 'Model', model = "models/uprising/attachments/v/rds/eotechl3.mdl", bone = "sight", rel = "ref", pos = Vector(0,0,0), angle = Angle(0,0,0), size = Vector(1,1,1), color = Color(255, 255, 255, 255), surpresslightning = false, material = '', skin = 0, bodygroup = {}, bonemerge = true,  active = false },
["targetfinder"] = { type = 'Model', model = "models/uprising/attachments/v/rds/targetfinder.mdl", bone = "sight", rel = "ref", pos = Vector(0,0,0), angle = Angle(0,0,0), size = Vector(1,1,1), color = Color(255, 255, 255, 255), surpresslightning = false, material = '', skin = 0, bodygroup = {}, bonemerge = true,  active = false },
["acog"] = { type = 'Model', model = "models/uprising/attachments/v/optics/acog.mdl", bone = "sight", rel = "ref", pos = Vector(0,0,0), angle = Angle(0,0,0), size = Vector(1,1,1), color = Color(255, 255, 255, 255), surpresslightning = false, material = '', skin = 0, bodygroup = {}, bonemerge = true,  active = false },
["hamr"] = { type = 'Model', model = "models/uprising/attachments/v/optics/hybrid.mdl", bone = "sight", rel = "ref", pos = Vector(0,0,0), angle = Angle(0,0,0), size = Vector(1,1,1), color = Color(255, 255, 255, 255), surpresslightning = false, material = '', skin = 0, bodygroup = {}, bonemerge = true,  active = false },
["elcan"] = { type = 'Model', model = "models/uprising/attachments/v/optics/elcan.mdl", bone = "sight", rel = "ref", pos = Vector(0,0,0), angle = Angle(0,0,0), size = Vector(1,1,1), color = Color(255, 255, 255, 255), surpresslightning = false, material = '', skin = 0, bodygroup = {}, bonemerge = true,  active = false },
["suppressor"] = { type = 'Model', model = "models/uprising/attachments/v/muzzles/riflesilencer.mdl", bone = "muzzle", rel = "ref", pos = Vector(0,0,0), angle = Angle(0,0,0), size = Vector(1,1,1), color = Color(255, 255, 255, 255), surpresslightning = false, material = '', skin = 0, bodygroup = {}, bonemerge = true,  active = false },
["laser"] = { type = 'Model', model = "models/uprising/attachments/v/lams/riflelaser.mdl", bone = "laser", rel = "ref", pos = Vector(0,0,0), angle = Angle(0,0,0), size = Vector(1,1,1), color = Color(255, 255, 255, 255), surpresslightning = false, material = '', skin = 0, bodygroup = {}, bonemerge = true,  active = false },
["grip"] = { type = 'Model', model = "models/uprising/attachments/v/grips/grip.mdl", bone = "grip", rel = "ref", pos = Vector(0,0,0), angle = Angle(0,0,0), size = Vector(1,1,1), color = Color(255, 255, 255, 255), surpresslightning = false, material = '', skin = 0, bodygroup = {}, bonemerge = true,  active = false },
["afg"] = { type = 'Model', model = "models/uprising/attachments/v/grips/afg.mdl", bone = "grip", rel = "ref", pos = Vector(0,0,0), angle = Angle(0,0,0), size = Vector(1,1,1), color = Color(255, 255, 255, 255), surpresslightning = false, material = '', skin = 0, bodygroup = {}, bonemerge = true,  active = false }

}




SWEP.Attachments = {

	[1] = {
	header = "Sights",
	sel = 1,
	 offset = { 0, 0 }, atts = { "uprising_si_m82" }, order = 1 },
    [2] = { 
	header = "Laser Modules",
	offset = { 0, 0 }, atts = { "uprising_laser" }, order = 2 },	
	[3] = { 
header = "Weapon Mods",
	 offset = { 0, 0 }, atts = { "uprising_modifiedrifling", "uprising_precisionbarrel" }, order = 3 }
}
SWEP.AttachmentDependencies = {}--{["si_acog"] = {"bg_rail"}}
SWEP.AttachmentExclusions = {}--{ ["si_iron"] = {"bg_heatshield"} }

SWEP.GripBoneMods = {
	["j_mid_le_1"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(6.479, 23.697, 0) },
	["j_index_le_0"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(26.27, 49.159, 38.838) },
	["j_ring_le_1"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 28.735, 0) },
	["j_shoulder_le"] = { scale = Vector(1, 1, 1), pos = Vector(6, 3.151, 0), angle = Angle(0, 0, 0) },
	["j_pinky_le_0"] = { scale = Vector(1, 1, 1), pos = Vector(-0.362, -0.951, -1.469), angle = Angle(3.319, -41.199, 41.981) },
	["j_mid_le_0"] = { scale = Vector(1, 1, 1), pos = Vector(0.177, 0.453, 0), angle = Angle(7.46, 27.201, 29.517) },
	["j_elbow_le"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-16.386, -2.824, 34.922) },
	["j_ring_le_0"] = { scale = Vector(1, 1, 1), pos = Vector(0, -0.424, -0.951), angle = Angle(6.21, -1.691, 38.74) },
	["j_wrist_le"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 9.932) },
	["j_thumb_le_0"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-37.749, -40.916, 108.085) },
	["j_pinky_le_2"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-14.15, 75.785, 0) },
	["j_thumb_le_1"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-19.171, -10.721, 0) },
	["j_ring_le_2"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 56.443, 0) },
	["j_index_le_2"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 39.273, 0) },
	["j_pinky_le_1"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 39.543, 0) },
	["j_index_le_1"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 18.413, -4.694) },
	["j_thumb_le_2"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -60.055, 0) },
	["j_mid_le_2"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 41.363, 0) }
}
SWEP.InspectBoneMods = {
	["j_shoulder_ri"] = { scale = Vector(1,1,1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["j_shoulder_le"] = { scale = Vector(1,1,1), pos = Vector(-8, 10, -5), angle = Angle(0, 0, 0) }
}

SWEP.GripBadActivities = { 
[ACT_VM_RELOAD] = {0., 0.73},
[ACT_VM_RELOAD_EMPTY] = {0., 0.56},
[ACT_VM_DRAW] = {0, 0.4},
[ACT_VM_HOLSTER] = {0.1, 1}   }


SWEP.MuzzleAttachmentSilenced = 3
SWEP.MuzzleAttachmentSilencedWorld = 1

SWEP.LaserSightModAttachment = 1
SWEP.LaserSightModAttachmentWorld = 5

local mat = Material( "uprising/trails/sniper_trail" )

function SWEP:CustomBulletCallback( a, b )

	if CLIENT then

		local startP = a.StartPos - Vector( 0, 0, 1 )
		local endP = a.HitPos
		local res = startP:Distance( endP ) * 0.01

		if startP and endP then

			local name = "TracerDraw_".. math.random( 1, 1000 )
			local a = 255

			hook.Add( "PostDrawTranslucentRenderables", name, function()

				a = math.Clamp( a - 0.3, 0, 255 )

				if a <= 0 then

					hook.Remove( "PostDrawTranslucentRenderables", name )

				end

				render.SetMaterial( mat )

				render.StartBeam( 2 )

					render.AddBeam( startP, 6, 0, Color( 255, 235, 215, a ) )
					render.AddBeam( endP, 6, res, Color( 255, 235, 215, a ) )

				render.EndBeam()

			end )

		end

	end

end

DEFINE_BASECLASS( SWEP.Base )

if CLIENT then

	local originalHands = SWEP.ViewModelBoneMods
	local desiredBoneMods = {}
	local oldBoneMods = {}

	local function LerpBoneMods( t, b1, b2 )
		local tbl = table.Copy(b1)
		for k,v in pairs(b2) do
			if not tbl[k] then
				tbl[k] = table.Copy(defaultbl)
			end
			tbl[k].scale = LerpVector( t, tbl[k].scale, v.scale )
			tbl[k].pos = LerpVector( t, tbl[k].pos, v.pos )
			tbl[k].angle = LerpAngle( t, tbl[k].angle, v.angle )
		end
		return tbl
	end

	function SWEP:Think2()

		if self.InspectingProgress and self.InspectingProgress > 0.1 then

			desiredBoneMods = self.InspectBoneMods or originalHands
			oldBoneMods = self.ViewModelBoneMods

		else

			oldBoneMods = desiredBoneMods
			desiredBoneMods = originalHands

		end

		local transitionTime = 70 - ( self:GetStat( "IronSightTime" ) * 10 )

		if self.IronSightsProgress > 0.3 then

			self.ogviewmodelfov = math.Approach( self.ogviewmodelfov, self:GetStat( "AimViewModelFOV", 70 ), ( FrameTime() * transitionTime ) )

		else

			
		self.ogviewmodelfov = math.Approach( (self.ogviewmodelfov or 70), self:GetStat( "OGViewModelFOV", 70 ), FrameTime() * 55 )

		end

		self.ViewModelBoneMods = LerpBoneMods( FrameTime() * 30, self.ViewModelBoneMods, desiredBoneMods )

		BaseClass.Think2(self)

	end

end


function SWEP:CanAttach( attn )
	if not self.HasBuiltMutualExclusions then
		tc = table.Copy( self.AttachmentExclusions )
		for k,v in pairs( tc ) do
			if k ~= "BaseClass" then
				for l,b in pairs(v) do
					self.AttachmentExclusions[b] = self.AttachmentExclusions[b] or {}
					if not table.HasValue( self.AttachmentExclusions[b] ) then
						self.AttachmentExclusions[b][ #self.AttachmentExclusions[b] + 1 ] = k
					end
				end
			end
		end
		self.HasBuiltMutualExclusions = true
	end
	if self.AttachmentExclusions[ attn ] then
		for k,v in pairs( self.AttachmentExclusions[ attn ] ) do
			if self:IsAttached(v) then
				return false
			end
		end
	end
	if self.AttachmentDependencies[ attn ] then
		for k,v in pairs( self.AttachmentDependencies[ attn ] ) do
			if k ~= "BaseClass" and ( not self:IsAttached(v) ) then
				return false
			end
		end
	end
	return true
end