return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
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

		dapui.setup()

        -- Trigger dapui to launch when dap does
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

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
	end,
}
