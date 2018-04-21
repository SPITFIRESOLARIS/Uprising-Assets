if CLIENT then
	matproxy.Add({
	name = "Uprising_IronsightVectorResult",
	init = function(self, mat, values)
		self.resultVar = values.resultvar
		self.ResultDefault = Vector(values.resultdefault) -- original overreflective value
		self.ResultZoomed = Vector(values.resultzoomed) * .25
	end,
	bind = function(self, mat, ent)
		local ply = LocalPlayer()
		if IsValid(ply) then
			local wep = ply:GetActiveWeapon()
			if IsValid(wep) and wep.CLIronSightsProgress then
				local newVector = LerpVector(math.Clamp(wep.CLIronSightsProgress, 0, 1), self.ResultDefault, self.ResultZoomed)
				mat:SetVector(self.resultVar, newVector)

			end
		end
	end
	})
	matproxy.Add( {

		name = "Uprising_RT",
		init = function( self, material, vals )

			self.RTMat = Material( "!tfa_rtmaterial" )

		end,
		bind = function( self, material, ent )

			if not self.RTMat then

				self.RTMat = Material( "!tfa_rtmaterial" )

			end

			material:SetTexture( "$basetexture", self.RTMat:GetTexture( "$basetexture" ) )

		end

	} )

end