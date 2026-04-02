local Collision = {}

function Collision.check(a, b)
  if (a.x >= b.x and a.x <= b.x + b.w and a.y >= b.y and a.y <= b.y + b.h)
  or (a.x + a.w >= b.x and a.x + a.w <= b.x + b.w and a.y >= b.y and a.y <= b.y + b.h)
  or (a.x >= b.x and a.x <= b.x + b.w and a.y + a.h >= b.y and a.y + a.h <= b.y + b.h)
  or (a.x + a.w >= b.x and a.x + a.w <= b.x + b.w and a.y + a.h >= b.y and a.y + a.h <= b.y + b.h)

  or (b.x >= a.x and b.x <= a.x + a.w and b.y >= a.y and b.y <= a.h + a.h)
  or (b.x + b.w >= a.x and b.x + b.w <= a.x + a.w and b.y >= a.y and b.y <= a.h + a.h)
  or (b.x >= a.x and b.x <= a.x + a.w and b.y + b.h >= a.y and b.y + b.h <= a.h + a.h)
  or (b.x + b.w >= a.x and b.x + b.w <= a.x + a.w and b.y + b.h >= a.y and b.y + b.h <= a.h + a.h) then
    return true
  end
  return false
end

return collision