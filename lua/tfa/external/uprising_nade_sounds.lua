local commonPath = "weapons/uprising_nades/"
local m67path = "weapons/uprising_m67/"
local m18path = "weapons/uprising_m18/"
local m84path = "weapons/uprising_m84/"
TFA.AddFireSound("UPRISING.NADE_ThrowOverhand", commonPath .. "m67_throw_overhand.wav" )
TFA.AddFireSound("UPRISING.NADE_ThrowUnderhand", commonPath.. "m67_throw_underhand.wav" )
TFA.AddFireSound("UPRISING.NADE_PullPin", { commonPath .. "m67_pinpull_overhand.wav", commonPath .. "m67_pinpull_overhand_02.wav", commonPath.. "m67_pinpull_overhand_03.wav" } )

TFA.AddWeaponSound("UPRISING.M67_Deploy", m67path .. "m67_deploy.wav")