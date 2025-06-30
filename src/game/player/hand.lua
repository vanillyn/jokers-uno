local CardPile = require("src.piles.cardpile")

local Hand = {}
Hand.__index = Hand
setmetatable(Hand, {__index = CardPile})

function Hand.new()
  local self = CardPile.new()
  setmetatable(self, Hand)
  self.__type = "hand"
  return self
end

function Hand:moveCard(fromIndex, toIndex)
  local card = table.remove(self.cards, fromIndex)
  table.insert(self.cards, toIndex, card)
end



return Hand
