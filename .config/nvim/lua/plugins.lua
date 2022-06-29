-- Lua and Lua Jit are required to use PackerSync::
-- You must self compile neovim if you dont want to have 100+ random bugs
-- git clone --depth 1 https://github.com/wbthomason/packer.nvim \
--    ~/.local/share/nvim/site/pack/packer/start/packer.nvim


local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    return
end

packer.startup(function()
    use 'wbthomason/packer.nvim'
    use 'tomasr/molokai' -- :colorscheme molokai
    use 'nvim-treesitter/nvim-treesitter'
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'saadparwaiz1/cmp_luasnip'
    use 'L3MON4D3/LuaSnip'

    use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
    }

    use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    }
  }
end) 

require('./packages')