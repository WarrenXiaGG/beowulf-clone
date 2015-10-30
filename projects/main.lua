-- Variable for top alignment axis
local topAlignAxis = 200

-- Create first multi-line text object
local options1 = 
{
    text = "The quick brown fox jumped over the lazy dog.",
    x = 90,
    width = 120,     --required for multi-line and alignment
    font = native.systemFont,
    fontSize = 18
}
local myText1 = display.newText( options1 )
myText1:setFillColor( 1, 0, 0 )

-- Set anchor Y on object to 0 (top)
myText1.anchorY = 0
-- Align object to top alignment axis
myText1.y = topAlignAxis


-- Create second multi-line text object
local options2 = 
{
    text = "The quick brown fox jumped over the lazy dog, then jumped back again.",
    x = 230,
    width = 120,     --required for multi-line and alignment
    font = native.systemFont,
    fontSize = 18
}
local myText2 = display.newText( options2 )
myText2:setFillColor( 0.6, 0.4, 0.8 )

-- Set anchor Y on object to 0 (top)
myText2.anchorY = 0
-- Align object to top alignment axis
myText2.y = topAlignAxis