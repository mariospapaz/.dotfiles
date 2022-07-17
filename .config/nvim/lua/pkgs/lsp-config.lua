local function lsp_options(buffer)
    vim.api.nvim_buf_set_option(buffer, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

local function lsp_highlight_document(client)
    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec(
            [[
              augroup lsp_document_highlight
                autocmd! * <buffer>
                autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
              augroup END
            ]],
            false
        )
    end
end

local function lsp_keymaps(bufnr)
    local create_command = vim.api.nvim_create_user_command
    local command = vim.api.nvim_command
    
   
    local buf_keymap = function(mode, lhs, rhs, bufnr)
        local opts = {
            buffer = bufnr or true,
            silent = true,
        }
        vim.keymap.set(mode, lhs, rhs, opts)
    end

    buf_keymap('n', 'gD', vim.lsp.buf.declaration)
    buf_keymap('n', 'gd', vim.lsp.buf.definition)
    buf_keymap('n', 'K', vim.lsp.buf.hover)
    buf_keymap('n', 'gi', vim.lsp.buf.implementation)
    buf_keymap('n', '<C-k>', vim.lsp.buf.signature_help)
    buf_keymap('n', '<leader>rn', vim.lsp.buf.rename)
    buf_keymap('n', 'gr', vim.lsp.buf.references)

    buf_keymap('n', '[d', function()
        vim.diagnostic.goto_prev({ border = 'rounded' })
    end)

    buf_keymap('n', 'gl', function()
        vim.diagnostic.open_float(0, { scope = 'line', border = 'rounded' })
    end)

    buf_keymap('n', ']d', function()
        vim.diagnostic.goto_next({ border = 'rounded' })
    end)

    buf_keymap('n', '<leader>q', vim.diagnostic.setloclist)
    buf_keymap('n', '<leader>a', function()
        command('CodeActionMenu')
    end)

    buf_keymap('v', '<leader>a', function()
        command('CodeActionMenu')
    end)

    create_command('Format', vim.lsp.buf.formatting, { bang = true })
end

local M = {}
M.setup = function()
    local config = {
        virtual_text = false,
        signs = {
            active = signs,
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = 'minimal',
            border = 'rounded',
            source = 'always',
            header = '',
            prefix = '',
        },
    }

    vim.diagnostic.config(config)

    vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = 'rounded',
    })

    vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = 'rounded',
    })
end

M.on_attach = function(client, bufnr)
    if client.name == 'tsserver' or client.name == 'sumneko_lua' then
        client.resolved_capabilities.document_formatting = false
    end

    lsp_options(bufnr)
    lsp_keymaps(bufnr)
    lsp_highlight_document(client)

    vim.cmd([[
        augroup LspFormatting
        autocmd! * <buffer>
        autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
        augroup END
    ]])
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not status_ok then
    return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M