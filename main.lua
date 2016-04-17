---[[  ensures an error when acessing an undefined local
local global_meta = {}      
setmetatable(_G, global_meta)

function global_meta:__index(k)
    error("Undefined global variable '" .. k .. "'!")                                              
end
--]]

--[[ DEBUG STUFF
  inspect = require 'inspect'
--]]

-- imports
require 'utils.utils'
require 'resourcemanager'
SceneManager = require 'scenemgr'


WEB_BUILD = false


-- number of units in the window
SCREEN_SIZE_X = 1280
SCREEN_SIZE_Y = 720

-- window size in pixels
SCREEN_WIDTH = SCREEN_SIZE_X * 1
SCREEN_HEIGHT = SCREEN_SIZE_Y * 1


LEVELS = {
  test_level = {file = 'res/levels/test_level', next = 'level_1' },
  level_1 = {file = 'res/levels/level_1', next = 'level_2' },
  level_2 = {file = 'res/levels/level_2', next = 'level_3' },
  level_3 = {file = 'res/levels/level_3', next = 'level_4' },
  level_4 = {file = 'res/levels/level_4', next = 'level_5' },
  level_5 = {file = 'res/levels/level_5', next = 'level_6' },
  level_6 = {file = 'res/levels/level_6', next = 'end' },
}


---[[
MOAISim.openWindow('Teste', SCREEN_WIDTH, SCREEN_HEIGHT)

scene_manager = SceneManager.new('scenes/')
--scene_manager:push_scene('main_scene', 'level_6')
scene_manager:push_scene('moai_scene')
scene_manager:start()
--]]
