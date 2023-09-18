local M = {}

function M.setup()
	vim.api.nvim_create_autocmd("BufWritePre", {
		desc = "Format on save",
		callback = function()
			vim.lsp.buf.format({ async = false })
		end
	})
end

function M.after() end

return M;
