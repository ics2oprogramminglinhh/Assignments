-----------------------------------------------------------------------------------------
-- Title: Animating Images
-- Name: Linh Ho
-- Date: February 15th, 2019
-- Course: ICS2O
-- This program shows different objects moving around the screen with some coloured text.
-----------------------------------------------------------------------------------------

-- Hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- Sets the background colour
display.setDefault("background", 132/255, 205/255, 250/255)

-- Local Variables
local bird = display.newImageRect("Images/bird.png", 150, 150)
local balloon = display.newImageRect("Images/balloon.png", 200, 300)
local airplane = display.newImageRect("Images/airplane.png", 500, 500)
local clouds = display.newImageRect("Images/clouds.png", 2100, 800)
local speech = display.newImageRect("Images/speech.png", 600, 300)

local background = audio.loadSound("Sound/background.mp3")
local backgroundChannel

-- load physics 
local physics = require("physics")

-- start physics
physics.start()

-- Global Variables
scrollSpeed = -4
planeSpeed = 3
runSpeed = 2

-- Play background music 
backgroundChannel = audio.play(background)

----------------------------------------------------------------------------------------
-- Bird 
----------------------------------------------------------------------------------------

-- Create the text object
textObject = display.newText("Move out of the way!", 300, 200, nil, 40)

-- Set the inital x and y position of text
speech.x = 250
speech.y = 250

-- Change the text colour
textObject:setTextColor(0.4, 0, 0.9)

-- Set initial x and y position of the bird
bird.x = 500
bird.y = 500

-- set the bird to be transparent 
bird.alpha = 0

-- set the size of the bird
bird:scale(1, 1)

-- Function: MoveBird
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to the y-value of the bird
local function MoveBird(event)
	-- add the scroll speed to the y-value of the bird
	bird.y = bird.y + scrollSpeed
	-- change the transparency of the bird every time it moves so that it fades in
	bird.alpha = bird.alpha + 0.05

end 

-- MoveBird will be called over and over again
Runtime:addEventListener("enterFrame", MoveBird)

---------------------------------------------------------------------------------------
-- Balloon
---------------------------------------------------------------------------------------

-- Set initial position of balloon
balloon.x = 900
balloon.y = 600

-- set the balloon to be transparent
balloon.alpha = 100

-- set the directino of the balloon
balloon:scale(-1, 1)

-- Function: MoveBalloon
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the run speed to the y-value of the balloon
local function MoveBalloon(event)
	-- add the run speed to the x-value of the balloon
	balloon.y = balloon.y + runSpeed
	-- change the transparency of the balloon every time it moves so that it fades in
	balloon.alpha = balloon.alpha + 0.005 - 0.01
end 

-- MoveBalloon will be called over and over again
Runtime:addEventListener("enterFrame", MoveBalloon)

--------------------------------------------------------------------------------
-- Airplane
------------------------------------------------------------------------------- 

-- Set initial position of airplane
airplane.x = 20
airplane.y = 450

-- Set the airplane to be transparent
airplane.alpha = 20

-- Set the direction of the airplane
airplane:scale(1, 1)

-- Function: MoveAirplane
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the go speed to the x and y value of the airplane
local function MoveAirplane(event)
	-- add the go speed to the x and y value of the airplane
	airplane.x = airplane.x + planeSpeed
	airplane.y = airplane.y + scrollSpeed

	-- make the airplane shrink every time it moves
	airplane:scale(1 - 0.01, 1 - 0.01)

	-- change the transparency of the airplane every time it moves so that it fades in
	airplane.alpha = airplane.alpha + 0.005
end

-- MoveAirplane will be called over and over again
Runtime:addEventListener("enterFrame", MoveAirplane)

----------------------------------------------------------------------
-- Physics 
---------------------------------------------------------------------

-- Display the image of the beam
local beam = display.newImage("Physics/beam.png", 0, 0)

-- Set the x and y of beam
beam.x = display.contentCenterX/5
beam.y = display.contentCenterY*1.65

-- Change the size of the beam
beam.width = display.contentWidth/2
beam.height = display.contentHeight/10

-- Rotate the beam 45 degrees so its on an angle
beam:rotate(45)

-- Send it to the back layer
beam:toBack()

-- add to physics
physics.addBody(beam, "static", {friction=0.5, bounce = 0.3})

----------------------------------------------------------------------

-- create a wall
local wall  = display.newImage("Physics/beam_long.png", 0, 0)

-- set the x and y 
wall.x = 1000
wall.y = 500

--set the wall size
wall.width = 800
wall.height = 100

--send it to the back layer
wall:toBack()

-- rotate wall to 90 degrees so its straight
wall:rotate(90)

----------------------------------------------------------------------

-- Creating the ground
local ground = display.newImage("Physics/ground.png", 0, 0)

-- Set the x and y of the ground
ground.x = display.contentCenterX
ground.y = display.contentHeight

-- Change the width to be the same as the screen
ground.width = display.contentWidth

-- Add to physics
physics.addBody(ground, "static", {friction=0.5, bounce=0.3})
-- add to physics
physics.addBody(wall, "static", {friction=0.5, bounce=0.3})

------------------------------------------------------------------------

-- creating the first ball
local function firstBall()
	-- creating first ball 
	local ball1 = display.newImage("Physics/super_ball.png", 0, 0)

	-- add to physics
	physics.addBody(ball1, {density=1.0, friction=0.5, bounce=0.3, radius=30})

	-- make it same size
	ball1:scale(1, 1)
end

-- creating the second ball
local function secondBall()
	-- creating second ball
	local ball2 = display.newImage("Physics/super_ball.png", 0, 0)

	-- add to physics
	physics.addBody(ball2, {density=1.0, friction =0.5, bounce=0.3, radius=12.5})

	-- bigger than the original size
	ball2:scale(2,2)
end

--------------------------------------------------------------
-- Timer Delay
--------------------------------------------------------------

timer.performWithDelay(0, firstBall)
timer.performWithDelay(500, secondBall)


