local CheckHand = require("src.game.poker.checkhand")
local Hands = require("src.game.poker.hands")
local Eval = {}

local function extractByValue(cards, count)
    local groups = CheckHand.groupCounts(cards)
    for _, g in pairs(groups) do
        if #g == count then return g end
    end
    return {}
end

function Eval.evaluate(cards)
    if #cards < 1 then return { type = "None", rank = 0, cards = {} } end

    if Hands.Flush(cards) and Hands.Straight(cards) then
        return { type = "Straight Flush", rank = 8, cards = cards }
    end

    if Hands.FourOfAKind(cards) then
        return { type = "Four of a Kind", rank = 7, cards = extractByValue(cards, 4) }
    end

    if Hands.FullHouse(cards) then
        local groups = CheckHand.groupCounts(cards)
        local hand = {}
        for _, g in pairs(groups) do
            if #g == 3 or #g == 2 then
                for _, c in ipairs(g) do table.insert(hand, c) end
            end
        end
        return { type = "Full House", rank = 6, cards = hand }
    end

    if Hands.Flush(cards) then
        return { type = "Flush", rank = 5, cards = cards }
    end

    if Hands.Straight(cards) then
        return { type = "Straight", rank = 4, cards = cards }
    end

    if Hands.ThreeOfAKind(cards) then
        return { type = "Three of a Kind", rank = 3, cards = extractByValue(cards, 3) }
    end

    if Hands.TwoPair(cards) then
        local groups = CheckHand.groupCounts(cards)
        local pairs = {}
        for _, g in pairs(groups) do
            if #g == 2 then
                for _, c in ipairs(g) do table.insert(pairs, c) end
            end
        end
        return { type = "Two Pair", rank = 2, cards = pairs }
    end

    if Hands.Pair(cards) then
        return { type = "Pair", rank = 1, cards = extractByValue(cards, 2) }
    end
    if Hands.UNOFour(cards) then
        local wilds = {}
        for _, c in ipairs(cards) do
            if c.rank == "WILD" or c.suit == "wild" then
                table.insert(wilds, c)
            end
        end
        return { type = "UNO Four", rank = 100, cards = wilds }
    end

    if Hands.FiveOfAKind(cards) then
        return { type = "Five of a Kind", rank = 90, cards = cards }
    end

    if Hands.UNOTwoPair(cards) then
        local groups = CheckHand.groupCounts(cards)
        local suitPairs = {}
        local hand = {}

        for _, g in pairs(groups) do
            if #g == 2 and g[1].suit == g[2].suit then
                local suit = g[1].suit
                suitPairs[suit] = suitPairs[suit] or {}
                for _, c in ipairs(g) do table.insert(suitPairs[suit], c) end
            end
        end

        for _, cards in pairs(suitPairs) do
            if #cards >= 4 then
                for i = 1, 4 do table.insert(hand, cards[i]) end
                return { type = "UNO Two Pair", rank = 25, cards = hand }
            end
        end
    end

    if Hands.UNOPair(cards) then
        for i = 1, #cards do
            for j = i + 1, #cards do
                local a = cards[i]
                local b = cards[j]
                if a.value == b.value and a.suit == b.suit then
                    return { type = "UNO Pair", rank = 15, cards = { a, b } }
                end
            end
        end
    end

    local maxCard = cards[1]
    for _, c in ipairs(cards) do
        if c.value > maxCard.value then maxCard = c end
    end
    return { type = "High Card", rank = 0, cards = { maxCard } }
end

return Eval
