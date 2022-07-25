--------------
-- Latex
--------------
--autocmd filetype python <silent> <F5> :!latexmk -pdfxe --interaction=batchmod
--autocmd filetype latex <silent> <F5> :AsyncRunlatexmk -pdflatex='xelatex %O %S' -pdf -f --interaction=batchmod "%"
--autocmd FileType tex nnoremap <silent> <buffer> <F5> :w<CR>:AsyncRun -mode=term -pos=bottom -rows=10 latexmk -pdflatex='xelatex \%O \%S' -pdf "--interaction=batchmode" -f "%" <CR><C-\><C-N>
--autocmd FileType tex nnoremap <silent> <buffer> <F5> :w<CR>:AsyncRun -mode=term -pos=bottom -rows=10 latexmk -pdflatex='xelatex \%O \%S' -pdf -f "%" <CR><C-\><C-N>
--autocmd FileType tex nnoremap <silent> <buffer> <F5> :w<CR>:split<CR>:resize 10<CR>:ter clear;latexmk -pdflatex='xelatex \%O \%S' -pdf --interaction=batchmode -f "%" <CR><C-\><C-N>

vim.keymap.set('<localleader>i', '<plug>(vimtex-info)', {desc = 'Latex info'} )
vim.keymap.set('<localleader>I', '<plug>(vimtex-info-full)', {desc = 'Latex full info'} )
vim.keymap.set('<localleader>t', '<plug>(vimtex-toc-open)', {desc = 'Latex open toc'} )
vim.keymap.set('<localleader>T', '<plug>(vimtex-toc-toggle)', {desc = 'Latex toggle toc'} )
vim.keymap.set('<localleader>q', '<plug>(vimtex-log)', {desc = 'Latex log'} )
vim.keymap.set('<localleader>v', '<plug>(vimtex-view)', {desc = 'Latex view'} )
vim.keymap.set('<localleader>r', '<plug>(vimtex-reverse-search)', {desc = 'Latex reverse search'} )
vim.keymap.set('<localleader>l', '<plug>(vimtex-compile)', {desc = 'Latex compile'} )
vim.keymap.set('<localleader>L', '<plug>(vimtex-compile-selected)', {desc = 'Latex compile selected'} )
vim.keymap.set('<localleader>k', '<plug>(vimtex-stop)', {desc = 'Latex stop'} )
vim.keymap.set('<localleader>K', '<plug>(vimtex-stop-all)', {desc = 'Latex stop all'} )
vim.keymap.set('<localleader>e', '<plug>(vimtex-errors)', {desc = 'Latex errors'} )
vim.keymap.set('<localleader>o', '<plug>(vimtex-compile-output)', {desc = 'Latex compile output'} )
vim.keymap.set('<localleader>g', '<plug>(vimtex-status)', {desc = 'Latex status'} )
vim.keymap.set('<localleader>G', '<plug>(vimtex-status-all)', {desc = 'Latex status all'} )
vim.keymap.set('<localleader>c', '<plug>(vimtex-clean)', {desc = 'Latex clean'} )
vim.keymap.set('<localleader>C', '<plug>(vimtex-clean-all)', {desc = 'Latex clean all'} )
vim.keymap.set('<localleader>m', '<plug>(vimtex-imaps-list)', {desc = 'Latex imaps list'} )
vim.keymap.set('<localleader>x', '<plug>(vimtex-reload)', {desc = 'Latex reload'} )
vim.keymap.set('<localleader>X', '<plug>(vimtex-reload-state)', {desc = 'Latex reload state'} )
vim.keymap.set('<localleader>s', '<plug>(vimtex-toggle-main)', {desc = 'Latex toggle main'} )
