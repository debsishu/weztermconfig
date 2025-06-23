local wezterm = require("wezterm")
local module = {}

function module.apply_to_config(config)
	config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Medium" })
	-- config.font = wezterm.font("JetBrainsMono Nerd Font")
	-- config.font = wezterm.font("CommitMono Nerd Font", { weight = "Medium" })
	-- config.font = wezterm.font("GeistMono Nerd Font", { weight = "Regular" })
	-- config.font = wezterm.font("GeistMono Nerd Font")
	-- config.font = wezterm.font("ZedMono Nerd Font", { weight = "Medium" })
	-- config.font = wezterm.font_with_fallback({
	-- 	{ family = "Zed Mono", weight = "Medium" },
	-- 	{ family = "JetBrainsMono Nerd Font", scale = 0.8 },
	-- })
	config.font_size = 18
	-- config.line_height = 1.40
	config.line_height = 1.22
	-- config.dpi = 78
	-- config.line_height = 1.10
	-- config.freetype_load_flags = "FORCE_AUTOHINT"
  -- config.freetype_render_target = 'HorizontalLcd'
	-- config.freetype_load_flags = "NO_BITMAP | FORCE_AUTOHINT"
	-- config.freetype_load_flags = "NO_HINTING"
	-- config.freetype_load_flags = "FORCE_AUTOHINT | NO_HINTING"
end

return module
