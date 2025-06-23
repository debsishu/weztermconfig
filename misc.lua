local module = {}

function module.apply_to_config(config)
	config.automatically_reload_config = true
  config.front_end = "WebGpu"
  config.webgpu_power_preference = "HighPerformance"
  config.scrollback_lines = 10000
  config.animation_fps = 120
  config.max_fps = 120
end

return module
