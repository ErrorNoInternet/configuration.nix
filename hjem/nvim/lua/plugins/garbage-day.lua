return {
	"zeioth/garbage-day.nvim",
	dependencies = "neovim/nvim-lspconfig",
	event = "VeryLazy",
	opts = {
		grace_period = 12 * 60 * 60,
		wakeup_delay = 1000,
	},
}
