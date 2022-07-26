local status_ok, which_key = pcall(require, 'which-key')
if not status_ok then
    return
end

which_key.setup({
    operators = { gc = 'Comments', r = 'Replace' },
    window = {
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    },
})

-- Highlights
vim.api.nvim_set_hl(0, 'WhichKeySeparator', { link = 'DiffAdded' }) -- Only one that does anything

-- Give names to prefix keys
which_key.register({
    -- Needed so that filetype bindings trigger whichkey
    ['<localleader>'] = { name = 'Filetype bindings' },
    ['<leader>'] = {
        b = { name = 'Buffers' },
        f = { name = 'Find' },
        a = { name = 'Lsp' },
        g = { name = 'Git' },
        W = {
            name = 'Vimwiki',
            ['<space>'] = { name = 'Vimwiki Diary' },
        },
        t = { name = 'Toggle' },
    }
})
