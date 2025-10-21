vim.o.number = true
vim.o.relativenumber = false
vim.o.wrap = true
vim.o.tabstop = 2
vim.o.swapfile = false
vim.o.scrolloff = 10

-- keymaps
vim.g.mapleader = " "
vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>e', ':lua vim.diagnostic.open_float()<CR>')
--vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)

vim.pack.add({
				{ src = "https://github.com/nyoom-engineering/oxocarbon.nvim" },
				{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
				{ src = "https://github.com/neovim/nvim-lspconfig" },
				{ src = "https://github.com/mason-org/mason.nvim" },
				{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
				{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
				{ src = "https://github.com/nvim-mini/mini.pick" },
				{ src = "https://github.com/nvim-mini/mini.files" },
				{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
				{ src = "https://github.com/akinsho/toggleterm.nvim" },
				{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
})

-- LSP setup with auto install 
require "mason".setup()
require "mason-lspconfig".setup()
require "mason-tool-installer".setup({
				ensure_installed = {
								"lua_ls",
								"pylsp",
								"stylua",
								"pyright",
								"jdtls"
				}
})
-- fixes the undefined 'vim' global
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = {
          'vim',
          'require'
        },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
})

-- enable inline diagnostics
vim.diagnostic.enable = true
vim.diagnostic.config({
        virtual_lines = true,
      })

-- language parser and better syntax highlighting
local languages = {"python", "java", "rust", "c", "lua", "vim", "vimdoc", "markdown" }
require "nvim-treesitter".install(languages)
require "nvim-treesitter".setup({
				highlight = { enable = true },
				indent = { enable = true }
})
-- starts treesitter only in specific filetypes for speed
vim.api.nvim_create_autocmd('FileType', {
				pattern = languages,
				callback = function()
								vim.treesitter.start()
								-- enable indentation on Tree-sitter
								vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
})

-- quick terminal in nvim
require "toggleterm".setup({
				open_mapping = "<C-t>",
				direction = "float",
})

require "mini.pick".setup()
require "mini.files".setup()
require "render-markdown".setup()

vim.cmd("colorscheme oxocarbon")
