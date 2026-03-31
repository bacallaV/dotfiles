-- Pull in the wezterm API

local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- or, changing the font size and color scheme.
config.font_size = 14
config.color_scheme = "Tokyo Night"

config.window_background_opacity = 0.85
config.window_padding = {
	left = 24,
	right = 24,
	top = 24,
	bottom = 24,
}

-- Finally, return the configuration to wezterm:
return config
