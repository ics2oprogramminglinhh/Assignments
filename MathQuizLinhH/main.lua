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
local randomNumber1
local randomNumber2
local randomNumber3
local randomNumber4
local randomNumber5
local randomNumber6
local randomNumber7
local userAnswer
local correctAnswer
local correctText
local questionObject
local correctObject
local numericField
local incorrectObject
local pointsObject
local points = 0
local randomOperator

-- Variables for the timer and lives
local totalSeconds = 10
local secondsLeft = 11
local clockText
local countDownTimer

local lives = 3
local heart1
local heart2
local heart3

-- Victory and Gameover 
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
-- FUNCTIONS
---------------------------------------------------------------------------------------------------

local function AskQuestion()
 -- generate 7 random numbers between a max. and a min. number
 randomNumber1 = math.random(10, 20)
 randomNumber2 = math.random(10, 20)
 randomNumber3 = math.random(0, 10)
 randomNumber4 = math.random(0, 10)
 randomNumber5 = math.random(0, 100)
 randomNumber6 = math.random(1, 5)
 randomNumber7 = math.random(1, 2)

 -- changes the signs (-, +, *, /, ^, square root, factorial)
 randomOperator = math.random(1, 7)

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
 	-- calculate the correct answer
 	correctAnswer = randomNumber3 * randomNumber4 
  	-- create question in text object
 	questionObject.text = randomNumber3 .. " x " .. randomNumber4 .. " = "
 
 -- otherwise, if the random operator is 4, do multiplication
 elseif (randomOperator == 4) then
     -- make the answer positive/whole number
     correctAnswer = randomNumber3 * randomNumber6
     temp = randomNumber6
     randomNumber6 = correctAnswer
     correctAnswer = temp
	-- create question in text object
 	questionObject.text = randomNumber6 .. "/" .. randomNumber3 .. "="
end

 if (randomOperator == 5) then
 	-- calculate the correct answer
 	squareRoot = randomNumber4 * randomNumber4
 	correctAnswer = math.sqrt(squareRoot)
 	-- create question in text object
 	questionObject.text = squareRoot .. "sqrt"

 	--otherwise, if the random operator is 6, do exponents
 elseif (randomOperator == 6) then
 	-- calculate the exponent question
 	correctAnswer = math.pow(randomNumber6, randomNumber7)
 	-- create question in text object
 	questionObject.text = randomNumber6 .. "^" .. randomNumber7 .. "="
 end

 -- if the random operator is 7, do factorial
 if (randomOperator == 7) then
 
 	-- calculate the correct answer
 	if (randomNumber7 == 1) then
 	correctAnswer = 1
 	elseif randomNumber7 == 2 then 
 	correctAnswer = 2
 	-- create question in text object
 	questionObject.text = randomNumber7 .. "! ="
end
 end
end

-- Hide the correct object and ask question
local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

-- Hide the incorrect object and ask question
local function HideIncorrect()
	incorrectObject.isVisible = false
	AskQuestion()
end

-- Hide the Correct Text and ask question
local function HideCorrectText()
	correctText.isVisible = false
	AskQuestion()
end

local function NumericFieldListener(event)

	-- User begins editing "numericField"
	if (event.phase == "began") then

		-- clear text field
		event.target.text = ""

	elseif event.phase == "submitted" then

		-- when the answer is submitted (enter key is pressed) set user input to user's answer
		userAnswer = tonumber(event.target.text)

		-- if the users answer is correct
		if (userAnswer == correctAnswer) then
			correctSoundChannel = audio.play(correctSound)
			secondsLeft = totalSeconds
			correctObject.isVisible = true
			incorrectObject.isVisible = false
			timer.performWithDelay(1000, HideCorrect)
			points = points + 1
			pointsObject.text = "Points" .. " = ".. points
		
		-- show the victory background when user gets 5 points	
			if (points == 5) then
				victory.isVisible = true
				victoryChannel = audio.play(victorySound)
				numericField.isVisible = false
				totalSeconds = 0
			end

		-- if the users answer is wrong
		elseif (userAnswer) then	
			secondsLeft = totalSeconds
			correctObject.isVisible = false
			incorrectObject.isVisible = true
			wrongSoundChannel = audio.play(wrongSound)
			timer.performWithDelay(2500, HideIncorrect)
			lives = lives - 1
	
			-- tell user the correct answer
			correctText.text = "Correct Answer:" .. correctAnswer
			correctText.isVisible = true
			timer.performWithDelay(2200, HideCorrectText)

	-- REMOVE HEART AFTER LOSING LIVE(S)
	if (lives == 3) then
		heart1.isVisible = true
		heart2.isVisible = true
		heart3.isVisible = true
	elseif (lives == 2) then
		heart3.isVisible = false
	elseif (lives == 1) then
		heart2.isVisible = false
	elseif (lives == 0) then
		heart1.isVisible = false
			timer.performWithDelay(0, HideCorrectText)
			gameOver.isVisible = true
			numericField.isVisible = false
			clockText.isVisible = false
			gameOverSoundChannel = audio.play(gameOverSound)
			end
		end
	-- clear text field
	event.target.text = ""
	end 
end

local function UpdateTime()

	-- decrement the number of seconds
	secondsLeft = secondsLeft - 1

	-- display the number of seconds left in the clock object
	clockText.text = secondsLeft .. ""

	if (secondsLeft == 0) then
		
		-- Reset the number of seconds left, if times run out, user loses a life
		secondsLeft = totalSeconds 
		lives = lives - 1
		AskQuestion()

		if (lives == 3) then
			heart3.isVisible = false
		elseif (lives == 2) then
			heart2.isVisible = false
		elseif (lives == 1) then
			heart1.isVisible = false
		elseif (lives == 0) then
			-- if there are 0 lives left, display a gameOver background and sound
			gameOver.isVisible = true
			gameOverSoundChannel = audio.play(gameOverSound)
			-- lower the volume of the gameover sound, make the numeric field and clockText invisible
			audio.setVolume(0.3)
			numericField.isVisible = false
			clockText.isVisible = false
		end
	end
end

-- function that calls the timer
local function StartTimer()
	-- create a countdown timer that loops infinitely
	countDownTimer = timer.performWithDelay(1000, UpdateTime, 0)
end

------------------------------------------------------------------------------------------
-- OBJECT CREATION
------------------------------------------------------------------------------------------

-- displays a question and sets the colour
questionObject = display.newText("", display.contentWidth/3, display.contentHeight/2, nil, 70)
questionObject:setTextColor(0/255, 0/255, 0/255)

-- displays points and sets the colour
pointsObject = display.newText("", 300, 150, Arial, 30)
pointsObject:setTextColor(128/255, 128/255, 128/255)

-- create the correct text object and make it invisible
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight/3, nil, 100)
correctObject:setTextColor(50/255, 128/255, 50/255)
correctObject.isVisible = false

-- create the incorrect text object and make it invisible 
incorrectObject = display.newText("Incorrect", display.contentWidth/2, display.contentHeight/3, nil, 100)
incorrectObject:setTextColor(70/255, 90/255, 120/255)
incorrectObject.isVisible = false

-- Create numeric field
numericField = native.newTextField(500, display.contentWidth/2, display.contentHeight/2, 100, 100)
numericField.inputType = "number"

-- Tells user the correct answer 
correctText = display.newText("", 500, 600, Arial, 50)
correctText:setTextColor(0/255, 0/255, 0/255)

-- create the lives to display on the screen
heart1 = display.newImageRect("Images/heart.png", 100, 100)
heart1.x = display.contentWidth * 9.5 / 10
heart1.y = display.contentHeight * 1 / 8

heart2 = display.newImageRect("Images/heart.png", 100, 100)
heart2.x = display.contentWidth * 8.5 / 10
heart2.y = display.contentHeight * 1 / 8

heart3 = display.newImageRect("Images/heart.png", 100, 100)
heart3.x = display.contentWidth * 7.5 / 10
heart3.y = display.contentHeight * 1 / 8

-- display the timer
clockText = display.newText("", 100, 100, Arial, 50)
clockText:setTextColor(204/255, 0/255, 0/255)

-- Gameover Screen
gameOver = display.newImageRect("Images/gameOver.png", 1100, 1100)
gameOver.x = 500
gameOver.y = 400
gameOver.isVisible = false

-- Victory Screen
victory = display.newImageRect("Images/victory.png", 1100, 1100)
victory.x = 500
victory.y = 400
victory.isVisible = false
victory:scale(1,1)

-- add the event listener for the numeric field
numericField:addEventListener( "userInput", NumericFieldListener )

-----------------------------------------------------------------------------------------
-- FUNCTION CALLS
-----------------------------------------------------------------------------------------

-- call the function to ask the question
AskQuestion()

-- call the function to update the time
UpdateTime()

-- call the function to start timer
StartTimer()
