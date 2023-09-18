local M = {}

function M.setup()
	vim.g.mapleader = ","

	-- List files
	vim.keymap.set("n", "<C-L>", vim.cmd.Ex)

	-- Resize windows
	vim.keymap.set("n", "<C-w-Up>", "<cmd>resize +2<cr>")
	vim.keymap.set("n", "<C-w-Down>", "<cmd>resize -2<cr>")
	vim.keymap.set("n", "<C-w-Left>", "<cmd>vertical resize -2<cr>")
	vim.keymap.set("n", "<C-w-Right>", "<cmd>vertical resize +2<cr>")

	-- Move between buffers
	vim.keymap.set("n", "[b", vim.cmd.BufferLineCyclePrev)
	vim.keymap.set("n", "]b", vim.cmd.BufferLineCycleNext)

	-- Neogit
	vim.keymap.set("n", "<C-g>", vim.cmd.Neogit)

	-- LSP Context
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
			vim.keymap.set("n", "<F3>", function() vim.lsp.buf.format({ async = true }) end, opts)
			vim.keymap.set("n", "<F4>", vim.lsp.buf.code_action, opts)

			vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
		end
	})
end

function M.after()
	local telescope = require("telescope.builtin");

	-- Telescope
	vim.keymap.set('n', '<leader>ff', telescope.find_files, {})
	vim.keymap.set('n', '<leader>fg', telescope.live_grep, {})
	vim.keymap.set('n', '<leader>fb', telescope.buffers, {})
	vim.keymap.set('n', '<leader>fh', telescope.help_tags, {})
end

return M;
