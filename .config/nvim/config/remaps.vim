" Remaps
let g:mapleader = "\<Space>"
let g:maplocalleader = ','

" Splits
nnoremap <silent> <leader>s :wincmd s<CR>
nnoremap <silent> <leader>v :wincmd v<CR>
nnoremap <silent> <leader>h :wincmd h<CR>
nnoremap <silent> <leader>j :wincmd j<CR>
nnoremap <silent> <leader>k :wincmd k<CR>
nnoremap <silent> <leader>l :wincmd l<CR>

" Tabs
"nnoremap <silent> <leader>u gt
"nnoremap <silent> <leader>y gT

" Buffers
"nnoremap <silent> <leader>1 :bfirst<CR>
"nnoremap <silent> <leader>2 :bfirst<CR>:bn<CR>
"nnoremap <silent> <leader>3 :bfirst<CR>:2bn<CR>
"nnoremap <silent> <leader>4 :bfirst<CR>:3bn<CR>
"nnoremap <silent> <leader>5 :bfirst<CR>:4bn<CR>
"nnoremap <silent> <leader>6 :bfirst<CR>:5bn<CR>
"nnoremap <silent> <leader>7 :bfirst<CR>:6bn<CR>
"nnoremap <silent> <leader>8 :bfirst<CR>:7bn<CR>
"nnoremap <silent> <leader>9 :bfirst<CR>:8bn<CR>
nnoremap <silent> <leader>u :bn<CR>
nnoremap <silent> <leader>y :bp<CR>
nnoremap <silent> <leader>bq :bd<CR>
nnoremap <silent> <leader>bd :cd %:p:h<CR>

" Airline jump to buffer number
let g:airline#extensions#tabline#buffer_idx_mode = 1
nnoremap <silent> <leader>1 <Plug>AirlineSelectTab1
nnoremap <silent> <leader>2 <Plug>AirlineSelectTab2
nnoremap <silent> <leader>3 <Plug>AirlineSelectTab3
nnoremap <silent> <leader>4 <Plug>AirlineSelectTab4
nnoremap <silent> <leader>5 <Plug>AirlineSelectTab5
nnoremap <silent> <leader>6 <Plug>AirlineSelectTab6
nnoremap <silent> <leader>7 <Plug>AirlineSelectTab7
nnoremap <silent> <leader>8 <Plug>AirlineSelectTab8
nnoremap <silent> <leader>9 <Plug>AirlineSelectTab9

" Writing and quiting
nnoremap <silent> <leader>w :w<CR>
nnoremap <silent> <leader>q :q<CR>

" Fast scrolling
nnoremap <silent> <C-j> <C-d>
nnoremap <silent> <C-k> <C-u>

" Snippet Jumping
"inoremap ,<Space> <Esc>/<++><Enter>"_c4l

" Pairs
"inoremap <silent> " ""<Left>
"inoremap <silent> ' ''<Left>
inoremap <silent> ( ()<Left>
inoremap <silent> { {}<Left>
inoremap <silent> [ []<Left>

" Replace
nnoremap <silent> <leader>rw viwpgvy
nnoremap <silent> <leader>rl Vpgvy
nnoremap <silent> <leader>rs vispgvy
nnoremap <silent> <leader>rp vippgvy
nnoremap <silent> <leader>r" vi"pgvy
nnoremap <silent> <leader>r' vi'pgvy
nnoremap <silent> <leader>r( vi(pgvy
nnoremap <silent> <leader>r{ vi{pgvy
nnoremap <silent> <leader>r[ vi[pgvy

" Git Fugitive
nnoremap <silent> <leader>gi :Git init<CR>
nnoremap <silent> <leader>ga :Git add<CR>
nnoremap <silent> <leader>gc :Git commit<CR>
nnoremap <silent> <leader>gA :Git commit --amend --no-edit -a<CR>
nnoremap <silent> <leader>gl :Git log --pretty=format:"%h - %an, %ar : %s"<CR>
nnoremap <silent> <leader>gL :Git log<CR>
nnoremap <silent> <leader>gs :Git status<CR>
nnoremap <silent> <leader>gb :Git branch<CR>
nnoremap <silent> <leader>gd :Git diff<CR>
nnoremap <silent> <leader>gI :!touch .gitignore<CR>

" Signfy
nnoremap <silent> <leader>gt :SignifyToggle<CR>
nnoremap <silent> <leader>gT :SignifyToggleHighlight<CR>

" CtrlP
nnoremap <silent> <leader>f :CtrlP<CR>
nnoremap <silent> <leader>o :CtrlPMRUFiles<CR>

" UndoTree
nnoremap <silent> <leader>U :UndotreeToggle<CR>

" Startify
nnoremap <silent> <leader>S :Startify<CR>

" Prettier
nnoremap <silent> <leader>p :Prettier<CR>
