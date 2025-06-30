local StandardDeck = require("src.decks.standard")
local Discard = require("src.piles.discard")
local Hand = require("src.player.hand")
local TestUI = require("src.ui.test")
local CardUI = require("src.ui.cardui")
local Playing = require("src.player.playing")

local hand = Hand.new()
local deck = StandardDeck.new()
local discard = Discard.new()

function love.load()
    
    deck:shuffle()
    CardUI.registerRenderer("hand", require("src.ui.hand"))
    CardUI.registerRenderer("discard", require("src.ui.discard"))
    
    TestUI:addButton(200, 50, 200, 30, "TEST play card last drawn", function()
        Playing.play(hand, discard)
    end)

    
    TestUI:addButton(50, 50, 120, 30, "TEST draw card", function ()
        local card = deck:drawTop()
        print("You drew:", card.name, "("..card.desc..")")

        if card then
            hand:add(card)
        end
    end)
end

function love.draw()
    TestUI.draw(TestUI)
    CardUI.draw(hand)
    CardUI.draw(discard)
end

function love.mousepressed(x, y)
  TestUI:mousepressed(x, y)
end
