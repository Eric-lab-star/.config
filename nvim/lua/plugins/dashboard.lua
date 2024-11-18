local header = {
"",
".------------------------------------------------------------------------.",
"|                                                                        |",
"|    ███████████              █████                                      |",
"|   ░░███░░░░░███            ░░███                                       |",
"|    ░███    ░███  ██████     ░███         ██████  ██████████████ ████   |",
"|    ░██████████  ███░░███    ░███        ░░░░░███░█░░░░███░░███ ░███    |",
"|    ░███░░░░░███░███████     ░███         ███████░   ███░  ░███ ░███    |",
"|    ░███    ░███░███░░░      ░███      █ ███░░███  ███░   █░███ ░███    |",
"|    ███████████ ░░██████     ███████████░░█████████████████░░███████    |",
"|   ░░░░░░░░░░░   ░░░░░░     ░░░░░░░░░░░  ░░░░░░░░░░░░░░░░░  ░░░░░███    |",
"|                                                            ███ ░███    |",
"|                                                           ░░██████     |",
"|                                                            ░░░░░░      |",
"|                                                                        |",
"'------------------------------------------------------------------------'",
"",
}


return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
	config = function()
    require('dashboard').setup {
			theme = 'doom',
			config = {
				header = header,
				center = {
					{
						icon ='󰈙  ',
						desc = 'Reload Last Session',
						key = 'a',
						key_format = ' [%s]',
						action = 'require("persistence").load()',
					},
					{
						icon = '  ',
						desc = 'Update Plugins',
						key = 'u',
						key_format= ' [%s]',
						action = 'Lazy update',
					},
					{
						icon = '  ',
						desc = 'Search Projects',
						key = 'v',
						key_format = ' [%s]',
						action = 'Telescope mypro',
					}
				},
				footer = {
				}
			},
    }

		vim.api.nvim_set_hl(
			0,
			'DashboardHeader',
			{ fg = '#f08424', bg = 'NONE', bold = true }
		)

		vim.api.nvim_set_hl(
			0,
			'RedCenter',
			{ fg = '#c831a8', bg = 'NONE', bold = true }
		)
		vim.keymap.set(
			'n',
			'<Leader>ds',
			':Dashboard<CR>',
			{ noremap = true, silent = true }
		)
	end,
	opts = {},
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
}
