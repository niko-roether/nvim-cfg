local globals = require("globals")

return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	enabled = globals.theme == "tokyonight"
}
