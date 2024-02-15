return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",

		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("neogit").setup({
			graph_style = "unicode",
		})
	end,
	keys = {
		{
			"<leader>gg",
			function()
				require("neogit").open()
			end,
			desc = "Open Neogit",
		},
		{ "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Open Diffview" },
	},
}
