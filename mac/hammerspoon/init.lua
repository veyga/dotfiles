-- set in ~/.profile [comp dependent]
local hs_dir = os.getenv("HAMMERSPOON_DIR")

-- needed for hs reload calls from yabai
hs.ipc.cliInstall(hs_dir)
stackline = require "stackline"
stackline:init()
