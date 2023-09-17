local function register_filetype(pattern, filetype)
	vim.api.nvim_create_autocmd(
		{ "BufRead", "BufNewFile" },
		{
			pattern = pattern,
			callback = function()
				vim.cmd.setfiletype(filetype)
			end
		}
	)
end

register_filetype("*.wgsl", "wgsl");
