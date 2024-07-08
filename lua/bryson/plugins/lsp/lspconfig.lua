return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"stevearc/conform.nvim",
        { "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
        -- require('java').setup {}
		local lspconfig = require("lspconfig")
		local opts = { noremap = true, silent = true }
		local keymap = vim.keymap
		local on_attach = function(client, bufnr)
			opts.buffer = bufnr

			-- set keybinds
			opts.desc = "Show LSP references"
			keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

			opts.desc = "Go to declaration"
			keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

			opts.desc = "Show LSP definitions"
			keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

			opts.desc = "Show LSP implementations"
			keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

			opts.desc = "Show LSP type definitions"
			keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

			-- see available code actions, in visual mode will apply to selection
			opts.desc = "See available code actions"
			keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

			opts.desc = "Format code"
			keymap.set({ "n", "v" }, "<leader>cf", require("conform").format, opts)

			opts.desc = "Smart rename"
			keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

			opts.desc = "Show buffer diagnostics"
			keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

			opts.desc = "Show line diagnostics"
			keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

			opts.desc = "Go to previous diagnostic"
			keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

			opts.desc = "Go to next diagnostic"
			keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

			opts.desc = "Show documentation for what is under cursor"
			keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

			opts.desc = "Restart LSP"
			keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
		end

		local cmp_nvim = require("cmp_nvim_lsp")
		local capabilities = cmp_nvim.default_capabilities()

		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

        local util = require("lspconfig/util")

		lspconfig["html"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["tsserver"].setup({
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				vim.bo.shiftwidth = 2
				vim.bo.tabstop = 2
				on_attach(client, bufnr)
			end,
		})

        lspconfig["jsonls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

		lspconfig["omnisharp"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			cmd = { "omnisharp" },
		})

		lspconfig["rust_analyzer"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
            cmd = {
                "rustup", "run", "stable", "rust-analyzer",
            },
            filetypes = {"rust"},
            root_dir = util.root_pattern("Cargo.toml"),
            settings = {
                ['rust_analyzer'] = {
                    cargo = {
                        allFeatures = true,
                    }
                }
            }
		})

		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})

		lspconfig["clangd"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

        lspconfig["jdtls"].setup {
            capabilities = capabilities,
            on_attach = on_attach,
        }
	end,
}
