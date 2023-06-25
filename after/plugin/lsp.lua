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
	["<S-Return>"] = cmp.mapping.confirm()
}

lsp.setup_nvim_cmp {
	mapping = cmp_mappings
}

lsp.setup()

local function auto_format_buffer()
	vim.lsp.buf.format({ async = true })
end


vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local opts = { buffer = args.buf }

		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "sa", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "sr", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "x", auto_format_buffer, opts)
	end
})


vim.api.nvim_create_autocmd("BufWritePre", {
	callback = auto_format_buffer
});
