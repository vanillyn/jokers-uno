local CheckHand = {}

function CheckHand.groupCounts(cards)
  local rankGroups = {}
  for _, c in ipairs(cards) do
    rankGroups[c.val] = rankGroups[c.val] or {}
    table.insert(rankGroups[c.val], c)
  end
  return rankGroups
end

function CheckHand.getSuits(cards)
  local suits = {}
  for _, c in ipairs(cards) do
    suits[c.suit] = (suits[c.suit] or 0) + 1
  end
  return suits
end

function CheckHand.getRanks(cards)
  local ranks = {}
  for _, c in ipairs(cards) do
    ranks[c.value] = (ranks[c.value] or 0) + 1
  end
  return ranks
end

return CheckHand
