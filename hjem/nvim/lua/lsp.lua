local lspServers = {
	{
		name = "lua_ls",
		extraOptions = {
			settings = {
				Lua = {
					diagnostics = { globals = { "vim" } },
					runtime = { version = "LuaJIT" },
					telemetry = { enable = false },
					workspace = {
						checkThirdParty = false,
						library = { vim.api.nvim_get_runtime_file("", true) },
					},
				},
			},
		},
	},

	{
		name = "qmlls",
		extraOptions = { cmd = { "qmlls", "-E" } },
	},

	{
		name = "taplo",
		extraOptions = { root_dir = require("lspconfig.util").root_pattern("*.toml", ".git") },
	},

	{ name = "asm_lsp" },
	{ name = "bashls" },
	{ name = "clangd" },
	{ name = "cssls" },
	{ name = "gopls" },
	{ name = "html" },
	{ name = "jsonls" },
	{ name = "pyright" },
	{ name = "yamlls" },
	{ name = "zls" },
}

local function getCaps()
	local caps = vim.lsp.protocol.make_client_capabilities()
	caps = vim.tbl_deep_extend("force", caps, require("cmp_nvim_lsp").default_capabilities())
	caps.textDocument.foldingRange = {
		dynamicRegistration = false,
		lineFoldingOnly = true,
	}
	return caps
end
local setup = {
	on_attach = function(_, _) end,
	capabilities = getCaps(),
}
for _, server in ipairs(lspServers) do
	if type(server) == "string" then
		require("lspconfig")[server].setup(setup)
	else
		local options = server.extraOptions
		if options == nil then
			options = setup
		else
			options = vim.tbl_extend("keep", options, setup)
		end
		require("lspconfig")[server.name].setup(options)
	end
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	update_in_insert = true,
})
vim.diagnostic.config({
	virtual_text = true,
})
