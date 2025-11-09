vim.filetype.add({
	pattern = {
		[".*/.*.rasi"] = "rasi",
		[".*/.irssi/config"] = "conf",
		[".*/hypr/.*.conf"] = "hyprlang",
		[".*/mutt/account_.*"] = "muttrc",
	},
})

local autocommands = {
	{
		event = { "FileType" },
		pattern = { "nix" },
		command = "setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab",
	},
	{
		event = { "FileType" },
		pattern = { "toml" },
		command = "setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab",
	},
}

for _, autocmd in ipairs(autocommands) do
	vim.api.nvim_create_autocmd(autocmd.event, {
		group = autocmd.group,
		pattern = autocmd.pattern,
		buffer = autocmd.buffer,
		desc = autocmd.desc,
		callback = autocmd.callback,
		command = autocmd.command,
		once = autocmd.once,
		nested = autocmd.nested,
	})
end
