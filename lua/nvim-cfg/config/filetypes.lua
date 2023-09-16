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

local custom_filetypes = {
	["*.wgsl"] = "wgsl"
}

local M = {}

function M.setup()
	for pattern, filetype in pairs(custom_filetypes) do
		register_filetype(pattern, filetype)
	end
end

return M;
