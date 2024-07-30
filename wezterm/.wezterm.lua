-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.warn_about_missing_glyphs = false

-- This is where you actually apply your config choices
-- For example, changing the color scheme:
config.color_scheme = "Catppuccin Mocha"
config.text_background_opacity = 0.85
config.window_background_opacity = 0.85
-- config.width = { cell_width = 3.0 }
config.initial_cols = 100
config.initial_rows = 26
config.font_size = 18
config.font = wezterm.font("JetBrains Mono", { weight = 'Medium'})
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
-- and finally, return the configuration to wezterm
return config
