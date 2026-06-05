return {
	"ziontee113/icon-picker.nvim",
	config = function()
		require("icon-picker").setup({ disable_legacy_commands = true })

		local opts = { noremap = true, silent = true }

		opts.desc = "Icon picker"
		vim.keymap.set("n", "<Leader>fi", "<cmd>IconPickerNormal<cr>", opts)
		opts.desc = "Icon picker to register"
		vim.keymap.set("n", "<Leader><Leader>y", "<cmd>IconPickerYank<cr>", opts) --> Yank the selected icon into register
		opts.desc = "Icon picker (insert mode)"
		vim.keymap.set("i", "<C-t>", "<cmd>IconPickerInsert<cr>", opts)
	end,
}
