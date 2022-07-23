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
-- add rr support
function _G.Replace_operator(motion)
    if motion == nil then
        vim.o.operatorfunc = 'v:lua.Replace_operator'
        return 'g@'
    end
    local start = vim.api.nvim_buf_get_mark(0, '[')
    local finish = vim.api.nvim_buf_get_mark(0, ']')
    local replacement = vim.split(vim.fn.getreg('+'):gsub('%\n$', ''), '\n', false)
    if motion == 'char' then
        vim.api.nvim_buf_set_text(0, start[1] - 1, start[2], finish[1] - 1, finish[2] + 1, replacement)
    elseif motion == 'line' then
        vim.api.nvim_buf_set_lines(0, start[1] - 1, finish[1], true, replacement)
    end
end

nmap('r', _G.Replace_operator, { desc = 'Replace', expr = true })
vmap('r', _G.Replace_operator, { desc = 'Replace', expr = true })
-- nmap('rr', '"_cc<C-r>+<BS><esc>', { desc = 'Replace line' })
