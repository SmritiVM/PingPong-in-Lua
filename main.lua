require("player") --importing player file
require("ball") --importing ball file

function love.load()
    Player:load()
    Ball:load()
end

function love.update(dt)
    Player:update(dt)
    Ball:update(dt)
end

function love.draw()
    Player:draw()
    Ball:draw()
end

function checkCollision(a, b)
    if a.x + a.width > b.x and a.x < b.x + b.width and a.y + a.height > b.y and a.y < b.y + b.height then
        return true
    end 
    return false

end