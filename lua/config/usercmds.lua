local M = {}

function M.setup()
	vim.api.nvim_create_user_command(
		"Autoformat",
		function(opts)
			local enable = not (opts.fargs[1] == "disable")
			vim.g.autoformat = enable
			if enable then
				print("Enabled autoformatting")
			else
				print("Disabled autoformatting")
			end
		end,
		{
			nargs = "?",
			complete = function()
				return { "enable", "disable" }
			end
		}
	)
end

function M.after() end

return M
