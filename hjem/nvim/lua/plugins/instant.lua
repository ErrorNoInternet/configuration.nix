return {
	"jbyuki/instant.nvim",

	cmd = {
		"InstantFollow",
		"InstantJoinSession",
		"InstantJoinSingle",
		"InstantMark",
		"InstantMarkClear",
		"InstantOpenAll",
		"InstantSaveAll",
		"InstantStartServer",
		"InstantStartSession",
		"InstantStartSingle",
		"InstantStatus",
		"InstantStop",
		"InstantStopFollow",
		"InstantStopServer",
	},
	config = function()
		vim.g.instant_username = "ErrorNoInternet"
        vim.g.instant_name_hl_group_default = "LineNr"
        vim.g.instant_name_hl_group_user1 = "LineNr"
        vim.g.instant_name_hl_group_user2 = "LineNr"
        vim.g.instant_name_hl_group_user3 = "LineNr"
        vim.g.instant_name_hl_group_user4 = "LineNr"
	end,
}
