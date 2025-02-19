return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
		"leoluz/nvim-dap-go",
	},
	config = function()
		local keymap = vim.keymap
		local dap = require("dap")
		local dapui = require("dapui")
		-- local dapgo = require("dap-go") --

		-- dap logs temporary
		dap.set_log_level("TRACE")

		dapui.setup()
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

		keymap.set("n", "<leader>dd", ":lua require('dap').continue()<CR>", { desc = "Debugger: Continue" })
		keymap.set("n", "<leader>do", ":lua require('dap').step_over()<CR>", { desc = "Debugger: Step Over" })
		keymap.set("n", "<leader>di", ":lua require('dap').step_into()<CR>", { desc = "Debugger: Step Into" })

		keymap.set("n", "<leader>duio", ":lua require('dapui').open()", { desc = "Debugger UI: Open" })
		keymap.set("n", "<leader>duiq", ":lua require('dapui').close()", { desc = "Debugger UI: Close" })

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
	end,
}
