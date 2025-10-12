vim.o.number = true
vim.o.relativenumber = false
vim.o.wrap = true
vim.o.tabstop = 4
vim.o.swapfile = false

-- keymaps
vim.g.mapleader = " "
vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
--vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)

vim.pack.add({
	{ src = "https://github.com/nyoom-engineering/oxocarbon.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/nvim-mini/mini.pick" },
	{ src = "https://github.com/nvim-mini/mini.files" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
})

require "mason".setup()
require "mini.pick".setup()
require "mini.files".setup()
require "render-markdown".setup()

vim.cmd("colorscheme oxocarbon")
