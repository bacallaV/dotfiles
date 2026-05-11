-- Pull in the wezterm API

local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- or, changing the font size and color scheme.
config.font_size = 12
config.font = wezterm.font({ family = "Fira Code", harfbuzz_features = { "calt=0", "clig=0", "liga=0" } })
config.line_height = 1.2

config.color_scheme = "Tokyo Night"

config.window_background_opacity = 0.85
config.window_padding = {
	left = 4,
	right = 4,
	top = 4,
	bottom = 4,
}

config.inactive_pane_hsb = {
	saturation = 0.9,
	brightness = 0.5,
}

-- Finally, return the configuration to wezterm:
return config
