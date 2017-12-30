--- Shortcut key to toggle screen to full brightness.

local obj = {}
obj.name = "brightness"
obj.author = "Sean Kelly <smkelly@smkelly.org>"

setmetatable(obj, obj)

obj.__gc = function(self)
  self:stop()
end

obj.logger = hs.logger.new("brightness")

obj.hotkey={{"cmd", "alt", "ctrl"}, ";"}

local binding = {}

function obj:start()
  binding = hs.hotkey.bind(self.hotkey[1], self.hotkey[2], function()
    local current = hs.screen.mainScreen():getBrightness()
    local target  = current == 1 and .75 or 1
    self.logger.f("Changing brightness from %d to %d", current*100, target*100)
    hs.screen.mainScreen():setBrightness(target)
  end)
  return self
end

function obj:stop()
  binding:delete()
  return self
end

return obj
