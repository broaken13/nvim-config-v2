return {
    "echasnovski/mini.nvim",
    dependencies = { "folke/which-key.nvim", },
    version = false,
    config = function()
        require("mini.icons").setup()
        require("mini.files").setup()
        local wk = require("which-key")
        wk.add {"<leader>ee", function() MiniFiles.open() end, desc = "Mini Files"}

        require("mini.pairs").setup()
        require("mini.ai").setup()
        require("mini.splitjoin").setup()
        require("mini.starter").setup()
        require("mini.sessions").setup()
    end
}
