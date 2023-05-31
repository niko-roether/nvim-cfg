vim.g.mapleader = ","

-- Explore files
vim.keymap.set("n", "<leader>ls", vim.cmd.Ex)

-- Git
vim.keymap.set("n", "<leader>g", vim.cmd.Git)

-- Mode switching
vim.keymap.set("i", "<C-Enter>", "<Esc>")

-- Split-Screen
vim.keymap.set("n", "<leader>sv", vim.cmd.vsplit)
vim.keymap.set("n", "<leader>sh", vim.cmd.split)

