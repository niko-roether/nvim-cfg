local function config(opts)
	local leptosfmt_exists = not vim.tbl_isempty(vim.fs.find("leptosfmt.toml", {
		upward = true,
		stop = vim.fn.getcwd(),
		path = vim.fs.dirname(vim.api.nvim_buf_get_name(0))
	}));

	local options = {
		checkOnSave = "clippy"
	}

	if leptosfmt_exists then
		options["rustfmt"] = { overrideCommand = { "leptosfmt", "--stdin", "--rustfmt", "--" } }
	end

	opts.settings = {
		["rust-analyzer"] = options
	}
end

return config
