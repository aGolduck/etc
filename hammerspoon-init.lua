function open_app(name)
   return function()
      -- hs.application.launchOrFocus(name)
      -- hs.application.open(name)
      hs.application.get(name):activate()
      if name == "Finder" then
         hs.appfinder.appFromName(name):activate()
      end
   end
end

-- hs.hotkey.bind({"alt"}, "M", open_app("/Users/w/.nix-profile/Applications/Emacs.app"))
-- hs.hotkey.bind({"alt"}, "M", open_app("/usr/local/Cellar/emacs-mac/emacs-27.2-mac-8.2/Emacs.app"))
hs.hotkey.bind({"alt"}, "M", function()
      current_app = hs.application.frontmostApplication()
      current_app_name= current_app:title()
      hs.alert.show(current_app_name)
      if current_app_name == "IntelliJ IDEA" then
         hs.eventtap.keyStroke({"alt"}, "M", 0, current_app)
      else
         open_app("Emacs")()
      end
end)
-- hs.hotkey.bind({"alt"}, "M", open_app("Emacs"))
hs.hotkey.bind({"cmd"}, "right", function() hs.window.focusedWindow():moveOneScreenEast(true, true) end)
hs.hotkey.bind({"cmd"}, "left", function() hs.window.focusedWindow():moveOneScreenWest(true, true) end)

hs.hotkey.bind({"cmd", "ctrl"}, "L", function() hs.alert.show(hs.application.frontmostApplication():title()) end)

-- hs.hotkey.bind({"alt"}, "space", function() hs.eventtap.keyStroke({}, "escape"); hs.eventtap.keyStroke({}, "space") end)

