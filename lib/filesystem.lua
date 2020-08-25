filesystem = {}

function filesystem.init()
  filesystem.paths = {}
  filesystem.paths["save_path"] = config.settings.save_path
  filesystem.paths["crypt_path"] = config.settings.crypt_path
  filesystem.paths["crypts_path"] = config.settings.crypts_path
  for k,path in pairs(filesystem.paths) do
    if util.file_exists(path) == false then
      util.make_dir(path)
    end
  end
  -- crypt(s)
  filesystem.crypts_names = { config.settings.crypt_default_name }
  filesystem.default = filesystem.paths.crypt_path
  filesystem.current = filesystem.default
  filesystem:scan_crypts()
end



function filesystem:scan_crypts()
  local delete = {"LICENSE", "README.md"}
  local scan = util.scandir(self.paths.crypts_path)
  for k, file in pairs(scan) do
    for kk, d in pairs(delete) do
      local find = fn.table_find(scan, d)
      if find then table.remove(scan, find) end
    end
    local name = string.gsub(file, "/", "")
    table.insert(self.crypts_names, name)
  end
end


function filesystem:set_crypt(index)
  if index == 1 then
    self.current = self.default
  else
    self.current = self.paths.crypts_path .. self.crypts_names[index] .. "/"
  end
  if init_done then
    keeper:update_all_crypts()
  end
end

function filesystem:get_crypt()
  return self.current
end

return filesystem