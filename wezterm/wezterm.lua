-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- max fps
config.max_fps = 240
config.animation_fps = 240

-- change to square if you don't like rounded tab style
local tab_style = "square"

-- leader active indicator prefix
local leader_prefix = utf8.char(0x1f30a) -- unicorn icon

--[[
============================
Font
============================
]]
--

config.font_size = 10

--[[
============================
Colors
============================
]]
--

config.color_scheme = "Catppuccin Macchiato"

--[[
============================
Shortcuts
============================
]]
--

-- shortcut_configuration

--[[
============================
Tab Bar
============================
]]
--

-- tab bar
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = true

-- Finally, return the configuration to wezterm:
return config
