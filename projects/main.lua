leveldata = {}
playerposition = {0,0}
local collideable = display.newGroup()
local noncollideable = display.newGroup()
for i = 0, 10 do
    leveldata[i] = {}

    for j = 0, 10 do
        if i == 2 then

        leveldata[i][j] = 0 
        else 
        leveldata[i][j] = 1-- Fill the values here
      
        
    end
end
end

for i=0,10 do

   for j=0,10 do
     local rect = display.newRect(i*40, j*40, 40, 40)
  if leveldata[i][j] == 0 then
    
    rect:setFillColor( 0.5 )

    collideable:insert( rect )
    else 
    
    rect:setFillColor( 3.6 )

    noncollideable:insert( rect )
end
   
end
    
end

