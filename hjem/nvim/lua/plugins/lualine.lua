return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	lazy = false,
	opts = {
		options = {
			component_separators = { left = "|", right = "|" },
			icons_enabled = true,
			section_separators = { left = "", right = "" },
		},
		sections = { lualine_c = { "filename", "navic" } },
	},
}
