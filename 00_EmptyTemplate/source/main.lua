-- This is an empty project for the playdate
-- Author: Jake Allan
-- Screen Size: 400, 240

import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

local gfx <const> = playdate.graphics


local function loadGame()
	playdate.display.setRefreshRate(50) -- Sets framerate to 50 fps
	
end

local function updateGame()
	
end

local function drawGame()
	gfx.clear() -- Clears the screen
end

loadGame()

function playdate.update()
	updateGame()
	drawGame()
	playdate.drawFPS(0,0) -- FPS widget
end