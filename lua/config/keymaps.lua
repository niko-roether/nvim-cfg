local M = {}

function M.setup()
	vim.g.mapleader = ","

	-- File manager
	vim.keymap.set("n", "<leader>np", vim.cmd.NnnPicker)
	vim.keymap.set("n", "<leader>ne", vim.cmd.NnnExplorer)

	-- Resize windows
	vim.keymap.set("n", "<C-w><S-K>", "<cmd>resize +2<cr>")
	vim.keymap.set("n", "<C-w><S-J>", "<cmd>resize -2<cr>")
	vim.keymap.set("n", "<C-w><S-L>", "<cmd>vertical resize -2<cr>")
	vim.keymap.set("n", "<C-w><S-H>", "<cmd>vertical resize +2<cr>")

	-- Tabs
	vim.keymap.set("n", "<C-l>", vim.cmd.BufferNext)
	vim.keymap.set("n", "<C-h>", vim.cmd.BufferPrevious)
	vim.keymap.set("n", "<C-S-l>", vim.cmd.BufferNext)
	vim.keymap.set("n", "<C-S-h>", vim.cmd.BufferPrevious)
	for i = 1, 9 do
		vim.keymap.set("n", "<C-" .. i .. ">", function() vim.cmd.BufferGoto(i) end)
	end
	vim.keymap.set("n", "<C-0>", vim.cmd.BufferLast)
	vim.keymap.set("n", "<C-t>p", vim.cmd.BufferPin)
	vim.keymap.set("n", "<C-t>c", vim.cmd.BufferCloseAllButCurrent)
	vim.keymap.set("n", "<C-q>", vim.cmd.BufferClose)
	vim.keymap.set("n", "<C-p>", vim.cmd.BufferPick)
	vim.keymap.set("n", "<leader>tb", vim.cmd.BufferOrderByBufferNumber)
	vim.keymap.set("n", "<leader>td", vim.cmd.BufferOrderByDirectory)
	vim.keymap.set("n", "<leader>tl", vim.cmd.BufferOrderByLanguage)
	vim.keymap.set("n", "<leader>tw", vim.cmd.BufferOrderByWindowNumber)

	-- Formatting
	vim.keymap.set("n", "<C-k>", "<cmd>m-2<cr>")
	vim.keymap.set("n", "<C-j>", "<cmd>m+<cr>")
	vim.keymap.set("v", "<C-k>", ":m-2<cr>gv")
	vim.keymap.set("v", "<C-j>", ":m'>+<cr>gv")
	vim.keymap.set("n", "<S-Up>", "o<Esc>k")
	vim.keymap.set("n", "<S-Down>", "O<Esc>j")
	vim.keymap.set("n", "<A-Up>", "kdd")
	vim.keymap.set("n", "<A-Down>", "jddk")

	-- Neogit
	vim.keymap.set("n", "<C-g>", vim.cmd.Neogit)

	-- Lazy
	vim.keymap.set("n", "<leader>l", vim.cmd.Lazy)

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
			vim.keymap.set("n", "<F3>", vim.lsp.buf.format, opts)
			vim.keymap.set("n", "<F4>", vim.lsp.buf.code_action, opts)

			vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
		end
	})
end

function M.after()
	local telescope = require("telescope.builtin");
	local oil = require("oil");
	local dap = require("dap");
	local dap_widgets = require("dap.ui.widgets");

	-- Telescope
	vim.keymap.set("n", "<leader>ff", function() telescope.find_files({ hidden = true }) end)
	vim.keymap.set("n", "<leader>fg", function() telescope.live_grep({ hidden = true }) end)
	vim.keymap.set("n", "<leader>fz", function() telescope.grep_string({ word_match = "-w", search = "" }) end)
	vim.keymap.set("n", "<leader>fb", telescope.buffers, {})
	vim.keymap.set("n", "<leader>fh", telescope.help_tags, {})

	vim.api.nvim_create_autocmd("LspAttach", {
		desc = "Telescope LSP Keybinds",
		callback = function(evt)
			local opts = { buffer = evt.buf }

			vim.keymap.set("n", "<leader>fr", telescope.lsp_references, opts)
			vim.keymap.set("n", "<leader>fs", telescope.lsp_document_symbols, opts)
			vim.keymap.set("n", "<leader>fS", telescope.lsp_workspace_symbols, opts)
			vim.keymap.set("n", "<leader>fd", telescope.diagnostics, opts)
		end
	})

	-- File manager
	vim.keymap.set("n", "<leader>ec", function() oil.toggle_float() end)
	vim.keymap.set("n", "<leader>ew", function() oil.toggle_float(vim.fn.getcwd()) end)

	-- Debugger
	vim.keymap.set("n", "<F5>", dap.toggle_breakpoint)
	vim.keymap.set("n", "<F9>", dap.continue)
	vim.keymap.set("n", "<F10>", dap.step_over)
	vim.keymap.set("n", "<F11>", dap.step_into)
	vim.keymap.set("n", "<F12>", dap.step_out)
	vim.keymap.set("n", "<leader>dr", dap.repl.open)
	vim.keymap.set({ "n", "v" }, "<leader>dh", dap_widgets.hover)
	vim.keymap.set({ "n", "v" }, "<leader>dp", dap_widgets.preview)
	vim.keymap.set({ "n", "v" }, "<leader>df", function()
		dap_widgets.centered_float(dap_widgets.frames)
	end)
	vim.keymap.set({ "n", "v" }, "<leader>ds", function()
		dap_widgets.centered_float(dap_widgets.scopes)
	end)
end

return M;
