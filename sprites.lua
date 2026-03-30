Sprites = {}
Sprites.__index = Sprites

Sprites.new = function(img, rows, cols, width, height, animaciones)
  local self = setmetatable({}, Sprites)
  self.img = img
  self.rows = rows
  self.cols = cols
  self.width = width
  self.height = height
  -- {nombre, frames, delay, loop, siguienteAnim}
  self.animaciones = animaciones
  -- variables para control de animacion
  self.frame = 1
  self.time = 0
  self.currentAnim = 1
  --
  self.quads = {}
  for i = 0, rows - 1 do
    table.insert(self.quads, {})
    for j = 0, cols - 1 do
      local quad = love.graphics.newQuad(j * width, i * height, width, height, img:getDimensions())
      table.insert(self.quads[i + 1], quad)
    end
  end
  return self
end

function Sprites:update(dt)
  local retorno = {frame = 1, change = false}
  self.time = self.time + dt
  local anim = self.animaciones[self.currentAnim]
  if self.time >= anim.delay then
    self.time = 0
    self.frame = self.frame + 1
    retorno.frame = self.frame
    retorno.change = true
    if self.frame > anim.frames then
      self.frame = 1
      if not anim.loop then
        self.currentAnim = findNext(self.animaciones, anim.siguienteAnim)
        if self.currentAnim == 0 then
          retorno.change = false
          retorno.frame = 0
        end
      end
    end
  end
  return retorno
end

function Sprites:change(nombre)
  for a = 1, #self.animaciones do
    if self.animaciones[a].nombre == nombre then
      self.currentAnim = a
      break
    end
  end
end

function Sprites:reset()
  self.frame = 1
  self.time = 0
end

function Sprites:draw(x, y, dir, pX, pY)
  local quad = self.quads[self.currentAnim][self.frame]
  love.graphics.draw(self.img, quad, x, y, 0, dir, 1, pX, pY)
end

function findNext(lista, nombre)
  for a = 1, #lista do
    if lista[a].nombre == nombre then
      return a
    end
  end
  return 0
end