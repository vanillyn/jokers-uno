local Card = {}
Card.__index = Card

function Card.new(suit, rank, desc)
    local self = setmetatable({}, Card)
    self.suit = suit
    self.rank = rank
    self.name = desc.name
    self.desc = desc.desc
    return self
end

return Card