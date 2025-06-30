local debug = require("game-debug")

function love.load()
  debug.load()
end

function love.draw()
  debug.draw()
end

function love.mousepressed(x, y)
    debug.mousepressed(x, y)
end
