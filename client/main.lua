local Config = {
  MARKER_TYPE = 28,
  MARKER_SIZE = 0.05,
  MARKER_COLOR = { r = 247, g = 85, b = 16, a = 100 },
  RAYCAST_DISTANCE = 25.0,
  INPUT_KEY = 38, -- E key
}

local isActive = false

local function getCoordsFromCamera(distance, coords)
  local cameraRotation = GetGameplayCamRot(0)

  local radiansX = math.rad(cameraRotation.x)
  local radiansZ = math.rad(cameraRotation.z)

  local cosX = math.abs(math.cos(radiansX))
  local sinZ = math.sin(radiansZ)
  local cosZ = math.cos(radiansZ)
  local sinX = math.sin(radiansX)

  local direction = vec3(
    -sinZ * cosX,
    cosZ * cosX,
    sinX
  )

  local finalCoords = vec3(
    coords[1] + direction[1] * distance,
    coords[2] + direction[2] * distance,
    coords[3] + direction[3] * distance
  )

  return finalCoords
end

local function drawTargetMarker(coords)
  DrawMarker(
    Config.MARKER_TYPE,
    coords.x, coords.y, coords.z,
    0.0, 0.0, 0.0,  -- Direction
    0.0, 0.0, 0.0,  -- Rotation
    Config.MARKER_SIZE, Config.MARKER_SIZE, Config.MARKER_SIZE,  -- Scale
    Config.MARKER_COLOR.r, Config.MARKER_COLOR.g, Config.MARKER_COLOR.b, Config.MARKER_COLOR.a,
    false, false, 2, false  -- bobUpAndDown, faceCamera, p19, rotate
  )
end

local function performRaycast(playerPed, cameraCoords)
  local endCoords = getCoordsFromCamera(Config.RAYCAST_DISTANCE, cameraCoords)
  local raycastHandle = StartExpensiveSynchronousShapeTestLosProbe(
    cameraCoords.x,
    cameraCoords.y,
    cameraCoords.z,
    endCoords.x,
    endCoords.y,
    endCoords.z,
    -1,
    playerPed,
    4
  )

  local _, _, coords = GetShapeTestResult(raycastHandle)
  return coords
end

local function startTargetCoordsSystem()
  CreateThread(function()
    while isActive do
      local playerPed = PlayerPedId()
      local cameraCoords = GetGameplayCamCoord()

      local targetCoords = performRaycast(playerPed, cameraCoords)

      drawTargetMarker(targetCoords)

      if IsControlJustPressed(1,Config.INPUT_KEY) then
        print(('Received coordinates: X: %.2f, Y: %.2f, Z: %.2f'):format(targetCoords.x, targetCoords.y, targetCoords.z))
        TriggerServerEvent("zeerow-targetcoords:server:sendCoords", targetCoords)
        isActive = false
        break
      end

      Wait(1)
    end
  end)
end

RegisterNetEvent("zeerow-targetcoords:client:init", function()
  if isActive then return end

  isActive = true
  startTargetCoordsSystem()
end)