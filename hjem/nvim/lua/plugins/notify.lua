return {
	"rcarriga/nvim-notify",

	lazy = false,
	opts = {
		background_colour = "#2e3440",
		stages = "slide",
		timeout = 3000,
	},
	config = function(_, opts)
		require("notify").setup(opts)
		vim.notify = require("notify")
	end,
}
