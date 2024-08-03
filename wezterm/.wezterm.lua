local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Mocha"

config.font = wezterm.font("JetBrains Mono")
config.font_size = 16.0

config.window_decorations = "RESIZE"
config.window_padding = {
	left = 2,
	right = 2,
	top = 5,
	bottom = 0,
}

config.background = {
	{
		source = {
			Color = "#0B0B0F",
		},
		width = "100%",
		height = "100%",
	},
	-- {
	-- 	source = {
	-- 		Gradient = {
	-- 			colors = { "#1E1E2E" },
	-- 		},
	-- 	},
	-- 	width = "100%",
	-- 	height = "100%",
	-- 	opacity = 0.98,
	-- },
	-- {
	-- 	source = {
	-- 		File = {
	-- 			path = "/Users/alex/Downloads/blob_blue.gif",
	-- 			speed = 0.001,
	-- 		},
	-- 	},
	-- 	repeat_x = "NoRepeat",
	-- 	repeat_y = "NoRepeat",
	-- 	vertical_align = "Middle",
	-- 	width = "100%",
	-- 	height = "Cover",
	-- 	opacity = 0.30,
	-- 	hsb = {
	-- 		hue = 0.9,
	-- 		saturation = 0.8,
	-- 		brightness = 0.1,
}
config.use_ime = false

config.enable_tab_bar = false

config.keys = {
	{
		key = "LeftArrow",
		mods = "CMD",
		action = wezterm.action({ SendString = "\x1bOH" }),
	},
	{
		key = "RightArrow",
		mods = "CMD",
		action = wezterm.action({ SendString = "\x1bOF" }),
	},
}

return config
