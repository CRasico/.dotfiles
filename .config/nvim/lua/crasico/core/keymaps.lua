local keymap = vim.keymap

-- window navigation
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move left one window" })
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move right one window" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- tab management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- yanking
keymap.set("v", "<leader>y", '"+y', { desc = "Yank to clipboard" })
keymap.set("n", "<leader>y", '"+y', { desc = "Yank to clipboard" })

-- pasting
keymap.set("n", "<leader>p", '"+p', { desc = "Paste from clipboard" })
keymap.set("v", "<leader>p", '"+p', { desc = "Paste from clipboard" })
