vim.g.mapleader = ","

-- Explore files
vim.keymap.set("n", "<leader>ls", vim.cmd.Ex)

-- Interact with tabs
vim.keymap.set("n", "<C-T>", function() vim.cmd.tabnew(".") end)
vim.keymap.set("n", "<C-W>", vim.cmd.tabclose)
vim.keymap.set("n", "<C-H>", function() vim.cmd.tabnext("-") end)
vim.keymap.set("n", "<C-L>", function() vim.cmd.tabnext("+") end)

-- Git
vim.keymap.set("n", "<leader>g", vim.cmd.Git)

-- Mode switching
vim.keymap.set("i", "<C-Enter>", "<Esc>")
