local globals = require("globals")

local M = {}

function M.after()
	if globals.theme_variant ~= nil then
		vim.cmd.colorscheme(globals.theme .. "-" .. globals.theme_variant)
	else
		vim.cmd.colorscheme(globals.theme)
	end
end

function M.setup()
	vim.o.tabstop = 4
	vim.o.shiftwidth = 4
	vim.o.softtabstop = 0
	vim.o.expandtab = false

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
