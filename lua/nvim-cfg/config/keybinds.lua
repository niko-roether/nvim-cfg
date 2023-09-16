local M = {}

function M.setup()
	vim.g.mapleader = ","

	-- Split-Screen
	vim.keymap.set("n", "<leader>sv", vim.cmd.vsplit)
	vim.keymap.set("n", "<leader>sh", vim.cmd.split)
end

return M
