local Hand = require("hand")
local Chips= require("chips")
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

