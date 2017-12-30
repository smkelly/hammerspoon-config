
autoreload = require("autoreload"):start()
brightness = require("brightness"):start()

--- Notify that load is done
hs.notify.new({
    title="Hammerspoon",
    informativeText="Configuration loaded and ready."
}):send()
