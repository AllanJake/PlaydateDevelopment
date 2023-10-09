import "CoreLibs/sprites"
import "CoreLibs/animation"
import "CoreLibs/timer"

local gfx <const> = playdate.graphics


class("Dino").extends(gfx.sprite)

function Dino:init(x, y)
    Dino.super.init(self)

    -- Get the dino sprite tables
    self.dinoTable = gfx.imagetable.new("Dino/dino")

    self:setCollideRect(0, 0, 60, 50)
    self:setZIndex(800)

    self:updateTransform(x, y)

    self.runAnim = gfx.animation.loop.new(100, self.dinoTable)
    self.runAnim.startFrame = 3
    self.runAnim.endFrame = 4

    self.waitAnim = gfx.animation.loop.new(1200, self.dinoTable)
    self.waitAnim.startFrame = 1
    self.waitAnim.endFrame = 2

    self.activeAnimation = gfx.animation.loop.new()
    self.activeAnimation = self.waitAnim

    -- 180 is the position of the dino on the ground. 115 should be the max jump
    self.jumpUp = gfx.animator.new(280, 180, 135)
    self.jumpUp.reverses = true
    self.jumpUp.repeatCount = 1
    self.fall = gfx.animator.new(200, 135, 180)
    self.isJumping = false
    self.isGrounded = true

    self:moveTo(self.transform.x, self.transform.y)
    
    self:add()
    
end

function Dino:update()
    Dino.super.update(self)
    self:setImage(self.activeAnimation:image())
    self:updateJumping()
end

function Dino:updateTransform(x, y)
    self.transform = {
        x = x,
        y = y,
    }

    self:moveTo(self.transform.x, self.transform.y)
end

function Dino:setState(state)
    if state == "wait" then
        self.activeAnimation = self.waitAnim
    elseif state == "run" then
        self.activeAnimation = self.runAnim
    end
end

function Dino:updateJumping()    
    if self.isJumping == true then
        local yVal = self.jumpUp:currentValue()
        self:updateTransform(self.transform.x, yVal)
        self.isGrounded = false
        print(yVal)
    end
end




function Dino:jumpPressed(jump)
    self.isJumping = jump
end

function Dino:setFallHeight()
    self.fall = gfx.animator.new(150, self.transform.y, 180)
end