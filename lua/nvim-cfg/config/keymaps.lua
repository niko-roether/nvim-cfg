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
