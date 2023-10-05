class("Dino").extends(playdate.graphics.sprite)

function Dino:init()
    Dino.super.init(self)

    -- Get the dino sprite tables
    self.images, result = playdate.graphics.imagetable.new("Dino/dino")
    if (result == nil)	then 	print("Image Table Loaded Successfully")
    else 						print("ERROR:", result)
    end 

    self:setCollideRect(0, 0, 60, 50)
    self:setZIndex(800)

    self.runAnim = playdate.graphics.animation.loop.new(100, self.images)
    self.runAnim.startFrame = 3
    self.runAnim.endFrame = 4

    --self:setImage(images[1])
    self:addSprite()
    
end

function Dino:draw()
    Dino.super.draw(self)

    self:setImage(images[1])
end