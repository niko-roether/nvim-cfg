local function config(opts)
	opts.settings = {
		["rust-analyzer"] = {
			checkOnSave = {
				command = "clippy"
			}
		}
	}
end

return config
