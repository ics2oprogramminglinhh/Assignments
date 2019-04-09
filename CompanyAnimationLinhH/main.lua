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
scrollSpeed = 4

-- Local Variables
local topLeft = display.newImageRect("Images/topleft.png", 200, 200)
local topRight = display.newImageRect("Images/topright.png", 200, 200)
local botLeft = display.newImageRect("Images/botleft.png", 200, 200)
local botRight = display.newImageRect("Images/botright.png", 200, 200)
local logo = display.newImageRect("Images/logo.png", 600, 600)


---------------------------------------------------------------------------------------

-- set the logo to be invisible
logo.isVisible = false
botLeft.isVisible = true
botRight.isVisible = true
topLeft.isVisible = true
topRight.isVisible = true
-- set the initial x and y position of topLeft, topRight, botLeft, botRight, logo
topLeft.x = 400
topLeft.y = 300

topRight.x = 600
topRight.y = 300

botLeft.x = 400
botLeft.y = 500

botRight.x = 600
botRight.y = 500
logo.x = 500
logo.y = 400



