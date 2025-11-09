return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",

	event = { "User FilePost" },
	opts = {
		indent = { char = "" },
		scope = {
			show_end = false,
			show_start = false,
		},
	},
	config = function(_, opts)
		vim.api.nvim_set_hl(0, "@ibl.indent.char.1", { fg = "#2E3440" })
		require("ibl").setup(opts)
	end,
}
