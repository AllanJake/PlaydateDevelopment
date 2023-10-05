-- This is a project to test loading sprite images to the playdate
-- Author: Jake Allan
-- Screen Size: 400, 240

import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"


local gfx <const> = playdate.graphics
local AstroImage = gfx.image.new(gfx.imageSizeAtPath("sprites/AstroLogo.png"))


local function loadGame()
	playdate.display.setRefreshRate(50) -- Sets framerate to 50 fps
	AstroImage:load("sprites/AstroLogo.png")
end

local function updateGame()
	
end

local function drawGame()
	gfx.clear() -- Clears the screen
	local scaledLogo = AstroImage:scaledImage(0.35)
	scaledLogo:drawCentered(200, 120)
end

loadGame()

function playdate.update()
	updateGame()
	drawGame()
	playdate.drawFPS(0,0) -- FPS widget
end