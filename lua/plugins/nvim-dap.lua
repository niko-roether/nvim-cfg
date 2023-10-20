return {
	"mfussenegger/nvim-dap",
	keys = {
		"<F5>",
		"<F9>",
		"<F10>",
		"<F11>",
		"<F12>",
		"<leader>dr",
		"<leader>dh",
		"<leader>dp",
		"<leader>df",
		"<leader>ds"
	},
	config = function()
		local dap = require("dap")
		local dap_widgets = require("dap.ui.widgets")

		vim.keymap.set("n", "<F5>", dap.toggle_breakpoint)
		vim.keymap.set("n", "<F9>", dap.continue)
		vim.keymap.set("n", "<F10>", dap.step_over)
		vim.keymap.set("n", "<F11>", dap.step_into)
		vim.keymap.set("n", "<F12>", dap.step_out)
		vim.keymap.set("n", "<leader>dr", dap.repl.open)
		vim.keymap.set({ "n", "v" }, "<leader>dh", dap_widgets.hover)
		vim.keymap.set({ "n", "v" }, "<leader>dp", dap_widgets.preview)
		vim.keymap.set({ "n", "v" }, "<leader>df", function()
			dap_widgets.centered_float(dap_widgets.frames)
		end)
		vim.keymap.set({ "n", "v" }, "<leader>ds", function()
			dap_widgets.centered_float(dap_widgets.scopes)
		end)

		dap.adapters.gdb = {
			type = "executable",
			command = "gdb",
			args = { "-i", "dap" }
		}

		dap.configurations.rust = {
			{
				name = "Launch",
				type = "gdb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}"
			}
		}
	end
}
