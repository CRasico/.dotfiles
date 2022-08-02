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

    -- Rust Programming Help
    use 'rust-lang/rust.vim'
end)
