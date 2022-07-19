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
-- Replace object with default register without yanking replaced text
nmap('r', '\'"_c\' . (nr2char(getchar())) . (nr2char(getchar())) . "<C-r>+<esc>"', { expr = true })
-- Two character replace motions
nmap('rr', '"_cc<C-r>+<BS><esc>', { desc = 'Replace line' })
nmap('r0', '"_c0<C-r>+<BS><esc>', { desc = 'Replace to start of line' })
nmap('r$', '"_c$<C-r>+<BS><esc>', { desc = 'Replace to end of line' })
nmap('r^', '"_c^<C-r>+<BS><esc>', { desc = 'Replace to start of line not including char' })
nmap('rw', '"_cw<C-r>+<esc>', { desc = 'Replace word' })
nmap('rW', '"_cW<C-r>+<esc>', { desc = 'Replace Word' })
