-----------------------------------------------------------------------------------------
-- Title: MathQuiz
-- Name: Linh Ho
-- Course: ICS2O
-- This program displays a math question and asks the user to answer in a numeric field
-- terminal within a time limit.
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- set the background colour 
display.setDefault("background", 224/255, 187/255, 228/255)

------------------------------------------------------------------------------------------
-- LOCAL VARIABLES
------------------------------------------------------------------------------------------

-- Create local variables
local questionObject
local correctObject
local numericField
local randomNumber1
local randomNumber2
local randomNumber3
local randomNumber4
local randomNumber5
local userAnswer
local correctAnswer

-- Additional local variables
local incorrectObject
local pointsObject

local points = 0
local randomOperator
local randomNumber3
local randomNumber4

-- Variables for the timer and lives
local totalSeconds = 10
local secondsLeft = 10
local clockText
local countDownTimer

-- Lives 
local lives = 3
local heart1
local heart2
local heart3

-- Victory and gameover
local victory
local victorySound = audio.loadSound("Sounds/victory.mp3")
local victoryChannel

local gameOver
local gameOverSound = audio.loadSound("Sounds/gameOver.mp3")
local gameOverSoundChannel

-- Correct and Wrong Sounds
local correctSound = audio.loadSound("Sounds/correct.mp3")
local correctSoundChannel

local wrongSound = audio.loadSound("Sounds/wrong.mp3")
local wrongSoundChannel

---------------------------------------------------------------------------------------------------

local function AskQuestion()
	-- generate 2 random numbers between a max. and a min. number
	randomNumber1 = math.random(10, 20)
	randomNumber2 = math.random(10, 20)
	randomNumber3 = math.random(0, 10)
	randomNumber4 = math.random(0, 10)
	randomNumber5 = math.random(0,100)

	-- changes the signs (-, +, *)
	randomOperator = math.random(1, 3)

	-- display points 
	pointsObject.text = "Points" .. " = " .. points

	if (randomOperator == 1) then 

		-- calculate the correct answer
		correctAnswer = randomNumber1 + randomNumber3

		-- create question in text object
		questionObject.text = randomNumber1 .. " + " .. randomNumber3 .. " = "

	-- otherwise, if the random operator is 2, do subtraction
	elseif (randomOperator == 2) then
		correctAnswer = randomNumber2 - randomNumber4
			
		-- create question in text object 
		questionObject.text = randomNumber2 .. " - " .. randomNumber4 .. " = "
	end

	if (randomOperator == 3) then
			correctAnswer = randomNumber3 * randomNumber4 

		-- create question in text object
		questionObject.text = randomNumber3 .. " x " .. randomNumber4 .. " = "
	-- otherwise, if the random operator is 4, do multiplication
	elseif (randomOperator == 4) then
		    correctAnswer = randomNumber3 / randomNumber4

		-- create question in text object
			questionObject.text = randomNumber3 .. "/" .. randomNumber4 .. "="
	end
end
-- Checklist
-- addtion and subtraction (1-20)
-- subtraction must avoid negative answers
-- multiplication, use numbers in the range (1-10)
-- division, use numbers in the range (1-100), must be rounded to 1 decimal place

-- if user gets the answer right must have a sound effect and increase the number correct count
-- if the user gets it wrong must have a sound effect and tell them the correct answer and they lose a life


-- user has three lives
-- once the user gets  correct answers, display an image telling that they won and play a diff sound effect

-- lose all lives, game over image and display diff sound effect

-- timer should stop when the game is finished, aswell it should reset after each question is answered
-- 10 seconds to answer a question