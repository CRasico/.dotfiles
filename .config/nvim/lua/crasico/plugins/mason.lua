return {
  "williamboman/mason.nvim",
	dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
	},
  config = function()
    local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")

		mason.setup()

		mason_lspconfig.setup({
      ensure_installed = {
        "tsserver",
				"cssls",
				"lua_ls",
				"csharp_ls",
				"gopls",
				"rust_analyzer",
			}
		})

		local keymap = vim.keymap

		keymap.set("n", "<leader>PM", ":Mason<CR>", { desc = "Open Mason (Package Management" })
  end
}
