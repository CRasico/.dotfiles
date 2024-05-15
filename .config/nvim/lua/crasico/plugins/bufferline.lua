return {
	"akinsho/bufferline.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local bufferline = require("bufferline")

		bufferline.setup()

		local keymap = vim.keymap
		keymap.set("n", "<leader>h", "<cmd>BufferLineCycleNext<cr>", { desc = "Buffer Cycle Left" })
		keymap.set("n", "<leader>l", "<cmd>BufferLineCyclePrev<cr>", { desc = "Buffer Cycle Left" })
	end,
}
