-- D-PAD buttons
local buttonUp = display.newImage("images/button.png", 50, 300)
local buttonDown = display.newImage("images/button.png", 50, 375)
local buttonLeft = display.newImage("images/button.png", 50, 375)
local buttonRight = display.newImage("images/button.png", 50, 375)
local buttonLeftUp = display.newImage("images/buttonv2.png", 50, 375)
local buttonRightUp = display.newImage("images/buttonv2.png", 50, 375)
local buttonLeftDown = display.newImage("images/buttonv2.png", 50, 375)
local buttonRightDown = display.newImage("images/buttonv2.png", 50, 375)

local player = display.newImage("images/player.png")
player.width = 100
player.height = 60
player.y = 260
player.x = math.random(45, 175)
physics.addBody(player, "dynamic", {friction=0.5, bounce=0, gravity=0})

print(player.x)

--Objects and properties
buttonUp.x = display.contentWidth / 2
buttonUp.y = display.contentHeight - 212
buttonUp.alpha = 0.4
--

buttonDown.x = display.contentWidth / 2
buttonDown.y = display.contentHeight - 100
buttonDown.alpha = 0.4
buttonDown.rotation = 180
--

buttonLeft.x = (display.contentWidth / 2) - 56
buttonLeft.y = display.contentHeight - 156
buttonLeft.alpha = 0.4
buttonLeft.rotation = -90
--

buttonRight.x = (display.contentWidth / 2) + 56
buttonRight.y = display.contentHeight - 156
buttonRight.alpha = 0.4
buttonRight.rotation = 90
--

buttonLeftUp.x = (display.contentWidth / 2) + 56
buttonLeftUp.y = display.contentHeight - 100
buttonLeftUp.alpha = 0.4
buttonLeftUp.rotation = 90
--

buttonRightUp.x = (display.contentWidth / 2) + 56
buttonRightUp.y = display.contentHeight - 212
buttonRightUp.alpha = 0.4
--

buttonLeftDown.x = (display.contentWidth / 2) - 56
buttonLeftDown.y = display.contentHeight - 212
buttonLeftDown.alpha = 0.4
buttonLeftDown.rotation = -90
--

buttonRightDown.x = (display.contentWidth / 2) - 56
buttonRightDown.y = display.contentHeight - 100
buttonRightDown.alpha = 0.4
buttonRightDown.rotation = 180
--

--Variables that will be used
local motionx = 0 --X Motion
local motiony = 0 -- Y Motion
local speed = 5 -- Speed

local function stop (event) --Statements to control when there is no 
--touch and the touch is outside the D-Pad

        if "ended" == event.phase then --Check to see if the touch ended

        motionx = 0
        motiony = 0
        end

        --Touch Pos. Checkers

        if event.y < (display.contentHeight - 252) then

        motionx = 0
        motiony = 0

        end


        if event.y > (display.contentHeight - 70) then

        motionx = 0
        motiony = 0

        end

        if event.x > (display.contentWidth - 70) then

        motionx = 0
        motiony = 0

        end

        if event.x < 69 then

        motionx = 0
        motiony = 0

        end
    end

Runtime:addEventListener("touch", stop ) --What activates the stop function

----
local function move (event) -- Moves and updates the Player's movement 
--and the speed feedback
player.x = player.x + motionx;
player.y = player.y + motiony;

end


Runtime:addEventListener("enterFrame", move) --Every frame of the program will 
--run this     function

-----

local function wrap (event) --Function used to keep the player on screen

if player.x < -85 then
player.x = 405
end
----
if player.x > 405 then
player.x = -85
end
-------
if player.y < -88 then
player.y = 568
end
----
if player.y > 568 then
player.y = -88
end
---

if speed < 0 then

speed = 0
end


Runtime:addEventListener("enterFrame", wrap)

-------

--Button Functions to set the motionx and motiony variables 

function buttonUp:touch()
motionx = 0
motiony = -speed
end

buttonUp:addEventListener("touch", buttonUp)

------
function buttonDown:touch()
motionx = 0
motiony = speed

end

buttonDown:addEventListener("touch", buttonDown)
------

function buttonLeft:touch()
motionx = -speed
motiony = 0

end

buttonLeft:addEventListener("touch", buttonLeft)
------
function buttonRight:touch()
motionx = speed
motiony = 0

end

buttonRight:addEventListener("touch", buttonRight)
-------
-----

function buttonLeftUp:touch()
motionx = speed
motiony = speed

end

buttonLeftUp:addEventListener("touch", buttonLeftUp)


function buttonRightUp:touch()
motionx = speed
motiony = -speed

end

buttonRightUp:addEventListener("touch", buttonRightUp)

function buttonLeftDown:touch()
motionx = -speed
motiony = -speed

end

buttonLeftDown:addEventListener("touch", buttonLeftDown)

function buttonRightDown:touch()
motionx = -speed
motiony = speed

end

buttonRightDown:addEventListener("touch", buttonRightDown)
end