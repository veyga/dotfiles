-- set in ~/.bash_profile [comp dependent]
local hs_dir = os.getenv("HAMMERSPOON_DIR")

-- install the `hs` command-line tool (used for reload calls, etc.)
hs.ipc.cliInstall(hs_dir)

-- AeroSpace accordion stack icons.
-- (Replaces stackline, which only detects yabai-style identical-frame stacks.)
local aerostack = require "aerostack"
aerostack:init()
