local status_ok = pcall(require, 'nvim-surround')
if not status_ok then
    return
end

require('nvim-surround').setup({
    delimiters = {
        pairs = {
            ['('] = { '(', ')' },
            [')'] = { '( ', ' )' },
            ['{'] = { '{', '}' },
            ['}'] = { '{ ', ' }' },
            ['<'] = { '<', '>' },
            ['>'] = { '< ', ' >' },
            ['['] = { '[', ']' },
            [']'] = { '[ ', ' ]' },
        },
        aliases = {
            ['a'] = '<', -- Single character aliases apply everywhere
            ['b'] = '(',
            ['c'] = '{',
            ['r'] = '[',
        },
    },
})

vim.keymap.set('o', 'ac', 'a{', { buffer = true, desc = 'a block from { to } (curly brackets)' })
vim.keymap.set('o', 'ic', 'i{', { buffer = true, desc = 'inner block from { to } (curly brackets)' })
vim.keymap.set('o', 'aa', 'a<', { buffer = true, desc = 'a block from < to > (angled brackets)' })
vim.keymap.set('o', 'ia', 'i<', { buffer = true, desc = 'inner block from < to > (angled brackets)' })
vim.keymap.set('o', 'ar', 'a[', { buffer = true, desc = 'a block from [ to ] (rectangle brackets)' })
vim.keymap.set('o', 'ir', 'i[', { buffer = true, desc = 'inner block from [ to ] (rectangle brackets)' })
