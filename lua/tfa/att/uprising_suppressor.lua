if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Suppressor"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.AttachmentColors["+"], "Less firing noise",  TFA.AttachmentColors["+"], "Slightly increases accuracy",  TFA.AttachmentColors["+"], "Slightly Decreases recoil", TFA.AttachmentColors["-"], "Slightly decreases damage", TFA.AttachmentColors["-"], "Decreases effective range", }
ATTACHMENT.Icon = "uprising/atticons/suppressor.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "SUPP"

ATTACHMENT.WeaponTable = {
	["VElements"] = {
		["suppressor"] = {
			["active"] = true
		}
	},
	["WElements"] = {
		["suppressor"] = {
			["active"] = true
		}
	},
	["Primary"] = {
		["Damage"] = function(wep,stat) return stat * 0.9 end,
		["KickUp"] = function(wep,stat) return stat * 0.9 end,
		["KickDown"] = function(wep,stat) return stat * 0.9 end,
		["RangeFalloff"] = function(wep,stat) return stat * 0.9 end,
		["IronAccuracy"] = function(wep,stat) return stat * 0.9 end,
		["Sound"] = function(wep,stat) return wep.Primary.SilencedSound or stat end
	},
	["MuzzleFlashEffect"] = "tfa_muzzleflash_silenced",
	["MuzzleAttachmentMod"] = function(wep,stat) return wep.MuzzleAttachmentSilenced or stat end
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
