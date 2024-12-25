local wezterm                                     = require('wezterm')
local config                                      = wezterm.config_builder()
local opacity                                     = 0.96
local features                                    = require('theme-switch')

-- Font
config.font                                       = wezterm.font_with_fallback({
	{ family = 'JetBrainsMonoNL Nerd Font Mono' },
	"Segoe UI Emoji",
})
config.font_size                                  = 12
config.line_height                                = 1.2

-- Window
config.initial_rows                               = 24
config.initial_cols                               = 100
config.window_decorations                         = "RESIZE"
config.window_background_opacity                  = opacity
config.window_close_confirmation                  = "NeverPrompt"
config.win32_system_backdrop                      = "Acrylic"
config.max_fps                                    = 60
config.animation_fps                              = 60
config.cursor_blink_rate                          = 250
config.default_cursor_style                       = 'BlinkingBar'
config.adjust_window_size_when_changing_font_size = false

-- Colors
config.color_scheme                               = "rose-pine-moon"
config.force_reverse_video_cursor                 = true

-- Tabs
config.enable_tab_bar                             = true
config.hide_tab_bar_if_only_one_tab               = false
config.show_tab_index_in_tab_bar                  = true
config.tab_bar_at_bottom                          = true
config.tab_and_split_indices_are_zero_based       = false
config.use_fancy_tab_bar                          = false


config.keys = {
	{
		key = 't',
		mods = 'LEADER',
		action = wezterm.action_callback(function(window, pane)
			features.theme_switcher(window, pane)
		end)
	},
}

wezterm.on('update-right-status', function(window, _)
	local SOLID_LEFT_ARROW = ''
	local ARROW_FOREGROUND = { Foreground = { Color = "#c6a0f6" } }
	local prefix = ""

	if window:leader_is_active() then
		prefix = " " .. utf8.char(0x1f30a)
		SOLID_LEFT_ARROW = utf8.char(0xe0b2)
	end

	if window:active_tab():tab_id() ~= 0 then
		ARROW_FOREGROUND = { Foreground = { Color = '#1e2030' } }
	end

	window:set_left_status(wezterm.format {
		{ Background = { Color = '#b7bdf8' } },
		{ Text = prefix },
		ARROW_FOREGROUND,
		{ Text = SOLID_LEFT_ARROW }
	})
end)

wezterm.on('user-var-changed', function(window, pane, name, value)
	local overrides = window:get_config_overrides() or {}
	if name == "ZEN_MODE" then
		local incremental = value:find("+")
		local number_value = tonumber(value)
		if incremental ~= nil then
			while (number_value > 0) do
				window:perform_action(wezterm.action.IncreaseFontSize, pane)
				number_value = number_value - 1
			end
			overrides.enable_tab_bar = false
		elseif number_value < 0 then
			window:perform_action(wezterm.action.ResetFontSize, pane)
			overrides.font_size = nil
			overrides.enable_tab_bar = true
		else
			overrides.font_size = number_value
			overrides.enable_tab_bar = false
		end
	end
	window:set_config_overrides(overrides)
end)

-- Plugins

local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
tabline.setup({
	options = {
		icons_enabled = true,
		theme = 'rose-pine-moon',
		color_overrides = {},
		section_separators = {
			left = wezterm.nerdfonts.pl_left_hard_divider,
			right = wezterm.nerdfonts.pl_right_hard_divider,
		},
		component_separators = {
			left = wezterm.nerdfonts.pl_left_soft_divider,
			right = wezterm.nerdfonts.pl_right_soft_divider,
		},
		tab_separators = {
			left = wezterm.nerdfonts.pl_left_hard_divider,
			right = wezterm.nerdfonts.pl_right_hard_divider,
		},
	},
	sections = {
		tabline_a = {},
		tabline_b = {},
		tabline_c = {},
		tab_active = {
			'[',
			'index',
			']',
			{ 'cwd',     padding = { left = 1, right = 1 } },
			{ 'process', padding = { left = 0, right = 1 } },
		},
		tab_inactive = {
			'[',
			'index',
			']',
			{ 'process', padding = { left = 1, right = 1 } },
		},
		tabline_x = { 'ram', 'cpu' },
		tabline_y = {},
		tabline_z = {},
	},
	extensions = {},
})

tabline.apply_to_config(config)

return config
