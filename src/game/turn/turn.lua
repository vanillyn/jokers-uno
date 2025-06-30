local Turns = {}

local currentPlayer = 1
local players = {}

function Turns.setPlayers(list)
    players = list
end

function Turns.getCurrentPlayer()
    return players[currentPlayer]
end

function Turns.nextPlayer()
    currentPlayer = currentPlayer % #players + 1
end

function Turns.turnStart()
    local player = Turns.currentPlayer
    -- TODO: check for the effects
end

function Turns.turnEnd()
    Turns.nextPlayer()
    Turns.turnStart()
end

function Turns.startGame(deck, discard)
    assert(#players > 0, "no players in game")

    for _, p in ipairs(players) do
        p.hand = require("src.game.player.hand").new()
        p.chips:modify("subtract", p.chips:get())
    end

    for _ = 1, 8 do
        for _, p in ipairs(players) do
            p.hand:add(deck:drawTop())
        end
    end

    for _, p in ipairs(players) do 
        p.chips:modify("add", 100)
    end

    deck:shuffle()

    local card = deck:drawTop()
    discard:add(card)

    currentPlayer = love.math.random(1, #players)

    Turns.turnStart()
end

return Turns