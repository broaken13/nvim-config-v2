-- Tab bar
return {
    "romgrk/barbar.nvim",
    dependencies = {
        "lewis6991/gitsigns.nvim",
        "nvim-tree/nvim-web-devicons"
    },
    init = function ()
        vim.g.barbar_auto_setup = false
    end,
    config = function ()
        require("barbar").setup()

        local map = vim.keymap.set
        local opts = { noremap = true, silent = true }

        map("n", "<A-,>", "<cmd>BufferPrevious<CR>", opts)
        map("n", "<A-.>", "<cmd>BufferNext<CR>", opts)
        map("n", "<A-<>", "<cmd>BufferMovePrevious<CR>", opts) -- Thats Alt + Shift + ,
        map("n", "<A->>", "<cmd>BufferMoveNext<CR>", opts) -- Alt + Shift + .

        map("n", "<A-1>", "<cmd>BufferGoto 1<CR>", opts)
        map("n", "<A-2>", "<cmd>BufferGoto 2<CR>", opts)
        map("n", "<A-3>", "<cmd>BufferGoto 3<CR>", opts)
        map("n", "<A-4>", "<cmd>BufferGoto 4<CR>", opts)
        map("n", "<A-5>", "<cmd>BufferGoto 5<CR>", opts)
        map("n", "<A-6>", "<cmd>BufferGoto 6<CR>", opts)
        map("n", "<A-7>", "<cmd>BufferGoto 7<CR>", opts)
        map("n", "<A-8>", "<cmd>BufferGoto 8<CR>", opts)
        map("n", "<A-9>", "<cmd>BufferGoto 9<CR>", opts)
        map("n", "<A-0>", "<cmd>BufferLast<CR>", opts)

        map("n", "<A-p>", "<cmd>BufferPick<CR>", opts)

        local wk = require("which-key")
        wk.register({
            b = {
                name = "Barbar buffer manipulations",
                c = "Close buffer",
                a = "Close all but current or pinned",
                p = "Pick buffer"
            }
        }, { prefix = "<leader>" })

        map("n", "<leader>bc", "<cmd>BufferClose<CR>", opts)
        map("n", "<leader>ba", "<cmd>BufferCloseAllButCurrentOrPinned<CR>", opts)
        map("n", "<leader>bp", "<cmd>BufferPin<CR>", opts)
    end
}
