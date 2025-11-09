return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-context",
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	build = ":TSUpdate",

	lazy = false,
	config = function()
		vim.highlight.priorities.semantic_tokens = 99

		vim.keymap.set("n", "]]", function()
			local t = require("nvim-treesitter.ts_utils")
			t.goto_node(t.get_next_node(t.get_node_at_cursor(), true, true), false, true)
		end)
		vim.keymap.set("n", "[[", function()
			local t = require("nvim-treesitter.ts_utils")
			t.goto_node(t.get_previous_node(t.get_node_at_cursor(), true, true), false, true)
		end)

		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = {
				"asm",
				"c",
				"capnp",
				"cpp",
				"cuda",
				"glsl",
				"go",
				"haskell",
				"html",
				"hyprlang",
				"java",
				"javascript",
				"kdl",
				"lua",
				"markdown",
				"markdown_inline",
				"nim",
				"nix",
				"python",
				"query",
				"rasi",
				"rust",
				"toml",
				"vala",
				"vim",
				"vimdoc",
				"zig",
			},

			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },

			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "gnn",
					node_decremental = "grm",
					node_incremental = "grn",
					scope_incremental = "grc",
				},
			},
		})
	end,
}
