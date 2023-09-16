local options = require("options")
local keybinds = require("keybinds")
local filetypes = require("filetypes")

local M = {}

function M.setup()
	options.setup()
	keybinds.setup()
	filetypes.setup()
end

return M
