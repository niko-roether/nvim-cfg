local eslint_d = {
	lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
	lintStdin = true,
	lintFormats = { "%f:%l:%c: %tarning %m", "%f:%l:%c: %trror %m" },
	lintIgnoreExitCode = true,
	lintSource = "eslint"
}

local function config(opts)
	opts = {}

	opts.settings = {
		rootMarkers = { ".git", "package.json" },
		languages = {
			javascript = { eslint_d },
			javascriptreact = { eslint_d },
			typescript = { eslint_d },
			typescriptreact = { eslint_d }
		}
	}

	opts.filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" }
end

return config
