
dofile("autoreload.lua")
dofile("brightness.lua")

--- Notify that load is done
hs.notify.new({
    title="Hammerspoon",
    informativeText="Configuration loaded and ready."
}):send()
