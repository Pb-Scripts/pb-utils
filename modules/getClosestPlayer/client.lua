function pb.getClosestPlayer(distance, coords, selfCount)
	local players = GetActivePlayers()
	local closestId, closestPed

	for _,playerId in pairs(players) do

		if selfCount and playerId ~= PlayerId() then
			local playerPed = GetPlayerPed(playerId)
			local playerCoords = GetEntityCoords(playerPed)
			local distBetween = #(coords - playerCoords)

			if distance < distBetween then
				distance = distBetween
				closestId = playerId
			end
		end
	end

	return closestId
end

return pb.getClosestPlayer
