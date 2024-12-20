local function config(opts)
	local language = os.getenv("NVIM_LTEX_LANGUAGE") or "en-US"
	opts.settings = {
		ltex = {
			language = language
		}
	}
end

return config
