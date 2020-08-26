local fn = {}

-- state checks, utilities, and formatters

function fn.init()
  fn.id_prefix = "arc-"
  fn.id_counter = 1000
end

function fn.id()
  -- a servicable attempt creating unique ids
  -- i (tried a md5 library but it tanked performance)
  fn.id_counter = fn.id_counter + 1
  return fn.id_prefix .. os.time(os.date("!*t")) .. "-" .. fn.id_counter
end

function fn.grid_width()
  return g.cols
end

function fn.grid_height()
  return g.rows
end

function fn.index(x, y)
  return x + ((y - 1) * fn.grid_width())
end

function fn.xy(cell)
  return "X" .. cell.x .. "Y" .. cell.y
end

function fn.rx()
  return math.random(1, fn.grid_width())
end

function fn.ry()
  return math.random(1, fn.grid_height())
end

function fn.playback()
  return sound.playback == 0 and "READY" or "PLAYING"
end

function fn.coin()
  return math.random(0, 1)
end

function fn.nearest_value(table, number)
    local nearest_so_far, nearest_index
    for i, y in ipairs(table) do
        if not nearest_so_far or (math.abs(number-y) < nearest_so_far) then
            nearest_so_far = math.abs(number-y)
            nearest_index = i
        end
    end
    return table[nearest_index]
end

function fn.table_find(t, element)
  for i,v in pairs(t) do
    if v == element then
      return i
    end
  end
  return false
end

function fn.deep_copy(orig)
  local orig_type = type(orig)
  local copy
  if orig_type == 'table' then
    copy = {}
    for orig_key, orig_value in next, orig, nil do
        copy[fn.deep_copy(orig_key)] = fn.deep_copy(orig_value)
    end
    setmetatable(copy, fn.deep_copy(getmetatable(orig)))
  else -- number, string, boolean, etc
    copy = orig
  end
  return copy
end

function fn.in_bounds(x, y)
  if 1 > y then
    return false -- north
  elseif fn.grid_width() < x then
    return false -- east
  elseif fn.grid_height() < y then
    return false -- south
  elseif 1 > x then
    return false -- west
  else
    return true -- ok
  end
end

function fn.no_grid()
  if fn.grid_width() == 0 then
    return true
  else
    return false
  end
end

function fn.cycle(value, min, max)
  if value > max then
    return min
  elseif value < 1 then
    return max
  else
    return value
  end
end

function fn.long_press(k)
  -- anythin greater than half a second is a long press
  clock.sleep(.5)
  key_counter[k] = nil
  if k == 3 then
    popup:launch("delete_all", true, "key", 3)
  end
  fn.dirty_screen(true)
end

-- simple boolean getters/setters/checks

function fn.dirty_grid(bool)
  if bool == nil then return grid_dirty end
  grid_dirty = bool
  return grid_dirty
end

function fn.dirty_screen(bool)
  if bool == nil then return screen_dirty end
  screen_dirty = bool
  return screen_dirty
end

function fn.break_splash(bool)
  if bool == nil then return splash_break end
  splash_break = bool
  return splash_break
end

-- the lost souls

function fn.cleanup()
  g.all(0)
  -- crow.clear()
  -- crow.reset()
  -- crow.ii.jf.mode(0)
  poll:clear_all()
end

function fn.seed_cells()
  if params:get("seed") ~= 0 and not fn.no_grid() then
    keeper:delete_all_cells()
    sound:set_random_root()
    sound:set_random_scale()
    params:set("bpm", math.random(100, 160))
    for i = 1, params:get("seed") do
      fn.random_cell()
    end
    keeper:deselect_cell()
  end
end

function fn.random_cell()
  keeper:select_cell(fn.rx(), fn.ry())
  keeper.selected_cell:set_structure_by_key(math.random(1, #config.structures))
  if keeper.selected_cell:is("SHRINE")
  or keeper.selected_cell:is("TOPIARY")
  or keeper.selected_cell:is("VALE")
  or keeper.selected_cell:is("CRYPT") then
    keeper.selected_cell:invert_ports()
  else
    local ports = { "n", "e", "s", "w" }
    for i = 1, #ports do
      if fn.coin() == 1 then
        keeper.selected_cell:open_port(ports[i])
      end
    end
  end
  if keeper.selected_cell:has("OFFSET") then
    keeper.selected_cell:set_offset(math.random(1, 5))
  end
  if keeper.selected_cell:has("METABOLISM") then
    keeper.selected_cell:set_metabolism(math.random(1, sound.length or 16))
  end
  if keeper.selected_cell:is("SHRINE") then
    keeper.selected_cell:set_note(sound:get_random_note(.6, .7), 1)
  end
  if keeper.selected_cell:is("DOME") then
    keeper.selected_cell:set_pulses(math.random(1, keeper.selected_cell.metabolism))
  end
  if keeper.selected_cell:is("CRYPT") then
    keeper.selected_cell:set_state_index(math.random(1, 6))
  end
end

return fn