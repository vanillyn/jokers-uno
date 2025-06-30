local TestUI = {}
TestUI.__index = TestUI
TestUI.buttons = {}

function TestUI:addButton(x, y, w, h, label, callback)
  table.insert(self.buttons, {
    x = x, y = y, w = w, h = h,
    label = label,
    callback = callback
  })
end


function TestUI:draw()
  for _, b in ipairs(self.buttons) do
    love.graphics.setColor(1,1,1)
    love.graphics.rectangle("line", b.x, b.y, b.w, b.h)
    love.graphics.printf(b.label, b.x, b.y + b.h / 2 - 6, b.w, "center")
  end
end

function TestUI:mousepressed(x, y)
  for _, b in ipairs(self.buttons) do
    if x >= b.x and x <= b.x + b.w and y >= b.y and y <= b.y + b.h then
      b.callback()
    end
  end
end


function TestUI.player(players, cID)
  local x, y = love.graphics.getWidth() - 200, 50

  love.graphics.setColor(1, 1, 1)
  love.graphics.rectangle("line", x - 10, y - 10, 190, #players * 90 + 20)

  for i, p in ipairs(players) do
    local px = x
    local py = y + (i - 1) * 90

    local isCurrent = p.id == cID
    if isCurrent then
      love.graphics.setColor(1, 1, 0)
    else
      love.graphics.setColor(1, 1, 1)
    end

    love.graphics.print("pid: " .. p.id, px, py)
    love.graphics.print("chips: " .. p.chips:get(), px, py + 15)
    love.graphics.print("hand: " .. p.hand:count(), px, py + 30)
    love.graphics.print("effects: " .. #p.effects, px, py + 45)

  end
end

return TestUI