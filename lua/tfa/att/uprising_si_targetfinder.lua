if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Zoomed RDS"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.AttachmentColors["+"], "Provides red dot reticle for precise aiming"}
ATTACHMENT.Icon = "uprising/atticons/tf.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "TF"
ATTACHMENT.AimPos = "TF"
ATTACHMENT.elementID = "targetfinder"
ATTACHMENT.reticle = Material( "uprising/attachments/reticles/targetfinder_rds" )
ATTACHMENT.size = 0.7

ATTACHMENT.WeaponTable = {
	["VElements"] = {
		["targetfinder"] = {
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

		["targetfinder"] = {
			["active"] = true
		},
	
	},

	  ["AimViewModelFOV"] = 50,
	["IronSightsPos"] = function( wep, val ) return wep.IronSightsPos_TF or val end,
	["IronSightsAng"] = function( wep, val ) return wep.IronSightsAng_TF or val end,
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
