return {
	"RaafatTurki/hex.nvim",

	cmd = { "HexDump", "HexAssemble", "HexToggle" },
	config = function()
		require("hex").setup()
	end,
}
