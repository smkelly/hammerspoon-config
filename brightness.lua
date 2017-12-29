--- Shortcut key to toggle screen to full brightness.
hs.hotkey.bind({"cmd", "alt", "ctrl"}, ";", function()
    local current = hs.screen.mainScreen():getBrightness()
    local target  = current == 1 and .75 or 1
    print("Changing brightness from " .. current .. " to " .. target)
    hs.screen.mainScreen():setBrightness(target)
  end)
