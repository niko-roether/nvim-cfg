local function config(opts)
  opts.settings = {
	Lua = {
	  runtime = {
		version = "LuaJIT"
	  },
	  diagnostics = {
		globals = {
		  "vim"
		}
	  },
	  workspace = {
		library = vim.env.VIMRUNTIME,
		checkThirdParty = false
	  },
	  telemetry = {
		enable = false
	  }
	}
  }
end

return config
