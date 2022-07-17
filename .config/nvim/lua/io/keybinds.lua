vim.bo.expandtab = true
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2

local set_global_variable = vim.api.nvim_set_var
local keymap = function(mode, lhs, rhs)
    local opts = { silent = true }
    vim.keymap.set(mode, lhs, rhs, opts)
end
keymap('', '<Space>', '<Nop>')
keymap('n', '<c-s>', ':w<CR>')
keymap('i', '<c-s>', '<Esc>:w<CR>a')
set_global_variable('mapleader', ' ')
set_global_variable('maplocalleader', ' ')


local telescope = "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({previewer = false}))<CR>"

keymap('n', '<Leader>f', telescope)

