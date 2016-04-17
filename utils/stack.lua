
-- Stack

local Stack = {}
Stack.__index = Stack

-- I could optimize it by having a pointer to the top element

-- Length function? or override metamethod...

function Stack.new()
  local stack = setmetatable( {n=0}, Stack)
  return stack
end


function Stack.push(self, value)
  self.n = self.n + 1
  self[self.n] = value
end


function Stack.pop(self)
  if self.n <= 0 then
    --error('Empty stack!')
    return nil
  end
  local value = self[self.n]
  self[self.n] = nil
  self.n = self.n - 1
  return value
end


function Stack.peek(self)
  return self[self.n]
end


return Stack