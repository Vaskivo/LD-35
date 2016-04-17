
-- make namespace global
_G.ResourceManager = {}

-- constants:
--              resource folder path
ResourceManager.RES_PATH = './res/'
--              images folder path
ResourceManager.SPRITES_PATH = ResourceManager.RES_PATH .. 'sprites/'
--              fonts folder path
ResourceManager.FONTS_PATH = ResourceManager.RES_PATH .. 'fonts/'

local charcode = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 _.,?!;:()[]{}+-/*^@#$%&\\\'"<>`|'

-- create a cache for fonts and images
local spriteCache = {}
local fontCache = {}

-- retrieve sprite
function ResourceManager.getSprite(filename)
  
  if spriteCache[filename] then
    return spriteCache[filename]
  end
  
  local sprite = MOAIImage.new()
  sprite:load( ResourceManager.SPRITES_PATH .. filename )
  spriteCache[filename] = sprite
  
  return sprite  
end

function ResourceManager.releaseSprite(filename)
  if spriteCache[filename] then
    spriteCache[filename]:release()
    spriteCache[filename] = nil
  end
end

function ResourceManager.getFont(filename, size)
  if fontCache[filename .. size] then
    return fontCache[filename .. size]
  end
  
  local font = MOAIFont.new()
  font:load(ResourceManager.FONTS_PATH .. filename)
  font:preloadGlyphs(charcode, size, 72)
  fontCache[filename .. size] = font
  
  return font
end








