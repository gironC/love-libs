local StateManager = {}
StateManager.__index = StateManager

StateManager.new = function()
  local self = setmetatable({}, StateManager)
  self.current = nil
  return self
end

function StateManager:change(state)
  self.current = state
end

function StateManager:update(dt)
  if self.current and self.current.update then
    self.current:update(dt)
  end
end

function StateManager:draw()
  if self.current and self.current.draw then
    self.current:draw()
  end
end