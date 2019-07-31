ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

--Make binoculars useable--
ESX.RegisterUsableItem('binoculars', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_binoculars:use', source)
end)