-- Conform is a formatting plugin
return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function(_, opts)
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout = 1500,
			},
		})

		vim.keymap.set({ "n", "x" }, "<leader>cf", conform.format, opts)
	end,
}
