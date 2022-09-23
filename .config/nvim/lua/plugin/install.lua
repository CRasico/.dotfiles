require('packer').startup(function(use)
    -- Packer to Assist with Package Management
    use 'wbthomason/packer.nvim'

    -- Tokyo Night Colorscheme
    use 'folke/tokyonight.nvim'
	-- Embark Colorscheme
	use { 'embark-theme/vim', name = 'embark' }
	-- gruvbox colorsheme
	use 'morhetz/gruvbox'

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

	-- Buffer Completion
	use 'hrsh7th/cmp-buffer'

	-- Path Completion
	use 'hrsh7th/cmp-path'

	-- Snippet Completions
	use 'saadparwaiz1/cmp_luasnip'

	-- Snippet Renderer
	use 'L3MON4D3/LuaSnip'

	-- Easy Friendly Snippets
	use 'rafamadriz/friendly-snippets'

    -- Rust Programming LSP Provider/Lang
    use 'rust-lang/rust.vim'

	-- Python Programming LSP Provider
	use 'davidhalter/jedi-vim'

	-- CSharp Programming LSP Provider
	use 'OmniSharp/omnisharp-vim'

	-- Terraform Programming LSP Provider
	use 'hashicorp/terraform-ls'

	-- Debugger Adapter
	use 'mfussenegger/nvim-dap'
	use 'rcarriga/nvim-dap-ui'
	
	-- Debugger Adapter Language Help
	use 'mfussenegger/nvim-dap-python'

	-- Test Runners
	use {
		'nvim-neotest/neotest',
		requires = {
			'nvim-lua/plenary.nvim',
			'nvim-treesitter/nvim-treesitter',
			'antoinemadec/FixCursorHold.nvim'
		}
	}
	use 'nvim-neotest/neotest-python'
	use 'Issafalcon/neotest-dotnet'
	use 'haydenmeade/neotest-jest'
	use 'rouge8/neotest-rust'
end)
