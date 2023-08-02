require("player") --importing player file

function love.load()
    Player:load()
end

function love.update(dt)
    Player:update(dt)
end

function love.draw()
    Player:draw()
end