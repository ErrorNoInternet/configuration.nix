return {
	"nvimdev/lspsaga.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},

	lazy = false,
	opts = {
		beacon = { enable = false },
		lightbulb = { enable = false },
		symbol_in_winbar = { enable = false },
		ui = { code_action = " " },
	},
	config = function(_, opts)
		require("lspsaga").setup(opts)

		local highlights = {
			RenameNormal = { bg = "#2E3440" },
			SagaButton = { fg = "#81A1C1", bg = "#81A1C1" },
			SagaVirtLine = { fg = "#4C566A" },
		}
		for k, v in pairs(highlights) do
			vim.api.nvim_set_hl(0, k, v)
		end
	end,
}
