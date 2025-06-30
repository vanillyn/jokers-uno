local Card = require("src.cards.card")

function RegisterCards(deck)
    local values = deck.values

    local function newCard(rank, desc)
        local value = values[rank] or 0
        deck:add(Card.new("yellow", rank, desc, value))
    end

    newCard("ZERO", {name = "Yellow Zero", desc = "A standard yellow zero. Also acts as 10, going after 9 and before Reverse."})
    newCard("ACE", {name = "Yellow Ace", desc = "A standard yellow ace. Goes both before 2 and after Draw."})
    newCard("THREE", {name = "Yellow Three", desc = "A standard yellow three."})
    newCard("FOUR", {name = "Yellow Four", desc = "A standard yellow four."})
    newCard("FIVE", {name = "Yellow Five", desc = "A standard yellow five."})
    newCard("SIX", {name = "Yellow Six", desc = "A standard yellow six."})
    newCard("SEVEN", {name = "Yellow Seven", desc = "A standard yellow seven."})
    newCard("EIGHT", {name = "Yellow Eight", desc = "A standard yellow eight."})
    newCard("NINE", {name = "Yellow Nine", desc = "A standard yellow nine."})
    newCard("REVERSE", {name = "Yellow Reverse", desc = "A standard yellow reverse. When the highest played card, the direction of play reverses."})
    newCard("SKIP", {name = "Yellow Skip", desc = "A standard yellow skip. When the highest played card, the next player is skipped."})
    newCard("DRAW", {name = "Yellow Draw Two", desc = "A standard yellow draw two. When the highest played card, the next player draws two cards and is skipped."})
    newCard("TWO", {name = "Yellow Two", desc = "A standard yellow two."})

end

return {
  RegisterCards = RegisterCards
}
