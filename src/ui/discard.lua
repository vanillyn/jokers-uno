local DiscardUI = {}
local Discard = require("src.piles.discard")

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
end

return DiscardUI