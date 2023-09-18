return {
	"nvim-lualine/lualine.nvim",
	event = "VimEnter",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"folke/tokyonight.nvim"
	},
	opts = {
		options = {
			theme = "tokyonight"
		}
	}
}
