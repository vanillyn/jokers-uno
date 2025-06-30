local HandUI = {}

function HandUI.draw(hand)
  for i, card in ipairs(hand:getAll()) do
    local x = 50 + (i - 1) * 60
    local y = love.graphics.getHeight() - 100
    love.graphics.rectangle("line", x, y, 50, 70)
    love.graphics.printf(card.name, x, y + 25, 50, "center")
  end
end

return HandUI