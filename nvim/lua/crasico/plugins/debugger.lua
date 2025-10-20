return {
	"rcarriga/nvim-dap-ui",
	name = "debugger",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
		"leoluz/nvim-dap-go",
		"jay-babu/mason-nvim-dap.nvim",
	},
	config = function()
		local keymap = vim.keymap
		local dap = require("dap")
		local dapui = require("dapui")
		local mason_nvimdap = require("mason-nvim-dap")

		-- dap logs temporary
		dap.set_log_level("TRACE")

		dapui.setup()
		mason_nvimdap.setup({
			ensure_installed = { "js-debug-adapter", "node2" },
			handlers = {
				function(config)
					mason_nvimdap.default_setup(config)
				end,
			},
		})
		-- dapgo.setup() --

		-- setup debugger ui --
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end

		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end

		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end

		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		-- setup keymaps for the debugger --
		keymap.set(
			"n",
			"<leader>db",
			":lua require('dap').toggle_breakpoint()<CR>",
			{ desc = "Debugger: Set Breakpoint" }
		)

		keymap.set("n", "<leader>dc", dap.continue, { desc = "Debug Continue" })
		keymap.set("n", "<leader>do", dap.step_over, { desc = "Debug Step Over" })
		keymap.set("n", "<leader>di", dap.step_into, { desc = "Debug Step Into" })
		keymap.set("n", "<leader>du", dap.step_out, { desc = "Debug Step Out" })
		keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Debug Toggle Breakpoint" })
		keymap.set("n", "<leader>dB", function()
			dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end, { desc = "Debug Set Conditional Breakpoint" })
		keymap.set("n", "<leader>dr", dap.repl.open, { desc = "Debug Open REPL" })
		keymap.set("n", "<leader>dl", dap.run_last, { desc = "Debug Run Last" })
		keymap.set("n", "<leader>ds", function()
			dap.close()
			dapui.close()
		end, { desc = "Stop Debugging" })

		dap.adapters.delve = function(callback, config)
			if config.mode == "remote" and config.request == "attach" then
				callback({
					type = "server",
					host = config.host or "127.0.0.1",
					port = config.port or "38697",
				})
			else
				callback({
					type = "server",
					port = "${port}",
					executable = {
						command = "dlv",
						args = { "dap", "-l", "127.0.0.1:${port}", "--log", "--log-output=dap" },
						detached = vim.fn.has("win32") == 0,
					},
				})
			end
		end

		-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
		dap.configurations.go = {
			{
				type = "delve",
				name = "Debug",
				request = "launch",
				program = "${file}",
			},
			{
				type = "delve",
				name = "Debug test", -- configuration for debugging test files
				request = "launch",
				mode = "test",
				program = "${file}",
			},
			-- works with go.mod packages and sub packages
			{
				type = "delve",
				name = "Debug test (go.mod)",
				request = "launch",
				mode = "test",
				program = "./${relativeFileDirname}",
			},
		}

		dap.configurations.typescript = {
			{
				type = "node2",
				request = "launch",
				name = "Launch file",
				program = "${file}",
				cwd = "${workspaceFolder}",
				sourceMaps = true,
				protocol = "inspector",
				console = "integratedTerminal",
				outFiles = { "${workspaceFolder}/dist/**/*.js" },
				runtimeExecutable = "node",
				runtimeArgs = { "--loader", "ts-node/esm" },
			},
			{
				type = "node2",
				request = "attach",
				name = "Attach to Port",
				port = 9229,
				localRoot = "${workspaceFolder}",
				remoteRoot = "${workspaceFolder}",
				sourceMaps = true,
				protocol = "inspector",
				skipFiles = { "<node_internals>/**/*.js" },
			},
		}

		dap.configurations.javascript = dap.configurations.typescript
	end,
}
