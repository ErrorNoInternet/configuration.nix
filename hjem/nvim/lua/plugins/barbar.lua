return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim",
		"nvim-tree/nvim-web-devicons",
	},

	lazy = false,
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	opts = {
		icons = { button = false },
		maximum_padding = 3,
		minimum_padding = 1,
	},
}
