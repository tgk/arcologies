offset_trait = {}

offset_trait.init = function(self)

  self.setup_offset = function(self)
    self.offset = 0
  end

  self.set_offset = function(self, i)
    self.offset = util.clamp(i, 0, 15)
    self.callback(self, 'set_offset')
  end

end