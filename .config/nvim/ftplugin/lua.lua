local function map(lhs, rhs, opts)
    opts = vim.tbl_extend('force', opts, { buffer = 0 })
    vim.keymap.set('n', '<localleader>' .. lhs, rhs, opts)
end

map('a', function()
    print('hello')
end, { desc = 'Print hello' })
