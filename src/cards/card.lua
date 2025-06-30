

local Card = {}
Card.__index = Card

function Card.new(suit, rank, desc, val)
    local self = setmetatable({}, Card)
    self.suit = suit
    self.rank = rank
    self.name = desc.name
    self.desc = desc.desc
    self.clicked = false
    self.val = val or 0
    return self
end

return Card