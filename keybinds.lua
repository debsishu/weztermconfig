local wezterm = require("wezterm")
local act = wezterm.action
local module = {}

function module.apply_to_config(config)
	-- CTRL + SPACE as leader
	config.leader = {
		key = " ",
		mods = "CTRL",
		timeout_milliseconds = 2000,
	}

	config.keys = {
		-- custom script keybinds
		{
			key = "i",
			mods = "CMD | SHIFT",
			action = act.EmitEvent("trigger-pin-input"),
		},

		-- Normal keybinds
		{
			key = "[",
			mods = "LEADER",
			action = act.ActivateCopyMode,
		},
		{
			key = "c",
			mods = "LEADER",
			action = act.SpawnTab("CurrentPaneDomain"),
		},
		{
			key = "|",
			mods = "LEADER",
			action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "_",
			mods = "LEADER",
			action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "h",
			mods = "ALT | SHIFT",
			action = act.ActivateTabRelative(-1),
		},
		{
			key = "l",
			mods = "ALT | SHIFT",
			action = act.ActivateTabRelative(1),
		},
		{
			key = "f",
			mods = "ALT | SHIFT",
			action = act.ShowLauncherArgs({
				flags = "FUZZY|WORKSPACES",
			}),
		},
		-- Similar to tmux sessionizer
		{
			key = "f",
			mods = "CTRL",
			action = require("wez-per-project-workspace.plugin").action.ProjectWorkspaceSelect({
				base_dirs = {
					{
						path = "/Users/debsishu/Desktop/Amazon",
						min_depth = 1,
						max_depth = 1,
					},
					{
						path = "/Users/debsishu/Desktop/Work",
						min_depth = 1,
						max_depth = 1,
					},
				},
				rooters = { "packageInfo", ".git" },
				shorten_paths = false,
			}),
		},
		{ key = "h", mods = "CTRL", action = act.EmitEvent("ActivatePaneDirection-left") },
		{ key = "j", mods = "CTRL", action = act.EmitEvent("ActivatePaneDirection-down") },
		{ key = "k", mods = "CTRL", action = act.EmitEvent("ActivatePaneDirection-up") },
		{ key = "l", mods = "CTRL", action = act.EmitEvent("ActivatePaneDirection-right") },
	}
end

return module
