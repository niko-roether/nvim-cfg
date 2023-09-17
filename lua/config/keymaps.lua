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
