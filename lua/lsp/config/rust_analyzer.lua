local function config(opts)
	local leptosfmt_exists = not vim.tbl_isempty(vim.fs.find("leptosfmt.toml", {
		upward = true,
		stop = vim.fn.getcwd(),
		path = vim.fs.dirname(vim.api.nvim_buf_get_name(0))
	}));

	local rustfmt_override = { "rustfmt", "--" }


	if leptosfmt_exists then
		rustfmt_override = { "leptosfmt", "--stdin", "--rustfmt", "--" }
	end

	opts.settings = {
		["rust-analyzer"] = {
			checkOnSave = {
				command = "clippy"
			},
			rustfmt = {
				overrideCommand = rustfmt_override
			}
		}
	}
end

return config
