local dap = require('dap')
local dapui = require('dapui')
local dappython = require('dap-python')
local csharp = require('after.csharp') 

dapui.setup({
	layouts = {
    {
      elements = {
      -- Elements can be strings or table with id and size keys.
        "watches",
        "breakpoints",
        "stacks",
        { id = "scopes", size = 0.25 },
      },
      size = 40, -- 40 columns
      position = "left",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 7, -- 7 columns
      position = "bottom",
    },
  }
})

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

function map(mode, lhs, rhs, opt)
    local options = { noremap = true }
    if opts then 
        options = vim.tbl_extend("force", options, opts)
    end 
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<leader><leader>", ":DapTerminate<CR>")
map("n", "<Up>", ":DapContinue<CR>")
map("n", "<Down>", ":DapStepOver<CR>")
map("n", "<Right>", ":DapStepInto<CR>")
map("n", "<Left>", ":DapStepOut<CR>")
map("n", "<Leader>b", ":DapToggleBreakpoint<CR>")

dappython.setup('~/.virtualenvs/debugpy/bin/python')
csharp.setup()
