local marks = {}

pb.marks = {
	new = function(...)
		args = {...}
		self.id = #marks + 1
		self.remove = function()
			self = nil
		end
		self.distance = args[2]
		self.vector = args[3]
	end
}

Citizen.CreateThread(function()
	while true do
		local pedcoords = GetEntityCoords(PlayerPedId())

		for id, mark in pairs(marks) do

			local distance = #(pedcoords - mark.vector)

			if distance <= mark.distance then
				mark.inside = true
				mark:EnteredPoint()
			elseif mark.inside then
				mark.inside = nil
				mark:ExitedPoint()
			end
		end
		Wait(300)
	end
end)