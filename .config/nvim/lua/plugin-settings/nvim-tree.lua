-----------------
-- Settings
-----------------
require('nvim-tree').setup({
    view = {
        mappings = {
            list = {
                -- Key mappings
                -- Don't won't l to go up a node if used on root folder
                { key = { 'l', 'o', 'e', '<2-LeftMouse>' }, action = 'edit' },
                -- Want h to go up a node if not closing a folder
                { key = 'h', action = 'close_node' },
                { key = '<BS>', action = 'dir_up'},
                { key = 'v', action = 'vsplit' },
                { key = 's', action = 'split' },
                { key = 'n', action = 'create' },
                -- Want <CR> to open a file if not used on a directory
                { key = '<CR>', action = 'cd' }
            },
        },
    },
    renderer = {
        indent_markers = {
            enable = true,
            icons = {
                corner = '└ ',
                edge = '│ ',
                item = '│ ',
                none = '  ',
            },
        },
    },
})

-------------------
-- Highlights
-------------------
-- a list of groups can be found at `:help nvim-tree-highlight`
-- Main window bg and text color
vim.cmd('hi! def link NvimTreeNormal Normal')
-- Window Picker color
vim.cmd('hi! def link NvimTreeWindowPicker StatusLine')
-- Seperator color
vim.cmd('hi! def link NvimTreeWinSeparator SignColumn')
