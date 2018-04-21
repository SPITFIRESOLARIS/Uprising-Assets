if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Precision Barrel"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.AttachmentColors["+"], "Increases Aimed fire accuracy by using premium materials for the barrel." }
ATTACHMENT.Icon = "entities/tfa_si_eotech.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "PB"


ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["IronAccuracy"] = function(wep,stat) return stat * 0.8 end,
		["IronAccuracy"] = function(wep,stat) return stat * 0.8 end,

	}

}

function ATTACHMENT:Attach(wep)
end

function ATTACHMENT:Detach(wep)
end

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
