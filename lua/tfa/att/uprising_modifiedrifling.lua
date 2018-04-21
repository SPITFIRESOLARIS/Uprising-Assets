if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Aggressive Rifling"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.AttachmentColors["+"], "Increases effective range by accelerating bullet spin" }
ATTACHMENT.Icon = "entities/tfa_si_eotech.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "MR"


ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["RangeFalloff"] = function(wep,stat) return stat * 1.1 end,
	}

}

function ATTACHMENT:Attach(wep)
end

function ATTACHMENT:Detach(wep)
end

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
