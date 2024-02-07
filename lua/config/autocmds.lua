local M = {}


function M.setup()
	vim.g.autoformat = true

	vim.api.nvim_create_autocmd("BufWritePre", {
		desc = "Format on save",
		callback = function()
			if vim.g.autoformat then
				vim.lsp.buf.format({ async = false })
			end
		end
	})
end

function M.after() end

return M;
