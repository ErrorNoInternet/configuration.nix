return {
	"fatih/vim-go",

    ft = "go",
	config = function()
		vim.g["go_fmt_autosave"] = 0
		vim.g["go_highlight_array_whitespace_error"] = 1
		vim.g["go_highlight_build_constraints"] = 1
		vim.g["go_highlight_chan_whitespace_error"] = 1
		vim.g["go_highlight_diagnostic_errors"] = 1
		vim.g["go_highlight_diagnostic_warnings"] = 1
		vim.g["go_highlight_extra_types"] = 1
		vim.g["go_highlight_fields"] = 1
		vim.g["go_highlight_format_strings"] = 1
		vim.g["go_highlight_function_calls"] = 1
		vim.g["go_highlight_function_parameters"] = 1
		vim.g["go_highlight_functions"] = 1
		vim.g["go_highlight_generate_tags"] = 1
		vim.g["go_highlight_operators"] = 1
		vim.g["go_highlight_space_tab_error"] = 1
		vim.g["go_highlight_string_spellcheck"] = 1
		vim.g["go_highlight_trailing_whitespace_error"] = 1
		vim.g["go_highlight_types"] = 1
		vim.g["go_highlight_variable_assignments"] = 1
		vim.g["go_highlight_variable_declarations"] = 1
	end,
}
