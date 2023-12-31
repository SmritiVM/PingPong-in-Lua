Ball = {}

function Ball:load()
    self.x = love.graphics.getWidth() / 2
    self.y = love.graphics.getHeight() / 2
    self.width = 20
    self.height = 20
    self.speed = 200
    self.xVel = -self.speed
    self.yVel = 0
end

function Ball:update(dt)
    self:move(dt)
    self:collide()
end

function Ball:collide()
    --PLAYER
    if checkCollision(self, Player) then
       self.xVel = self.speed

       --finding the middle point of the ball
       --so that ball can move upwards if it collides with upper half of player
       --and move downwards if it collides with lower half

        local middleBall = self.y + self.height / 2
        local middlePlayer = Player.y + Player.height / 2
        local collisionPosition = middleBall - middlePlayer
        self.yVel = collisionPosition * 5
    end

    --OPPONENT AI  
    if checkCollision(self, AI) then
        self.xVel = -self.speed --so that ball can travel back towards player
 
        --finding the middle point of the ball
        --so that ball can move upwards if it collides with upper half of player
        --and move downwards if it collides with lower half
 
         local middleBall = self.y + self.height / 2
         local middleAI = AI.y + AI.height / 2
         local collisionPosition = middleBall - middleAI
         self.yVel = collisionPosition * 5
     end

    --setting boundaries
    if self.y < 0 then
        self.y = 0
        self.yVel = -self.yVel --reversing direction of ball

    elseif self.y + self.height > love.graphics.getHeight() then
        self.y = love.graphics.getHeight() - self.height
        self.yVel = -self.yVel

    end

    --if AI scores
    if self.x < 0 then
        self.x = love.graphics.getWidth() / 2 - self.width / 2
        self.y = love.graphics.getHeight() / 2 - self.height / 2
        self.yVel = 0
        self.xVel = self.speed
    end

    --if Player scores
    if self.x + self.width > love.graphics.getWidth() then
        self.x = love.graphics.getWidth() / 2 - self.width / 2
        self.y = love.graphics.getHeight() / 2 - self.height / 2
        self.yVel = 0
        self.xVel = -self.speed
    end


end
function Ball:move(dt)
    self.x = self.x + self.xVel * dt
    self.y = self.y + self.yVel * dt
end

function Ball:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end


