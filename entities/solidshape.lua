
local SolidShape = {}
SolidShape.__index = SolidShape


local SHAPE_INDEX = {
    circle = 1,
    triangle = 2,
    square = 3,
    pentagon = 4,
    hexagon = 5
  }
SolidShape.SHAPE_INDEX = SHAPE_INDEX    -- enum accessible to the outside

--[[
local SHAPE_KILL_RULES = {
    circle = { circle = true, triangle = true },
    triangle = { circle = true, triangle = true, square = true },
    square = { triangle = true, square = true, pentagon = true },
    pentagon = { square = true, pentagon = true, hexagon = true },
    hexagon = { pentagon = true, hexagon = true },
  }
--]]
local SHAPE_KILL_RULES = {
    circle = { triangle = true },
    triangle = { circle = true, square = true },
    square = { triangle = true, pentagon = true },
    pentagon = { square = true, hexagon = true },
    hexagon = { pentagon = true },
  }

local deck = MOAITileDeck2D.new()
deck:setTexture(ResourceManager.getSprite('SS.png'))
deck:setSize(5, 1)
deck:setRect(-15, -15, 15, 15)


function SolidShape.new()
  local ss = setmetatable({}, SolidShape)
  
  local prop = MOAIProp2D.new()
  prop:setDeck(deck)
  
  ss.prop = prop
  prop.entity = ss
  
  ss.current_shape = 'triangle'
  prop:setIndex(SHAPE_INDEX['triangle'])
  
  return ss
end


function SolidShape.change_shape(self, shape)
  self.prop:setIndex(SHAPE_INDEX[shape])
  self.current_shape = shape
end


function SolidShape.can_kill(self, shape)
  if SHAPE_KILL_RULES[self.current_shape] then
    return SHAPE_KILL_RULES[self.current_shape][shape]
  end
  return false  
end

















return SolidShape