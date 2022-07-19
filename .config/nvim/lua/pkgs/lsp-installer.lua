

local status_ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
if not status_ok then
    return
end


local servers = {} 

-- Lua moment 
servers['sumneko_lua'] = { Lua = { diagnostics = { globals = { 'vim', 'use' }}}}
servers['pyright'] = require('pkgs.lsps.pyright') 
servers['bashls'] = "" 
servers['clangd'] = "" 
servers['cmake'] = "" 
servers['dockerls'] = "" 
servers['eslint'] = "" 
servers['gopls'] = "" 
servers['html'] = "" 
servers['jdtls'] = ""  
servers['jsonls'] = "" 
servers['rust_analyzer'] = "" 
servers['sqls'] = "" 
servers['yamlls'] = ""

lsp_installer.on_server_ready(function(server)
    local opts = {
      on_attach = require('pkgs.lsp-config').on_attach,
      capabilities = require('pkgs.lsp-config').capabilities,
    } 
    for index, key in ipairs(servers) do        
        opts = vim.tbl_deep_extend('force', key, opts) 
    end  
    server:setup(opts)
end) 
