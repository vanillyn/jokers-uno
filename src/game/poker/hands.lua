local Hands = {}
local CheckHand = require("src.game.poker.checkhand")

function Hands.Flush(cards)
  local suits = CheckHand.getSuits(cards)
  for _, count in pairs(suits) do
    if count == #cards then return true end
  end
  return false
end

function Hands.Straight(cards)
  local values = {}
  for _, c in ipairs(cards) do table.insert(values, c.value) end
  table.sort(values)
  for i = 2, #values do
    if values[i] ~= values[i-1] + 1 then return false end
  end
  return true
end

function Hands.FourOfAKind(cards)
  for _, group in pairs(CheckHand.groupCounts(cards)) do
    if #group == 4 then return true end
  end
  return false
end

function Hands.FullHouse(cards)
  local hasThree, hasTwo = false, false
  for _, group in pairs(CheckHand.groupCounts(cards)) do
    if #group == 3 then hasThree = true
    elseif #group == 2 then hasTwo = true end
  end
  return hasThree and hasTwo
end

function Hands.ThreeOfAKind(cards)
  for _, group in pairs(CheckHand.groupCounts(cards)) do
    if #group == 3 then return true end
  end
  return false
end

function Hands.TwoPair(cards)
  local pairs = 0
  for _, group in pairs(CheckHand.groupCounts(cards)) do
    if #group == 2 then pairs = pairs + 1 end
  end
  return pairs >= 2
end

function Hands.Pair(cards)
  for _, group in pairs(CheckHand.groupCounts(cards)) do
    if #group == 2 then return true end
  end
  return false
end

function Hands.FiveOfAKind(cards)
  for _, group in pairs(CheckHand.groupCounts(cards)) do
    if #group == 5 then return true end
  end
  return false
end

function Hands.UNOFour(cards)
  local count = 0
  for _, c in ipairs(cards) do
    if c.rank == "WILD" then count = count + 1 end
  end
  return count == 4
end

function Hands.UNOPair(cards)
  if #cards ~= 2 then return false end
  return cards[1].value == cards[2].value and cards[1].suit == cards[2].suit
end

function Hands.UNOTwoPair(cards)
  local group = CheckHand.groupCounts(cards)
  local suits = {}
  for _, g in pairs(group) do
    if #g == 2 then
      local suit = g[1].suit
      suits[suit] = (suits[suit] or 0) + 1
    end
  end
  for _, s in pairs(suits) do
    if s >= 2 then return true end
  end
  return false
end


return Hands