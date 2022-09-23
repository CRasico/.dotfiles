local luasnip = require("luasnip")
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

vim.opt.completeopt = { "menu", "menuone", "noselect" }

local local_capabilities = vim.lsp.protocol.make_client_capabilities()
local_capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  -- Mappings.
  local bufopts = { noremap=true, silent=true }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', '<leader>H', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts) vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>fo', vim.lsp.buf.formatting, bufopts)
end

local filter = function(code_action)
	if not code_action or not code_action.data then
		return false
	end
	local data = code_action.data.id
	return string.sub(data, #data -1, #data) == ":0"
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

local cmp = require('cmp')
cmp.setup {
	snippet = {
	  expand = function(args)
        luasnip.lsp_expand(args.body)
      end	
	},
	window = {
	--	completion = cmp.config.window.bordered(),
	--	documentation = cmp.config.window.bordered()
	},
	mapping = {
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-k>'] = cmp.mapping.select_prev_item(),
		['<C-j>'] = cmp.mapping.select_next_item(),
		['<C-Space>'] = cmp.mapping(
		  cmp.mapping.complete(), 
		  { 'i', 'c' }
		),
		['<C-e>'] = cmp.mapping(
		  cmp.mapping.abort(), 
		  { 'i', 'c' }
		),
		['<CR>'] = cmp.mapping.confirm({
			select = true 
		}),
		['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
	},	
	sources = cmp.config.sources({
		{ name = 'nvim_lua' },
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'buffer'}
	}),
	experimental = {
		native_menu = false,
		ghost_text = true
	}
}

local capabilities = require('cmp_nvim_lsp').update_capabilities(local_capabilities)

require('lspconfig').pyright.setup{
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
	filter = filter
}
require('lspconfig').tsserver.setup{
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
	filter = filter
}
require('lspconfig').rust_analyzer.setup{
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
	filter = filter
}
require('lspconfig').terraformls.setup{
	on_attach = on_attach,
	flags = flags,
	capabilities = capabilities,
	filter = filter
}
vim.api.nvim_create_autocmd({"BufWritePre"}, {
	pattern = { "*.tf", "*.tfvars" },
	callback = vim.lsp.buf.formatting_sync
})

local pid = vim.fn.getpid()
local omnisharp_bin = os.getenv("HOME") .. "/.cache/omnisharp-vim/omnisharp-roslyn/run"
require('lspconfig').omnisharp.setup{
	on_attach = on_attach,
	flags = lsp_flags,
	cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
	capabilities = capabilities,
	filter = filter
}

require('luasnip/loaders/from_vscode').lazy_load()
