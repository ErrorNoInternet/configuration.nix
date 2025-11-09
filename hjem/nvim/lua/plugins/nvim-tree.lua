vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

return {
	"nvim-tree/nvim-tree.lua",

	lazy = false,
	keys = {
		{
			"<C-l>",
			"<cmd>NvimTreeToggle<CR>",
			silent = true,
			mode = { "i", "n", "v", "t" },
		},
		{
			"<leader>L",
			"<cmd>NvimTreeFocus<CR>",
			silent = true,
		},
		{
			"<leader>n",
			"<cmd>NvimTreeFindFile<CR>",
			silent = true,
		},
	},
	opts = {
		diagnostics = { enable = true, show_on_dirs = true },
		renderer = { icons = { diagnostics_placement = "before" } },
		view = { width = 32, signcolumn = "no" },
	},
	config = function(_, opts)
		local highlights = {
			NvimTreeCursorLine = { bg = "#4C566A" },
			NvimTreeNormal = { bg = "#3B4252" },
			NvimTreeTitleBar = { bg = "#4C566A" },
			NvimTreeWindowPicker = { bg = "#81A1C1", fg = "#2E3440" },
		}
		for k, v in pairs(highlights) do
			vim.api.nvim_set_hl(0, k, v)
		end

		require("nvim-tree").setup(opts)
	end,
}
