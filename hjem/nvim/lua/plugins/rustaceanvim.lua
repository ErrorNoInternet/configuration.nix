return {
	"mrcjkb/rustaceanvim",

	ft = "rust",
	config = function()
		vim.g.rustaceanvim = {
			server = {
				status_notify_level = false,
				default_settings = {
					["rust-analyzer"] = {
						check = { command = "clippy" },
					},
				},
			},
		}
	end,
}
