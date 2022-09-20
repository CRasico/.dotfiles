require('neotest').setup({
	adapters = {
		require('neotest-python'),
		require('neotest-jest'),
		require('neotest-dotnet'),
		require('neotest-rust')
	}
})

map('n', '<leader>ut', "<Cmd>lua require('neotest').run.run() <CR>")
map('n', '<leader>uw', "<Cmd>lua require('neotest').output.open() <CR>")
map('n', '<leader>us', "<Cmd>lua require('neotest').summary.open() <CR>")
