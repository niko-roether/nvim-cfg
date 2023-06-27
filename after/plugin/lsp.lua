local lsp = require("lsp-zero")
local cmp = require("cmp")
local lspconfig = require("lspconfig")
local null_ls = require("null-ls")

lsp.preset("recommended")

lsp.ensure_installed {
	"lua_ls",
	"rust_analyzer"
}

local cmp_mappings = lsp.defaults.cmp_mappings {
	["<S-Return>"] = cmp.mapping.confirm()
}

lsp.setup_nvim_cmp {
	mapping = cmp_mappings
}

lsp.on_attach(function(_, bufnr)
	lsp.default_keymaps({ buffer = bufnr, omit = { "<F3>" } })
end)

local autoformat_cfg = {
	format_opts = {
		async = false,
		timeout_ms = 10000
	},
	servers = {
		["lua_ls"] = { "lua" },
		["rust_analyzer"] = { "rust" },
		["null-ls"] = {
			"javascript",
			"typescript",
			"javascriptreact",
			"typescriptreact",
			"vue",
			"css",
			"scss",
			"html",
			"json",
			"yaml",
			"markdown",
			"markdown.mdx",
			"handlebars"
		}
	}
}
lsp.format_on_save(autoformat_cfg)
lsp.format_mapping("<F3>", autoformat_cfg)

lsp.setup()

lspconfig.rust_analyzer.setup {
	checkOnSave = {
		command = "clippy"
	}
}

null_ls.setup {
	sources = {
		null_ls.builtins.code_actions.eslint_d,
		null_ls.builtins.code_actions.refactoring,
		null_ls.builtins.diagnostics.eslint_d,
		null_ls.builtins.diagnostics.tsc,
		null_ls.builtins.diagnostics.stylelint,
		null_ls.builtins.diagnostics.tidy,
		null_ls.builtins.formatting.prettierd
	}
}
