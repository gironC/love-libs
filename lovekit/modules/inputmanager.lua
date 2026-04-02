local Input = {}

Input.bindings = {}
Input.keysDown = {}
Input.keysPressed = {}
Input.keysReleased = {}

function Input.bind(action, keys)
  Input.bindings[action] = keys
end

function Input.keyDown(action)
  for _, key in ipairs(Input.bindings[action]) do
    if Input.keysDown[key] then
      return true
    end
  end
  return false
end

function Input.keyPressed(action)
  for _, key in ipairs(Input.bindings[action]) do
    if Input.keysPressed[key] then
      return true
    end
  end
  return false
end

function Input.keyReleased(action)
  for _, key in ipairs(Input.bindings[action]) do
    if Input.keysReleased[key] then
      return true
    end
  end
  return false
end


return Input