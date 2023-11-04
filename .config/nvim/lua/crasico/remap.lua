vim.g.mapleader = " "
local keymap = vim.keymap
keymap.set("n", "<leader>pv", vim.cmd.Explore)
keymap.set("n", "<C-h>", "<C-W><C-H>")
keymap.set("n", "<C-l>", "<C-W><C-W>")
keymap.set("n", "<leader>tt", "<cmd>terminal<CR>")
keymap.set("n", "<leader>ts", "<cmd>vsplit<CR><cmd>terminal<CR>")
keymap.set("n", "<leader>ss", "<cmd>vsplit<CR>")
