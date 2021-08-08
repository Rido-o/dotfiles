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

" nvim-lspconfig
lua << EOF
	require'lspconfig'.pyright.setup{}
EOF

" nvim-compe
	set completeopt=menuone,noselect
	let g:compe = {}
	let g:compe.enabled = v:true
	let g:compe.autocomplete = v:true
	let g:compe.debug = v:false
	let g:compe.min_length = 1
	let g:compe.preselect = 'enable'
	let g:compe.throttle_time = 80
	let g:compe.source_timeout = 200
	let g:compe.resolve_timeout = 800
	let g:compe.incomplete_delay = 400
	let g:compe.max_abbr_width = 100
	let g:compe.max_kind_width = 100
	let g:compe.max_menu_width = 100
	let g:compe.documentation = v:true

	let g:compe.source = {}
	let g:compe.source.path = v:true
	let g:compe.source.buffer = v:true
	let g:compe.source.calc = v:true
	let g:compe.source.nvim_lsp = v:true
	let g:compe.source.nvim_lua = v:true
	let g:compe.source.vsnip = v:true
	let g:compe.source.ultisnips = v:true
	let g:compe.source.luasnip = v:true
	let g:compe.source.emoji = v:true

	inoremap <silent><expr> <C-Space> compe#complete()
	inoremap <silent><expr> <CR>      compe#confirm('<CR>')
	inoremap <silent><expr> <C-e>     compe#close('<C-e>')
	inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
	inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

	" Change compe to use tab complete
lua << EOF
	local t = function(str)
	  return vim.api.nvim_replace_termcodes(str, true, true, true)
	end

	local check_back_space = function()
		local col = vim.fn.col('.') - 1
		return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
	end

	-- Use (s-)tab to:
	--- move to prev/next item in completion menuone
	--- jump to prev/next snippet's placeholder
	_G.tab_complete = function()
	  if vim.fn.pumvisible() == 1 then
		return t "<C-n>"
	  elseif vim.fn['vsnip#available'](1) == 1 then
		return t "<Plug>(vsnip-expand-or-jump)"
	  elseif check_back_space() then
		return t "<Tab>"
	  else
		return vim.fn['compe#complete']()
	  end
	end
	_G.s_tab_complete = function()
	  if vim.fn.pumvisible() == 1 then
		return t "<C-p>"
	  elseif vim.fn['vsnip#jumpable'](-1) == 1 then
		return t "<Plug>(vsnip-jump-prev)"
	  else
		-- If <S-Tab> is not working in your terminal, change it to <C-h>
		return t "<S-Tab>"
	  end
	end

	vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
	vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
	vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
	vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
EOF

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
		autocmd BufWritePre * undojoin | Neoformat
	augroup END
