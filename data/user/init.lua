-- put user settings here
-- this module will be loaded after everything else when the application starts

local keymap = require "core.keymap"
local config = require "core.config"
local style = require "core.style"

-- light theme:
require "user.colors.max"

config.line_limit = 79
style.guide = style.background2

config.treeview_size = 300 * SCALE

-- key binding:
-- keymap.add { ["ctrl+escape"] = "core:quit" }

