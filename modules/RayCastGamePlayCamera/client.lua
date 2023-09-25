local function RotationToDirection(rotation)

  local adjustedRotation =

  {

    x = (math.pi / 180) * rotation.x,

    y = (math.pi / 180) * rotation.y,

    z = (math.pi / 180) * rotation.z

  }

  local direction =

  {

    x = -math.sin(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)),

    y = math.cos(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)),

    z = math.sin(adjustedRotation.x)

  }

  return direction

end
  
function pb.RayCastGamePlayCamera(distance)
  
      local cameraRotation = GetGameplayCamRot()
  
    local cameraCoord = GetGameplayCamCoord()
  
    local direction = RotationToDirection(cameraRotation)
  
    local destination =
  
    {
  
      x = cameraCoord.x + direction.x * distance,
  
      y = cameraCoord.y + direction.y * distance,
  
      z = cameraCoord.z + direction.z * distance
  
    }
  
    local a, b, c, d, e = GetShapeTestResult(StartShapeTestRay(cameraCoord.x, cameraCoord.y, cameraCoord.z, destination.x, destination.y, destination.z, -1, PlayerPedId(), 0))
  
    return b, c, e
  
end

return pb.RayCastGamePlayCamera