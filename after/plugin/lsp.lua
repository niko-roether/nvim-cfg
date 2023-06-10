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
	["<Return>"] = cmp.mapping.confirm({ select = false })
}

lsp.setup_nvim_cmp {
	mapping = cmp_mappings
}

lsp.setup()

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = args.buf })
	end
})
