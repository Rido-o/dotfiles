" Plugins

" NERDTree
	"let NERDTreeShowHidden=1

" Airline
	"let g:airline#extensions#tabline#enabled = 1
	"let g:airline_powerline_fonts = 0

	" Airline symbols
	"if !exists('g:airline_symbols')
		"let g:airline_symbols = {}
	"endif
	"let g:airline_left_sep = ''
	"let g:airline_left_alt_sep = ''
	"let g:airline_right_sep = ''
	"let g:airline_right_alt_sep = ''
	"let g:airline_symbols.branch = ''
	"let g:airline_symbols.readonly = ''
	"let g:airline_symbols.linenr = '☰'
	"let g:airline_symbols.maxlinenr = ''
	"let g:airline_symbols.dirty='⚡'

" Indentline
	"let g:indentLine_char_list = ['|', '¦', '┆', '┊']
    "let g:indentLine_setColors = 0
    "let g:indentLine_defaultGroup = 'SpecialKey'
	"let g:indentLine_char = '┊'
    "let g:indentLine_fileTypeExclude = [""]

" nvim-compe
	inoremap <silent><expr> <C-Space> compe#complete()
	inoremap <silent><expr> <CR>      compe#confirm('<CR>')
	"inoremap <silent><expr> <CR>      compe#confirm(luaeval("require 'nvim-autopairs'.autopairs_cr()"))
	inoremap <silent><expr> <C-e>     compe#close('<C-e>')
	inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
	inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" Signify
	"let g:signify_sign_add               = '▎'
    "let g:signify_sign_delete            = '▎'
    "let g:signify_sign_delete_first_line = '▎'
    "let g:signify_sign_change            = '▎'

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
	"let g:AutoPairsMapSpace = 0

" Quickscope
	" Only enable after hitting f, F, t, T
	let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

	" Colors used
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
    let g:vimwiki_map_prefix = '<space>W'

" nnn settings
	let g:nnn#set_default_mappings = 0
	let g:nnn#command = 'nnn -D'
	let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6} }
	let g:nnn#action = {
		\ 's': 'split',
		\ 'v': 'vsplit',
		\ 'l': 'e',
		\ 'e': 'e'}

" Neoformat
	augroup fmt
		autocmd!
		autocmd BufWritePre * Neoformat
	augroup END
