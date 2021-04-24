" Plugins

" NERDTree
	let NERDTreeShowHidden=1

" Airline
	let g:airline#extensions#tabline#enabled = 1
	let g:airline_powerline_fonts = 0

	" Airline symbols
	if !exists('g:airline_symbols')
		let g:airline_symbols = {}
	endif
	let g:airline_left_sep = ''
	let g:airline_left_alt_sep = ''
	let g:airline_right_sep = ''
	let g:airline_right_alt_sep = ''
	let g:airline_symbols.branch = ''
	let g:airline_symbols.readonly = ''
	let g:airline_symbols.linenr = '☰'
	let g:airline_symbols.maxlinenr = ''
	let g:airline_symbols.dirty='⚡'

" Indentline
	"let g:indentLine_char_list = ['|', '¦', '┆', '┊']
	let g:indentLine_char = '┊'

" CoC
	" Use tab for completion
	inoremap <silent><expr> <TAB>
		\ pumvisible() ? "\<C-n>" :
		\ <SID>check_back_space() ? "\<TAB>" :
		\ coc#refresh()
	inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
	function! s:check_back_space() abort
		let col = col('.') - 1
		return !col || getline('.')[col - 1]  =~# '\s'
	endfunction

" Signify
	let g:signify_sign_add               = '▎'
    let g:signify_sign_delete            = '▎'
    let g:signify_sign_delete_first_line = '▎'
    let g:signify_sign_change            = '▎'

" Vimtex
	"au FileType tex ++once call vimtex#pack_install()
	let g:tex_flavor = 'latex'
	let g:vimtex_compiler_method = 'latexmk'
    let g:vimtex_compiler_latexmk = {
        \ 'build_dir' : '',
        \ 'callback' : 1,
        \ 'continuous' : 1,
        \ 'executable' : 'latexmk',
        \ 'hooks' : [],
        \ 'options' : [
        \   '-pdf',
        \   '-xelatex',
        \   '-verbose',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \}

	if g:os == "Windows"
		let g:vimtex_view_general_viewer = 'SumatraPDF'
	elseif g:os == "Linux"
		let g:vimtex_view_general_viewer = 'MuPDF'
	endif

" Autopairs
	" Disable automatically adding spaces inbetween brackets
	let g:AutoPairsMapSpace = 0

" Sneak
" 1-character enhanced 'f'
	"nmap f <Plug>Sneak_f
	"nmap F <Plug>Sneak_F
	"" visual-mode
	"xmap f <Plug>Sneak_f
	"xmap F <Plug>Sneak_F
	"" operator-pending-mode
	"omap f <Plug>Sneak_f
	"omap F <Plug>Sneak_F
	"" 1-character enhanced 't'
	"nmap t <Plug>Sneak_t
	"nmap T <Plug>Sneak_T
	"" visual-mode
	"xmap t <Plug>Sneak_t
	"xmap T <Plug>Sneak_T
	"" operator-pending-mode
	"omap t <Plug>Sneak_t
	"omap T <Plug>Sneak_T

	"Easymotion mode for sneak
	"let g:sneak#label = 1

" Quickscope
	" Only enable after hitting f, F, t, T
	let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

	" Colors used
	"highlight QuickScopePrimary guifg='#00C7DF' gui=underline ctermfg=155 cterm=underline
	"highlight QuickScopeSecondary guifg='#afff5f' gui=underline ctermfg=81 cterm=underline
	highlight QuickScopePrimary gui=underline cterm=underline
	highlight QuickScopeSecondary gui=underline cterm=underline

	" Max number of characters to highlight
	let g:qs_max_chars=150

" Vimwiki
	if g:os == "Windows"
		let g:vimwiki_list = [{'path': '~/Documents/Wiki/'}]
	elseif g:os == "Linux"
		let g:vimwiki_list = [{'path': '$HOME/.cfg/wiki/'}]
	endif

" nnn settings
	let g:nnn#set_default_mappings = 0
	let g:nnn#command = 'nnn -D'
	let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6} }
	let g:nnn#action = {
		\ 's': 'split',
		\ 'v': 'vsplit',
		\ 'l': 'e',
		\ 'e': 'e'}
