local Chips = {}
Chips.__index = Chips

function Chips.new(starting)
    local self = setmetatable({}, Chips)
    self.amount = starting or 0
    return self
end

function Chips:get()
  return self.amount
end

function Chips:modify(a, n)
  if a == "add" then
    self.amount = self.amount + n
  elseif a == "subtract" then
    self.amount = math.max(0, self.amount - n)
  elseif a == "multiply" then
    self.amount = math.floor(self.amount * n)
  elseif a == "divide" then
    self.amount = math.floor(self.amount / n)
  end
end

return Chips