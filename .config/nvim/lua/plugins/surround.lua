require('nvim-surround').setup({
    keymaps = { -- vim-surround style keymaps
        insert = 's',
        insert_line = 'ss',
        visual = 's',
        delete = 'ds',
        change = 'cs',
    },
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
            -- Define pairs based on function evaluations!
            ['i'] = function()
                return {
                    require('nvim-surround.utils').get_input('Enter the left delimiter: '),
                    require('nvim-surround.utils').get_input('Enter the right delimiter: '),
                }
            end,
            ['f'] = function()
                return {
                    require('nvim-surround.utils').get_input('Enter the function name: ') .. '(',
                    ')',
                }
            end,
        },
        separators = {
            ["'"] = { "'", "'" },
            ['"'] = { '"', '"' },
            ['`'] = { '`', '`' },
        },
        HTML = {
            ['t'] = 'type', -- Change just the tag type
            ['T'] = 'whole', -- Change the whole tag contents
        },
        aliases = {
            ['a'] = '<', -- Single character aliases apply everywhere
            ['b'] = '(',
            ['c'] = '{',
            ['r'] = '[',
            -- Table aliases only apply for changes/deletions
            ['q'] = { '"', "'", '`' }, -- Any quote character
            ['s'] = { ')', ']', '}', '>', "'", '"', '`' }, -- Any surrounding delimiter
        },
    },
    highlight_motion = { -- Highlight before inserting/changing surrounds
        duration = 0,
    },
})

vim.keymap.set("o", "ac", "a{", { buffer = true, desc = 'a block from { to } (curly brackets)' })
vim.keymap.set("o", "ic", "i{", { buffer = true, desc = 'inner block from { to } (curly brackets)' })
vim.keymap.set("o", "aa", "a<", { buffer = true, desc = 'a block from < to > (angled brackets)' })
vim.keymap.set("o", "ia", "i<", { buffer = true, desc = 'inner block from < to > (angled brackets)' })
vim.keymap.set("o", "ar", "a[", { buffer = true, desc = 'a block from [ to ] (rectangle brackets)' })
vim.keymap.set("o", "ir", "i[", { buffer = true, desc = 'inner block from [ to ] (rectangle brackets)' })
