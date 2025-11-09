return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-calc",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		"L3MON4D3/LuaSnip",
		"ray-x/cmp-treesitter",
		"saadparwaiz1/cmp_luasnip",
		"windwp/nvim-autopairs",
	},

	event = { "InsertEnter" },
	config = function()
		local cmp = require("cmp")

		local mapping = {
			["<C-down>"] = (cmp.mapping.scroll_docs(5)),
			["<C-e>"] = (cmp.mapping.abort()),
			["<C-up>"] = (cmp.mapping.scroll_docs(-5)),
			["<CR>"] = (cmp.mapping.confirm()),
			["<S-Tab>"] = (cmp.mapping.select_prev_item()),
			["<Tab>"] = (cmp.mapping.select_next_item()),
		}

		cmp.setup({
			mapping = cmp.mapping.preset.insert(mapping),
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			sources = {
				{ name = "buffer" },
				{ name = "calc" },
				{ name = "crates" },
				{ name = "luasnip" },
				{ name = "nvim_lsp" },
				{ name = "path" },
				{ name = "treesitter" },
			},
		})

		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "cmdline" },
				{ name = "path" },
			},
		})

		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}
