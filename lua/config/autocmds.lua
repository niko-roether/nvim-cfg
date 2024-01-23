local M = {}

vim.g.autoformat = 1

function M.setup()
	vim.api.nvim_create_autocmd("BufWritePre", {
		desc = "Format on save",
		callback = function()
			if vim.g.autoformat == 1 then
				vim.lsp.buf.format({ async = false })
			end
		end
	})
end

function M.after() end

return M;
