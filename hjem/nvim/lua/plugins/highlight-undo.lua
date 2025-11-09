return {
	"tzachar/highlight-undo.nvim",

	keys = { "u", "<C-r>" },
	config = function()
		vim.api.nvim_set_hl(0, "HighlightRedo", { bg = "#4C566A", fg = "none" })
		vim.api.nvim_set_hl(0, "HighlightUndo", { bg = "#4C566A", fg = "none" })
		require("highlight-undo").setup()
	end,
}
