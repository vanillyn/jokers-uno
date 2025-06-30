local Deck = require("src.piles.deck")
local Values = require("src.decks.standard.values")
local StandardDeck = {}

function StandardDeck.new()
  local deck = Deck.new(Values)

  require("src.cards.standard.blue").RegisterCards(deck)
  require("src.cards.standard.green").RegisterCards(deck)
  require("src.cards.standard.red").RegisterCards(deck)
  require("src.cards.standard.yellow").RegisterCards(deck)

  deck:shuffle()
  return deck
end

return StandardDeck
