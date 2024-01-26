local M = {}

function M.after()
	vim.cmd.colorscheme("tokyonight-storm")
end

function M.setup()
	vim.o.clipboard = "unnamedplus"

	vim.o.tabstop = 4
	vim.o.shiftwidth = 4
	vim.o.softtabstop = 0
	vim.o.noexpandtab = true

	vim.o.nu = true
	vim.o.signcolumn = "yes"
	vim.o.relativenumber = true

	vim.o.wrap = false

	vim.o.hlsearch = false
	vim.o.incsearch = true

	vim.o.scrolloff = 0

	vim.o.updatetime = 50

	vim.o.termguicolors = true
end

return M;
