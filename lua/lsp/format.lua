local formatting_blacklist = { "tsserver" };

local function format(bufnr)
	local options = {
		async = true,
		bufnr = bufnr
	}

	function options.filter(client)
		return not vim.tbl_contains(formatting_blacklist, client.name)
	end

	vim.lsp.buf.format(options)
end

return format
