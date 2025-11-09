return {
	"folke/lazydev.nvim",
	ft = "lua",
	opts = {
		library = {
			"${3rd}/luv/library",
			"LazyVim",
		},
		enabled = function(root_dir)
			return not (vim.g.lazydev_enabled == false) and vim.uv.fs_stat(root_dir .. "/init.lua")
		end,
	},
}
