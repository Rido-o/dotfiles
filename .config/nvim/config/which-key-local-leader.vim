" Which Key Local Leader
	" Setup
	let g:maplocalleader = ','
	let g:which_key_map_local = {}
	autocmd VimEnter * call which_key#register(',', 'g:which_key_map_local')

	" Enable
	nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
	vnoremap <silent> <localleader> :<c-u>WhichKeyVisual  ','<CR>

	" Vimtex
	if &filetype == 'tex'
		let g:which_key_map_local.l = {
			\ 'name' : '+Latex',
			\ 'i' : ['<plug>(vimtex-info)' , 'Latex info'],
			\ 'I' : ['<plug>(vimtex-info-full)' , 'Latex full info'],
			\ 't' : ['<plug>(vimtex-toc-open)' , 'Latex open toc'],
			\ 'T' : ['<plug>(vimtex-toc-toggle)' , 'Latex toggle toc'],
			\ 'q' : ['<plug>(vimtex-log)' , 'Latex log'],
			\ 'v' : ['<plug>(vimtex-view)' , 'Latex view'],
			\ 'r' : ['<plug>(vimtex-reverse-search)' , 'Latex reverse search'],
			\ 'l' : ['<plug>(vimtex-compile)' , 'Latex compile'],
			\ 'L' : ['<plug>(vimtex-compile-selected)' , 'Latex compile selected'],
			\ 'k' : ['<plug>(vimtex-stop)' , 'Latex stop'],
			\ 'K' : ['<plug>(vimtex-stop-all)' , 'Latex stop all'],
			\ 'e' : ['<plug>(vimtex-errors)' , 'Latex errors'],
			\ 'o' : ['<plug>(vimtex-compile-output)' , 'Latex compile output'],
			\ 'g' : ['<plug>(vimtex-status)' , 'Latex status'],
			\ 'G' : ['<plug>(vimtex-status-all)' , 'Latex status all'],
			\ 'c' : ['<plug>(vimtex-clean)' , 'Latex clean'],
			\ 'C' : ['<plug>(vimtex-clean-all)' , 'Latex clean all'],
			\ 'm' : ['<plug>(vimtex-imaps-list)' , 'Latex imaps list'],
			\ 'x' : ['<plug>(vimtex-reload)' , 'Latex reload'],
			\ 'X' : ['<plug>(vimtex-reload-state)' , 'Latex reload state'],
			\ 's' : ['<plug>(vimtex-toggle-main)' , 'Latex toggle main'],
			\ }
	endif
