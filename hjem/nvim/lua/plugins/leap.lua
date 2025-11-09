return {
	"ggandor/leap.nvim",

	keys = { "s", "S" },
	config = function()
		local leap = require("leap")
		leap.add_default_mappings()
		leap.opts = vim.tbl_deep_extend("keep", {}, leap.opts)
	end,
}
