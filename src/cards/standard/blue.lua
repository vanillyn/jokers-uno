local Card = require("src.cards.card")

function RegisterCards(deck)
    local values = deck.values

    local function newCard(rank, desc)
        local value = values[rank] or 0
        deck:add(Card.new("blue", rank, desc, value))
    end

    newCard("ZERO", {name = "Blue Zero", desc = "A standard blue zero. Also acts as 10, going after 9 and before Reverse."})
    newCard("ACE", {name = "Blue Ace", desc = "A standard blue ace. Goes both before 2 and after Draw."})
    newCard("THREE", {name = "Blue Three", desc = "A standard blue three."})
    newCard("FOUR", {name = "Blue Four", desc = "A standard blue four."})
    newCard("FIVE", {name = "Blue Five", desc = "A standard blue five."})
    newCard("SIX", {name = "Blue Six", desc = "A standard blue six."})
    newCard("SEVEN", {name = "Blue Seven", desc = "A standard blue seven."})
    newCard("EIGHT", {name = "Blue Eight", desc = "A standard blue eight."})
    newCard("NINE", {name = "Blue Nine", desc = "A standard blue nine."})
    newCard("REVERSE", {name = "Blue Reverse", desc = "A standard blue reverse. When the highest played card, the direction of play reverses."})
    newCard("SKIP", {name = "Blue Skip", desc = "A standard blue skip. When the highest played card, the next player is skipped."})
    newCard("DRAW", {name = "Blue Draw Two", desc = "A standard blue draw two. When the highest played card, the next player draws two cards and is skipped."})
    newCard("TWO", {name = "Blue Two", desc = "A standard blue two."})

end

return {
  RegisterCards = RegisterCards
}
