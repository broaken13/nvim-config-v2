return {
	{
		"Shatur/neovim-ayu",
		lazy = false,
		priority = 1001,
		config = function()
			vim.o.background = "dark"
			vim.cmd([[ colorscheme gruvbox-material ]])
			vim.cmd [[
				highlight Normal guibg=None
				highlight NonText guibg=none
				highlight Normal ctermbg=none
				highlight NonText ctermbg=none
			]]
		end
	},
	{ "sainnhe/gruvbox-material", priority = 1001 },
	{ "catppuccin/nvim", name = "catppuccin", priority = 1001 }
}
