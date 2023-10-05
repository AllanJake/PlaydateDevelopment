import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

local gfx <const> = playdate.graphics


local function loadGame()
	local r = 20
	local circleImage = gfx.image.new(r * 2, r * 2)
	gfx.pushContext(circleImage)
		gfx.fillCircleAtPoint(r,r,r)
	gfx.popContext()
	local circleSprite = gfx.sprite.new(circleImage)
	circleSprite:moveTo(200, 120)
	circleSprite:add()
end

local function updateGame()

end

local function drawGame()
	gfx.clear() -- Clears the screen

end

loadGame()

function playdate.update()
	-- updateGame()
	-- drawGame()
	-- playdate.drawFPS(0,0) -- FPS widget

	gfx.sprite.update()
end