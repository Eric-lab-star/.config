return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
		"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
	},
	opts = {},
	version = "^1.0.0",
	config = function ()
		require('barbar').setup({
			icons = {
				preset = "slanted"
			}
		});
		vim.keymap.set("n","<c-h>","<cmd>BufferPrevious<cr>")
		vim.keymap.set("n","<C-l>", "<cmd>BufferNext<CR>")
		vim.keymap.set("n","<C-c>", "<Cmd>BufferClose<CR>")
		vim.keymap.set("n","<M-1>", "<cmd>BufferCloseAllButCurrent<cr>")
	end,
}

