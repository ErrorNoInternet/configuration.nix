return {
	"mrjones2014/smart-splits.nvim",

	keys = {
		{
			"<M-h>",
			"<cmd>lua require('smart-splits').resize_left(5)<cr>",
			silent = true,
		},
		{
			"<M-l>",
			"<cmd>lua require('smart-splits').resize_right(5)<cr>",
			silent = true,
		},
		{
			"<M-k>",
			"<cmd>lua require('smart-splits').resize_up(5)<cr>",
			silent = true,
		},
		{
			"<M-j>",
			"<cmd>lua require('smart-splits').resize_down(5)<cr>",
			silent = true,
		},
	},
}
