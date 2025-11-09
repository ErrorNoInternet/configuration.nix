return {
	"ziglang/zig.vim",

	ft = "zig",
	config = function(_, _)
		vim.g["zig_fmt_autosave"] = 0
	end,
}
