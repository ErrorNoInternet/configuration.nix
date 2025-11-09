local filetype_cmds = {
	asm = { F10 = 'gcc -nostdlib "%" -o %:t:r && ./%:t:r' },
	c = {
		F8 = 'clang -O3 -std=c23 -g -lm "%" -o %:t:r && ./%:t:r',
		F9 = 'clang -std=c23 -g -lm "%" -o %:t:r && ./%:t:r',
		F10 = "make",
		F11 = 'clang -std=c23 -g -lm "%" -o %:t:r',
	},
	cpp = {
		F8 = 'clang++ -O3 -std=c++23 -g -lm "%" -o %:t:r && ./%:t:r',
		F9 = 'clang++ -std=c++23 -g -lm "%" -o %:t:r && ./%:t:r',
		F10 = "make",
		F11 = 'clang++ -std=c++23 -g -lm "%" -o %:t:r',
	},
	cs = { F10 = 'mcs "%" -out:%:t:r && ./%:t:r' },
	cuda = {
		F10 = 'nvcc "%" -o %:t:r && ./%:t:r',
		F11 = 'nvcc "%" -o %:t:r',
	},
	fish = { F10 = 'fish "%"' },
	go = {
		F10 = "go run .",
		F9 = "go run %",
	},
	haskell = { F10 = "runghc %" },
	java = { F10 = "java %" },
	javascript = { F10 = "node %" },
	lua = { F10 = "lua %" },
	n = {
		F10 = "nix eval -f %",
	},
	python = {
		F10 = "python3 %",
		F8 = "pypy3 %",
	},
	rust = {
		F8 = "cd %:p:h:h && cargo run --release",
		F9 = 'rustc -g "%" && ./%:t:r',
		F10 = "cd %:p:h:h && cargo run",
		F11 = "cd %:p:h:h && cargo build",
	},
	sh = { F10 = "sh %" },
	zig = {
		F8 = "cd %:p:h:h && zig build run -Doptimize=ReleaseFast",
		F9 = 'zig build-exe "%" && ./%:t:r',
		F10 = "cd %:p:h:h && zig build run",
		F11 = "cd %:p:h:h && zig build",
	},
}

local opts = {
	buffer = true,
	silent = true,
}

for ft, filetype_cmd in pairs(filetype_cmds) do
	vim.api.nvim_create_autocmd("FileType", {
		pattern = ft,
		callback = function()
			for key, cmd in pairs(filetype_cmd) do
				vim.keymap.set("n", "<" .. key .. ">", ":wa<CR>:term " .. cmd .. "<CR>", opts)
				vim.keymap.set({ "i", "v" }, "<" .. key .. ">", "<esc>:wa<CR>:term " .. cmd .. "<CR>", opts)
			end
		end,
	})
end
