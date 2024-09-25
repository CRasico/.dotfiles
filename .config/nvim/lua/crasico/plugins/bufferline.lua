return {
    "akinsho/bufferline.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local bufferline = require("bufferline")

        bufferline.setup()

        local keymap = vim.keymap
        keymap.set("n", "<leader>h", "<cmd>BufferLineCyclePrev<cr>", { desc = "Buffer Cycle Left" })
        keymap.set("n", "<leader>l", "<cmd>BufferLineCycleNext<cr>", { desc = "Buffer Cycle Right" })
        keymap.set("n", "<leader>x", "<cmd>bd<cr>", { desc = "Close Current Buffer" })
    end,
}
