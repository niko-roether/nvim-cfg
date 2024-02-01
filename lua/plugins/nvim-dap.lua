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
		local debug_cfg = require("debugger")
		debug_cfg.setup(dap)
	end
}
