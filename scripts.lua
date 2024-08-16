local module = {}

function module.apply_wezterm_listeners(wezterm)
	local act = wezterm.action
	wezterm.on("trigger-pin-input", function(window, pane)
		local success, stdout, stderr = wezterm.run_child_process({
			"security",
			"find-generic-password",
			"-w",
			"-a",
			"debsishu",
			"-s",
			"amz-security-pin",
		})
		pane:send_text(stdout)
	end)

	wezterm.on("window-config-reloaded", function(window, _)
		window:toast_notification("wezterm", "Configuration reloaded!")
	end)

	wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
		return {
			{ Text = " " .. tab.tab_index + 1 .. ": " .. tab.active_pane.title .. " " },
		}
	end)

	wezterm.on("gui-startup", function()
		local tab, pane, window = wezterm.mux.spawn_window({})
		window:gui_window():maximize()
	end)

	wezterm.on("update-status", function(window, pane)
		local nerdfonts = wezterm.nerdfonts
		local status_generator = require("wez-status-generator.plugin")
		local left_status = status_generator.generate_left_status({
			sections = {
				{
					components = {
						function()
							return window:mux_window():get_workspace():gsub(".*/", "")
						end,
					},
					foreground = "#15161e",
					background = "#89b4fa",
				},
				{
					components = {
						function()
							return ""
						end,
					},
					foreground = "#a9b1d6",
					background = "#466391",
				},
			},
			separator = status_generator.section_separators.ROUND,
			hide_empty_sections = false,
		})

		local right_status = status_generator.generate_right_status({
			sections = {
				{
					components = {
						function()
							return nerdfonts.md_clock_outline .. " " .. wezterm.strftime("%-d/%-m %a, %I:%M %p")
						end,
					},
					foreground = "#7aa2f7",
					background = "#3b4261",
				},
			},
			separator = status_generator.section_separators.ROUND,
			hide_empty_sections = false,
		})

		window:set_left_status(left_status .. (" "):rep(2))
		window:set_right_status(right_status)
	end)

	local function isViProcess(pane)
		return pane:get_foreground_process_name():find("n?vim") ~= nil
	end

	local function conditionalActivatePane(window, pane, pane_direction, vim_direction)
		if isViProcess(pane) then
			window:perform_action(
				-- This should match the keybinds you set in Neovim.
				act.SendKey({ key = vim_direction, mods = "CTRL" }),
				pane
			)
		else
			window:perform_action(act.ActivatePaneDirection(pane_direction), pane)
		end
	end

	wezterm.on("ActivatePaneDirection-right", function(window, pane)
		conditionalActivatePane(window, pane, "Right", "l")
	end)
	wezterm.on("ActivatePaneDirection-left", function(window, pane)
		conditionalActivatePane(window, pane, "Left", "h")
	end)
	wezterm.on("ActivatePaneDirection-up", function(window, pane)
		conditionalActivatePane(window, pane, "Up", "k")
	end)
	wezterm.on("ActivatePaneDirection-down", function(window, pane)
		conditionalActivatePane(window, pane, "Down", "j")
	end)
end

return module
