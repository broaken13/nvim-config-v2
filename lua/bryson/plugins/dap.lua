return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"mxsdev/nvim-dap-vscode-js",
		{
			"microsoft/vscode-js-debug",
			version = "1.x",
			build = "npm i && npx gulp vsDebugServerBundle && mv dist out",
		},
	},
	event = "VeryLazy",
	keys = {
		{
			"<leader>db",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "Toggle breakpoint",
		},
		{
			"<leader>dc",
			function()
				require("dap").continue()
			end,
			desc = "Start Debugging",
		},
		{
			"<leader>dso",
			function()
				require("dap").step_over()
			end,
			desc = "Debug step over",
		},
		{
			"<leader>dsi",
			function()
				require("dap").step_into()
			end,
			desc = "Debug step into",
		},
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		local wk = require("which-key")
		wk.add({
			{
				"<leader>d",
				group = "Debug",
			},
			{
				"<leader>ds",
				group = "Step...",
			},
		})

		require("dap-vscode-js").setup({
			debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
			adapters = { "pwa-node", "pwa-chrome", "node-terminal", "pwa-extensionHost" },
		})

		dapui.setup()

		-- Trigger dapui to launch when dap does
		dap.listeners.before.launch.dapui_config = dapui.open
		dap.listeners.after.event_initialized = dapui.open
		dap.listeners.before.event_terminated.dapui_config = dapui.close
		dap.listeners.before.event_exited.dapui_config = dapui.close

		dap.adapters.coreclr = {
			type = "executable",
			command = "/home/bryson/.local/share/nvim/mason/bin/netcoredbg",
			args = { "--interpreter=vscode" },
			name = ".Net Core DBG",
		}

		dap.configurations.cs = {
			{
				type = "coreclr",
				name = "launch .Net Debugger",
				request = "launch",
				program = function()
					return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug", "file")
				end,
			},
		}

		for _, language in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact" }) do
			dap.configurations[language] = {
                {
                    type = "pwa-node",
                    request = "launch",
                    name = "Launch file",
                    program = "${file}",
                    cwd = "${workspaceFolder}"
                },
				{
					type = "pwa-node",
					request = "attach",
					processId = require("dap.utils").pick_process,
					name = "Attach debugger to existing node process",
					sourceMaps = true,
					resolveSourceMapLocations = {
						"${workspaceFolder}/**",
						"!**/node_modules/**",
					},
					cwd = "${workspaceFolder}/src",
					skipFiles = { "${workspaceFolder}/node_modules/**/*.js" },
				},
				{
					type = "pwa-chrome",
					name = "Launch Chrome for debugging",
					request = "launch",
					url = "http://localhost:5173",
					sourceMaps = true,
					protocol = "inspector",
					port = 9222,
					webRoot = "${workspaceFolder}/src",
					skipFiles = { "**/node_modules/**/*", "**/@vite/*" },
				},
				language == "javascript" and {
					type = "pwa-node",
					request = "launch",
					name = "Launch file in new node process",
					program = "${file}",
					cwd = "${workspaceFolder}",
				} or nil,
			}
		end
	end,
}
