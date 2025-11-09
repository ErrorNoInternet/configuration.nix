return {
	"L3MON4D3/LuaSnip",
	dependencies = { "rafamadriz/friendly-snippets" },
	build = "make install_jsregexp",

	lazy = true,
	config = function()
		require("luasnip").config.set_config({})
		require("luasnip.loaders.from_vscode").lazy_load({})
	end,
}
