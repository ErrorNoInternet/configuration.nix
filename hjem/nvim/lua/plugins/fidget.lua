return {
	"j-hui/fidget.nvim",

	lazy = false,
	opts = {
		notification = { window = { winblend = 0 } },
		progress = {
			display = { group_style = "@string" },
			lsp = { progress_ringbuf_size = 1024 },
		},
	},
}
