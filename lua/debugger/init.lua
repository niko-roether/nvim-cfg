local M = {}

function M.setup(dap)
	dap.adapters = {
		gdb = require("debugger.adapters.gdb")
	}

	dap.configurations = {
		rust = require("debugger.config.rust")
	}
end

return M
