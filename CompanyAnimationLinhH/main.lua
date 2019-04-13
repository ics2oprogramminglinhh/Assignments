-----------------------------------------------------------------------------------------
-- Title: Animating Company Logo
-- Name: Linh Ho
-- Course: ICS2O
-- This program displays an animation company logo of GAX Games.
-----------------------------------------------------------------------------------------

-- Hides the status bar
display.setStatusBar(display.HiddenStatusBar)

-- Set the background colour
display.setDefault("background", 202/255, 204/255, 206/255)
----------------------------------------------------------------------------------------
--                               Local and Global Variables
---------------------------------------------------------------------------------------

-- Global variables
scrollSpeed = 3
runSpeed = 4

-- Local Variables
local topLeft = display.newImageRect("Images/topleft.png", 200, 200)
local topRight = display.newImageRect("Images/topright.png", 200, 200)
local botLeft = display.newImageRect("Images/botleft.png", 200, 200)
local botRight = display.newImageRect("Images/botright.png", 200, 200)
local overlay = display.newImageRect("Images/overlay.png", 650, 650)
local rainbow = display.newImageRect("Images/rainbow.png", 500, 312)
local paws = display.newImageRect("Images/paws.png", 600, 454)
local sparkle = display.newImageRect("Images/sparkle.png", 607, 215)
local whooshSound = audio.loadSound("Sounds/whooshS.mp3")
local whooshChannel
local bkg = audio.loadSound("Sounds/background.mp3")
local bkgChannel
---------------------------------------------------------------------------------------
-- play the background music
local bkg = audio.play(bkg)
-- lower the volume of the background music
audio.setVolume(0.5)
-- play the whoosh sound
local whoosh = audio.play(whooshSound)

---------------------------------------------------------------------------------------
--                                Positions and Transitions
---------------------------------------------------------------------------------------
-- set the initial x and y position of topLeft
topLeft.x = 400
topLeft.y = -1000

-- Transitions the topLeft image to the center
transition.to(topLeft, {x=400, y=300, time=500})

-- set the initial x and y position of topRight
topRight.x = 1000
topRight.y = -1000

-- Transitions the topRight image to the center
transition.to(topRight, {x=600, y=300, time=500})

-- set the initial x and y position of botLeft
botLeft.x = 400
botLeft.y = 1000

-- Transitions the botLeft image to the center
transition.to(botLeft, {x=400, y=500, time=500})

-- set the initial x and y position of botRight
botRight.x = 1000
botRight.y = 1000

-- Transitions the botRight image to the center
transition.to(botRight, {x=600, y=500, time=500})

-- set the transition of the image overlay 
overlay.x = 500
overlay.y = 400

-- set the position of overlay 
overlay.x = 500
overlay.y = 400
-- set the rainbow's x and y position
rainbow.x = 600
rainbow.y = 500

-- position the paws
paws.x = 550
paws.y = 500

-- move the paws to right
transition.to(paws, {x= 700, y=400, time= 9000})

-- set the x and y position of sparkles
sparkle.x = 300
sparkle.y = 400

----------------------------------------------------------------------------
-- 							Scale and Rotations
-----------------------------------------------------------------------------
-- set the size of the overlay to be same size
overlay:scale(1, 1)

-- scale the rainbow
rainbow:scale(3,3)
-- send to back of background
rainbow:toBack()

-- rotate the paw image
paws:rotate(-10)

-- scale the sparkles
sparkle:scale(3,3)

-- rotate the sparkle
sparkle:rotate(-40)
sparkle:toBack()

--send to the back of logo
paws:toBack()

-----------------------------------------------------------------------------
--								Functions
-----------------------------------------------------------------------------

-- set the rainbow to be transparent
rainbow.alpha = 0

-- Function: rainbow
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to the y-value of the rainbow
local function Rainbow(event)
	-- change the transparency of the rainbow every time it moves so that it fades in
	rainbow.alpha = rainbow.alpha + 0.01
end 

-- Rainbow will be called over and over again
Runtime:addEventListener("enterFrame", Rainbow)

-- set the overlay to be transparent
overlay.alpha = 0

-- Function: Overlay
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to the y-value of the overlay
local function Overlay(event)
	-- change the transparency of the overlay every time it moves so that it fades in
	overlay.alpha = overlay.alpha + 0.02
	-- make it bigger
	overlay:scale(1+0.003, 1+0.002)
end 

-- Overlay will be called over and over again
Runtime:addEventListener("enterFrame", Overlay)


                       





