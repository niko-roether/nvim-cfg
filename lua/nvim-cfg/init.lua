local lazy = require("lazy")
local config = require("config")

local M = {}

function M.setup()
	lazy.setup("plugins")
	config.setup()
end

return M
