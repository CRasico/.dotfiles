require('neotest').setup({
	adapters = {
		require('neotest-python'),
		require('neotest-jest')({
			jestCommand = "yarn test",
			cwd = function(path)
				return vim.fn.getcwd()
			end,
		}),
		require('neotest-dotnet'),
		require('neotest-rust')
	}
})

map('n', '<leader>ut', "<Cmd>lua require('neotest').run.run() <CR>")
map('n', '<leader>us', "<Cmd>lua require('neotest').run.run({ suite = true}) <CR>")
map('n', '<leader>tw', "<Cmd>lua require('neotest').output.open() <CR>")
map('n', '<leader>ts', "<Cmd>lua require('neotest').summary.open() <CR>")
