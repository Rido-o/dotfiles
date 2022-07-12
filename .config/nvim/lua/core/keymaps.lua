local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

--------------
-- Basic
--------------
-- Reload Nvim
map('n', '<F2>', ':source $MYVIMRC<CR>', opts)
-- Enter to clear highlighting
map('n', '<CR>', ':noh<CR>', opts)
-- Maps escape to normal mode for terminal
-- May cause problems for terminal
--tnoremap <esc> <esc><C-\><C-N>

----------------
-- Replace
----------------
-- Replace object with default register without yanking replaced text
map('n', 'r', '\'"_c\' . (nr2char(getchar())) . (nr2char(getchar())) . "<C-r>+<esc>"', { expr = true })
-- Two character replace motions
-- * these are questionable
--nnoremap <silent> rr "_cc<esc>Vp
--nnoremap <silent> rr "_ddP
map('n', 'rr', '"_cc<C-r>+<BS><esc>', opts)
map('n', 'r0', '"_c0<C-r>+<BS><esc>', opts)
map('n', 'r$', '"_c$<C-r>+<BS><esc>', opts)
map('n', 'r^', '"_c^<C-r>+<BS><esc>', opts)

--------------
-- Latex
--------------
--autocmd filetype python <silent> <F5> :!latexmk -pdfxe --interaction=batchmod
--autocmd filetype latex <silent> <F5> :AsyncRunlatexmk -pdflatex='xelatex %O %S' -pdf -f --interaction=batchmod "%"
--autocmd FileType tex nnoremap <silent> <buffer> <F5> :w<CR>:AsyncRun -mode=term -pos=bottom -rows=10 latexmk -pdflatex='xelatex \%O \%S' -pdf "--interaction=batchmode" -f "%" <CR><C-\><C-N>
--autocmd FileType tex nnoremap <silent> <buffer> <F5> :w<CR>:AsyncRun -mode=term -pos=bottom -rows=10 latexmk -pdflatex='xelatex \%O \%S' -pdf -f "%" <CR><C-\><C-N>
--autocmd FileType tex nnoremap <silent> <buffer> <F5> :w<CR>:split<CR>:resize 10<CR>:ter clear;latexmk -pdflatex='xelatex \%O \%S' -pdf --interaction=batchmode -f "%" <CR><C-\><C-N>

------------
-- C++
------------
--Remember to use asyncrun
--Command for running cmake
--Command for building i.e make
--Command for running
--Command for generating make config
--Command for clearing build files