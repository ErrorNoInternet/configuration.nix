return {
	"saecki/crates.nvim",
	dependencies = { "hrsh7th/nvim-cmp" },

	event = { "BufRead Cargo.toml" },
	opts = { completion = { cmp = { enabled = true } } },
}
