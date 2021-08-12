local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

--------------
-- Basic
--------------
-- Reload Nvim
map ('n', '<F2>', ':source $MYVIMRC<CR>', opts)
-- Enter to clear highlighting
map ('n', '<CR>', ':noh<CR>', opts)

----------------
-- Replace
----------------
-- Replace object with default register without yanking replaced text
map ('n', 'r', '\'"_c\' . (nr2char(getchar())) . (nr2char(getchar())) . "<C-r>+<esc>"', { expr = true })
-- Two character replace motions
-- * these are questionable
map ('n', 'rr', '"_cc<C-r>+<BS><esc>', opts)
map ('n', 'r0', '"_c0<C-r>+<BS><esc>', opts)
map ('n', 'r$', '"_c$<C-r>+<BS><esc>', opts)
map ('n', 'r^', '"_c^<C-r>+<BS><esc>', opts)
