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

return TestUI