local PlayerDebug = {}
local HandEval = require("src.game.poker.handeval")


function PlayerDebug.draw(players, cID)
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

    love.graphics.print("Player: " .. p.id, px, py)
    love.graphics.print("Chips: " .. p.chips:get(), px, py + 15)
    love.graphics.print("Cards: " .. p.hand:count(), px, py + 30)
    love.graphics.print("Effects: " .. #p.effects, px, py + 45)

    local all = p.hand:getAll()
    local possible = HandEval.evaluate(all)
    love.graphics.print("HandType: " .. possible.type, px, py + 60)
  end
end

return PlayerDebug