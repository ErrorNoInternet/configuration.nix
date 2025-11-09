local autocommands = {
	{ command = "set number", event = { "TermOpen" }, pattern = { "*" } },
	{ command = "startinsert", event = { "TermOpen" }, pattern = { "*" } },
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
