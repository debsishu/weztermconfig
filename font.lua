local wezterm = require("wezterm")
local module = {}

function module.apply_to_config(config)
	-- config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Regular" })
	config.font = wezterm.font("ZedMono Nerd Font", { weight = "Medium" })
	config.font_size = 20
	config.line_height = 1.12
	-- config.dpi = 78
	-- config.line_height = 1.10
	-- config.freetype_load_flags = "FORCE_AUTOHINT"
	config.freetype_load_flags = "NO_HINTING"
end

return module
