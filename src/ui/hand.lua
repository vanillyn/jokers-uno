local HandUI = {}

function HandUI.draw(hand)
  for i, card in ipairs(hand:getAll()) do
    local x = 50 + (i - 1) * 60
    local y = love.graphics.getHeight() - 100

    if card.clicked then
      love.graphics.setColor(0.5,1,0.5)
    else
      love.graphics.setColor(1,1,1)
    end

    love.graphics.rectangle("line", x, y, 50, 70)
    love.graphics.printf(card.name, x, y + 25, 50, "center")
  end
end

function HandUI.mousepressed(hand, x, y)
  for i, card in ipairs(hand:getAll()) do
    local cx = 50 + (i - 1) * 60
    local cy = love.graphics.getHeight() - 100
    if x >= cx and x <= cx + 50 and y >= cy and y <= cy + 70 then
      card.clicked = not card.clicked
    end
  end
end


return HandUI