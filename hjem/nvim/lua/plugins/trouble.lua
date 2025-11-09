return {
	"folke/trouble.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-tree/nvim-web-devicons",
	},

	opts = {
		warn_no_results = false,
		open_no_results = true,
	},
	cmd = { "Trouble" },
	keys = {
		{
			"<leader>xD",
			"<cmd>Trouble toggle<cr>",
			silent = true,
		},
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics<cr>",
			silent = true,
		},
		{
			"gd",
			"<cmd>Trouble lsp_definitions<cr>",
			silent = true,
		},
		{
			"grr",
			"<cmd>Trouble lsp_references<cr>",
			silent = true,
		},
		{
			"gri",
			"<cmd>Trouble lsp_implementations<cr>",
			silent = true,
		},
		{
			"gD",
			"<cmd>Trouble lsp_type_definitions<cr>",
			silent = true,
		},
		{
			"<leader>xq",
			"<cmd>Trouble quickfix<cr>",
			silent = true,
		},
	},
	config = true,
}
