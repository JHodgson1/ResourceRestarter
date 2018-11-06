local success = false
local success2 = false
local success3 = false

local res_name = 'resource' -- change this

local duration = 5

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(duration * 60000) -- duration(mins) * 60000 = duration(mins) in ms | change the variable 'duration' if you want to change it.
		success = StopResource(res_name)
		if (success) then -- if the resource was stopped then
			success = StartResource(res_name) -- change 'success' to starting the resource
			if (success) then -- if the resource starts again
				TriggerClientEvent('chatMessage', -1, "", {255, 0, 0}, "^1Resource \"" .. res_name .. "\" has been restarted.") -- Message that announces to all players once it has been restarted.
			else
				TriggerClientEvent('chatMessage', -1, "", {255, 0, 0}, "Failed to restart \"" .. res_name .. "\".") -- If the resource fails to restart then a message will be sent to all players.
			end
		end
	end
end)