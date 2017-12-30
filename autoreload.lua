--- Reload config if Lua files are changed.
obj = {}
obj.__gc = function(self)
    self:stop()
  end  
setmetatable(obj, obj)

obj.logger = hs.logger.new("autoreload")

local function reloadConfig(files)
    local doReload = hs.fnutils.some(files, function(f)
        return f:sub(-4) == ".lua"
    end)
    if doReload then
        obj.logger.i("Detected config file change - reloading...")
        hs.reload()
    end
end

local configWatcher = {}

function obj:start()
    configWatcher = hs.pathwatcher.new(hs.configdir .. "/", reloadConfig):start()
    return self
end

function obj:stop()
    configWatcher:stop()
    return self
end

return obj