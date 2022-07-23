local status_ok, tree_sitter = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
    return
end

-- Disable perl
let g:loaded_perl_provider = 0 

tree_sitter.setup {
  ensure_installed = "all", -- Only use parsers that are maintained
  ignore_install = { "phpdoc", "tree-sitter-phpdoc" },
  highlight = { -- enable highlighting
    enable = true, 
  } ,
  indent = {
    enable = true, -- default is disabled anyways
   }
} 
