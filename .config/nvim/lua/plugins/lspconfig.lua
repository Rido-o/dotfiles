local lspconfig = require('lspconfig')

-- Set lsp sign column signs
local signs = { Error = ' ', Warn = '⚠ ', Hint = ' ', Info = ' ' } -- 
for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    local function bufopts(map_desc)
        return { noremap = true, silent = true, buffer = bufnr, desc = map_desc }
    end
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    vim.keymap.set('n', '<leader>ae', vim.diagnostic.open_float, bufopts('Popup diagnostic'))
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, bufopts('Previous diagnostic'))
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, bufopts('Next diagnostic'))
    vim.keymap.set('n', '<leader>aq', vim.diagnostic.setloclist, bufopts('Show diagnostic location list'))
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts('Goto declaration'))
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts('Goto definition'))
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts('Goto references'))
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts('Goto implementation'))
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts('Popup documentation'))
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts('Popup help'))
    vim.keymap.set('n', '<leader>aw', vim.lsp.buf.add_workspace_folder, bufopts('Add workspace folder'))
    vim.keymap.set('n', '<leader>aW', vim.lsp.buf.remove_workspace_folder, bufopts('Remove workspace folder'))
    vim.keymap.set('n', '<leader>al', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts('List workspace folders'))
    vim.keymap.set('n', '<leader>aD', vim.lsp.buf.type_definition, bufopts('Goto type defintion'))
    -- vim.keymap.set('n', '<leader>ar', vim.lsp.buf.rename, bufopts)
    -- vim.keymap.set('n', '<leader>aa', vim.lsp.buf.code_action, bufopts)
    -- vim.keymap.set('n', '<leader>af', vim.lsp.buf.formatting, bufopts)
end

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Individual server settings
local settings = {
    sumneko_lua = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'pyright', 'sumneko_lua' }
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = settings[lsp]
    })
end
