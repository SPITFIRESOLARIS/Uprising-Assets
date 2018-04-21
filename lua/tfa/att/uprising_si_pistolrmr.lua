if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "RMR"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.AttachmentColors["="], "Provides delta reticle for precise aiming"}
ATTACHMENT.Icon = "uprising/atticons/rmr.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "RMR"
ATTACHMENT.AimPos = "RMR"
ATTACHMENT.elementID = "rmr"
ATTACHMENT.reticle = Material( "uprising/attachments/reticles/delta_rds" )
ATTACHMENT.size = 1

ATTACHMENT.WeaponTable = {
	["VElements"] = {
		["rmr"] = {
			["active"] = true
		},
	},

	["Bodygroups_V"] = {
		[1] = 1
	},

		["Bodygroups_W"] = {
		[1] = 1
	},

	["WElements"] = {

		["rmr"] = {
			["active"] = true
		},
	
	},
	["IronSightsPos"] = function( wep, val ) return wep.IronSightsPos_RMR or val end,
	["IronSightsAng"] = function( wep, val ) return wep.IronSightsAng_RMR or val end,
	-- ["Secondary"] = {
	-- 	["IronFOV"] = function( wep, val ) return val * 0.9 end
	-- },
	-- ["IronSightTime"] = function( wep, val ) return val * 1 end,
}

function ATTACHMENT:Attach( wep )

	wep.ViewModelDrawnPost = function()

		TFA.UPRISING.StencilTest( wep, wep.VElements[ self.elementID ].curmodel, wep.VElements[ self.elementID ], self.reticle, self.size, self.reticleColor )

	end

end

function ATTACHMENT:Detach( wep )

	wep.ViewModelDrawnPost = nil

end

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
