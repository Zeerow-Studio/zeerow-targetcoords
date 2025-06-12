-- local Proxy = module("vrp","lib/Proxy")
-- local vRP = Proxy.getInterface("vRP")

RegisterCommand('targetcoords',function(source)
  -- local user_id = vRP.getUserId(source)
  -- if not vRP.hasPermission(user_id, "targetcoords.permission") then
  --   TriggerClientEvent('Notify',source,'amarelo','Você não tem permissão para usar este comando.',5000)
  --   return
  -- end

  TriggerClientEvent('zeerow-targetcoords:client:init',source)
end,false)

RegisterNetEvent('zeerow-targetcoords:server:sendCoords',function(coords)
  print(('Received coordinates: X: %.2f, Y: %.2f, Z: %.2f'):format(coords.x, coords.y, coords.z))

  -- local prompt = vRP.prompt(source,"Basta copiar:", coords.x .. ", " .. coords.y .. ", " .. coords.z)
end)