local lib = require("neotest.lib");
local dotnetNeotestAdaper = require("neotest-dotnet");
dotnetNeotestAdaper.root = lib.files.match_root_pattern("*.sln");

local config = {
  header = {
    "Welcome to Cam's Neovim"
  },
  colorscheme = "tokyonight",
  plugins = {
    init = {
      { "folke/tokyonight.nvim" },
      { "xiyaowong/nvim-transparent" },
      { "nvim-neotest/neotest",
        requires = {
          "nvim-treesitter/nvim-treesitter",
          "antoinemadec/FixCursorHold.nvim",
          "nvim-lua/plenary.nvim",
          "vim-test/vim-test",
          "nvim-neotest/neotest-plenary",
          "nvim-neotest/neotest-vim-test",
          "nvim-neotest/neotest-python",
          "haydenmeade/neotest-jest",
          "rouge8/neotest-rust",
          "Issafalcon/neotest-dotnet"
        },
        config = function()
          require("neotest").setup({
            log_level = vim.log.levels.DEBUG,
            adapters = {
              require("neotest-python")({
                dap = { justMyCode = false }
              }),
              require("neotest-plenary"),
              require("neotest-jest")({
                jestCommand = "npm test --",
                env = { CI = true },
                cwd = function(path)
                  return vim.fn.getcwd()
                end,
              }),
              require("neotest-rust"),
              dotnetNeotestAdaper,
              require("neotest-vim-test")({
                ignore_file_types = { "python", "vim", "lua", "cs" },
              }),
            }
          })
        end,
      }
    },
    treesitter = {
      ensure_installed = { "c_sharp", "lua" },
      highlight = { enable = true, additional_vim_regex_highlighting = false },
      autotag = { enable = true },
      rainbow = {
        enable = true,
        extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil -- Do not enable for files with more than n lines, int
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
      },
      autopairs = { enable = true }
    }
  },
  options = {
    g = {
      transparent_enabled = true
    }
  },
  mappings = {
    n = {
      ["<leader>rtt"] = { '<cmd>:lua require("neotest").run.run()<cr>', desc = "Run Nearest Test" },
      ["<leader>rtf"] = { '<cmd>:lua require("neotest").run.run(vim.fn.expand("%"))<cr>', desc = "Run Unit Tests In File" },
      ["<leader>rto"] = { '<cmd>:lua require("neotest").output.toggle()<cr>', desc = "Open Test Output" },
      ["<leader>rts"] = { '<cmd>:lua require("neotest").summary.toggle()<cr>', desc = "Open Test Summary from Project" }
    }
  }
}

return config;
