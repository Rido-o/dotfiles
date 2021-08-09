require("which-key").setup {
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
    operators = { gc = "Comments" },
    key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        -- ["<space>"] = "SPC",
        -- ["<cr>"] = "RET",
        -- ["<tab>"] = "TAB",
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
    },
    window = {
        border = "none", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    },
    layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "left", -- align columns left, center or right
    },
    ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
    show_help = true, -- show help message on the command line when the popup is visible
    triggers = "auto", -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
    triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = { "j", "k" },
        v = { "j", "k" },
    },
}

vim.g.mapleader = ' '

local wk = require('which-key')

wk.register({
    -- Single Mappings
    s = {':wincmd s' , 'Horizontal split'},
    v = {':wincmd v' , 'Vertical split'},
    h = {':wincmd h' , 'Move left'},
    j = {':wincmd j' , 'Move down'},
    k = {':wincmd k' , 'Move up'},
    l = {':wincmd l' , 'Move right'},
    u = {'gt' , 'Next tab'},
    y = {'gT' , 'Previous tab'},
    w = {'w' , 'Write'},
    q = {'q' , 'Quit'},
    n = {':call NERDTreeToggleInCurDir()' , 'Toggle file explorer'},
    U = {':UndotreeToggle' , 'Open undo tree'},           -- Undo tree toggle
    d = {':NnnPicker' , 'Open nnn'},
    S = {':Startify' , 'Open start screen'},              -- Open startify

    -- Buffers
    u = {':bn' , 'Next buffer'},
    y = {':bp' , 'Previous Buffer'},
    b = {
        name = '+Buffers',
        q = {':Bdelete' , 'Close buffer'},
        --d = {':cd %:p:h|call Mapff()', 'Change CWD to file directory'},
        f = {'gf' , 'Open file'},
        s = {':wincmd f', 'Open file in split'},
        v = {':vertical wincmd f', 'Open file in vert split'},
        t = {':wincmd gf', 'Open file in tab'},
        Q = {':w|%bd|e#|bd#', 'Close all except current'},
    },

    -- Airline buffer maps
    -- vim.g.airline#extensions#tabline#buffer_idx_mode = 1
    ['1'] = {'<Plug>AirlineSelectTab1' , 'Buffer 1'},
    ['2'] = {'<Plug>AirlineSelectTab2' , 'Buffer 2'},
    ['3'] = {'<Plug>AirlineSelectTab3' , 'Buffer 3'},
    ['4'] = {'<Plug>AirlineSelectTab4' , 'Buffer 4'},
    ['5'] = {'<Plug>AirlineSelectTab5' , 'Buffer 5'},
    ['6'] = {'<Plug>AirlineSelectTab6' , 'Buffer 6'},
    ['7'] = {'<Plug>AirlineSelectTab7' , 'Buffer 7'},
    ['8'] = {'<Plug>AirlineSelectTab8' , 'Buffer 8'},
    ['9'] = {'<Plug>AirlineSelectTab9' , 'Buffer 9'},

    -- NerdCommenter
    c = {
        name = '+Comment',
        c = {'<plug>NERDCommenterComment' , 'Comment'},
        n = {'<plug>NERDCommenterNested' , 'Nested comment'},
        SPC = {'<plug>NERDCommenterToggle' , 'Toggle comment'},
        m = {'<plug>NERDCommenterMinimal' , 'Minimal comment'},
        i = {'<plug>NERDCommenterInvert' , 'Invert comment'},
        s = {'<plug>NERDCommenterSexy' , 'Sexy comment'},
        y = {'<plug>NERDCommenterYank' , 'Yank and comment'},
        --$ = {'<plug>NERDCommenterToEOL' , 'Replace to end of line'},
        A = {'<plug>NERDCommenterAppend' , 'Append comment'},
        a = {'<plug>NERDCommenterAltDelims' , 'Comment and insert'},
        l = {'<plug>NERDCommenterAlignLeft' , 'Comment aligned left'},
        b = {'<plug>NERDCommenterAlignBoth' , 'Comment aligned both'},
        u = {'<plug>NERDCommenterUncomment' , 'Uncomment'},
    },

    -- Fugitive
    g = {
        name = '+Git',
        i = {':Git init', 'Git init'},
        a = {':Git add .', 'Git add all'},
        c = {':Git commit', 'Git commit'},
        A = {':Git commit --amend --no-edit -a', 'Git amend last commit'},
        r = {':Git reset', 'Git unstage all'},
        l = {':Git log --decorate --pretty=format:"%h - %an, %ar : %s"', 'Git pretty log'},
        L = {':Git log', 'Git raw log'},
        s = {':Git status', 'Git status'},
        b = {':Git branch', 'Git branches'},
        d = {':Git diff', 'Git diff'},
        I = {':!touch .gitignore', 'Create git ignore'},
        t = {':SignifyToggle', 'Toggle signs'},
        T = {':SignifyToggleHighlight', 'Toggle highlights'},
    },

    -- Fzf
    f = {
        name = '+Find',
        f = {'' , 'Find files'},
        F = {':Files' , 'Find files'},
        o = {':History' , 'Find MRU'},
        e = {':History:' , 'Search command history'},
        E = {':Commands' , 'Find commands'},
        b = {':Buffers' , 'Find buffers'},
        s = {':Colors' , 'Find colorschemes'},
        c = {':Commits' , 'Find commits'},
        C = {':BCommits' , 'Find buffer commits'},
        w = {':Windows' , 'Find windows'},
        l = {':Lines' , 'Find lines in open buffers'},
        L = {':BLines' , 'Find lines in current buffer'},
        g = {':GFiles --cached --others --exclude-standard' , 'Find git files'},
    },

    -- Vimwiki
    W = {
        name = '+Vimwiki',
        w = {'<plug>VimwikiIndex' , 'Open Vimwiki'},
        i = {'<plug>VimwikiDiaryIndex' , 'Open Vimwiki diary'},
        s = {'<plug>VimwikiUISelect' , 'Select Vimwiki'},
        d = {'<plug>VimwikiDeleteFile' , 'Delete current file'},
        H = {'<plug>Vimwiki2HTMLBrowse' , 'Convert to HTML and browse'},
        h = {'<plug>Vimwiki2HTMl' , 'Convert to HTML'},
        n = {'<plug>VimwikiGoto' , 'Goto'},
        r = {'<plug>VimwikiRenameFile' , 'Rename current file'},
        I = {'<plug>VimwikiDiaryGenerateLinks' , 'Generate links'},
        t = {'<plug>VimwikiMakeDiaryNote' , 'Todays diary'},
        y = {'<plug>VimwikiMakeYesterdayDiaryNote' , 'Yesterdays diary'},
        m = {'<plug>VimwikiMakeTomorrowDiaryNote' , 'Tomorrows diary'},
    },

    -- Coc
    --a = {
        --name = '+Coc',
        --a = {'<plug>(coc-codeaction)' , 'Line action'},
        --d = {'<plug>(coc-definition)' , 'Definition'},
        --r = {'<plug>(coc-references)' , 'References'},
        --t = {'<plug>(coc-type-definition)' , 'Type definition'},
        --m = {'<plug>(coc-rename)' , 'Rename'},
        --D = {'<plug>(coc-declaration)' , 'Declaration'},
        --i = {'<plug>(coc-implementation)' , 'Implementation'},
        --f = {'<plug>(coc-format)' , 'Format'},
        --q = {'<plug>(coc-fix-current)' , 'Quickfix'},
        --c = {'<plug>(coc-codelens-action)' , 'Code lens'},
        --n = {'<plug>(coc-diagnostic-next)' , 'Next diagnostic'},
        --N = {'<plug>(coc-diagnostic-next-error)' , 'Next error'},
        --I = {':CocList diagnostics' , 'Diagnostics'},
        --o = {':CocList outline' , 'Search outline'},
        --s = {':CocList -l symbols' , 'References-'},
        --C = {':CocConfig' , 'Open config lens'},
        --u = {':CocUpdate' , 'Update Coc'},
        --E = {':CocDisable' , 'Disable Coc'},
        --e = {':CocEnable' , 'Enable Coc'},
    --},

    -- Toggle settings
    t = {
        name = '+Toggle',
        c = {':call ColorColumn()' , 'Toggle color column'},
    }
}, { prefix = '<leader>' })
