local StandardDeck = require("src.decks.standard")
local Discard = require("src.piles.discard")
local Hand = require("src.player.hand")
local TestUI = require("src.ui.test")
local CardUI = require("src.ui.cardui")
local Playing = require("src.player.playing")
local Player = require("src.player.player")
local Chips = require("src.player.chips")
local Turns = require("src.player.turn.turn")

local function testPlayers(n)
    local list = {}
    for i = 1, n do
        local p = Player.new("P"..i)
        p.chips = Chips.new(0)
        table.insert(list, p)
    end
    return list
end


local hand = Hand.new()
local deck = StandardDeck.new()
local discard = Discard.new()
local players = testPlayers(4)
local debugPlayer
function love.load()

    Turns.setPlayers(players)
    Turns.startGame(deck, discard)
    debugPlayer = Turns.getCurrentPlayer()

    deck:shuffle()
    CardUI.registerRenderer("hand", require("src.ui.hand"))
    CardUI.registerRenderer("discard", require("src.ui.discard"))
    
    TestUI:addButton(200, 50, 200, 30, "TEST play card last drawn", function()
        Playing.play(debugPlayer.hand, discard)
    end)

    TestUI:addButton(420, 50, 100, 30, "TEST turn next", function()
        Turns.turnEnd()
    end)

    TestUI:addButton(420, 85, 100, 36, "TEST debug next player", function()
        Turns.turnEnd()
        debugPlayer = Turns.getCurrentPlayer()
    end)


    TestUI:addButton(50, 50, 120, 30, "TEST draw card", function ()
        local card = deck:drawTop()
        print("You drew:", card.name, "("..card.desc..")")

        if card then
            debugPlayer.hand:add(card)
        end
    end)

    for i, p in ipairs(players) do
        print(p.id .. ":")
        for _, card in ipairs(p.hand:getAll()) do
            print(" -", card.name)
        end
    end

end

function love.draw()
    TestUI.draw(TestUI)
    love.graphics.print("Current player: " .. debugPlayer.id, 50, 0)
    CardUI.draw(debugPlayer.hand)
    CardUI.draw(discard)
    local currentp = Turns.getCurrentPlayer()
    love.graphics.print("Current turn: " .. currentp.id, 50, 20)
end

function love.mousepressed(x, y)
  TestUI:mousepressed(x, y)
end
