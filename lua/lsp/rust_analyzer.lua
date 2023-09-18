local function specialize(opts)
	opts.settings = {
		["rust-analyzer"] = {
			checkOnSave = {
				command = "clippy"
			}
		}
	}
end

return specialize
