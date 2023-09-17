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
			"lua_ls",
			"rust_analyzer",
			"tsserver"
		}
	},
	config = function(_, opts)
		local lspconfig = require("lspconfig");
		local cmp_nvim_lsp = require("cmp_nvim_lsp");
		local mason_lspconfig = require("mason-lspconfig");

		local lsp_capabilities = cmp_nvim_lsp.default_capabilities();

		mason_lspconfig.setup(opts);
		mason_lspconfig.setup_handlers {
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = lsp_capabilities
				})
			end
		}
	end
}
