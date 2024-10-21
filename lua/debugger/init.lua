local M = {}

function M.setup(dap)
	dap.adapters = {
		gdb = require("debugger.adapters.gdb"),
		rust_gdb = require("debugger.adapters.rust_gdb")
	}

	dap.configurations = {
		rust = require("debugger.config.rust")
	}
end

return M
