-----------------------------------------------------------------------------------------
-- Title: Displaying Shapes
-- Name: Linh Ho
-- Date: February 14th, 2019
-- Course: ICS2O
-- This program shows shapes with different colours labeled 
-- below identifying what type of shape it is.
-----------------------------------------------------------------------------------------

-- Hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-----------------------------------------------------------------------------------------
-- BACKGROUND
-----------------------------------------------------------------------------------------

-- Sets the background colour
display.setDefault('background', 202/255, 204/255, 206/255)

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

local myTriangle
local verticesT = {150, 112, -45, 112, 65, 43}
local triangleText

local myParallelogram
local verticesP = {-105, -108, 185, -108, 259, 51, -19, 51}
local parallelogramText

local myHexagon
local verticesH = {-200, 300, 200, 300, -400, 450, 400,-450, -500, -650, 500, -650}      
local hexagonText

-----------------------------------------------------------------------------------------
-- TRIANGLE 
-----------------------------------------------------------------------------------------

-- Drawing my triangle 
local myTriangle = display.newPolygon(100, 350, verticesT)

-- Set the colour of the triangle
myTriangle:setStrokeColor(1,1,1)

-- Set the width of the border
myTriangle.strokeWidth = 6

-- Set the colour of the border
myTriangle:setFillColor(0, 0, 0.8)

-- Display the name of the shape below it
triangleText = display.newText("Triangle", 90, 430, Arial, 40)

-- Set text colour
triangleText:setTextColor(0/255, 30/255, 108/255)

-----------------------------------------------------------------------------------------
-- PARALLELOGRAM
-----------------------------------------------------------------------------------------

-- Drawing my parallelogram
local myParallelogram = display.newPolygon(350, 350, verticesP)

-- Set the colour of the parallelogram
myParallelogram:setStrokeColor(1,1,1)

-- Set the width of the border
myParallelogram.strokeWidth = 6

-- Set the colour of the border
myParallelogram:setFillColor(0.8, 0, 0)

-- Display the name of the shape below it
parallelogramText = display.newText("parallelogram", 380, 470, Arial, 40)

-- Set text colour
parallelogramText:setTextColor(255/255, 10/255, 0/255)

-----------------------------------------------------------------------------------------
-- HEXAGON
-----------------------------------------------------------------------------------------

-- Drawing my Hexagon
local myHexagon = display.newPolygon(500, 350, verticesH)

-- Set the colour of the Hexagon
myHexagon:setStrokeColor(1,1,1)

-- Set the width of the border
myHexagon.strokeWidth = 6

-- Set the colour of the border
myHexagon:setFillColor(0, .8 , 0)

-- Display the name of the shape below it
hexagonText = display.newText("Hexagon", 670, 470, Arial, 40)

-- Set text colour
hexagonText:setTextColor(104/255, 61/255, 244/255)













-----------------------------------------------------------------------------------------
-- TEXT OBJECTS
-----------------------------------------------------------------------------------------

-- set text colour of the triangle


-- draw the triangle (vertices)

-- set the width of the border

-----------------------------------------------------------------------------------------
-- EXTRA FUNCTIONS
-----------------------------------------------------------------------------------------

-- Additional shape

-- Display the area of triangle

-- Inserted an image into 4th shape

-- Gradient fill to 1st shape


