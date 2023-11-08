return {
	"rebelot/terminal.nvim",
	config = function()
		require("terminal").setup()
		local term_map = require("terminal.mappings")
		vim.keymap.set("n", "<leader>to", term_map.toggle)
		vim.keymap.set("n", "<leader>tr", term_map.run)
		vim.keymap.set("n", "<leader>tk", term_map.kill)
		vim.keymap.set("n", "<leader>t[", term_map.cycle_prev)
		vim.keymap.set("n", "<leader>t]", term_map.cycle_next)
		vim.keymap.set("n", "<leader>tl", term_map.move({ open_cmd = "belowright vnew" }))
		vim.keymap.set("n", "<leader>th", term_map.move({ open_cmd = "belowright 12 new" }))
		vim.keymap.set({ "n", "t" }, "<M-f>", term_map.toggle({ open_cmd = "float" })) -- toggle a floating terminal
		vim.keymap.set("t", "<C-\\><C-\\>", [[<C-\><C-n>]])
		vim.api.nvim_create_autocmd("TermOpen", {
			command = [[setlocal nonumber norelativenumber winhl=Normal:NormalFloat]],
		})
	end,
}
