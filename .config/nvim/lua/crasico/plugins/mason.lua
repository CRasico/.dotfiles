return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"neovim/nvim-lspconfig"
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")
		local lsp_zero = require("lsp-zero")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗"
				}
			}
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"tsserver",
				"csharp_ls",
				"pyright",
				"html",
				"cssls",
				"lua_ls",
			},
			automatic_installation = true,
			handlers = {
				lsp_zero.default_setup,
			}
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier",
				"stylua",
				"pylint",
				"eslint_d"
			},
		})
	end
}
