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
local verticesG = {-105, -108, 185, -108, 259, 51, -19, 51}
local parallelogramText

local myHexagon
local verticesH = {600, 463, 500, 463, 450, 550, 500, 637, 600, 637, 650, 550}     
local hexagonText

local myPentagon
local verticesP = {550, 450, 455, 519, 491, 631, 609, 631, 645, 519}
local pentagonText

local myOctagon
local verticesO = {588, 458, 512, 458, 458, 512, 458, 588, 512, 642, 588, 642, 642, 588, 642, 512}
local octagonText 

local myTrapezoid
local verticesZ = {144, 89, 213, 89, 266, 25, 88, 25}
local trapezoidText 

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
local myParallelogram = display.newPolygon(350, 350, verticesG)

-- Set the colour of the parallelogram
myParallelogram:setStrokeColor(1,1,1)

-- Set the width of the border
myParallelogram.strokeWidth = 6

-- Set the colour of the border
myParallelogram:setFillColor(0.8, 0, 0)

-- Display the name of the shape below it
parallelogramText = display.newText("Parallelogram", 380, 470, Arial, 40)

-- Set text colour
parallelogramText:setTextColor(255/255, 10/255, 0/255)

-----------------------------------------------------------------------------------------
-- HEXAGON
-----------------------------------------------------------------------------------------

-- Drawing my Hexagon
local myHexagon = display.newPolygon(650, 350, verticesH)

-- Set the colour of the Hexagon
myHexagon:setStrokeColor(1,1,1)

-- Set the width of the border
myHexagon.strokeWidth = 6

-- Set the colour of the border
myHexagon:setFillColor(0, .8 , 0)

-- Display the name of the shape below it
hexagonText = display.newText("Hexagon", 650, 470, Arial, 40)

-- Set text colour
hexagonText:setTextColor(46/255, 139/255, 87/255)

-----------------------------------------------------------------------------------------
-- EXTRA FUNCTIONS
-----------------------------------------------------------------------------------------

-- Drawing my Pentagon
local myPentagon = display.newPolygon(880, 350, verticesP)

-- Set the colour of the Pentagon
myPentagon:setStrokeColor(1,1,1)

-- Set the width of the border
myPentagon.strokeWidth = 6

-- Set the colour of the border
myPentagon:setFillColor(.9, 0 , 1)

-- Display the name of the shape below it
pentagonText = display.newText("Pentagon", 880, 470, Arial, 40)

-- Set text colour
pentagonText:setTextColor(249/255, 102/255, 204/255)

-- Add Gradient Fill to Pentagon Shape
local paint = {
    type = "gradient",
    color1 = { 1, 0, 0.4 },
    color2 = { 1, 0, 0, 0.2 },
    direction = "down"
}

local myPentagon = display.newPolygon(880, 350, verticesP)
myPentagon.fill = paint

-----------------------------------------------------------------------------------------

-- Drawing my Octagon
local myOctagon = display.newPolygon(500, 600, verticesO)

-- Set the colour of the Octagon
myOctagon:setStrokeColor(1,1,1)

-- Set the width of the border
myOctagon.strokeWidth = 6

-- Set the colour of the border
myOctagon:setFillColor(0.4, 0 , 1)

-- Display the name of the shape below it
octagonText = display.newText("Octagon", 500, 730, Arial, 40)

-- Set text colour
octagonText:setTextColor(107/255, 63/255, 160/255)

-- Add Gradient Fill to Octagon Shape
local paint = {
    type = "gradient",
    color1 = { 0.4, 0, 1},
    color2 = { 0.2, 0, 0, 1},
    direction = "down"
}

local myOctagon = display.newPolygon(500, 600, verticesO)
myOctagon.fill = paint

-------------------------------------------------------------------------------------------

-- Drawing my Trapezoid
local myTrapezoid = display.newPolygon(200, 600, verticesZ)

-- Set the colour of the Trapezoid
myTrapezoid:setStrokeColor(1,1,1)

-- Set the width of the border
myTrapezoid.strokeWidth = 6

-- Set the colour of the border
myTrapezoid:setFillColor(0.3, 0.3 , 0.1)

-- Display the name of the shape below it
trapezoidText = display.newText("Trapezoid", 200, 680, Arial, 40)

-- Set text colour
trapezoidText:setTextColor(120/255, 150/255, 180/255)




