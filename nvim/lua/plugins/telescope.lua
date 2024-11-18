return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"benfowler/telescope-luasnip.nvim",
	},
	config = function()
		local builtin = require("telescope.builtin")
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		-- Clone the default Telescope configuration
		local vimgrep_arguments =
			{ "rg", "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" }
		--I want to search in hidden/dot files.
		table.insert(vimgrep_arguments, "--hidden")
		-- I don't want to search in the `.git` directory.
		table.insert(vimgrep_arguments, "--glob")
		table.insert(vimgrep_arguments, "!**/.git/*")
		table.insert(vimgrep_arguments, "--glob")
		table.insert(vimgrep_arguments, "!**/node_modules/*")
		table.insert(vimgrep_arguments, "--glob")
		table.insert(vimgrep_arguments, "!**/build/*")
		table.insert(vimgrep_arguments, "--glob")
		table.insert(vimgrep_arguments, "!Flutter/**/ios/*")
		table.insert(vimgrep_arguments, "--glob")
		table.insert(vimgrep_arguments, "!**/*.png")
		table.insert(vimgrep_arguments, "--glob")
		table.insert(vimgrep_arguments, "!**/.gradle/**")
		table.insert(vimgrep_arguments, "--glob")
		table.insert(vimgrep_arguments, "!**/.ccls-cache/**")
		table.insert(vimgrep_arguments, "--glob")
		table.insert(vimgrep_arguments, "!**/target/**")

		telescope.setup({
			defaults = {
				-- `hidden = true` is not supported in text grep commands.
				vimgrep_arguments = vimgrep_arguments,
			},
			pickers = {
				buffers = {
					mappings = {
						i = {
							["<c-d>"] = actions.delete_buffer + actions.move_to_top,
						},
					},
				},
				find_files = {
					-- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
					find_command = {
						"rg",
						"--files",
						"--hidden",
						"--glob",
						"!**/node_modules/*",
						"--glob",
						"!**/.git/*",
						"--glob",
						"!**/ios/*",
						"--glob",
						"!**/build/*",
						"--glob",
						"!**/android/*",
						"--glob",
						"!**/macos/*",
						"--glob",
						"!**/web/*",
						"--glob",
						"!**/windows/*",
						"--glob",
						"!**/linux/*",
						"--glob",
						"!**/.dart_tool/*",
						"--glob",
						"!**/*.png",
						"--glob",
						"!**/.gradle/**",
						"--glob",
						"!**/.ccls-cache/**",
						"--glob",
						"!**/target/**",
					},
				},
				oldfiles = {},
				live_grep = {
					find_files = {
						find_command = {
							"rg",
							"--files",
							"--hidden",
							"--glob",
							"!**/node_modules/*",
							"--glob",
							"!**/.git/*",
							"--glob",
							"!**/ios/*",
							"--glob",
							"!**/build/*",
							"--glob",
							"!**/android/*",
							"--glob",
							"!**/macos/*",
							"--glob",
							"!**/web/*",
							"--glob",
							"!**/windows/*",
							"--glob",
							"!**/linux/*",
							"--glob",
							"!**/.dart_tool/*",
							"--glob",
							"!**/*.png",
							"--glob",
							"!**/.gradle/**",
							"--glob",
							"!**/.ccls-cache/**",
							"--glob",
							"!**/target/**",
						},
					},
				},
			},
		})

		require("telescope").load_extension("luasnip")

		local keys = vim.keymap
		keys.set("n", "<leader>ff", builtin.find_files, {})
		keys.set("n", "<leader>fg", builtin.live_grep, {})
		keys.set("n", "<leader>fs", builtin.current_buffer_fuzzy_find, {}) -- search in current buffer
		keys.set("n", "<leader>ma", builtin.marks, {}) -- list marks
		keys.set("n", "<leader>oc", builtin.lsp_outgoing_calls, { noremap = true })
		keys.set("n", "<leader>ic", builtin.lsp_incoming_calls, { noremap = true })
		keys.set("n", "<leader>wd", builtin.diagnostics, { noremap = true })
		keys.set("n", "<leader>lg", builtin.live_grep,{noremap = true})
		keys.set("n", "<leader>nn", "<cmd>Telescope luasnip<cr>")
	end,
}
