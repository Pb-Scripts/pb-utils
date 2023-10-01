function pb.getClosestVehicle(distance, coords, selfCount)
	local vehicles = GetGamePool('CVehicle')
	local Nearbyvehicle
	local coords = coords or GetEntityCoords(PlayerPedId())

	for _,vehicle in pairs(vehicles) do
		local VehDistance = #(coords - GetEntityCoords(vehicle))
		if VehDistance < distance then
			if not selfCount and GetVehiclePedIsIn(PlayerPedId()) ~= vehicle then
				Nearbyvehicle = vehicle
			end
		end
	end
	return Nearbyvehicle
end

return pb.getClosestVehicle
