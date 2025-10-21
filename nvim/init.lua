vim.o.number = true
vim.o.relativenumber = false
vim.o.wrap = false
vim.o.tabstop = 2
vim.o.swapfile = false
vim.o.scrolloff = 10

-- keymaps
vim.g.mapleader = " "
vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
--vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)

vim.pack.add({
				{ src = "https://github.com/nyoom-engineering/oxocarbon.nvim" }, 
				-- language parser and better syntax highlighting
				{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
				{ src = "https://github.com/nvim-mini/mini.pick" },
				{ src = "https://github.com/nvim-mini/mini.files" },
				{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
				{ src = "https://github.com/mason-org/mason.nvim" },
				{ src = "https://github.com/akinsho/toggleterm.nvim" },
				{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
})

require "mason".setup()

local languages = {"python", "java", "rust", "c", "lua", "vim", "vimdoc", "markdown" }
require "nvim-treesitter".install(languages)
require "nvim-treesitter".setup({
				highlight = { enable = true },
				indent = { enable = true }
})
vim.api.nvim_create_autocmd('FileType', {
				pattern = languages,
				callback = function()
								vim.treesitter.start()
								-- enable indentation on Tree-sitter
								vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
})

require "toggleterm".setup({
				open_mapping = "<C-t>",
				direction = "float",
}) 

require "mini.pick".setup()
require "mini.files".setup()
require "render-markdown".setup()

vim.cmd("colorscheme oxocarbon")
