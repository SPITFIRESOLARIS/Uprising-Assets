if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "SIG Sauer ROMEO4"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.AttachmentColors["="], "Provides red dot reticle for precise aiming"}
ATTACHMENT.Icon = "uprising/atticons/compm4.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "ROMEO4"
ATTACHMENT.AimPos = "ROMEO4"
ATTACHMENT.elementID = "romeo4"
ATTACHMENT.reticle = Material( "uprising/attachments/reticles/dot_rds" )
ATTACHMENT.size = 0.2

ATTACHMENT.WeaponTable = {
	["VElements"] = {
		["romeo4"] = {
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

		["romeo4"] = {
			["active"] = true
		},
	
	},
	
	["AimViewModelFOV"] = 50,
	["IronSightsPos"] = function( wep, val ) return wep.IronSightsPos_ROMEO4 or val end,
	["IronSightsAng"] = function( wep, val ) return wep.IronSightsAng_ROMEO4 or val end,
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
