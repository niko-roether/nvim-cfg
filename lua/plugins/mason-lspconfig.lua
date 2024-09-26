return {
	"williamboman/mason-lspconfig.nvim",
	lazy = false,
	dependencies = {
		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp"
	},
	opts = {
		ensure_installed = {
			"efm",
			"lua_ls",
			"rust_analyzer",
			"ts_ls",
			"zls",
		}
	},
	config = function(_, opts)
		local lsp = require("lsp");
		local mason_lspconfig = require("mason-lspconfig")

		mason_lspconfig.setup(opts);
		mason_lspconfig.setup_handlers { lsp.setup }
	end
}
