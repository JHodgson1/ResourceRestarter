local success = false
local success2 = false
local success3 = false

local resource-name = 'resource' -- change this

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(600 * 1000) --600 seconds * milliseconds = 10 mins | change if you wish.
		success = StopResource(resource-name)
		if (success) then
			success = StartResource(resource-name)
			if (success) then
				TriggerClientEvent('chatMessage', -1, "", {255, 0, 0}, "^1Resource \"" .. resourcename .. "\" has been restarted.") -- Message that announces to all players once it has been restarted.
			else
				TriggerClientEvent('chatMessage', -1, "", {255, 0, 0}, "Failed to restart \"" .. resourcename .. "\".") -- If the resource fails to restart then a message will be sent to all players.
			end
		end
	end
end)