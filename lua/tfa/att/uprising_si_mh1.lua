if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Hartman MH-1"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.AttachmentColors["="], "Provides circle and dot and line reticle for precise aiming" }
ATTACHMENT.Icon = "uprising/atticons/elcan.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "MH-1"
ATTACHMENT.AimPos = "MH1"
ATTACHMENT.elementID = "mh1"
ATTACHMENT.reticle = Material( "uprising/attachments/reticles/mh1_rds" )
ATTACHMENT.size = 1.6

ATTACHMENT.WeaponTable = {
	["VElements"] = {
		["mh1"] = {
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

		["mh1"] = {
			["active"] = true
		},
	
	},

	["IronSightsPos"] = function( wep, val ) return wep.IronSightsPos_MH1 or val end,
	["IronSightsAng"] = function( wep, val ) return wep.IronSightsAng_MH1 or val end,
	-- ["Secondary"] = {
	-- 	["IronFOV"] = function( wep, val ) return val * 0.9 end
	-- },
	-- ["IronSightTime"] = function( wep, val ) return val * 1.5 end,
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
