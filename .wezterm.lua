local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'GruvboxDarkHard'
-- config.color_scheme = 'Gruvbox Dark (Gogh)'
-- config.color_scheme = 'Kanagawa Dragon (Gogh)'

config.font = wezterm.font {
  family = 'Fira Code Nerd Font',
  harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
}

local act = wezterm.action

-- config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 2000 }
config.keys = {
  {
    key = 'w',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  {
    key = '\\',
    mods = 'ALT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = '-',
    mods = 'ALT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'h',
    mods = 'ALT',
    action = act.ActivatePaneDirection 'Left',
  },
  {
    key = 'l',
    mods = 'ALT',
    action = act.ActivatePaneDirection 'Right',
  },
  {
    key = 'k',
    mods = 'ALT',
    action = act.ActivatePaneDirection 'Up',
  },
  {
    key = 'j',
    mods = 'ALT',
    action = act.ActivatePaneDirection 'Down',
  },

  { key = "1", mods = "ALT", action = wezterm.action.ActivateTab(0) },
  { key = "2", mods = "ALT", action = wezterm.action.ActivateTab(1) },
  { key = "3", mods = "ALT", action = wezterm.action.ActivateTab(2) },
  { key = "4", mods = "ALT", action = wezterm.action.ActivateTab(3) },
  { key = "5", mods = "ALT", action = wezterm.action.ActivateTab(4) },
  { key = "6", mods = "ALT", action = wezterm.action.ActivateTab(5) },
  { key = "7", mods = "ALT", action = wezterm.action.ActivateTab(6) },
  { key = "8", mods = "ALT", action = wezterm.action.ActivateTab(7) },
  { key = "9", mods = "ALT", action = wezterm.action.ActivateTab(-1) },
}

-- config.front_end = "WebGpu"
config.enable_wayland = false
return config
