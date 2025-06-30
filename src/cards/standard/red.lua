local Card = require("src.cards.card")



function RegisterCards(deck)
    local values = deck.values

    local function newCard(rank, desc)
        local value = values[rank] or 0
        deck:add(Card.new("red", rank, desc, value))
    end

    newCard("ZERO", {name = "Red Zero", desc = "A standard red zero. Also acts as 10, going after 9 and before Reverse."})
    newCard("ACE", {name = "Red Ace", desc = "A standard red ace. Goes both before 2 and after Draw."})
    newCard("THREE", {name = "Red Three", desc = "A standard red three."})
    newCard("FOUR", {name = "Red Four", desc = "A standard red four."})
    newCard("FIVE", {name = "Red Five", desc = "A standard red five."})
    newCard("SIX", {name = "Red Six", desc = "A standard red six."})
    newCard("SEVEN", {name = "Red Seven", desc = "A standard red seven."})
    newCard("EIGHT", {name = "Red Eight", desc = "A standard red eight."})
    newCard("NINE", {name = "Red Nine", desc = "A standard red nine."})
    newCard("REVERSE", {name = "Red Reverse", desc = "A standard red reverse. When the highest played card, the direction of play reverses."})
    newCard("SKIP", {name = "Red Skip", desc = "A standard red skip. When the highest played card, the next player is skipped."})
    newCard("DRAW", {name = "Red Draw Two", desc = "A standard red draw two. When the highest played card, the next player draws two cards and is skipped."})
    newCard("TWO", {name = "Red Two", desc = "A standard red two."})

end
return {
  RegisterCards = RegisterCards
}
