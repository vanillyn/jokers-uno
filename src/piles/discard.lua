local CardPile = require("src.piles.cardpile")

local Discard = {}
Discard.__index = Discard
setmetatable(Discard, {__index = CardPile})
Discard.__type = "discard"


function Discard.new()
  local self = CardPile.new()
  setmetatable(self, Discard)
  self.__type = "discard"
  return self
end

function Discard:peekTop()
  return self.cards[#self.cards]
end

return Discard
