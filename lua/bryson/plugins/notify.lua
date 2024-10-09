return {
    "rcarriga/nvim-notify",
    config = function()
        vim.notify = require("notify")
        vim.notify.setup({
            background_colour = "#000000"
        })
        vim.keymap.set('n', '<leader>fn', "<cmd>Telescope notify<cr>", { desc = 'Telescope notifications' })
    end
}
