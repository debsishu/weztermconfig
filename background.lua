local wezterm = require("wezterm")
local module = {}

-- Catppuccin color overrides
local catppuccin_overrides = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]
catppuccin_overrides.tab_bar.background = "#181825"
catppuccin_overrides.tab_bar.new_tab.bg_color = "#585b70"
catppuccin_overrides.tab_bar.active_tab = {
	bg_color = "#89b4fa",
	fg_color = "#181825",
	intensity = "Bold",
}
catppuccin_overrides.tab_bar.inactive_tab = {
	bg_color = "#28283d",
	fg_color = "#cdd6f4",
}

function module.apply_to_config(config)
	config.color_scheme = "Catppuccin Mocha"
	config.background = {
		-- This is the main background image
		{
			source = {
				File = "/Users/debsishu/Downloads/Wallpapers/Terminal Walls/oskwqx4kq5ta1.png",
			},
			hsb = {
				brightness = 1.0,
				hue = 1.0,
				saturation = 1.0,
			},
			horizontal_align = "Center",
		},
    -- This is the catppuccin color overlay, change it's opacity
		{
			source = {
				Color = "#1e1e2e",
			},
			width = "100%",
			height = "100%",
			opacity = 0.93,
		},
	}
	config.color_schemes = {
		["BLUDppuccin"] = catppuccin_overrides,
	}
	config.color_scheme = "BLUDppuccin"
end

return module
