return {
	"hrsh7th/nvim-cmp",
	lazy = false,
	dependencies = {
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip"
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		cmp.setup {
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end
			},
			mapping = cmp.mapping.preset.insert {
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.complete(),
				["<CR>"] = cmp.mapping.confirm({ select = false })
			},
			sources = cmp.config.sources({
				{ name = "nvim_lsp" }
			}, {
				{ name = "buffer" }
			})
		}
	end
}
