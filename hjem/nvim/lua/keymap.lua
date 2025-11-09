local map = {
	{ action = "<cmd>BufferClose<CR>", key = "<C-w><C-w>", mode = "n", options = { silent = true } },
	{ action = "<cmd>BufferMoveNext<CR>", key = "<M-n>", mode = "n", options = { silent = true } },
	{ action = "<cmd>BufferMovePrevious<CR>", key = "<M-p>", mode = "n", options = { silent = true } },
	{ action = "<cmd>BufferNext<CR>", key = "<C-n>", mode = "n", options = { silent = true } },
	{ action = "<cmd>BufferPick<CR>", key = "<leader>b", mode = "n", options = { silent = true } },
	{ action = "<cmd>BufferPrevious<CR>", key = "<C-p>", mode = "n", options = { silent = true } },
	{ action = '"_dP', key = "<leader>p", mode = "v" },
	{ action = "gj", key = "j", mode = "" },
	{ action = "gk", key = "k", mode = "" },
	{ action = ":m .+1<CR>==", key = "<C-j>", mode = "n", options = { silent = true } },
	{ action = ":m .-2<CR>==", key = "<C-k>", mode = "n", options = { silent = true } },
	{ action = "<esc>:m .+1<CR>==gi", key = "<C-j>", mode = "i", options = { silent = true } },
	{ action = "<esc>:m .-2<CR>==gi", key = "<C-k>", mode = "i", options = { silent = true } },
	{ action = ":m '>+1<CR>gv=gv", key = "<C-j>", mode = "v", options = { silent = true } },
	{ action = ":m '<-2<CR>gv=gv", key = "<C-k>", mode = "v", options = { silent = true } },
	{ action = "<Plug>SortMotion", key = "gs", mode = "n" },
	{ action = "<Plug>SortMotionVisual", key = "gs", mode = "x" },
	{ action = "<Plug>SortLines", key = "gss", mode = "n" },
	{ action = "<esc>dbi<del>", key = "<C-h>", mode = "i", options = { remap = true } },
	{ action = "dbi<del>", key = "<C-h>", mode = "n", options = { remap = true } },
	{ action = "<esc><right>wdbi", key = "<C-Del>", mode = "i", options = { remap = true } },
	{ action = "wdbi", key = "<C-Del>", mode = "n", options = { remap = true } },
	{ action = "<esc><cmd>w<CR>", key = "<F1>", mode = "i", options = { remap = true, silent = true } },
	{ action = "<cmd>w<CR>", key = "<F1>", mode = "n", options = { remap = true, silent = true } },
	{ action = "<esc><cmd>w<CR>", key = "<C-S>", mode = "i", options = { silent = true } },
	{ action = "<cmd>w<CR>", key = "<C-S>", mode = "n", options = { silent = true } },
	{ action = "<cmd>BufferNext<CR>", key = "gt", mode = "n", options = { silent = true } },
	{ action = "<cmd>BufferPrevious<CR>", key = "gT", mode = "n", options = { silent = true } },
	{ action = "<cmd>Start<CR>", key = "<F10>", mode = "n", options = { silent = true } },
	{ action = "<esc><cmd>Start<CR>", key = "<F10>", mode = "i", options = { silent = true } },
	{
		action = "<cmd>UndotreeToggle<CR><cmd>UndotreeFocus<CR>",
		key = "<leader>u",
		mode = "n",
		options = { silent = true },
	},
	{ action = "<esc><cmd>nohl<CR>i<right>", key = "<M-u>", mode = "i", options = { silent = true } },
	{ action = "<cmd>nohl<CR>", key = "<M-u>", mode = "n", options = { silent = true } },
	{ action = "<esc><cmd>nohl<CR>i<right>", key = "<F4>", mode = "i", options = { silent = true } },
	{ action = "<cmd>nohl<CR>", key = "<F4>", mode = "n", options = { silent = true } },
	{ action = "<cmd>BufferGoto 1<CR>", key = "<leader>1", mode = "n", options = { silent = true } },
	{ action = "<cmd>BufferGoto 2<CR>", key = "<leader>2", mode = "n", options = { silent = true } },
	{ action = "<cmd>BufferGoto 3<CR>", key = "<leader>3", mode = "n", options = { silent = true } },
	{ action = "<cmd>BufferGoto 4<CR>", key = "<leader>4", mode = "n", options = { silent = true } },
	{ action = "<cmd>BufferGoto 5<CR>", key = "<leader>5", mode = "n", options = { silent = true } },
	{ action = "<cmd>BufferGoto 6<CR>", key = "<leader>6", mode = "n", options = { silent = true } },
	{ action = "<cmd>BufferGoto 7<CR>", key = "<leader>7", mode = "n", options = { silent = true } },
	{ action = "<cmd>BufferGoto 8<CR>", key = "<leader>8", mode = "n", options = { silent = true } },
	{ action = "<cmd>BufferGoto 9<CR>", key = "<leader>9", mode = "n", options = { silent = true } },
	{ action = "<C-z>", key = "<Tab>", mode = "c" },
	{
		action = function()
			require("luasnip").jump(1)
		end,
		key = "<Tab>",
		mode = "s",
	},
	{
		action = function()
			return require("luasnip").expand_or_jumpable() and "<Plug>luasnip-expand-or-jump" or "<Tab>"
		end,
		key = "<Tab>",
		mode = "i",
		options = { expr = true, silent = true },
	},
	{
		action = function()
			require("luasnip").jump(-1)
		end,
		key = "<S-Tab>",
		mode = "s",
	},
	{
		action = function()
			require("luasnip").jump(-1)
		end,
		key = "<S-Tab>",
		mode = "i",
	},
	{ action = "<Plug>luasnip-next-choice", key = "<C-t>", mode = "i" },
	{
		action = function()
			vim.diagnostic.reset(nil, 0)
		end,
		key = "<leader>D",
		mode = "n",
	},
	{
		action = function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
		end,
		key = "<leader>h",
		mode = "n",
	},
	{
		action = function()
			vim.diagnostic.config({ virtual_lines = not vim.diagnostic.config().virtual_lines })
		end,
		key = "gK",
		mode = "n",
	},
	{
		action = function()
			if not require("ufo").peekFoldedLinesUnderCursor() then
				vim.lsp.buf.hover({ border = "single" })
			end
		end,
		mode = "n",
		key = "K",
	},
	{
		action = function()
			vim.diagnostic.open_float({ border = "single" })
		end,
		mode = "n",
		key = "<leader>K",
	},
	{ action = "<cmd>Lspsaga outline<CR>", key = "<leader>o", mode = "n", options = { silent = true } },
	{
		action = "<cmd>Lspsaga peek_definition<CR>",
		key = "<leader>pd",
		mode = "n",
		options = { silent = true },
	},
	{ action = "<cmd>Lspsaga finder<CR>", key = "<leader>pD", mode = "n", options = { silent = true } },
	{ action = "<cmd>Lspsaga rename<CR>", key = "grn", mode = "n", options = { silent = true } },
	{ action = "<cmd>Lspsaga code_action<CR>", key = "gra", mode = "n", options = { silent = true } },
	{ action = "<cmd>Lspsaga code_action<CR>", key = "gra", mode = "v", options = { silent = true } },
	{
		action = "<cmd>Lspsaga incoming_calls<CR>",
		key = "<leader>ci",
		mode = "n",
		options = { silent = true },
	},
	{
		action = "<cmd>Lspsaga outgoing_calls<CR>",
		key = "<leader>co",
		mode = "n",
		options = { silent = true },
	},
	{
		action = "<cmd>lua require('crates').show_popup()<CR>",
		key = "<leader>ca",
		mode = "n",
		options = { silent = true },
	},
	{ action = "<cmd>TSContextToggle<CR>", key = "<leader>tc", mode = "n", options = { silent = true } },
}

for _, mapping in ipairs(map) do
	vim.keymap.set(mapping.mode, mapping.key, mapping.action, mapping.options)
end
