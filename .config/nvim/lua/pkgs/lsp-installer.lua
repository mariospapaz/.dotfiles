

local status_ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
if not status_ok then
    return
end


servers = {
  'bashls',
  'clangd',
  'cmake',
  'dockerls',
  'eslint',
  'gopls',
  'html',
  'jdtls',
  'jsonls',
  'pyright',
  'rust_analyzer',
  'sqls',
  'sumneko_lua',
  'yamlls',
}


lsp_installer.on_server_ready(function(server)
    local opts = {
      on_attach = require('pkgs.lsp-config').on_attach,
      capabilities = require('pkgs.lsp-config').capabilities,
    }

    -- remove global vim and use
    if server.name == "sumneko_lua" then
      opts = vim.tbl_deep_extend('force', { Lua = { diagnostics = { globals = { 'vim', 'use' }}}}, opts)
    end
    
    server:setup(opts)
end) 
