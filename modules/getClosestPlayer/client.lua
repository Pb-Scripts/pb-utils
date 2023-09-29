#Code from ox_lib getClosestPlayer
---@param coords vector3 The coords to check from.
---@param maxDistance number The max distance to check.
---@param includePlayer boolean Whether or not to include the current player.
---@return number? playerId
---@return number? playerPed
---@return vector3? playerCoords
function pb.getClosestPlayer(coords, maxDistance, includePlayer)
	local players = GetActivePlayers()
	local closestId, closestPed, closestCoords
	maxDistance = maxDistance or 2.0

	for i = 1, #players do
		local playerId = players[i]

		if playerId ~= PlayerId() or includePlayer then
			local playerPed = GetPlayerPed(playerId)
			local playerCoords = GetEntityCoords(playerPed)
			local distance = #(coords - playerCoords)

			if distance < maxDistance then
				maxDistance = distance
				closestId = playerId
				closestPed = playerPed
				closestCoords = playerCoords
			end
		end
	end

	return closestId, closestPed, closestCoords
end

return pb.getClosestPlayer
