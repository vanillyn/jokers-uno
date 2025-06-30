local Card = require("src.cards.card")


function RegisterCards(deck)
    local values = deck.values

    local function newCard(rank, desc)
        local value = values[rank] or 0
        deck:add(Card.new("green", rank, desc, value))
    end

    newCard("ZERO", {name = "Green Zero", desc = "A standard green zero. Also acts as 10, going after 9 and before Reverse."})
    newCard("ACE", {name = "Green Ace", desc = "A standard green ace. Goes both before 2 and after Draw."})
    newCard("THREE", {name = "Green Three", desc = "A standard green three."})
    newCard("FOUR", {name = "Green Four", desc = "A standard green four."})
    newCard("FIVE", {name = "Green Five", desc = "A standard green five."})
    newCard("SIX", {name = "Green Six", desc = "A standard green six."})
    newCard("SEVEN", {name = "Green Seven", desc = "A standard green seven."})
    newCard("EIGHT", {name = "Green Eight", desc = "A standard green eight."})
    newCard("NINE", {name = "Green Nine", desc = "A standard green nine."})
    newCard("REVERSE", {name = "Green Reverse", desc = "A standard green reverse. When the highest played card, the direction of play reverses."})
    newCard("SKIP", {name = "Green Skip", desc = "A standard green skip. When the highest played card, the next player is skipped."})
    newCard("DRAW", {name = "Green Draw Two", desc = "A standard green draw two. When the highest played card, the next player draws two cards and is skipped."})
    newCard("TWO", {name = "Green Two", desc = "A standard green two."})

end

return {
  RegisterCards = RegisterCards
}
