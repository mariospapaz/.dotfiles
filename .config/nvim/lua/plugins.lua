local fn = vim.fn
local command = vim.api.nvim_command

-- Automatically install packer
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path,
    })
    print('Installing packer close and reopen Neovim...')
    command('packadd packer.nvim')
end



local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    return
end

packer.startup(function()
    use 'wbthomason/packer.nvim'
    
    use 'savq/melange'
    
    use 'nvim-treesitter/nvim-treesitter'
    
    use 'williamboman/nvim-lsp-installer'
    
    use 'hrsh7th/cmp-nvim-lsp'
    
    use 'hrsh7th/cmp-buffer'
    
    use 'hrsh7th/cmp-path'
    
    use 'ahmedkhalf/project.nvim' 

    use 'hrsh7th/cmp-cmdline'
    
    use 'hrsh7th/nvim-cmp'
    
    use 'goolord/alpha-nvim'
    
    use 'saadparwaiz1/cmp_luasnip'
    
    use 'L3MON4D3/LuaSnip'

    use 'andweeb/presence.nvim'

    use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP

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
