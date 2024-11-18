-- lazy.nvim
return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {},
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		"rcarriga/nvim-notify",
	},
	config = function()
		require("noice").setup({
			messages = {
				enabled = true,
			},
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
				},
			},

			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
    	},

			routes = {
				{
					filter = {
						event = "msg_show",
						kind = "",
						find = ".*",
					},
					opts = { skip = true },
				},
				{
					filter = {
						event = "msg_show",
						kind = "",
						find = "written",
					},
					opts = { skip = true },
				},
			},

		})

		vim.keymap.set("n", "<leader>nd", function()
			require("noice").cmd("dismiss")
		end)

		vim.keymap.set("n", "<leader>nh", function()
			require("noice").cmd("history")
		end)
	end,
}
