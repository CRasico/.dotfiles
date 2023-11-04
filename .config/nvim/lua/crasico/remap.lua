vim.g.mapleader = " "
local keymap = vim.keymap
keymap.set("n", "<leader>pv", vim.cmd.Explore)
keymap.set("n", "<leader>h", "<C-W><C-H>")
keymap.set("n", "<leader>l", "<C-W><C-W>")
keymap.set("n", "<leader>t", "<cmd>vsplit<CR><cmd>terminal<CR>")
