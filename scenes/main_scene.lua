
SolidShape = require 'entities/solidshape'
Enemy = require 'entities/enemy'
Map = require 'entities/map'

local Scene = {}
Scene.__index = Scene

local PAN_RADIUS = 10

local MAP_LAYER = 1
local CHAR_LAYER = 2

local restart_deck = MOAIGfxQuad2D.new()
restart_deck:setTexture(ResourceManager.getSprite('restart_button.png'))
restart_deck:setRect(-25, -25, 25, 25)

function Scene.new(name)
  local scene = setmetatable({}, Scene)
  
  -- probably nothing (should be redesigned)
  -- constants, important structures and static data?
  -- I usually put stuff here (even with nil) just to know it exists
  scene.name = name
  scene.layers = {}
  
  return scene
end


function Scene.setup(self, ...)
  self.cleanup()  -- ensures a clean start  
  
  -- load assets
  -- setup graphics
  -- setup physics
  -- build level
  -- build gui
  -- etc
  
  local level_name = ...
  local level_data = LEVELS[level_name]
  self.level_data = level_data
  
  local viewport = MOAIViewport.new()
  viewport:setSize(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
  viewport:setScale(SCREEN_SIZE_X / (5/3), SCREEN_SIZE_Y / (5/3))
  
  
  -- LAYERS
  local map_layer = MOAILayer2D.new()
  map_layer:setViewport(viewport)
  map_layer:setClearColor(0, 0, 0, 0)
  self.layers[MAP_LAYER] = map_layer
  
  local char_layer = MOAILayer2D.new()
  char_layer:setViewport(viewport)
  --char_layer:setClearColor(0, 0, 0, 1)
  self.layers[CHAR_LAYER] = char_layer
  
  MOAIRenderMgr.setRenderTable( self.layers )
  
  
  -- PARTITIONS
  local partition = MOAIPartition.new ()
  char_layer:setPartition ( partition ) 
  

  -- ENTITIES
  local map_data = require(level_data.file)
  
  --map
  local map = Map.new(map_data)
  map_layer:insertProp(map.prop)
  
  self.map = map
  
  -- Solid Shape
  local solid_shape = SolidShape.new()
  partition:insertProp(solid_shape.prop)
  
  self:_set_prop_in_grid(solid_shape.prop, map_data.start_position.x, map_data.start_position.y)

  -- enemies
  local enemies = {}
  local enemies_data = map_data.enemies
  for i = 1, #enemies_data do
    local enemy_data = enemies_data[i]
    
    local enemy = Enemy.new(enemy_data.shape)
    self:_set_prop_in_grid(enemy.prop, enemy_data.position.x, enemy_data.position.y)
    partition:insertProp(enemy.prop)
    
    enemies[i] = enemy
  end  
  
  
  -- restart button
  local restart_prop = MOAIProp2D.new()
  restart_prop:setDeck(restart_deck)
  restart_prop:setLoc(350, 180)
  
  partition:insertProp(restart_prop)
  
  self.restart_prop = restart_prop
  
  
  
  
  
    
  self.solid_shape = solid_shape
  self.solid_shape_location = { x = map_data.start_position.x, 
                                y = map_data.start_position.y } -- this is so ugly :/ 
  self.map_data = map_data
  self.map = map                      -- repeating it for organization. (DANGEROUS!)
  self.enemies = enemies
  self.remaining_enemies = #enemies
  
  self.io_stuff = { 
    mouse_queue = {},
    is_down = false,
    is_panning = false,
    current_position = { x = 0, y = 0}
  }
  
end


function Scene.focus(self)
  -- scene becomes the one "we're looking at"
  
  -- setup input
  -- start physics
  -- start actions/animations
end


function Scene.update(self, delta_time)
  -- do stuff
  -- THIS FUNCTION IS NOT A THREAD!
  -- THIS IS TO BE CALLED BY SceneMAnager.update()
  
  if self.remaining_enemies == 0 and self.end_level ~= true then
    self.end_level = true
    
    local end_deck = MOAIGfxQuad2D.new()
    end_deck:setTexture(ResourceManager.getSprite('end_level.png'))
    end_deck:setRect(-300, -200, 300, 200)

    local end_prop = MOAIProp2D.new()
    end_prop:setDeck(end_deck)
    self.layers[CHAR_LAYER]:insertProp(end_prop)
  end
  
  local io_stuff = self.io_stuff
  local mouse_queue = io_stuff.mouse_queue
  self.io_stuff.mouse_queue = {}
  
  for i = 1, #mouse_queue do
    local data = mouse_queue[i]
    
    if self.end_level and data.button == 'left' and data.down == false then
      self:_next_level()
    end
    
    
    if data.button == 'left' and data.down == false then
      io_stuff.left_is_down = false
      local mouse_x = data.pos.x
      local mouse_y = data.pos.y
      
      if WEB_BUILD then   -- teh hack :(
        mouse_x = mouse_x + 25
        mouse_y = mouse_y + 10
      end
      
      
      
      local layer = self.layers[CHAR_LAYER]
      local partition = layer:getPartition()
      local world_x, world_y = layer:wndToWorld(mouse_x, mouse_y)
      local pick = partition:propForPoint(world_x, world_y)
      
      if pick == self.restart_prop then
        self:_reset_scene()
        return
      end
      
      local enemy = nil
      if pick and pick ~= self.solid_shape.prop then
        enemy = pick.entity
      end 
      
      local grid_x, grid_y = self:_get_grid_indexes(world_x, world_y) 
      local ss_x = self.solid_shape_location.x
      local ss_y = self.solid_shape_location.y
      if self.map:exists_path(ss_x, ss_y, grid_x, grid_y, enemy) then
        
        if enemy then
          if self.solid_shape:can_kill(enemy.shape) then
            self:_kill_enemy(enemy, grid_x, grid_y)
            local new_pos_x, new_pos_y = self:_get_centered_grid_coordinates(grid_x, grid_y)
            self.solid_shape.prop:setLoc(new_pos_x, new_pos_y)
          end
        else
          local new_pos_x, new_pos_y = self:_get_centered_grid_coordinates(grid_x, grid_y)
          self.solid_shape.prop:setLoc(new_pos_x, new_pos_y)
        end
      end
    end
  end
end


function Scene.unfocus(self)
  -- we "stop looking at it"
  
  -- remove/stop input callbacks
  -- stop/pause physics
  -- stop/pause actions/animations
end


function Scene.cleanup(self)
  -- teardown objects
  -- teardown gui
  -- stop and teardown physics
  -- release assets
end


function Scene.on_keyboard_event(self, key, down)
  --
  -- do stuff...
  --
  -- WARNINIG! Be careful with what is in here.
  -- this may be used with event pooling:
  --     (on the scene_manager update function)
  --      for key, state in last_frame_input() do stuff end
  -- OR may be used as a callback:
  --     (on the scene_manager input callback function)
  --      active_scene.on_*_event(...)
  --
  -- If possible, keep your logic in the update function.
  
  --[[
  print('key', key)
  if down == false then
    if key == 49 then self.solid_shape:change_shape('circle') end
    if key == 50 then self.solid_shape:change_shape('triangle') end
    if key == 51 then self.solid_shape:change_shape('square') end
    if key == 52 then self.solid_shape:change_shape('pentagon') end
    if key == 53 then self.solid_shape:change_shape('hexagon') end
    if key == 114 then self:_reset_scene() end
    if key == 102 then self:_next_level() end
  end 
  --]]
  
end


function Scene.on_pointer_event(self, x, y)
  --
  -- do stuff...
  --
  -- WARNINIG! Be careful with what is in here.
  -- this may be used with event pooling:
  --     (on the scene_manager update function)
  --      for key, state in last_frame_input() do stuff end
  -- OR may be used as a callback:
  --     (on the scene_manager input callback function)
  --      active_scene.on_*_event(...)
  --
  -- If possible, keep your logic in the update function.
end


function Scene.on_mouse_left_event(self, down)
  --
  -- do stuff...
  --
  -- WARNINIG! Be careful with what is in here.
  -- this may be used with event pooling:
  --     (on the scene_manager update function)
  --      for key, state in last_frame_input() do stuff end
  -- OR may be used as a callback:
  --     (on the scene_manager input callback function)
  --      active_scene.on_*_event(...)
  --
  -- If possible, keep your logic in the update function.
  local mouse_x, mouse_y = MOAIInputMgr.device.pointer:getLoc()
  local data = { 
    pos = { x = mouse_x, y = mouse_y },
    button = 'left',
    down = down
  }
  
  local queue = self.io_stuff.mouse_queue
  queue[#queue+1] = data
end


function Scene.on_mouse_middle_event(self, down)
  --
  -- do stuff...
  --
  -- WARNINIG! Be careful with what is in here.
  -- this may be used with event pooling:
  --     (on the scene_manager update function)
  --      for key, state in last_frame_input() do stuff end
  -- OR may be used as a callback:
  --     (on the scene_manager input callback function)
  --      active_scene.on_*_event(...)
  --
  -- If possible, keep your logic in the update function.
end


function Scene.on_mouse_right_event(self, down)
  --
  -- do stuff...
  --
  -- WARNINIG! Be careful with what is in here.
  -- this may be used with event pooling:
  --     (on the scene_manager update function)
  --      for key, state in last_frame_input() do stuff end
  -- OR may be used as a callback:
  --     (on the scene_manager input callback function)
  --      active_scene.on_*_event(...)
  --
  -- If possible, keep your logic in the update function.
end

function Scene.on_touch_event(self, eventType, idx, x, y, tapCount)
  --
  -- do stuff...
  --
  -- WARNINIG! Be careful with what is in here.
  -- this may be used with event pooling:
  --     (on the scene_manager update function)
  --      for key, state in last_frame_input() do stuff end
  -- OR may be used as a callback:
  --     (on the scene_manager input callback function)
  --      active_scene.on_*_event(...)
  --
  -- If possible, keep your logic in the update function.
end


-------------------------------------
----    PRIVATE FUNCTIONS       -----
-------------------------------------

function Scene._get_grid_indexes(self, world_x, world_y)
  local map_x, map_y = self.map.prop:worldToModel(world_x, world_y)
  local grid_x, grid_y = self.map.main_grid:locToCoord(map_x, map_y)
  
  return grid_x, grid_y
end

function Scene._get_centered_grid_coordinates(self, grid_x, grid_y)
  local map_x, map_y = self.map.main_grid:getTileLoc(grid_x, grid_y, MOAIGrid.TILE_CENTER)
  local world_x, world_y = self.map.prop:modelToWorld(map_x, map_y)
  
  return world_x, world_y
end

function Scene._set_prop_in_grid(self, prop, grid_x, grid_y)
  local map_x, map_y = self.map.main_grid:getTileLoc(grid_x, grid_y, MOAIGrid.TILE_CENTER)
  local world_x, world_y = self.map.prop:modelToWorld(map_x, map_y)
  prop:setLoc(world_x, world_y)
end

function Scene._kill_enemy(self, enemy, position_X, position_y)
  self.layers[CHAR_LAYER]:getPartition():removeProp(enemy.prop)
  self.remaining_enemies = self.remaining_enemies - 1
  self.solid_shape:change_shape(enemy.shape)
  self.map:enemy_killed(position_X, position_y)
end

function Scene._reset_scene(self)
  local partition = self.layers[CHAR_LAYER]:getPartition()
  partition:clear()
  
  -- map
  self.map:reset_map()
  
  -- solid shape
  local ss = self.solid_shape
  ss:change_shape(self.map_data.start_shape)

  self:_set_prop_in_grid(ss.prop, self.map_data.start_position.x, self.map_data.start_position.y)
  partition:insertProp(ss.prop)
  
  self.solid_shape_location = { x = self.map_data.start_position.x, 
                                y = self.map_data.start_position.y }
  
  -- enemies
  local enemies = self.enemies
  for i = 1, #enemies do
    partition:insertProp(enemies[i].prop)
  end
  self.remaining_enemies = #enemies
  
  partition:insertProp(self.restart_prop)
end

function Scene._next_level(self)
  --scene_manager:stop()
  if self.level_data.next == 'end' then
    scene_manager:replace_scene('end_scene')
    return
  end
  scene_manager:replace_scene('intermission_scene', self.level_data.next)
  --scene_manager:start()
end

return Scene