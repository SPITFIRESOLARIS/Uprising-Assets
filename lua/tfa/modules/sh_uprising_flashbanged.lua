TFA.UPRISING = TFA.UPRISING or {}

print( "ok")

if SERVER then

	util.AddNetworkString( "Uprising_Flashed" )

	function TFA.UPRISING.SetFlashed( ply, intensity )

		if IsValid( ply ) and ply:IsPlayer() then

			net.Start( "Uprising_Flashed" )

				net.WriteFloat( intensity )

			net.Send( ply )

		end

	end

else

	net.Receive( "Uprising_Flashed", function()

		local intensity = net.ReadFloat()

		LocalPlayer().FlashedTime = CurTime()
		LocalPlayer().FlashedEnd = CurTime() + ( 15 * intensity )

	end )

	function TFA.UPRISING.HandleFlashed()

		local ply = LocalPlayer()

		if ply then

			if ply.FlashedTime and ply.FlashedEnd then

				if CurTime() < ( ply.FlashedEnd ) then

					print( ( CurTime() - ply.FlashedEnd ) / 10 )

					DrawMotionBlur( 0.2, 0.3, 0.05 )
					surface.SetDrawColor( 255, 255, 255, 255 * ( ( ply.FlashedEnd - CurTime() ) / 10 ) )
					surface.DrawRect( 0, 0, ScrW(), ScrH() )

				end

			end

		end

	end

	hook.Add( "RenderScreenspaceEffects", "TFA.UPRISING.HandleFlashed", TFA.UPRISING.HandleFlashed )

end