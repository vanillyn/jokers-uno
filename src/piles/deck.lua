local CardPile = require("src.piles.cardpile")

local Deck = {}
Deck.__index = Deck
setmetatable(Deck, {__index = CardPile})

function Deck.new(values)
  local self = CardPile.new()
  setmetatable(self, Deck)
  self.values = values
  return self
end

function Deck:shuffle()
  for i = #self.cards, 2, -1 do
    local j = love.math.random(i)
    self.cards[i], self.cards[j] = self.cards[j], self.cards[i]
  end
end

function Deck:drawTop()
  return table.remove(self.cards)
end

function Deck:drawBottom()
  return table.remove(self.cards, 1)
end

return Deck