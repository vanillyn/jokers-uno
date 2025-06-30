local Deck = require("src.piles.deck")

local StandardDeck = {
  cards = {}
}

function StandardDeck.register(card)
  table.insert(StandardDeck.cards, card)
end

function StandardDeck.new()
  -- load card sets
  require("src.cards.standard.blue")
  require("src.cards.standard.green")
  require("src.cards.standard.red")
  require("src.cards.standard.yellow")

  local deck = Deck.new()

  for _, card in ipairs(StandardDeck.cards) do
    deck:add(card)
  end

  deck:shuffle()
  return deck
end

return StandardDeck
