return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = function()
		vim.cmd.TSUpdate()
	end,
	opts = {
		auto_install = true,
		sync_install = false,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false
		},
		autotag = {
			enable = true
		}
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end
}
