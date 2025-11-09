return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		"gbprod/yanky.nvim",
	},

	cmd = { "Telescope" },
	keys = {
		{
			"<leader>fy",
			"<cmd>Telescope yank_history<CR>",
			silent = true,
		},
		{
			"<leader>fe",
			"<cmd>Telescope spell_suggest<CR>",
			silent = true,
		},
		{
			"<leader>ft",
			"<cmd>Telescope todo-comments<CR>",
			silent = true,
		},
		{
			"<leader>ff",
			"<cmd>Telescope find_files<CR>",
			silent = true,
		},
		{
			"<leader>fg",
			"<cmd>Telescope live_grep<CR>",
			silent = true,
		},
		{
			"<leader>fz",
			"<cmd>Telescope current_buffer_fuzzy_find<CR>",
			silent = true,
		},
		{
			"<leader>fb",
			"<cmd>Telescope buffers<CR>",
			silent = true,
		},
		{
			"<leader>fc",
			"<cmd>Telescope git_bcommits<CR>",
			silent = true,
		},
		{
			"<leader>fC",
			"<cmd>Telescope git_commits<CR>",
			silent = true,
		},
		{
			"gO",
			"<cmd>Telescope lsp_dynamic_workspace_symbols<CR>",
			silent = true,
		},
		{
			"<leader>fS",
			"<cmd>Telescope git_status<CR>",
			silent = true,
		},
	},
	opts = { defaults = { layout_strategy = "vertical" } },
	config = function(_, opts)
		local telescope = require("telescope")
		telescope.setup(opts)
		telescope.load_extension("ui-select")
		telescope.load_extension("yank_history")
	end,
}
