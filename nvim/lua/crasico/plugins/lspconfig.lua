return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "hrsh7th/cmp-nvim-lsp", { "antosha417/nvim-lsp-file-operations", config = true } },
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local on_attach = function(client, bufnr)
			local keymap = vim.keymap -- for conciseness
			local opts = { noremap = true, silent = true }
			opts.buffer = bufnr

			opts.desc = "Show LSP references"
			keymap.set("n", "<leader>gR", "<cmd>Telescope lsp_references<CR>", opts)

			opts.desc = "Go to declaration"
			keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, opts)

			opts.desc = "Goto definitions"
			keymap.set("n", "<leader>gd", "<cmd>Telescope lsp_definitions<CR>", opts)

			opts.desc = "Goto implementations"
			keymap.set("n", "<leader>gi", "<cmd>Telescope lsp_implementations<CR>", opts)

			opts.desc = "Goto type definitions"
			keymap.set("n", "<leader>gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
			opts.desc = "See available code actions"
			keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

			opts.desc = "Rename"
			keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

			opts.desc = "Show buffer diagnostics"
			keymap.set("n", "<leader>cD", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

			opts.desc = "Show line diagnostics"
			keymap.set("n", "<leader>cd", vim.diagnostic.open_float, opts)

			opts.desc = "Go to previous diagnostic"
			keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

			opts.desc = "Go to next diagnostic"
			keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

			opts.desc = "Show documentation for what is under cursor"
			keymap.set("n", "<leader>c", vim.lsp.buf.hover, opts)

			opts.desc = "Restart LSP"
			keymap.set("n", "<leader>rlsp", ":LspRestart<CR>", opts)
		end

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- configure html server
		lspconfig.html.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure typescript server with plugin
		lspconfig.tsserver.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure css server
		lspconfig.cssls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure csharp server
		lspconfig.csharp_ls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure prisma server
		lspconfig.prismals.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure go server with plugin
		lspconfig.gopls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure python server with plugin
		lspconfig.pylsp.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure lua server (with special settings)
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})

		-- configure yaml server with plugin
		lspconfig.yamlls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure terraform server with plugin
		lspconfig.terraformls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig.sqls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
	end,
}
