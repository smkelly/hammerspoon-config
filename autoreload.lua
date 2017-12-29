--- Reload config if Lua files are changed.
function reloadConfig(files)
    local doReload = hs.fnutils.some(files, function(f)
        return f:sub(-4) == ".lua"
    end)
    if doReload then
        print("Detected file change - reloading...")
        hs.reload()
    end
end

configWatcher = hs.pathwatcher.new(hs.configdir .. "/", reloadConfig):start()
