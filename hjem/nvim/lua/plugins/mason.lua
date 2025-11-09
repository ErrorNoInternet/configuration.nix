return {
	"williamboman/mason.nvim",

	lazy = false,
	config = function()
		local highlights = {
			MasonHeader = { bg = "#D08770" },
			MasonHeaderHighlightBlockBoldSecondary = { bg = "#D08770" },
			MasonHeaderHighlightBlockSecondary = { bg = "#D08770" },
			MasonHeaderSecondary = { bg = "#81A1C1" },
			MasonHighlight = { fg = "#81A1C1" },
			MasonHighlightBlock = { bg = "#81A1C1" },
			MasonHighlightBlockBold = { bg = "#81A1C1" },
			MasonHighlightSecondary = { fg = "#D08770" },
			MasonMuted = { fg = "#4C566A" },
			MasonMutedBlock = { bg = "#4C566A" },
			MasonMutedBlockBold = { bg = "#3B4252" },
		}
		for k, v in pairs(highlights) do
			vim.api.nvim_set_hl(0, k, v)
		end

		require("mason").setup()

		local registry = require("mason-registry")
		vim.api.nvim_create_user_command("MasonInstallAll", function()
			for _, pkg_name in ipairs({
				"alejandra",
				"ansible-language-server",
				"ansible-lint",
				"asm-lsp",
				"asmfmt",
				"bash-language-server",
				"cspell",
				"css-lsp",
				"deno",
				"gopls",
				"html-lsp",
				"json-lsp",
				"lua-language-server",
				"prettier",
				"pyright",
				"qmlls",
				"ruff",
				"shfmt",
				"stylua",
				"taplo",
				"vale",
				"yaml-language-server",
				"yamllint",
				"zls",
			}) do
				local pkg = registry.get_package(pkg_name)
				if not pkg:is_installed() then
					vim.cmd("MasonInstall " .. pkg_name)
				end
			end
		end, {})
	end,
}
