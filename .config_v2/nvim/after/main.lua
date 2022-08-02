function map(mode, lhs, rhs, opt)
    local options = { noremap = true }
    if opts then 
        options = vim.tbl_extend("force", options, opts)
    end 
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.setleader = " "

map("n", "<leader>h", "<C-w>h", "<CR>")
map("n", "<leader>j", "<C-w>j", "<CR>")
map("n", "<leader>k", "<C-w>k", "<CR>")
map("n", "<leader>l", "<C-w>l", "<CR>")

map("n", "<leader>t", ":NvimTreeToggle<CR>")
map("n", "<leader>r", ":NvimTreeRefresh<CR>")
map("n", "<leader>n", ":NvimTreeFindFile<CR>")

map("n", "<leader>f", ":Files<CR>")
map("n", "<leader>rg", ":Rg<CR>")

map("n", "<leader>=", ':exe "vertical resize " . (winwidth(0) * 5/4)<CR>', { silent = true })
map("n", "<leader>-", ':exe "vertical resize " . (winwidth(0) * 3/4)<CR>', { silent = true })
