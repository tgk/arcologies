local dev = {}

function rerun(option)
  if option == 1 then 
    print("option 1")
  end
  norns.script.load(norns.state.script)
end

function dev:scene(i)
print(i)
  -- ode to joy
 

  -- hive test
  if i == 1 then 
    page:select(3)
    menu:select_item(4)
    keeper:select_cell(4, 4)
    keeper.selected_cell:open_port("n")
    keeper.selected_cell:open_port("e")
    keeper.selected_cell:open_port("s")
    keeper.selected_cell:open_port("w")
    keeper:deselect_cell()
    params:set("bpm", 120)

  
  elseif i == 2 then
    keeper:select_cell(4, 1)
    keeper.selected_cell:open_port("s")
    keeper:select_cell(4, 4)
    keeper.selected_cell:change("TOPIARY")
    keeper.selected_cell:open_port("n")
    keeper.selected_cell:open_port("e")
    keeper.selected_cell:open_port("s")
    keeper.selected_cell:open_port("w")
    page:select(2)
    menu:select_item(4)
    params:set("bpm", 120)



  elseif i == 3 then
    keeper:select_cell(4, 4)
    keeper.selected_cell:change("HIVE")
    -- keeper.selected_cell:open_port("n")
    -- keeper.selected_cell:open_port("e")
    -- keeper.selected_cell:open_port("s")
    -- keeper.selected_cell:open_port("w")
    keeper.selected_cell:set_metabolism(16)
    keeper.selected_cell:set_offset(5)
    -- keeper:deselect_cell()
    page:select(2)      


  elseif i == 4 then
    -- fn.seed_cells()
    page:select(4)      






  elseif i == 10 then
    params:set("bpm", 240)
    sound:set_scale(47)
    page:select(2)
    keeper:select_cell(1, 4)
    keeper.selected_cell:open_port("e")
    keeper.selected_cell:set_metabolism(16)

    keeper:select_cell(5, 4)
    keeper.selected_cell:open_port("n")
    keeper.selected_cell:open_port("w")
    keeper.selected_cell:open_port("e")
    keeper.selected_cell:change("SHRINE")
    keeper.selected_cell:set_note(65) -- yeah these are very wrong


    keeper:select_cell(6, 4)
    keeper.selected_cell:open_port("n")
    keeper.selected_cell:open_port("w")
    keeper.selected_cell:open_port("e")
    keeper.selected_cell:change("SHRINE")
    keeper.selected_cell:set_note(65) -- yeah these are very wrong

    keeper:select_cell(7, 4)
    keeper.selected_cell:open_port("n")
    keeper.selected_cell:open_port("w")
    keeper.selected_cell:open_port("e")
    keeper.selected_cell:change("SHRINE")
    keeper.selected_cell:set_note(66) -- yeah these are very wrong

    keeper:select_cell(8, 4)
    keeper.selected_cell:open_port("n")
    keeper.selected_cell:open_port("w")
    keeper.selected_cell:open_port("e")
    keeper.selected_cell:change("SHRINE")
    keeper.selected_cell:set_note(68) -- yeah these are very wrong

    keeper:select_cell(9, 4)
    keeper.selected_cell:open_port("n")
    keeper.selected_cell:open_port("w")
    keeper.selected_cell:open_port("e")
    keeper.selected_cell:change("SHRINE")
    keeper.selected_cell:set_note(68) -- yeah these are very wrong

    keeper:select_cell(10, 4)
    keeper.selected_cell:open_port("n")
    keeper.selected_cell:open_port("w")
    keeper.selected_cell:open_port("e")
    keeper.selected_cell:change("SHRINE")
    keeper.selected_cell:set_note(66) -- yeah these are very wrong

    keeper:select_cell(11, 4)
    keeper.selected_cell:open_port("n")
    keeper.selected_cell:open_port("w")
    keeper.selected_cell:open_port("e")
    keeper.selected_cell:change("SHRINE")
    keeper.selected_cell:set_note(65) -- yeah these are very wrong

    keeper:select_cell(12, 4)
    keeper.selected_cell:open_port("n")
    keeper.selected_cell:open_port("w")
    keeper.selected_cell:open_port("s")
    keeper.selected_cell:change("SHRINE")
    keeper.selected_cell:set_note(63) -- yeah these are very wrong

    keeper:select_cell(12, 5)
    keeper.selected_cell:open_port("n")
    keeper.selected_cell:open_port("w")
    keeper.selected_cell:open_port("s")
    keeper.selected_cell:change("SHRINE")
    keeper.selected_cell:set_note(61) -- yeah these are very wrong
    
    keeper:select_cell(11, 5)
    keeper.selected_cell:open_port("w")
    keeper.selected_cell:open_port("e")
    keeper.selected_cell:open_port("s")
    keeper.selected_cell:change("SHRINE")
    keeper.selected_cell:set_note(61) -- yeah these are very wrong

    keeper:select_cell(10, 5)
    keeper.selected_cell:open_port("w")
    keeper.selected_cell:open_port("e")
    keeper.selected_cell:open_port("s")
    keeper.selected_cell:change("SHRINE")
    keeper.selected_cell:set_note(63) -- yeah these are very wrong

    keeper:select_cell(9, 5)
    keeper.selected_cell:open_port("w")
    keeper.selected_cell:open_port("e")
    keeper.selected_cell:open_port("s")
    keeper.selected_cell:change("SHRINE")
    keeper.selected_cell:set_note(65) -- yeah these are very wrong

    keeper:select_cell(8, 5)
    keeper.selected_cell:open_port("w")
    keeper.selected_cell:open_port("e")
    keeper.selected_cell:open_port("s")
    keeper.selected_cell:change("SHRINE")
    keeper.selected_cell:set_note(65) -- yeah these are very wrong

    keeper:select_cell(7, 5)
    keeper.selected_cell:open_port("w")
    keeper.selected_cell:open_port("e")
    keeper.selected_cell:open_port("s")
    keeper.selected_cell:change("SHRINE")
    keeper.selected_cell:set_note(63) -- yeah these are very wrong

    keeper:select_cell(6, 5)
    keeper.selected_cell:open_port("w")
    keeper.selected_cell:open_port("e")
    keeper.selected_cell:open_port("s")
    keeper.selected_cell:change("SHRINE")
    keeper.selected_cell:set_note(63) -- yeah these are very wrong

    keeper:deselect_cell()
  



  else
    print('else block')

  end
end

return dev