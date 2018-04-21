TFA.UPRISING = TFA.UPRISING or {}

local stencilMat = "uprising/attachments/stencils/stencil"
local hideMat = "uprising/attachments/stencils/nodraw"

TFA.UPRISING.LensReplacements = {}
TFA.UPRISING.LensReplacements[ "uprising/attachments/v/acog/optic_lense" ] = true
TFA.UPRISING.LensReplacements[ "uprising/attachments/v/aimpoint/optic_lense" ] = true
TFA.UPRISING.LensReplacements[ "uprising/attachments/v/bo2rds/optic_lense" ] = true
TFA.UPRISING.LensReplacements[ "uprising/attachments/v/hybrid/optic_lense" ] = true
TFA.UPRISING.LensReplacements[ "uprising/attachments/v/rmrpistol/optic_lense" ] = true
TFA.UPRISING.LensReplacements[ "uprising/attachments/v/pistolrds/optic_lense" ] = true
TFA.UPRISING.LensReplacements[ "uprising/attachments/v/eotechl3/optic_lense" ] = true
TFA.UPRISING.LensReplacements[ "uprising/attachments/v/targetfinder/optic_lense" ] = true
TFA.UPRISING.LensReplacements[ "uprising/attachments/v/compm4/optic_lense" ] = true

function TFA.UPRISING.DrawStencilEnt( wep, ent, attTbl )

	if not IsValid( attTbl.StencilEnt ) then

		attTbl.StencilEnt = ClientsideModel( attTbl.model, RENDERGROUP_VIEWMODEL)
		attTbl.StencilEnt:SetNoDraw( true )

		if attTbl.size then

			attTbl.matrix = Matrix()
			attTbl.matrix:Scale( attTbl.size )
			attTbl.StencilEnt:EnableMatrix( "RenderMultiply", attTbl.matrix )

		end

		for k, v in pairs( attTbl.StencilEnt:GetMaterials() ) do

			if TFA.UPRISING.LensReplacements[ v ] then

				attTbl.StencilEnt:SetSubMaterial( k - 1, stencilMat )

			else

				attTbl.StencilEnt:SetSubMaterial( k - 1, hideMat )

			end

		end

		TFA.RegisterClientsideModel( attTbl.StencilEnt, wep )

	else

		attTbl.StencilEnt:SetPos( ent:GetPos() )
		attTbl.StencilEnt:SetAngles( ent:GetAngles() )

		attTbl.StencilEnt:DrawModel()

	end

end

function TFA.UPRISING.StencilTest( wep, ent, attTbl, reticle, size, color )

	if not wep then return end
	if not ent then return end
	if not size then size = 1 end
	if not color then color = Color( 255, 0, 0 ) end

	local lens = ent:GetAttachment( ent:LookupAttachment( "reticle" ) )
	local lensSpot = lens.Pos
	local lensAng = lens.Ang

	render.ClearStencil()
	render.SetStencilEnable( true )
	render.SetStencilWriteMask( 1 )
	render.SetStencilTestMask( 1 )
	render.SetStencilReferenceValue( 1 )
	render.SetStencilCompareFunction( STENCILCOMPARISONFUNCTION_ALWAYS )
	render.SetStencilPassOperation( STENCILOPERATION_REPLACE )
	render.SetStencilFailOperation( STENCILOPERATION_KEEP )
	render.SetStencilZFailOperation( STENCILOPERATION_KEEP )

	TFA.UPRISING.DrawStencilEnt( wep, ent, attTbl )

	render.SetStencilWriteMask( 2 )
	render.SetStencilTestMask( 2 )
	render.SetStencilReferenceValue( 2 )
	render.SetStencilCompareFunction( STENCILCOMPARISONFUNCTION_EQUAL )
	render.SetStencilPassOperation( STENCILOPERATION_REPLACE )
	render.SetStencilWriteMask( 1 )
	render.SetStencilTestMask( 1 )
	render.SetStencilReferenceValue( 1 )

	local dist = lensSpot:Distance( EyePos() ) * 50
	local pos = lensSpot + lensAng:Forward() * dist
	local norm = lensAng:Forward()

	size = size * attTbl.size.x

	render.SetMaterial( reticle )

	size = 8 * size

	cam.IgnoreZ( true )

		render.CullMode( MATERIAL_CULLMODE_CW )

			render.DrawQuadEasy( pos, norm, size, size, color, lensAng )
			color.a = 55
			render.DrawQuadEasy( pos, norm, size, size, color, lensAng )

		render.CullMode( MATERIAL_CULLMODE_CCW )

	cam.IgnoreZ( false )

	render.SetStencilEnable( false )

end