return {
	"williamboman/mason.nvim",
	priority = 1000,
	lazy = false,
	config = function(_, opts)
		require("mason").setup(opts);
	end
}
