local lsp = require("lsp-zero")
local cmp = require("cmp")

lsp.preset("recommended")

lsp.ensure_installed {
	"tsserver",
	"eslint",
	"lua_ls",
	"rust_analyzer"
}

local cmp_mappings = lsp.defaults.cmp_mappings {
	["<Return>"] = cmp.mapping.confirm({ select = false }),
	["<ESC>"] = cmp.mapping.abort()
}

lsp.setup_nvim_cmp {
	mapping = cmp_mappings
}

lsp.setup()
