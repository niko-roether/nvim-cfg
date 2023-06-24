vim.o.tabstop = 4
vim.o.shiftwidth = 4

vim.o.nu = true
vim.o.relativenumber = false

vim.o.wrap = false

vim.o.hlsearch = false
vim.o.incsearch = true

vim.o.scrolloff = 8

vim.o.updatetime = 50

-- Format on save
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
