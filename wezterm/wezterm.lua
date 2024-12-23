local wezterm = require("wezterm")
local config = {}
config.default_cwd = "Users/kyungsubkim/Programming"
config.window_decorations = "RESIZE"
config.window_padding = {
	left   = 0,
	right  = 0,
	top    = 0,
	bottom = 0,
}

config.inactive_pane_hsb = {
  saturation = 0.9,
  brightness = 0.4,
}

config.background = {
	{
		source = {
			File = {
				path = "/Users/kyungsubkim/.config/wezterm/assets/bluegrad.jpg",
			},
		},
		hsb = {brightness = 0.06},
		height = "Cover", -- required
		width = "Cover", -- required
		repeat_x = "NoRepeat",
		repeat_y = "NoRepeat",
		vertical_align = "Middle",
		horizontal_align = "Center",
	},
}



config.font_size = 15.0
config.font = wezterm.font({
	family = "D2Coding",
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
})

wezterm.on("update-right-status", function(window, _)
	local name = window:active_key_table()
	if name then
		name = "TABLE: " .. name
	end
	window:set_right_status(name or "")
end)

config.leader = {
	key = "a",
	mods = "CTRL",
}


local act = wezterm.action
config.native_macos_fullscreen_mode = false

-- Activate pane direction
config.keys = {
  {
    key = 'LeftArrow',
    mods = 'CTRL|SHIFT',
    action = act.ActivatePaneDirection 'Left',
  },
  {
    key = 'RightArrow',
    mods = 'CTRL|SHIFT',
    action = act.ActivatePaneDirection 'Right',
  },
  {
    key = 'UpArrow',
    mods = 'CTRL|SHIFT',
    action = act.ActivatePaneDirection 'Up',
  },
  {
    key = 'DownArrow',
    mods = 'CTRL|SHIFT',
    action = act.ActivatePaneDirection 'Down',
  },
}

config.keys = {
	{
		key = 'f',
		mods = 'CMD | CTRL',
		action = wezterm.action.ToggleFullScreen,
	},
	{ key = 'Enter', mods = 'CTRL|SHIFT', action = wezterm.action.TogglePaneZoomState},
	{ key = 'UpArrow', mods = 'SHIFT', action = act.ScrollByLine(-1) },
	{ key = 'DownArrow', mods = 'SHIFT', action = act.ScrollByLine(1) },
	{ key = "x", mods = "CTRL|SHIFT", action = wezterm.action.ActivateCopyMode },
	{
		key = "K",
		mods = "CTRL|SHIFT",
		action = act.Multiple({
			act.ClearScrollback("ScrollbackAndViewport"),
			act.SendKey({ key = "L", mods = "CTRL" }),
		}),
	},
	{
		key = "r",
		mods = "LEADER",
		action = act.ActivateKeyTable({
			name = "resize_pane",
			one_shot = false,
		}),
	},
	{
		key = "s",
		mods = "LEADER",
		action = act.ActivateKeyTable({
			name = "split_pane",
			one_shot = true,
		}),
	},
  {
    key = '0',
    mods = 'CTRL',
    action = act.PaneSelect {
      mode = 'Activate',
    },
  },
  {
    key = 'w',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentPane { confirm = false},
  },
}

config.key_tables = {
	resize_pane = {
		{ key = "LeftArrow", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },

		{ key = "RightArrow", action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },

		{ key = "UpArrow", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },

		{ key = "DownArrow", action = act.AdjustPaneSize({ "Down", 1 }) },
		{ key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },

		-- Cancel the mode by pressing escape
		{ key = "Escape", action = "PopKeyTable" },
	},
	split_pane = {
		{
			key = "ㅍ",
			action = act.SplitVertical({
				domain = "CurrentPaneDomain"
			})
		},
		{
			key = "v",
			action = act.SplitVertical({
				domain = "CurrentPaneDomain"
			})
		},
		{
			key = "ㄴ",
			action = act.SplitHorizontal({
				domain = "CurrentPaneDomain"
			})
		},
		{
			key = "s",
			action = act.SplitHorizontal({
				domain = "CurrentPaneDomain"
			})
		},
		{ key = "Escape", action = "PopKeyTable" },
	},
}


config.color_scheme = 'rose-pine'


local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")
bar.apply_to_config(config, {
	modules = {
		spotify = {
			enabled = false,
		},
	}
})

config.tab_bar_at_bottom = false
config.show_new_tab_button_in_tab_bar = false
------------
-- TAB BAR
---
-- The filled in variant of the < symbol

return config
