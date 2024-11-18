return {
	{
		"stevearc/oil.nvim",
		opts = {},
		config = function()
			require("oil").setup({
				columns = {
					"icon",
					"size",
				},
				delete_to_trash = true,
				prompt_save_on_select_new_entry = true,
				view_options = {
					show_hidden = true,
				}
			})

			vim.keymap.set("n", "<C-\\>", "<cmd>Oil<cr>")
		end,

		-- Optional dependencies
		dependencies = { { "nvim-tree/nvim-web-devicons", opts = {} } },
	},
}
