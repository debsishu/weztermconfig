local module = {}

function module.apply_to_config(config)
	-- config.window_padding = {
	-- 	left = "0.2%",
	-- 	right = "0.2%",
	-- 	top = "1.5%",
	-- 	bottom = "0.8%",
	-- }
	config.window_padding = {
		left = 4,
		right = 4,
		top = 10,
		bottom = 0,
	}
	config.use_fancy_tab_bar = false
	-- config.hide_tab_bar_if_only_one_tab = true
	config.tab_bar_at_bottom = true
  -- config.window_decorations="RESIZE"
end

return module
