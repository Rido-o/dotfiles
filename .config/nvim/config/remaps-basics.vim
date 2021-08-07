" Replace
"nnoremap <silent> rr "_cc<esc>Vp
"nnoremap <silent> rr "_ddP
nnoremap <silent> rr "_cc<C-r>+<BS><esc>
nnoremap <silent> r0 "_c0<C-r>+<BS><esc>
nnoremap <silent> r$ "_c$<C-r>+<BS><esc>
nnoremap <silent> r^ "_c^<C-r>+<BS><esc>

" Replace object with default register without yanking replaced text
nnoremap <expr> r '"_c' . (nr2char(getchar())) . (nr2char(getchar())) . "<C-r>+<esc>"

" Reload session
nnoremap <F2> :source $MYVIMRC<CR>

" Clear highlighting on enter in normal mode
nnoremap <CR> :noh<CR>

" May cuase problems for terminal
" Maps escape to normal mode for terminal
tnoremap <esc> <esc><C-\><C-N>

" Latex
"autocmd filetype python <silent> <F5> :!latexmk -pdfxe --interaction=batchmod
"autocmd filetype latex <silent> <F5> :AsyncRunlatexmk -pdflatex='xelatex %O %S' -pdf -f --interaction=batchmod "%"
"autocmd FileType tex nnoremap <silent> <buffer> <F5> :w<CR>:AsyncRun -mode=term -pos=bottom -rows=10 latexmk -pdflatex='xelatex \%O \%S' -pdf "--interaction=batchmode" -f "%" <CR><C-\><C-N>
"autocmd FileType tex nnoremap <silent> <buffer> <F5> :w<CR>:AsyncRun -mode=term -pos=bottom -rows=10 latexmk -pdflatex='xelatex \%O \%S' -pdf -f "%" <CR><C-\><C-N>
"autocmd FileType tex nnoremap <silent> <buffer> <F5> :w<CR>:split<CR>:resize 10<CR>:ter clear;latexmk -pdflatex='xelatex \%O \%S' -pdf --interaction=batchmode -f "%" <CR><C-\><C-N>

" C++
"Remember to use asyncrun
"Command for running cmake
"Command for building i.e make
"Command for running
"Command for generating make config
"Command for clearing build files

" Python
" Run Python script
"autocmd FileType python nnoremap <silent> <buffer> <F5> :w<CR>:vsplit<CR>:ter clear;python "%"<CR>
autocmd FileType python nnoremap <silent> <buffer> <F5> :w<CR>:AsyncRun -mode=term -pos=bottom -rows=10 python "%"<CR><C-\><C-N>
" Open interactive repl
autocmd FileType python nnoremap <silent> <buffer> <F6> :w<CR>:vsplit<CR>:ter clear;python<CR>
" Benchmark python program
autocmd FileType python nnoremap <silent> <buffer> <F7> :w<CR>:AsyncRun -mode=term -pos=bottom -rows=10 hyperfine --warmup 10 "python %"<CR><C-\><C-N>
