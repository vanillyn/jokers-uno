local Playing = {}

local Eval = require("src.game.poker.handeval")

function Playing.play(hand, discard, selectedIndexes)

    table.sort(selectedIndexes, function(a, b) return a > b end)
    local selected = {}
    for _, i in ipairs(selectedIndexes) do
        table.insert(selected, 1, hand:remove(i))
    end

    local result = Eval.evaluate(selected)


    local match = {}
    local rest = {}
    local used = {}
    for _, c in ipairs(result.cards) do used[c] = true end

    for _, c in ipairs(selected) do
        if used[c] then
            table.insert(match, c)
        else
            table.insert(rest, c)
        end
    end

    for _, c in ipairs(rest) do hand:add(c) end

    if #match > 0 then
        discard:add(match[#match])
        discard.lastPlayed = match
    end

    return match
end

return Playing
