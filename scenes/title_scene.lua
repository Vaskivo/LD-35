
local Scene = {}
Scene.__index = Scene


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
  viewport:setScale(SCREEN_SIZE_X, SCREEN_SIZE_Y)
  
  local layer = MOAILayer2D.new()
  layer:setViewport(viewport)
  layer:setClearColor(1, 1, 1, 1)
  self.layer = layer
  
  MOAIRenderMgr.setRenderTable( {layer} )
  
  local partition = MOAIPartition.new()
  layer:setPartition(partition)
  
  -- props
  local title_deck = MOAIGfxQuad2D.new()
  title_deck:setTexture(ResourceManager.getSprite('title.png'))
  title_deck:setRect(-640, -360, 640, 360)
  
  local title_prop = MOAIProp2D.new()
  title_prop:setDeck(title_deck)
  layer:insertProp(title_prop)
  
  local play_deck = MOAIGfxQuad2D.new()
  play_deck:setTexture(ResourceManager.getSprite('play_button.png'))
  play_deck:setRect(-100, -50, 100, 50)
  
  local play_prop = MOAIProp2D.new()
  play_prop:setDeck(play_deck)
  partition:insertProp(play_prop)
  play_prop:setLoc(100, -200)
  
  
  local credits_deck = MOAIGfxQuad2D.new()
  credits_deck:setTexture(ResourceManager.getSprite('credits_button.png'))
  credits_deck:setRect(-100, -50, 100, 50)
  
  local credits_prop = MOAIProp2D.new()
  credits_prop:setDeck(credits_deck)
  partition:insertProp(credits_prop)
  credits_prop:setLoc(400, -200)
  
  
  
  self.play_button = play_prop
  self.credits_button = credits_prop
  
    
  
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
  
  if self.change_scene == 'play' then
    scene_manager:replace_scene('intermission_scene', 'level_1')
  elseif self.change_scene == 'credits' then
    scene_manager:replace_scene('credits_scene')
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
  
  if down == false then
    local x, y = MOAIInputMgr.device.pointer:getLoc()
    local layer = self.layer
    local partition = layer:getPartition()
    
    x, y = layer:wndToWorld(x, y)
    local prop = partition:propForPoint(x, y)
    
    if prop == self.play_button then
      self.change_scene = 'play'
    end
    
    if prop == self.credits_button then
      self.change_scene = 'credits'
    end
  end 
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


return Scene