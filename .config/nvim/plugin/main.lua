require('packer').startup(function(use)
    -- Packer to Assist with Package Management
    use 'wbthomason/packer.nvim'

    -- Tokyo Night Colorscheme
    use 'folke/tokyonight.nvim'

    -- Tree Sitter for advanced syntax highlighting
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- Status Line
    use 'nvim-lualine/lualine.nvim'

    -- File Explorer
    use 'kyazdani42/nvim-web-devicons'

    -- File Icons
    use 'kyazdani42/nvim-tree.lua'

    -- Fuzzy Finder
    use 'junegunn/fzf'
    use { 'junegunn/fzf.vim', run = 'fzf#install()' }


    -- Transparency
    use { 'xiyaowong/nvim-transparent', run = ':TransparentEnable' }

	-- LSP Auto Completion
	use 'hrsh7th/nvim-cmp'

	-- LSP Configurations
	use 'neovim/nvim-lspconfig'

	-- LSP Snippets
	use 'hrsh7th/cmp-nvim-lsp'

	-- Buffer Snippets
	use 'hrsh7th/cmp-buffer'

	-- Snippet Renderer
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'

    -- Rust Programming LSP Provider/Lang
    use 'rust-lang/rust.vim'

	-- Python Programming LSP Provider
	use 'davidhalter/jedi-vim'

	-- Debugger Adapter
	use 'mfussenegger/nvim-dap'
	use 'rcarriga/nvim-dap-ui'
	
	-- Debugger Adapter Language Help
	use 'mfussenegger/nvim-dap-python'
end)
