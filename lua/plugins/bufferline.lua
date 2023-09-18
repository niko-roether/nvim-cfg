local hidden_filetypes = { "oil" }

return {
	"akinsho/bufferline.nvim",
	event = "VimEnter",
	version = "*",
	opts = {
		options = {
			custom_filter = function(bufnr)
				local filetype = vim.bo[bufnr].filetype
				if vim.tbl_contains(hidden_filetypes, filetype) then
					return false
				end
				return true
			end
		}
	},
	dependencies = {
		"nvim-tree/nvim-web-devicons"
	}
}
