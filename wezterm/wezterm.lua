local wezterm = require("wezterm")
local config = {}
config.window_decorations = "RESIZE"
config.window_padding = {
	left   = 0,
	right  = 0,
	top    = 0,
	bottom = 0,
}


config.inactive_pane_hsb = {
  saturation = 0.9,
  brightness = 0.8,
}

config.background = {
	{
		source = {
			File = {
				path = "/Users/kyungsubkim/.config/wezterm/assets/bluegrad.jpg",
			},
		},
		hsb = {brightness = 0.1},
		height = "Cover",
		width = "Cover",
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

config.keys = {
	{ key = "X", mods = "CTRL", action = wezterm.action.ActivateCopyMode },
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
			key = "v",
			action = act.SplitVertical({
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
return config
