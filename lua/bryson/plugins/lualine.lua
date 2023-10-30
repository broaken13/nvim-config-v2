return {
    "nvim-lualine/lualine.nvim",
    priority = 500,
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    opts = {
        options = {
            icons_enabled = true,
            theme = "wombat",
            component_separators = { left = '', right = ''},
            section_separators = { left = '', right = ''},
        }
    }
}
