local Playing = {}

function Playing.play(hand, discard, selectedIndexes)
    local played = {}

    if selectedIndexes then
        table.sort(selectedIndexes, function (a, b) return a > b end)
        for _, i in ipairs(selectedIndexes) do
            table.insert(played, 1, hand:remove(i))
        end    
    else 
        if hand:count() > 0 then
            table.insert(played, hand:remove(hand:count()))
        end
    end
    if #played > 0 then
        for _, card in ipairs(played) do
            discard:add(card)
        end
    end

    return played
end

return Playing

        