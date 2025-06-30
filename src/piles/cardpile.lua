local CardPile = {}
CardPile.__index = CardPile

function CardPile.new()
    local self = setmetatable({}, CardPile)
    self.cards = {}
    return self
end


function CardPile:add(card)
  table.insert(self.cards, card)
end

function CardPile:remove(index)
  return table.remove(self.cards, index)
end

function CardPile:get(index)
  return self.cards[index]
end

function CardPile:getAll()
  return self.cards
end

function CardPile:count()
  return #self.cards
end

return CardPile