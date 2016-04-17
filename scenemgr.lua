
local Stack = require 'utils.stack'


local SceneManager = {}
SceneManager.__index = SceneManager


function SceneManager.new(scenes_folder)
  local manager = setmetatable({}, SceneManager)
  
  local update_thread = nil
  
  manager.scenes_folder = scenes_folder or ''
  manager.scene_stack = Stack.new()
  manager.active_scene = nil  -- scene at the top of the stack
  manager.update_thread = nil -- update thread. if ~= nil then 
                              -- the manager is "running"
                              
  -- setting up input callbacks
  MOAIInputMgr.device.keyboard:setCallback(manager:_get_input_callback('on_keyboard_event'))
  MOAIInputMgr.device.pointer:setCallback(manager:_get_input_callback('on_pointer_event'))
  MOAIInputMgr.device.mouseLeft:setCallback(manager:_get_input_callback('on_mouse_left_event'))
  MOAIInputMgr.device.mouseMiddle:setCallback(manager:_get_input_callback('on_mouse_middle_event'))
  MOAIInputMgr.device.mouseRight:setCallback(manager:_get_input_callback('on_mouse_right_event'))
  
  if MOAIInputMgr.device.touch then
    MOAIInputMgr.device.touch:setCallback(manager:_get_input_callback('on_touch_event'))
  end

  
  return manager
end

function SceneManager.update(self, delta_time)
  if self.active_scene then
    self.active_scene:update(delta_time)
  end
end

function SceneManager.start(self)
  if self.update_thread and self.update_thread.stop then
    self.update_thread:stop()
  end
  
  self.running_time = MOAISim.getElapsedTime()
  local thread = MOAICoroutine.new()
  self.update_thread = thread
  
  thread:run(function ()
      while true do
        local now = MOAISim.getElapsedTime()
        local delta_time = now - self.running_time
        self:update(delta_time)
        
        self.running_time = now
        coroutine.yield()
      end
    end
    )
end

function SceneManager.stop(self)
  if self.update_thread and self.update_thread.stop then
    self.update_thread:stop()
  end
  
  self.update_thread = nil
end

function SceneManager.push_scene(self, scene_name, ...)
  -- unfocus old scene
  if self.active_scene and self.active_scene.unfocus then
    self.active_scene:unfocus()
  end
  
  -- instantiate new scene
  local new_scene_module = require (self.scenes_folder .. scene_name)
  local new_scene = new_scene_module.new()
  
  self.scene_stack:push(new_scene)
  self.active_scene = new_scene
  new_scene:setup(...)
  new_scene:focus()
end

function SceneManager.pop_scene(self)
  -- cleanup_scene
  if self.active_scene then
    if self.active_scene.unfocus then
      self.active_scene:unfocus()
    end
    if self.active_scene.cleanup then
      self.active_scene:cleanup()
    end
  end
  
  self.scene_stack[#self.scene_stack] = nil
  self.active_scene = self.scene_stack:pop()
  
  if self.active_scene then
    self.active_scene:focus()
  end
end

function SceneManager.replace_scene(self, scene_name, ...)
  self:pop_scene()
  self:push_scene(scene_name, ...)
end

function SceneManager.clear(self)
  local stack = self.scene_stack
  local scene = nil
  while stack:peek() do
    scene = stack:pop()
    if scene.unfocus then
      scene:unfocus()
    end
    if scene.cleanup then
      scene:cleanup()
    end
  end
end

function SceneManager._get_input_callback(self, scene_input_handler)
  function callback(...)
    local scene = self.active_scene
    if self.update_thread and -- there is a scene running
        scene and scene[scene_input_handler] then  
      scene[scene_input_handler](scene, ...)
    end
  end
  return callback
end
    
  

return SceneManager
