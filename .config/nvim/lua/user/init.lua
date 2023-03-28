local config = {
  header = {
    "Welcome to Cam's Neovim"
  },
  colorscheme = "gruvbox-material",
  plugins = {
    init = {
      { "sainnhe/gruvbox-material" },
      { "folke/tokyonight.nvim" },
      { "xiyaowong/nvim-transparent" },
      { "nvim-neotest/neotest",
        requires = {
          "nvim-lua/plenary.nvim",
          "nvim-treesitter/nvim-treesitter",
          "antoinemadec/FixCursorHold.nvim",
          "haydenmeade/neotest-jest",
          "rouge8/neotest-rust",
        },
        config = function() 
          require("neotest").setup({
            adapters = {
              require("neotest-jest")({
                jestCommand = "npm test --",
                jestConfigFile = "custom.jest.config.ts",
                env = { CI = true},
                cwd = function(path)
                  return vim.fn.getcwd()
                end,
              }),
              require("neotest-rust"),
            }
          })
        end,
      }
    },
  },
  options = {
    g = {
      transparent_enabled = true
    }
  },
  mappings = {
    n = {
      ["<leader>utt"] = {'<cmd>:lua require("neotest").run.run()<cr>', desc="Run Nearest Test" },
      ["<leader>utf"] = {'<cmd>:lua require("neotest").run.run(vim.fn.expand("%"))<cr>', desc="Run Unit Tests In File" },
      ["<leader>uto"] = {'<cmd>:lua require("neotest").output.toggle()<cr>', desc="Open Test Output" },
      ["<leader>uts"] = {'<cmd>:lua require("neotest").summary.toggle()<cr>', desc="Open Test Summary from Project"}
    }
  }
}

return config;
