return {
	"mfussenegger/nvim-lint",

	keys = { { "<leader>l", "<cmd>lua require('lint').try_lint()<cr>", silent = true } },
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			fish = { "fish" },
			markdown = { "vale", "cspell" },
			python = { "ruff" },
			text = { "cspell" },
			yaml = { "yamllint" },
		}
		lint.linters.yamllint.args = { "-d", "relaxed", "--format", "parsable", "-" }
	end,
}
