require('nvim-treesitter.configs').setup({
	ensure_installed = { "c", "lua", "rust", "c_sharp", "python", "typescript" },
	auto_install = true,
	highlight = {
		enable = true
	}
})
