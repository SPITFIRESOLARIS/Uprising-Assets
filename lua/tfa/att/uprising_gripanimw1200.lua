if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Vertical Foregrip"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.AttachmentColors["+"], "60% less vertical recoil", "20% less horizontal recoil", TFA.AttachmentColors["-"], "10% lower base accuracy", "5% lower scoped accuracy", "Marginally slower movespeed" }
ATTACHMENT.Icon = "uprising/atticons/grip.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "GRIP"

ATTACHMENT.WeaponTable = {
	["VElements"] = {
		["grip"] = {
			["active"] = true
		}
	},
	["WElements"] = {
		["grip"] = {
			["active"] = true
		}
	},
	["Animations"] = {
		["draw"] = {
			["type"] = TFA.Enum.ANIMATION_SEQ, --Sequence or act
			["value"] = "drawgrip"
		},
		["draw_first"] = {
			["type"] = TFA.Enum.ANIMATION_SEQ, --Sequence or act
			["value"] = "drawfirstgrip"
		},
		["draw_empty"] = {
			["type"] = TFA.Enum.ANIMATION_SEQ, --Sequence or act
			["value"] = "drawemptygrip"
		},
		["shoot1"] = {
			["type"] = TFA.Enum.ANIMATION_SEQ, --Sequence or act
			["value"] = "firegrip"
		},
["shoot1_is"] = {
		["type"] = TFA.Enum.ANIMATION_SEQ, --Sequence or act
		["value"] = "fireadsgrip"
	},
		["shoot1_last"] = {
			["type"] = TFA.Enum.ANIMATION_SEQ, --Sequence or act
			["value"] = "firelastgrip"
		},
		["shoot1_empty"] = {
			["type"] = TFA.Enum.ANIMATION_SEQ, --Sequence or act
			["value"] = "dryfiregrip"
		},
		["reload"] = {
			["type"] = TFA.Enum.ANIMATION_SEQ, --Sequence or act
			["value"] = "reloadloopgrip"
		},
		["reload_empty"] = {
			["type"] = TFA.Enum.ANIMATION_SEQ, --Sequence or act
			["value"] = "reload_emptygrip"
		},
		["reload_shotgun_start"] = {
			["type"] = TFA.Enum.ANIMATION_SEQ,
			["value"] = "reload_startgrip"
		},
		["reload_shotgun_finish"] = {
			["type"] = TFA.Enum.ANIMATION_SEQ,
			["value"] = "reload_endgrip"
		},
		["idle"] = {
			["type"] = TFA.Enum.ANIMATION_SEQ, --Sequence or act
			["value"] = "idlegrip"
		},
		["idle_empty"] = {
			["type"] = TFA.Enum.ANIMATION_SEQ, --Sequence or act
			["value"] = "idle_emptygrip"
		},
		["holster"] = {
			["type"] = TFA.Enum.ANIMATION_SEQ, --Sequence or act
			["value"] = "holstergrip"
		},
		["holster_empty"] = {
			["type"] = TFA.Enum.ANIMATION_SEQ, --Sequence or act
			["value"] = "holstergripempty"
		},
	},
	
	["Primary"] = {
	--	["SpreadRecovery"] = function(wep,stat) return stat * 1.1 end,
		["KickUp"] = function(wep,stat) return stat * 0.6 end,
		["KickDown"] = function(wep,stat) return stat * 0.5 end,
		["KickHorizontal"] = function(wep,stat) return stat * 0.9 end,
	},
["HoldType"] = function(wep,stat)
		return "smg", true
	end,


	["SprintAnimation"] = {
		["loop"] = function(wep,val)
			if not wep.SprintAnimation.loop then return end
			val = table.Copy(val) or {}
			val["type"] = TFA.Enum.ANIMATION_SEQ --Sequence or act
			if val.value then
				val["value"] = "sprintgrip"
			end
			if val.value_empty then
				val["value_empty"] = "sprintgripempty"
			end
			return val, true, true
		end
	},
	["IronAnimation"] = {
		["shoot"] = function(wep,val)
			if not wep.IronAnimation.shoot then return end
			val = table.Copy(val) or {}
			val["type"] = TFA.Enum.ANIMATION_ACT --Sequence or act
			if val.value then
				val["value"] = ACT_VM_PRIMARYATTACK_DEPLOYED_1
			end
			if val.value_last then
				val["value_last"] = ACT_VM_PRIMARYATTACK_DEPLOYED_2
			end
			if val.value_empty then
				val["value_empty"] = ACT_VM_PRIMARYATTACK_DEPLOYED_3
			end
			return val, true, true
		end
	},
	["PumpAction"] = function(wep,val)
		val = table.Copy(val) or {}
		val["type"] = TFA.Enum.ANIMATION_ACT --Sequence or act
		if val.value then
			val["value"] = ACT_VM_PULLBACK_LOW
		end
		if val.value_is then
			val["value_is"] = ACT_VM_PULLBACK_LOW
		end
		return val, true, true
	end
}

function ATTACHMENT:Attach( wep )
	wep:ChooseIdleAnim()
	if game.SinglePlayer() then
		wep:CallOnClient("ChooseIdleAnim","")
	end
end

function ATTACHMENT:Detach( wep )
	wep:ChooseIdleAnim()
	if game.SinglePlayer() then
		wep:CallOnClient("ChooseIdleAnim","")
	end
end

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end