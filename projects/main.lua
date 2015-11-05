leveldata = {}

local DC_width = display.contentWidth;
local DC_height = display.contentHeight;
local require = require
local physics = require( "physics" )
physics.start()
physics.setGravity( 0, 0 )
local showGameElements = true
local perspective = require("perspective")
local camera = perspective.createView()
local motionx = 0 -- Variable used to move character along x axis
local speed = 10 -- Set Walking Speed
local prevx
local prevy
local function createPlayer( x, y, width, height, rotation )
    --  Player is a black square.

    local playerCollisionFilter = { categoryBits = 2, maskBits = 5 }
    local playerBodyElement = { filter=playerCollisionFilter }
     
    local p = display.newRect( x, y, width, height )
    p:setFillColor( 255, 0, 0 )
    p.rotation = rotation
    
physics.addBody ( p, "dynamic", playerBodyElement)

    return p
end


playerposition = {0,0}
local collideable = display.newGroup()
local noncollideable = display.newGroup()
for i = 0, 20 do
    leveldata[i] = {}

    for j = 0, 25 do
        if i == math.random(20) then

        leveldata[i][j] = 0
        else 
        leveldata[i][j] = 1 -- Fill the values here
        
      
        
    end
end
end

for i = 0, 20 do

   for j = 0, 25 do
    
     local rect = display.newRect(i*40, j*40, 40, 40)
     
  if leveldata[i][j] == 0 then
    
    rect:setFillColor( 0.5 )
 collideable:insert( rect )
 
 physics.addBody (rect, "static" )
    else 
    
    rect:setFillColor( 3.6 )

    noncollideable:insert( rect )
end
camera:add(rect, 1)
   
end
    
end

local player = createPlayer( 0, 0 , 40, 40, 0 )


 local function stop (event)
    if event.phase =="ended" then
        motionx = 0
    end     
end
Runtime:addEventListener("touch", stop )
--Library responsible to make buttons
local function movePlayer (event)
    prevx = player.x
    player.x = player.x + motionx   
end
Runtime:addEventListener("enterFrame", movePlayer)

-- When left arrow is touched, move character left
local leftArrow = display.newImage ("images/btn_arrow.png")
    leftArrow.x = 65 
    leftArrow.y = 280
    leftArrow.rotation = 180
    leftArrow.isVisible = showGameElements

-- RIGHT DPAD
local rightArrow = display.newImage ("images/btn_arrow.png")
    rightArrow.x = 180 
    rightArrow.y = 282
    rightArrow.isVisible = showGameElements

function leftArrow:touch()
    motionx = -speed
end
leftArrow:addEventListener("touch",leftArrow)

-- When right arrow is touched, move character right
function rightArrow:touch()
    motionx = speed
end
rightArrow:addEventListener("touch",rightArrow)

-- Make character jump

camera:add(player, 1)




camera:setFocus(player) -- Set the focus to the player
camera:track() 
-- Only the background receives touches. 
