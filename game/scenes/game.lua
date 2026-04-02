local Game = {}
function Game:enter()
  self.counter = 0
  print('change to Game scene')
end

function Game:leave()
  print('leaving Game scene')
end

function Game:update(dt)
  --update code
  e.timer:every('example', 1, function()
    self.counter = self.counter + 1
  end)
end

function Game:draw()
  love.graphics.printf('This is the game scene, for edit this go to\ngame/scenes/game.lua', 0, 0, e.camera.vW, 'center')
  love.graphics.printf('This is a timer example, the self.counter value is: \n' .. self.counter, 0, 50, e.camera.vW, 'center')
end

return Game