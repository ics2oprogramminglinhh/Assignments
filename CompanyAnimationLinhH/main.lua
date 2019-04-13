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
local whooshSound = audio.loadSound("Sounds/whoosh.mp3")
local whooshChannel

---------------------------------------------------------------------------------------
--                                Positions and Transitions
---------------------------------------------------------------------------------------

-- play the whoosh sound
local whoosh = audio.play(whooshSound)

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





                       





