local wezterm = require("wezterm")
local background = require("background")
local font = require("font")
local appearance = require("appearance")
local misc = require("misc")
local keybinds = require("keybinds")
local scripts = require("scripts")

local config = wezterm.config_builder()

background.apply_to_config(config)
font.apply_to_config(config)
appearance.apply_to_config(config)
misc.apply_to_config(config)
keybinds.apply_to_config(config)
scripts.apply_wezterm_listeners(wezterm)

return config
