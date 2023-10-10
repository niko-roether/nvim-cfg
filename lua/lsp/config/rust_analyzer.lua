local function config(opts)
	local leptosfmt_exists = vim.fs.find("leptosfmt.toml", {
		upward = true,
		stop = "/",
		path = vim.fs.dirname(vim.api.nvim_buf_get_name(0))
	}) ~= nil;

	local rustfmt_override = nil

	if leptosfmt_exists then
		rustfmt_override = { "leptosfmt", "--stdin", "--rustfmt" }
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
