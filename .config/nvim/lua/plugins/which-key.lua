local status_ok, which_key = pcall(require, 'which-key')
if not status_ok then
    return
end

which_key.setup({
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
            enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
            motions = true, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true, -- bindings for prefixed with g
        },
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    operators = { gc = 'Comments', r = 'Replace' },
    key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        -- ["<space>"] = "SPC",
        -- ["<cr>"] = "RET",
        -- ["<tab>"] = "TAB",
    },
    icons = {
        breadcrumb = '»', -- symbol used in the command line area that shows your active key combo
        separator = '➜', -- symbol used between a key and it's label
        group = '+', -- symbol prepended to a group
    },
    window = {
        border = 'none', -- none, single, double, shadow
        position = 'bottom', -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    },
    layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = 'left', -- align columns left, center or right
    },
    ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
    hidden = { '<silent>', '<cmd>', '<Cmd>', '<CR>', 'call', 'lua', '^:', '^ ' }, -- hide mapping boilerplate
    show_help = true, -- show help message on the command line when the popup is visible
    triggers = 'auto', -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
    triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = { 'j', 'k' },
        v = { 'j', 'k' },
    },
})

-- Highlights
vim.api.nvim_set_hl(0, 'WhichKey', { link = 'Function' })
vim.api.nvim_set_hl(0, 'WhichKeyGroup', { link = 'Keyword' })
vim.api.nvim_set_hl(0, 'WhichKeySeparator', { link = 'DiffAdded' })
vim.api.nvim_set_hl(0, 'WhichKeyDesc', { link = 'Identifier' })
vim.api.nvim_set_hl(0, 'WhichKeyFloat', { link = 'NormalFloat' })
vim.api.nvim_set_hl(0, 'WhichKeyValue', { link = 'Comment' })

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
