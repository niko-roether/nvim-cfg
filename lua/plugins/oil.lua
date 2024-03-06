local hidden_files = { ".git" };

return {
	"stevearc/oil.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons"
	},
	opts = {
		default_file_explorer = true,
		skip_confirm_for_simple_edits = true,
		experimental_watch_for_changes = true
	},
	is_hidden_file = function(name)
		return vim.tbl_contains(hidden_files, name)
	end
}
