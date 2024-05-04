local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Mocha"

config.font = wezterm.font("JetBrains Mono")
config.font_size = 16.0

config.window_decorations = "RESIZE"

config.use_ime = false

config.enable_tab_bar = false

config.keys = {
	{
	key = 'LeftArrow',
   mods = 'CMD',
   action = wezterm.action { SendString = "\x1bOH" }
 },
 {
   key = 'RightArrow',
   mods = 'CMD',
   action = wezterm.action { SendString = "\x1bOF" } 
}
}

return config
