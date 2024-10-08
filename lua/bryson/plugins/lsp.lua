return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v4.x",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/nvim-cmp",
    },
    config = function()
        local lsp_zero = require("lsp-zero")

        local lsp_attach = function(_, bufnr)
            local opts = {buffer = bufnr}

            -- opts.desc = "Hover"
            vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
            -- opts.desc = "Goto Definition"
            vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
            -- opts.desc = "Goto Declaration"
            vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
            -- opts.desc = "Goto Implementation"
            vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
            -- opts.desc = "Goto Type Definition"
            vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
            -- opts.desc = "Goto References"
            vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
            -- opts.desc = "Goto Signature Help"
            vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
            -- opts.desc = "LSP Rename"
            vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
            -- opts.desc = "Format Buffer"
            vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
            -- opts.desc = "Code Action"
            vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
        end
        
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        

        -- lsp_zero.extend_lspconfig({
        --     sign_text = true,
        --     lsp_attach = lsp_attach,
        --     capabilities = require('cmp_nvim_lsp').default_capabilities(),
        -- })

        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "csharp_ls",
                "vtsls",
                "lua_ls",
                "html",
            },
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup({
                        capabilities = capabilities,
                        on_attach = lsp_attach,
                    })
                end,
            }
        })
    end,
}

