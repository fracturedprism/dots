local wezterm = require 'wezterm'

return {
	font = wezterm.font{
		family = 'Cascadia Code PL',
		harfbuzz_features = {
			'calt', 'ss01',
		},
		-- family = 'Victor Mono'
	},
	font_size = 14.0,
	-- color_scheme = "tokyonight",
	-- color_scheme = "rose-pine",
	-- color_scheme = "rose-pine-moon",
	color_scheme = "rose-pine-dawn",
	-- color_scheme = "Rosé Pine (base16)",
	initial_cols = 94,
	initial_rows = 22,
	window_decorations = "RESIZE",
	-- use_fancy_tab_bar = false,
	-- colors = {
		-- tab_bar = {
			-- background = '#232136',
		-- }
	-- },
	-- default_prog = { '/bin/zsh', '-l -c tmux' },
}
