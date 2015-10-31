leveldata = {}
local DC_width = display.contentWidth;
local DC_height = display.contentHeight;
local require = require

local perspective = require("perspective")
local camera = perspective.createView()

local function createPlayer( x, y, width, height, rotation )
    --  Player is a black square.
    local p = display.newRect( x, y, width, height )
    p:setFillColor( 255, 0, 0 )
    p.rotation = rotation

    return p
end
local background = display.newRect( 0, 0, 480, 320 )  
background:setFillColor( 255, 255, 255 )  

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
    else 
    
    rect:setFillColor( 3.6 )

    noncollideable:insert( rect )
end
camera:add(rect, 1)
   
end
    
end

local player = createPlayer( 0, 0 , 40, 40, 0 )
camera:add(player, 2)
local function onTouch( event )
    if "began" == event.phase then
        player.isFocus = true

        player.x0 = event.x - player.x
        player.y0 = event.y - player.y
    elseif player.isFocus then
        if "moved" == event.phase then
            player.x = event.x - player.x0
            player.y = event.y - player.y0
        elseif "ended" == phase or "cancelled" == phase then
            player.isFocus = false
        end
    end

    -- Return true if the touch event has been handled.
    return true
end
camera:setFocus(player) -- Set the focus to the player
camera:track() 
-- Only the background receives touches. 
Runtime:addEventListener( "touch", onTouch)