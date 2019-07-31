ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

-- Disable binoculars if a player presses BACKSPACE or X
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsControlJustReleased(0, 194) or IsControlJustReleased(0, 73) then
			DestroyMobilePhone()
			ClearPedTasks(PlayerPedId())
		end
	end
end)

-- Binoculars stuff
RegisterNetEvent('esx_binoculars:use')
AddEventHandler('esx_binoculars:use', function()
		local ped = PlayerPedId()

		if not IsPedInAnyVehicle(ped) then
			local vehicle = GetVehiclePedIsIn(ped)
			
			Citizen.CreateThread(function()
			ClearPedTasks(PlayerPedId())
			  	TriggerEvent('camera:open')
			  		Citizen.Wait(100)
			  			TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_BINOCULARS", 0, 1)
				end)
		end
end)