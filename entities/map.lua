

local Map = {}
Map.__index = Map


local CELL_SIZE = 30

local deck = MOAITileDeck2D.new()
deck:setTexture(ResourceManager.getSprite('tiles.png'))
deck:setSize(1, 1)

function Map.new(map_data)
  local map = setmetatable({}, Map)
  
  local main_grid = map:_make_grid(map_data)
  local pf_grid = map:_make_pf_grid(map_data)
  
  local prop = MOAIProp2D.new()
  prop:setDeck(deck)
  prop:setGrid(main_grid)
  
  prop:setLoc(-((map_data.size.w*CELL_SIZE) / 2), -((map_data.size.h*CELL_SIZE) / 2))
  
  map.map_data = map_data
  map.size = map_data.size
  map.prop = prop
  map.main_grid = main_grid
  map.pf_grid = pf_grid
  
  return map
end


function Map.exists_path(self, start_x, start_y, end_x, end_y, end_has_enemy)
  if end_x < 1 or end_x > self.size.w or end_y < 1 or end_y > self.size.h then
    return false
  end
  
  if end_has_enemy then
    self.pf_grid:setTile(end_x, end_y, self.main_grid:getTile(end_x, end_y))
  end
  
  local start_node = self.pf_grid:getCellAddr(start_x, start_y)
  local end_node = self.pf_grid:getCellAddr(end_x, end_y)
  
  local pathfinder = MOAIPathFinder.new()
  pathfinder:setFlags(MOAIGridPathGraph.NO_DIAGONALS )
  pathfinder:setGraph(self.pf_grid)
  pathfinder:init(start_node, end_node)
  pathfinder:findPath()
  
  local result = false
  if pathfinder:getPathSize() ~= 0 then
    result = true
  end
  
  if end_has_enemy then
    self.pf_grid:setTile(end_x, end_y, 0)
  end
  
  return result
end


function Map.enemy_killed(self, grid_x, grid_y)
  self.pf_grid:setTile(grid_x, grid_y, self.main_grid:getTile(grid_x, grid_y))
end 

function Map.reset_map(self)
  self.pf_grid = self:_make_pf_grid(self.map_data)
end

---------------------------------
---- PRIVATES 
---------------------------------

function Map._make_grid(self, map_data)
  local grid = MOAIGrid.new()
  --[[
  grid:setSize(8, 8, CELL_SIZE ,CELL_SIZE)
  
  grid:setRow( 1,   1, 1, 1, 1, 1, 1, 1, 1)
  grid:setRow( 2,   0, 1, 1, 1, 1, 1, 1, 1)
  grid:setRow( 3,   1, 1, 0, 0, 0, 1, 1, 1)
  grid:setRow( 4,   1, 1, 0, 0, 0, 1, 1, 1)
  grid:setRow( 5,   1, 1, 0, 0, 0, 1, 1, 1)
  grid:setRow( 6,   1, 1, 0, 0, 0, 1, 1, 1)
  grid:setRow( 7,   1, 1, 1, 1, 1, 1, 0, 1)
  grid:setRow( 8,   1, 1, 1, 1, 1, 1, 1, 1)
  --]]

  ---[[
  local size = map_data.size
  
  grid:setSize(size.w, size.h, CELL_SIZE, CELL_SIZE)
  
  local cells = map_data.cells
  for i = size.h, 1, -1 do
    grid:setRow(size.h-i+1, unpack(cells[i]))
  end
  --]]
  
  return grid
end

function Map._make_pf_grid(self, map_data)
  -- call _make_Grid and then mess around with it
  local grid = self:_make_grid(map_data)
  local enemies = map_data.enemies
  for i = 1, #enemies do
    local position = enemies[i].position
    grid:setTile(position.x, position.y, 0)
  end
  
  return grid
end




return Map

