local status_ok, tree_sitter = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
    return
end


tree_sitter.setup {
  ensure_installed = "all", -- Only use parsers that are maintained

  highlight = { -- enable highlighting
    enable = true, 
  } ,
  indent = {
    enable = true, -- default is disabled anyways
   }
} 