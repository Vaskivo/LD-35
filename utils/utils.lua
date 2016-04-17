--- Utilities and generic auxiliary functions
-- @module util

--- Get an element from the matrix
-- @tparam table matrix
-- @tparam int x position of the element
-- @tparam int y position of the element
-- @return The element at the given position or null if there is none
function get_matrix_element(matrix, x, y)
  if matrix[x] then
    return matrix[x][y]
  end
end

--- Insert an element on the matrix
-- @tparam table matrix
-- @tparam int x position of the element
-- @tparam int y position of the element
-- @param The element to be inserted
function insert_matrix_element(matrix, x, y, elem)
  if not matrix[x] then
    matrix[x] = {}
  end
  matrix[x][y] = elem
end

--- Remove an element from the matrix
-- @tparam table matrix
-- @tparam int x x position of the element
-- @tparam int y y position of the element
function remove_matrix_elem(matrix, x, y)
  if matrix[x] then
    matrix[x][y] = nil
  end
end

--- Shuffles an array
-- Shuffles an array. This function changes the given array.
-- @tparam table array
-- @treturn table The shuffled array.
function shuffle_array(array)
  local n = #array
  while n > 2 do
    local k = math.random(n)
    array[n], array[k] = array[k], array[n]
    n = n - 1
  end
  return array
end

--- Makes a shallow copy of a table.
-- @tparam table t
-- @treturn table 
function copy_table(t)
  local new_t = {}
  for k, v in pairs(t) do
    new_t[k] = v
  end
  return new_t
end

--- Returns an array of elements of a set.
-- This assumes a set being implemented as specified in the Programming in Lua book <a href="http://www.lua.org/pil/11.5.html">here</a>.
-- If the input is <code>{ 'apples' = true, 'oranges' = true, 'pears' = true }</code> the output is <code>{ 'oranges', 'apples', 'pears' }</code>.
-- @tparam table set
-- @treturn table
function set_to_array(set)
  local array = {}
  for v, _ in pairs(set) do
    array[#array+1] = v
  end
  return array
end


function distance_between_points(v1, v2, u1, u2)
  return math.sqrt( (v1 - u1)^2 + (v2 - u2)^2   )
end
