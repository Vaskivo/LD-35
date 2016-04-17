
local Scene = {}
Scene.__index = Scene

CHARCODES = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789 .,:;!?()&/-'


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
  local level_data = require(LEVELS[level_name].file)
  self.level_name = level_name
  self.level_data = level_data
  
  local viewport = MOAIViewport.new()
  viewport:setSize(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
  viewport:setScale(SCREEN_SIZE_X, SCREEN_SIZE_Y)
  
  local layer = MOAILayer2D.new()
  layer:setViewport(viewport)
  self.layer = layer
  
  MOAIRenderMgr.setRenderTable( {layer} )
  
  -----------------------
  local intermission_data = level_data.intermission
  self.intermission_data = intermission_data
  
  local bg_deck = MOAIGfxQuad2D.new()
  bg_deck:setTexture(ResourceManager.getSprite(intermission_data.background))
  bg_deck:setRect(-640, -360, 640, 360)
  
  local bg_prop = MOAIProp2D.new()
  bg_prop:setDeck(bg_deck)
  
  layer:insertProp(bg_prop)
  
  
  self.dialog = intermission_data.dialog
  self.dialog_index = 1
  
  function new_style(font, size, r, g, b)
    local style = MOAITextStyle.new ()
    style:setFont(ResourceManager.getFont(font, size))
    style:setSize(size)
    style:setColor(r, g, b, 1)
    return style;
  end
  
  local textbox = MOAITextBox.new()
  textbox:setStyle(new_style('DejaVuSans.ttf', 24, 1, 1, 1))
  textbox:setStyle('shape', new_style('DejaVuSans.ttf', 36, unpack(intermission_data.s_color)))
  textbox:setStyle('other', new_style('DejaVuSans.ttf', 36, unpack(intermission_data.o_color)))
  textbox:setStyle('big', new_style('DejaVuSans.ttf', 50, unpack(intermission_data.o_color)))
  
  textbox:setRect(-500, -200, 500, 200)
  textbox:setAlignment(MOAITextBox.CENTER_JUSTIFY, MOAITextBox.CENTER_JUSTIFY)
  textbox:setYFlip(true)
  textbox:setLoc(0, -200)
  
  layer:insertProp(textbox)
  
  textbox:setString(self.dialog[self.dialog_index])
  
  
  
  self.textbox = textbox
  
  
  
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
  
  if self.clicked then
    self.clicked = false
    if self.dialog_index == #self.dialog then
      scene_manager:replace_scene('main_scene', self.level_name)
      return
    end
    
    self.dialog_index = self.dialog_index + 1
    self.textbox:setString(self.dialog[self.dialog_index])
    
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
    self.clicked = true
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