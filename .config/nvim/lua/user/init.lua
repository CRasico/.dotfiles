local config = {
  header = {
    "Welcome to Cam's Neovim"
  },
  colorscheme = "tokyonight",
  plugins = {
    init = {
      { "folke/tokyonight.nvim" },
      { "xiyaowong/nvim-transparent" },
    },
  },
  options = {
    g = {
      transparent_enabled = true
    }
  }
}

return config;
