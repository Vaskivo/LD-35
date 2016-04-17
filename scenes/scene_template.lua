
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