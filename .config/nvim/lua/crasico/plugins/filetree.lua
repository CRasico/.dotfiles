return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim", -- coroutines inside of neovim
      "nvim-tree/nvim-web-devicons", -- for icons support 
      "MunifTanjim/nui.nvim", -- component library
      "3rd/image.nvim", -- image support 
    },
		config = function()
				local keymap = vim.keymap

				keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle File Explorer" })
    end
}
