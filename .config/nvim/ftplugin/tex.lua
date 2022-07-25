--------------
-- Latex
--------------
--autocmd filetype python <silent> <F5> :!latexmk -pdfxe --interaction=batchmod
--autocmd filetype latex <silent> <F5> :AsyncRunlatexmk -pdflatex='xelatex %O %S' -pdf -f --interaction=batchmod "%"
--autocmd FileType tex nnoremap <silent> <buffer> <F5> :w<CR>:AsyncRun -mode=term -pos=bottom -rows=10 latexmk -pdflatex='xelatex \%O \%S' -pdf "--interaction=batchmode" -f "%" <CR><C-\><C-N>
--autocmd FileType tex nnoremap <silent> <buffer> <F5> :w<CR>:AsyncRun -mode=term -pos=bottom -rows=10 latexmk -pdflatex='xelatex \%O \%S' -pdf -f "%" <CR><C-\><C-N>
--autocmd FileType tex nnoremap <silent> <buffer> <F5> :w<CR>:split<CR>:resize 10<CR>:ter clear;latexmk -pdflatex='xelatex \%O \%S' -pdf --interaction=batchmode -f "%" <CR><C-\><C-N>

vim.keymap.set('n', '<localleader>i', '<plug>(vimtex-info)', { desc = 'Latex info', buffer = 0 })
vim.keymap.set('n', '<localleader>I', '<plug>(vimtex-info-full)', { desc = 'Latex full info', buffer = 0 })
vim.keymap.set('n', '<localleader>t', '<plug>(vimtex-toc-open)', { desc = 'Latex open toc', buffer = 0 })
vim.keymap.set('n', '<localleader>T', '<plug>(vimtex-toc-toggle)', { desc = 'Latex toggle toc', buffer = 0 })
vim.keymap.set('n', '<localleader>q', '<plug>(vimtex-log)', { desc = 'Latex log', buffer = 0 })
vim.keymap.set('n', '<localleader>v', '<plug>(vimtex-view)', { desc = 'Latex view', buffer = 0 })
vim.keymap.set('n', '<localleader>r', '<plug>(vimtex-reverse-search)', { desc = 'Latex reverse search', buffer = 0 })
vim.keymap.set('n', '<localleader>l', '<plug>(vimtex-compile)', { desc = 'Latex compile', buffer = 0 })
vim.keymap.set('n', '<localleader>L', '<plug>(vimtex-compile-selected)', { desc = 'Latex compile selected', buffer = 0 })
vim.keymap.set('n', '<localleader>k', '<plug>(vimtex-stop)', { desc = 'Latex stop', buffer = 0 })
vim.keymap.set('n', '<localleader>K', '<plug>(vimtex-stop-all)', { desc = 'Latex stop all', buffer = 0 })
vim.keymap.set('n', '<localleader>e', '<plug>(vimtex-errors)', { desc = 'Latex errors', buffer = 0 })
vim.keymap.set('n', '<localleader>o', '<plug>(vimtex-compile-output)', { desc = 'Latex compile output', buffer = 0 })
vim.keymap.set('n', '<localleader>g', '<plug>(vimtex-status)', { desc = 'Latex status', buffer = 0 })
vim.keymap.set('n', '<localleader>G', '<plug>(vimtex-status-all)', { desc = 'Latex status all', buffer = 0 })
vim.keymap.set('n', '<localleader>c', '<plug>(vimtex-clean)', { desc = 'Latex clean', buffer = 0 })
vim.keymap.set('n', '<localleader>C', '<plug>(vimtex-clean-all)', { desc = 'Latex clean all', buffer = 0 })
vim.keymap.set('n', '<localleader>m', '<plug>(vimtex-imaps-list)', { desc = 'Latex imaps list', buffer = 0 })
vim.keymap.set('n', '<localleader>x', '<plug>(vimtex-reload)', { desc = 'Latex reload', buffer = 0 })
vim.keymap.set('n', '<localleader>X', '<plug>(vimtex-reload-state)', { desc = 'Latex reload state', buffer = 0 })
vim.keymap.set('n', '<localleader>s', '<plug>(vimtex-toggle-main)', { desc = 'Latex toggle main', buffer = 0 })
