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

------------------------
-- Global Mappings
------------------------

-- Toggle color column
function ColorColumn()
    if vim.o.colorcolumn == '0' then
        vim.o.colorcolumn = '80'
    else
        vim.o.colorcolumn = '0'
    end
end

--------------------
-- Normal Mode
--------------------
-- Needed so that filetype bindings trigger whichkey
which_key.register({
    ['<localleader>'] = { name = 'Filetype bindings' },
})

which_key.register({
    -- Single Mappings
    s = { '<CMD>wincmd s<CR>', 'Horizontal split' },
    v = { '<CMD>wincmd v<CR>', 'Vertical split' },
    h = { '<CMD>wincmd h<CR>', 'Move left' },
    j = { '<CMD>wincmd j<CR>', 'Move down' },
    k = { '<CMD>wincmd k<CR>', 'Move up' },
    l = { '<CMD>wincmd l<CR>', 'Move right' },
    w = { '<CMD>w<CR>', 'Write' },
    q = { '<CMD>q<CR>', 'Quit' },
    U = { '<CMD>UndotreeToggle<CR>', 'Open undo tree' },
    c = { '<CMD>lua require("Comment.api").toggle_current_linewise()<CR>', 'Toggle comment' },

    -- Buffers
    b = {
        name = 'Buffers',
        Q = { '<CMD>w|%bd|e#|bd#<CR>', 'Close all except current' },
    },

    f = { name = 'Find' },

    -- Lsp
    a = {
        name = 'Lsp',
        a = { '<CMD>Lspsaga code_action<CR>', 'Code action' },
        r = { '<CMD>Lspsaga rename<CR>', 'Rename' },
        f = { '<CMD>lua vim.lsp.buf.formatting()<CR>', 'Format' },
    },

    -- Fugitive
    g = {
        name = 'Git',
        i = { '<CMD>Git init<CR>', 'Git init' },
        a = { '<CMD>Git add .<CR>', 'Git add all' },
        c = { '<CMD>Git commit<CR>', 'Git commit' },
        A = { '<CMD>Git commit --amend --no-edit -a<CR>', 'Git amend last commit' },
        r = { '<CMD>Git reset<CR>', 'Git unstage all' },
        l = { '<CMD>Git log --decorate --pretty=format:"%h - %an, %ar : %s"<CR>', 'Git pretty log' },
        L = { '<CMD>Git log<CR>', 'Git raw log' },
        s = { '<CMD>Git status<CR>', 'Git status' },
        b = { '<CMD>Git branch<CR>', 'Git branches' },
        d = { '<CMD>Git diff<CR>', 'Git diff' },
        I = { '<CMD>!touch .gitignore<CR>', 'Create git ignore' },
        t = { '<CMD>SignifyToggle<CR>', 'Toggle signs' },
        T = { '<CMD>SignifyToggleHighlight<CR>', 'Toggle highlights' },
    },

    -- Vimwiki
    W = {
        name = 'Vimwiki',
        i = { '<plug>VimwikiDiaryIndex', 'Open Vimwiki diary' },
        s = { '<plug>VimwikiUISelect', 'Select Vimwiki' },
        t = { '<plug>VimwikiTabIndex', 'Tab Index' },
        w = { '<plug>VimwikiIndex', 'Open Vimwiki' },
        ['<space>'] = {
            name = 'Vimwiki Diary',
            i = { '<plug>VimwikiDiaryGenerateLinks', 'Generate links' },
            m = { '<plug>VimwikiMakeTomorrowDiaryNote', 'Tomorrows diary' },
            t = { '<plug>VimwikiTabMakeDiaryNote', 'Tab todays diary' },
            w = { '<plug>VimwikiMakeDiaryNote', 'Todays diary' },
            y = { '<plug>VimwikiMakeYesterdayDiaryNote', 'Yesterdays diary' },
        },
    },

    -- Toggle settings
    t = {
        name = 'Toggle',
        c = { '<CMD>lua ColorColumn()<CR>', 'Toggle color column' },
    },
}, { prefix = '<leader>' })

--------------------
-- Visual Mode
--------------------
which_key.register({
    c = { '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>', 'Toggle comment' },
}, { mode = 'v', prefix = '<leader>' })
