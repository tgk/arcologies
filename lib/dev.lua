local dev = {}

function dev:scene(i)
  sound:toggle_playback()
  keeper:select_cell(2, 2)
  keeper:select_cell(2, 1)
  keeper:select_cell(2, 6)
  keeper.selected_cell:open_port("n")
  keeper.selected_cell:open_port("e")
  keeper.selected_cell:open_port("s")
  keeper.selected_cell:open_port("w")
  keeper.selected_cell.structure = 2
  page:select(1)
  -- keeper.selected_cell:open_port("n")
  -- keeper:select_cell(10, 4)
  -- keeper.selected_cell:open_port("e")
  -- keeper.selected_cell:open_port("w")
  -- keeper.selected_cell.structure = 2
  -- keeper:select_cell(13, 4)
  -- keeper.selected_cell:open_port("w")
  -- keeper:deselect_cell()
  -- menu.selected_item = 3
end

return dev