local M = {}

local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux

---@param opts { base_dirs: { path: string, max_depth: number? }[], rooters: string[]?}
local function Sessionizer(opts)
  local base_dirs = {}
  local rooters = opts.rooters or { ".git" }
end
