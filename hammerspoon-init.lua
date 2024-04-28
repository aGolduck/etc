-- 此方法是使用 hammerspoon 自己的方法去激活,麻烦,用名字判断也失准,不如直接调用命令行 open
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
-- hs.hotkey.bind({"alt"}, "M", open_app("Emacs"))
hs.hotkey.bind({"alt"}, "M", function()
      current_app = hs.application.frontmostApplication()
      current_app_name= current_app:title()
      current_app_bundle_id = current_app:bundleID()
      -- if current_app_name == "IntelliJ IDEA" then
      if current_app_bundle_id == "com.jetbrains.intellij" then
         hs.eventtap.keyStroke({"alt"}, "M", 0, current_app)
      else
         -- open_app("Emacs")()
         hs.execute("open /opt/homebrew/Cellar/emacs-plus@29/29.3/Emacs.app")
      end
end)
hs.hotkey.bind({"alt"}, "L", function()
      current_app = hs.application.frontmostApplication()
      current_app_name= current_app:title()
      if current_app_name == "Emacs" then
         hs.eventtap.keyStroke({"alt"}, "L", 0, current_app)
      else
         hs.execute("open '/Users/w/Applications/IntelliJ IDEA Ultimate.app'")
      end
end)
hs.hotkey.bind({"alt"}, "C", function()
      current_app = hs.application.frontmostApplication()
      current_app_name= current_app:title()
      hs.execute("open '/Users/w/Library/Caches/JetBrains/JetBrainsClientDist/JetBrainsClient-233.15026.9-aarch64.sit-03ce3ecd7e.ide.d/IntelliJ IDEA.app/'")
end)
hs.hotkey.bind({"cmd", "shift"}, "right", function() hs.window.focusedWindow():moveOneScreenEast(true, true) end)
hs.hotkey.bind({"cmd", "shift"}, "left", function() hs.window.focusedWindow():moveOneScreenWest(true, true) end)

-- hs.hotkey.bind({"cmd", "ctrl"}, "L", function() hs.alert.show(hs.application.frontmostApplication():title()) end)
hs.hotkey.bind({"cmd", "ctrl"}, "L", function() hs.alert.show(hs.application.frontmostApplication():bundleID()) end)

-- hs.hotkey.bind({"alt"}, "space", function() hs.eventtap.keyStroke({}, "escape"); hs.eventtap.keyStroke({}, "space") end)

