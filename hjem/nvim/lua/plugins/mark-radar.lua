return {
	"winston0410/mark-radar.nvim",

	keys = { "`", "'" },
	config = function()
		vim.api.nvim_set_hl(0, "RadarBackground", { fg = "#4C566A" })
		vim.api.nvim_set_hl(0, "RadarMark", { fg = "#D8DEE9" })
		require("mark-radar").setup()
	end,
}
