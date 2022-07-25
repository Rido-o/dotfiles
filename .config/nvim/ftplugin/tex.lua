--------------
-- Latex
--------------
--autocmd filetype python <silent> <F5> :!latexmk -pdfxe --interaction=batchmod
--autocmd filetype latex <silent> <F5> :AsyncRunlatexmk -pdflatex='xelatex %O %S' -pdf -f --interaction=batchmod "%"
--autocmd FileType tex nnoremap <silent> <buffer> <F5> :w<CR>:AsyncRun -mode=term -pos=bottom -rows=10 latexmk -pdflatex='xelatex \%O \%S' -pdf "--interaction=batchmode" -f "%" <CR><C-\><C-N>
--autocmd FileType tex nnoremap <silent> <buffer> <F5> :w<CR>:AsyncRun -mode=term -pos=bottom -rows=10 latexmk -pdflatex='xelatex \%O \%S' -pdf -f "%" <CR><C-\><C-N>
--autocmd FileType tex nnoremap <silent> <buffer> <F5> :w<CR>:split<CR>:resize 10<CR>:ter clear;latexmk -pdflatex='xelatex \%O \%S' -pdf --interaction=batchmode -f "%" <CR><C-\><C-N>

local function map(lhs, rhs, opts)
    opts = vim.tbl_extend('force', opts, { buffer = 0 })
    vim.keymap.set('n', '<localleader>' .. lhs, rhs, opts)
end

map('i', '<plug>(vimtex-info)', { desc = 'Latex info' })
map('I', '<plug>(vimtex-info-full)', { desc = 'Latex full info' })
map('t', '<plug>(vimtex-toc-open)', { desc = 'Latex open toc' })
map('T', '<plug>(vimtex-toc-toggle)', { desc = 'Latex toggle toc' })
map('q', '<plug>(vimtex-log)', { desc = 'Latex log' })
map('v', '<plug>(vimtex-view)', { desc = 'Latex view' })
map('r', '<plug>(vimtex-reverse-search)', { desc = 'Latex reverse search' })
map('l', '<plug>(vimtex-compile)', { desc = 'Latex compile' })
map('L', '<plug>(vimtex-compile-selected)', { desc = 'Latex compile selected' })
map('k', '<plug>(vimtex-stop)', { desc = 'Latex stop' })
map('K', '<plug>(vimtex-stop-all)', { desc = 'Latex stop all' })
map('e', '<plug>(vimtex-errors)', { desc = 'Latex errors' })
map('o', '<plug>(vimtex-compile-output)', { desc = 'Latex compile output' })
map('g', '<plug>(vimtex-status)', { desc = 'Latex status' })
map('G', '<plug>(vimtex-status-all)', { desc = 'Latex status all' })
map('c', '<plug>(vimtex-clean)', { desc = 'Latex clean' })
map('C', '<plug>(vimtex-clean-all)', { desc = 'Latex clean all' })
map('m', '<plug>(vimtex-imaps-list)', { desc = 'Latex imaps list' })
map('x', '<plug>(vimtex-reload)', { desc = 'Latex reload' })
map('X', '<plug>(vimtex-reload-state)', { desc = 'Latex reload state' })
map('s', '<plug>(vimtex-toggle-main)', { desc = 'Latex toggle main' })
