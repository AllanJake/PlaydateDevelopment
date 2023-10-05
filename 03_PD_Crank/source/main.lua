-- This is a project to test the crank.
-- It is extending the functionality of 02_Load_Image
-- Author: Jake Allan
-- Screen Size: 400, 240

import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "CoreLibs/crank"


local gfx <const> = playdate.graphics
local AstroImage = gfx.image.new(gfx.imageSizeAtPath("sprites/AstroLogo.png"))
local ShowVisualiser = false

local function loadGame()
	playdate.display.setRefreshRate(50) -- Sets framerate to 50 fps
	AstroImage:load("sprites/AstroLogo.png")
end

local function updateGame()
	crankAngleDegrees = playdate.getCrankPosition() - 90
	crankAngleRadians = math.rad(crankAngleDegrees)
	crankChangeDegrees = playdate.getCrankChange()

	cosine = math.cos(crankAngleRadians)
	sin = math.sin(crankAngleRadians)

	radius = 50

	x1 = 400/2
	y1 = 240/2
	x2 = x1 + (cosine * radius)
	y2 = y1 + (sin * radius)
end

local function DrawCrankText()
	gfx.drawText("Crank Position: " .. tostring(crankAngleDegrees), 5, 5)
	gfx.drawText("Crank Change: " .. tostring(crankChangeDegrees), 5, 25)
	gfx.drawText("Cosine: " .. tostring(cosine), 5, 45)
	gfx.drawText("Sine: " .. tostring(sin), 5, 65)
end

local function DrawCrankVisualiser()
	gfx.drawLine(x1, y1, x2, y2)
	gfx.drawCircleAtPoint(x2, y2, 5)
	gfx.drawCircleAtPoint(x1, y1, radius)
end

local function DrawAstrodreamerLogo()
	local scaledLogo = AstroImage:rotatedImage(crankAngleDegrees + 90, 0.35)
	scaledLogo:drawCentered(200, 120)
end

local function drawGame()
	gfx.clear() -- Clears the screen
	DrawCrankText()

	if ShowVisualiser == true then
		DrawCrankVisualiser()
	else
		DrawAstrodreamerLogo()
	end	
end

loadGame()

function playdate.update()
	updateGame()
	drawGame()
	playdate.drawFPS(0,0) -- FPS widget
end

function playdate.AButtonUp()	ShowVisualiser =  not ShowVisualiser 	end