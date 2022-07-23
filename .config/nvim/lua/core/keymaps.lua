local function map(mode, keys, func, opts)
    opts = vim.tbl_extend('force', opts, { noremap = true, silent = true })
    vim.keymap.set(mode, keys, func, opts)
end

local function nmap(keys, func, opts)
    map('n', keys, func, opts)
end

local function vmap(keys, func, opts)
    map('v', keys, func, opts)
end

--------------
-- Basic
--------------
-- Enter to clear highlighting
nmap('<CR>', ':noh<CR>', { desc = 'Clear highlighting' })

-- Do action without yanking into "+ register
nmap('c', '"_c', { desc = 'Copy' })
vmap('c', '"_c', { desc = 'Copy' })
nmap('x', '"_x', { desc = 'Delete char' })
vmap('x', '"_x', { desc = 'Delete char' })

----------------
-- Replace
----------------
-- add dot repeat support and rr support
function Replace_operator()
    local mode = vim.api.nvim_get_mode().mode
    local old_func = vim.go.operatorfunc
    _G.op_func_replace = function()
        local start = vim.api.nvim_buf_get_mark(0, '[')
        local finish = vim.api.nvim_buf_get_mark(0, ']')
        local replacement = vim.split(vim.fn.getreg('+'):gsub('%\n$', ''), '\n', false)
        if mode == 'V' then
            vim.api.nvim_buf_set_lines(0, start[1] - 1, finish[1], true, replacement)
        else
            vim.api.nvim_buf_set_text(0, start[1] - 1, start[2], finish[1] - 1, finish[2] + 1, replacement)
        end
        vim.go.operatorfunc = old_func
        _G.op_func_replace = nil
    end
    vim.go.operatorfunc = 'v:lua.op_func_replace'
    vim.api.nvim_feedkeys('g@', 'v', false)
end

nmap('r', '<cmd>lua Replace_operator()<CR>', { desc = 'Replace' })
vmap('r', '<cmd>lua Replace_operator()<CR>', { desc = 'Replace' })
-- nmap('rr', '"_cc<C-r>+<BS><esc>', { desc = 'Replace line' })
