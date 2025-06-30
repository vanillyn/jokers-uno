local Hand = require("src.player.hand")
local Chips= require("src.player.chips")
local Player = {}

Player.__index = Player

function Player.new(id)
    local self = setmetatable({}, Player)

    self.id = id
    self.hand = Hand.new()
    self.chips = Chips.new(0)
    self.effects = {}

    return self
end

function Player:addEffect(effect)
    table.insert(self.effects, effect)
end

function Player:clearAllEffects()
    self.effects = {}
end

return Player
