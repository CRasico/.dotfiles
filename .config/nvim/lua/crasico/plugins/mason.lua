return {
  "williamboman/mason.nvim",
	dependencies = {
    "williamboman/mason-lspconfig.nvim",
	},
  config = function()
    local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")

		mason.setup()

		mason_lspconfig.setup({
      ensure_installed = {
        "tsserver", -- ts language server
				"html", -- html language server
				"cssls", -- css language server
				"lua_ls", -- lua language server
				"csharp_ls", -- c# language server
				"gopls", -- go language server
				"rust_analyzer", -- rust language server
			},
			handlers = {
				csharp_ls = function()
				  local root_dir = function(startpath)
					  return require("lspconfig").util.root_pattern("*.sln")(startpath)
							or require("lspconfig").util.root_pattern("*.csproj")(startpath)
							or require("lspconfig").util.root_pattern("*.fsproj")(startpath)
							or require("lspconfig").util.root_pattern("*.git")(startpath)
				  end
				  return {
					  root_dir = root_dir
				  }
			  end
			}
		})

		local keymap = vim.keymap

		keymap.set("n", "<leader>PM", ":Mason<CR>", { desc = "Open Mason (Package Management" })
  end
}
