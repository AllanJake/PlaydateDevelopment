-- This is an empty project for the playdate
-- Author: Jake Allan
-- Screen Size: 400, 240

import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "CoreLibs/animation"

import "Dino/dino"



local gfx <const> = playdate.graphics
-- local dinoRun, result = gfx.imagetable.new("Dino/dino")
-- if (result == nil)	then 	print("Image Table Loaded Successfully")
-- else 						print("ERROR:", result)
-- end

local dinoImages, result = playdate.graphics.imagetable.new("Dino/dino")
    if (result == nil)	then 	print("Image Table Loaded Successfully")
    else 						print("ERROR:", result)
    end 


local anim = gfx.animation.loop.new(100, dinoImages)
anim.startFrame = 3
anim.endFrame = 4

local function loadGame()
	playdate.display.setRefreshRate(50) -- Sets framerate to 50 fps
	xPos = 70
	yPos = 180
	local dino = Dino()
end

local function updateGame()
	
end

local function DrawDebugText()
	gfx.drawText("X: ".. tostring(xPos), 5, 5)
	gfx.drawText("Y: ".. tostring(yPos), 5, 25)
end


local function drawGame()
	-- gfx.clear() -- Clears the screen
	anim:draw(xPos - anim:image():getSize() / 2, yPos - anim:image():getSize() / 2)
	-- DrawDebugText()
end

loadGame()

function playdate.update()
	updateGame()
	drawGame()
	playdate.drawFPS(0,0) -- FPS widget
end


function playdate.leftButtonDown() 			xPos = xPos - 1		end
function playdate.rightButtonDown() 		xPos = xPos + 1		end
function playdate.upButtonDown() 			yPos = yPos - 1		end
function playdate.downButtonDown() 			yPos = yPos + 1		end