
local Enemy = {}
Enemy.__index = Enemy


local SHAPE_INDEX = {
    circle = 1,
    triangle = 2,
    square = 3,
    pentagon = 4,
    hexagon = 5
  }
Enemy.SHAPE_INDEX = SHAPE_INDEX    -- enum accessible to the outside

local deck = MOAITileDeck2D.new()
deck:setTexture(ResourceManager.getSprite('enemies.png'))
deck:setSize(5, 1)
deck:setRect(-15, -15, 15, 15)

function Enemy.new(shape)
  local enemy = setmetatable({}, Enemy)
  
  local prop = MOAIProp2D.new()
  prop:setDeck(deck)
  
  
  enemy.prop = prop
  prop.entity = enemy
  
  enemy.shape = shape
  prop:setIndex(SHAPE_INDEX[shape])
  
  return enemy
end




return Enemy

