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

	vim.api.nvim_create_user_command(
		"Presentation",
		function(opts)
			print("Entering presentation mode...")
			require("lualine").hide()
			vim.o.wrap = true
			vim.o.nu = false
			vim.o.relativenumber = false
			vim.o.signcolumn = "no"
			vim.o.laststatus = 0
		end,
		{
			nargs = 0
		}
	)
end

function M.after() end

return M
