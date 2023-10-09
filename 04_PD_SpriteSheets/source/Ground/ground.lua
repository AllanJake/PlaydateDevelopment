import "CoreLibs/sprites"

local gfx <const> = playdate.graphics

class("Ground").extends(gfx.sprite)

function Ground:init()
    Ground.super.init(self)
    self:moveTo(200,205)
    local testImage = gfx.image.new(400, 10)
    gfx.pushContext(testImage)
        gfx.drawLine(0, 0, 400, 0)
    gfx.popContext()
    self:setImage(testImage)
    self:add()
end
