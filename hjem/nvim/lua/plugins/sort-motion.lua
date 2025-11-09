return {
	"christoomey/vim-sort-motion",
	dependencies = {
		"kana/vim-textobj-user",
		"kana/vim-textobj-indent",
	},

	keys = { "gs" },
	config = function()
		vim.g["sort_motion_flags"] = "i"
	end,
}
