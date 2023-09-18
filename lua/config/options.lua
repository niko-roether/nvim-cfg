local M = {}

function M.after() end

function M.setup()
  vim.o.clipboard = "unnamedplus"

  vim.o.tabstop = 4;
  vim.o.shiftwidth = 2;

  vim.o.nu = true
  vim.o.signcolumn = "yes"
  vim.o.relativenumber = false

  vim.o.wrap = false

  vim.o.hlsearch = false
  vim.o.incsearch = true

  vim.o.scrolloff = 8

  vim.o.updatetime = 50

  vim.o.termguicolors = true
  vim.cmd.colorscheme("tokyonight")

  vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP Keybinds",
	callback = function(evt)
	  local opts = { buffer = evt.buf }

	  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	  vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
	  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
	  vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
	  vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
	  vim.keymap.set("n", "x", function() vim.lsp.buf.format({ async = true }) end, opts)
	  vim.keymap.set("n", "<F4>", vim.lsp.buf.code_action, opts)

	  vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
	  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
	  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
	end
  })
end

return M;
