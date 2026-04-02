local Input = {}

Input.bindings = {}
Input.keysDown = {}
Input.keysPressed = {}
Input.keysReleased = {}

function Input.bind(action, keys)
  Input.bindings[action] = keys
end

function Input.keypressed(key)
  Input.keysPressed[key] = true
  Input.keysDown[key] = true
end

function Input.keyreleased(key)
  Input.keysReleased[key] = true
  Input.keysDown[key] = false
end

function Input.wasPressed(action)
  if not Input.bindings[action] then
    return false
  end
  local keys = Input.bindings[action]
  for _,key in ipairs(keys) do
    if Input.keysPressed[key] then
      return true
    end
  end
  return false
end

function Input.wasReleased(action)
  if not Input.bindings[action] then
    return false
  end
  local keys = Input.bindings[action]
  for _,key in ipairs(keys) do
    if Input.keysReleased[key] then
      return true
    end
  end
  return false
end

function Input.isDown(action)
  if not Input.bindings[action] then
    return false
  end
  local keys = Input.bindings[action]
  for _,key in ipairs(keys) do
    if Input.keysDown[key] then
      return true
    end
  end
  return false
end

return Input