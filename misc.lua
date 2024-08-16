local module = {}

function module.apply_to_config(config)
	config.automatically_reload_config = true
  config.front_end = "WebGpu"
  config.scrollback_lines = 10000
  config.animation_fps = 60
end

return module
