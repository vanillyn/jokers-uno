local DiscardUI = {}

function DiscardUI.draw(pile)
  local card = pile:peekTop()
  local x, y, w, h = 300, 200, 60, 80

  love.graphics.setColor(1, 1, 1)
  love.graphics.rectangle("line", x, y, w, h)

  if card then
    love.graphics.printf(card.name, x, y + h/2 - 6, w, "center")
  else
    love.graphics.printf("empty", x, y + h/2 - 6, w, "center")
  end
  local mx, my = love.mouse.getPosition()
  if mx >= x and mx <= x + w and my >= y and my <= y + h then
    if pile.lastPlayed then
      for i, c in ipairs(pile.lastPlayed) do
        local dx = x + (i - 1) * 60 + 80
        love.graphics.rectangle("line", dx, y, 50, 70)
        love.graphics.printf(c.name, dx, y +25, 50, "center")
      end
    end
  end
end

return DiscardUI