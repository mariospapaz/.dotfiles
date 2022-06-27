-- Lua and Lua Jit are required to use PackerSync::
-- You must self compile neovim if you dont want to have 100+ random bugs
vim.bo.expandtab = true
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2


local keymap = vim.api.nvim_set_keymap

keymap('n', '<c-s>', ':w<CR>', {})
keymap('i', '<c-s>', '<Esc>:w<CR>a', {})

local opts = { noremap = true }

keymap('n', '<c-j>', '<c-w>j', opts)

keymap('n', '<c-j>', '<c-w>j', opts)
keymap('n', '<c-h>', '<c-w>h', opts)
keymap('n', '<c-k>', '<c-w>k', opts)
keymap('n', '<c-l>', '<c-w>l', opts)

-- You need 'Packer' package manager in order to use this script
-- git clone --depth 1 https://github.com/wbthomason/packer.nvim \
--    ~/.local/share/nvim/site/pack/packer/start/packer.nvim

require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'tomasr/molokai' -- :colorscheme molokai
  use 'nvim-treesitter/nvim-treesitter'
end)

vim.g.colors_name = 'molokai'

local configs = require'nvim-treesitter.configs'
configs.setup {
  ensure_installed = "maintained", -- Only use parsers that are maintained

  highlight = { -- enable highlighting
    enable = true, 
  },
  indent = {
    enable = true, -- default is disabled anyways
  }
}


