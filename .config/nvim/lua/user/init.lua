local config = {
  header = {
    "Welcome to Cam's Neovim"
  },
  colorscheme = "catppuccin",
  plugins = {
    init = {
      { "catppuccin/nvim" },
      { "sainnhe/gruvbox-material" },
      { "folke/tokyonight.nvim" },
      { "xiyaowong/nvim-transparent" },
      { "Decodetalkers/csharpls-extended-lsp.nvim" },
      {
        "ray-x/lsp_signature.nvim",
        config = function()
          require('lsp_signature').setup()
        end
      },
      {
        "nvim-neotest/neotest",
        requires = {
          "nvim-lua/plenary.nvim",
          "nvim-treesitter/nvim-treesitter",
          "antoinemadec/FixCursorHold.nvim",
          "haydenmeade/neotest-jest",
          "rouge8/neotest-rust",
          "Issafalcon/neotest-dotnet"
        },
        config = function()
          require("neotest").setup({
            adapters = {
              require("neotest-jest")({
                jestCommand = "npm test --",
                jestConfigFile = "custom.jest.config.ts",
                env = { CI = true },
                cwd = function(path)
                  return vim.fn.getcwd()
                end,
              }),
              require("neotest-rust"),
              require("neotest-dotnet")
            }
          })
        end,
      }
    },
    treesitter = {
      ensure_installed = { "lua", "c", "c_sharp", "rust", "typescript", "python" }
    },
    ["mason-lspconfig"] = {
      ensure_installed = { "pyright", "csharp_ls" }
    },
    ["mason-nvim-dap"] = {
      ensure_installed = { "chrome-debug-adapter", "codelldb", "debugpy", "netcoredbg" }
    },
    ["mason-null-ls"] = {
      ensure_installed = { "rustfmt", "prettier", "autoflake", "csharpier" }
    },
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
  },
}

return config;
