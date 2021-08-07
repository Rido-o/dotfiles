" Which Key Leader
	" Setup
	let g:mapleader = "\<Space>"
	let g:which_key_map = {}
	autocmd VimEnter * call which_key#register('<Space>', 'g:which_key_map')

	" Enable
	nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
	vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

	" Colors
	highlight default link WhichKey          Operator
	highlight default link WhichKeySeperator DiffAdded
	highlight default link WhichKeyGroup     Identifier
	highlight default link WhichKeyDesc      Function

	" Disable floating window mode
	let g:which_key_use_floating_win = 0

	" Hide status line
	autocmd! FileType which_key
	autocmd  FileType which_key set laststatus=0 noshowmode noruler
		\| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

	" Toggle NERDTree based on the current buffer
	function! NERDTreeToggleInCurDir()
		" If NERDTree is open in the current buffer
		if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
			exe ":NERDTreeClose"
		" If in git directory open root directory
		elseif fugitive#head() != ''
			exe ":NERDTreeToggleVCS %"
		" If current buffer is empty open NERDTree in CWD
		elseif line('$') == 1 && getline(1) == ''
			exe ":NERDTreeCWD"
		" Else open nerdtree in directory of current file
		else
			exe ":NERDTree %"
		endif
	endfunction

	" Set ff based on weather in a git directory
	function Mapff()
		" If in git directory search for repository files
		if fugitive#head() != ''
			noremap <leader>ff :GFiles --cached --others --exclude-standard<CR>
		" Else search for current directory files
		else
			noremap <leader>ff :Files<CR>
		endif
	endfunction

	autocmd VimEnter * call Mapff()

	" Toggle color column
	function! ColorColumn()
		if &colorcolumn == 0
			set colorcolumn=80
		else
			set colorcolumn=0
		endif
	endfunction

	" Single Mappings
	let g:which_key_map['s'] = [':wincmd s' , 'Horizontal split']
	let g:which_key_map['v'] = [':wincmd v' , 'Vertical split']
	let g:which_key_map['h'] = [':wincmd h' , 'Move left']
	let g:which_key_map['j'] = [':wincmd j' , 'Move down']
	let g:which_key_map['k'] = [':wincmd k' , 'Move up']
	let g:which_key_map['l'] = [':wincmd l' , 'Move right']
	let g:which_key_map['u'] = ['gt' , 'Next tab']
	let g:which_key_map['y'] = ['gT' , 'Previous tab']
	let g:which_key_map['w'] = ['w' , 'Write']
	let g:which_key_map['q'] = ['q' , 'Quit']
	let g:which_key_map['n'] = [':call NERDTreeToggleInCurDir()' , 'Toggle file explorer']
	let g:which_key_map['U'] = [':UndotreeToggle' , 'Open undo tree']           " Undo tree toggle
	let g:which_key_map['d'] = [':NnnPicker' , 'Open nnn']
	let g:which_key_map['S'] = [':Startify' , 'Open start screen']              " Open startify

	" Buffers
	let g:which_key_map['u'] = [':bn' , 'Next buffer']
	let g:which_key_map['y'] = [':bp' , 'Previous Buffer']
	let g:which_key_map.b = {
		\ 'name' : '+Buffers',
		\ 'q' : [':Bdelete' , 'Close buffer'],
		\ 'd' : [':cd %:p:h|call Mapff()', 'Change CWD to file directory'],
		\ 'f' : ['gf' , 'Open file'],
		\ 's' : [':wincmd f', 'Open file in split'],
		\ 'v' : [':vertical wincmd f', 'Open file in vert split'],
		\ 't' : [':wincmd gf', 'Open file in tab'],
		\ 'Q' : [':w|%bd|e#|bd#', 'Close all except current'],
		\ }

	" Airline buffer maps
	let g:airline#extensions#tabline#buffer_idx_mode = 1
	let g:which_key_map['1'] = ['<Plug>AirlineSelectTab1' , 'Buffer 1']
	let g:which_key_map['2'] = ['<Plug>AirlineSelectTab2' , 'Buffer 2']
	let g:which_key_map['3'] = ['<Plug>AirlineSelectTab3' , 'Buffer 3']
	let g:which_key_map['4'] = ['<Plug>AirlineSelectTab4' , 'Buffer 4']
	let g:which_key_map['5'] = ['<Plug>AirlineSelectTab5' , 'Buffer 5']
	let g:which_key_map['6'] = ['<Plug>AirlineSelectTab6' , 'Buffer 6']
	let g:which_key_map['7'] = ['<Plug>AirlineSelectTab7' , 'Buffer 7']
	let g:which_key_map['8'] = ['<Plug>AirlineSelectTab8' , 'Buffer 8']
	let g:which_key_map['9'] = ['<Plug>AirlineSelectTab9' , 'Buffer 9']

	" NERDCommenter
	let g:which_key_map.c = {
		\ 'name' : '+Comment',
		\ 'c' : ['<plug>NERDCommenterComment' , 'Comment'],
		\ 'n' : ['<plug>NERDCommenterNested' , 'Nested comment'],
		\ 'SPC' : ['<plug>NERDCommenterToggle' , 'Toggle comment'],
		\ 'm' : ['<plug>NERDCommenterMinimal' , 'Minimal comment'],
		\ 'i' : ['<plug>NERDCommenterInvert' , 'Invert comment'],
		\ 's' : ['<plug>NERDCommenterSexy' , 'Sexy comment'],
		\ 'y' : ['<plug>NERDCommenterYank' , 'Yank and comment'],
		\ '$' : ['<plug>NERDCommenterToEOL' , 'Replace to end of line'],
		\ 'A' : ['<plug>NERDCommenterAppend' , 'Append comment'],
		\ 'a' : ['<plug>NERDCommenterAltDelims' , 'Comment and insert'],
		\ 'l' : ['<plug>NERDCommenterAlignLeft' , 'Comment aligned left'],
		\ 'b' : ['<plug>NERDCommenterAlignBoth' , 'Comment aligned both'],
		\ 'u' : ['<plug>NERDCommenterUncomment' , 'Uncomment'],
		\ }

	" Fugitive
	let g:which_key_map.g = {
		\ 'name' : '+Git',
		\ 'i' : [':Git init', 'Git init'],
		\ 'a' : [':Git add .', 'Git add all'],
		\ 'c' : [':Git commit', 'Git commit'],
		\ 'A' : [':Git commit --amend --no-edit -a', 'Git amend last commit'],
		\ 'r' : [':Git reset', 'Git unstage all'],
		\ 'l' : [':Git log --decorate --pretty=format:"%h - %an, %ar : %s"', 'Git pretty log'],
		\ 'L' : [':Git log', 'Git raw log'],
		\ 's' : [':Git status', 'Git status'],
		\ 'b' : [':Git branch', 'Git branches'],
		\ 'd' : [':Git diff', 'Git diff'],
		\ 'I' : [':!touch .gitignore', 'Create git ignore'],
		\ 't' : [':SignifyToggle', 'Toggle signs'],
		\ 'T' : [':SignifyToggleHighlight', 'Toggle highlights'],
		\}

	" Fzf
	let g:which_key_map.f = {
		\ 'name' : '+Find',
		\ 'f' : ['' , 'Find files'],
		\ 'F' : [':Files' , 'Find files'],
		\ 'o' : [':History' , 'Find MRU'],
		\ 'e' : [':History:' , 'Search command history'],
		\ 'E' : [':Commands' , 'Find commands'],
		\ 'b' : [':Buffers' , 'Find buffers'],
		\ 's' : [':Colors' , 'Find colorschemes'],
		\ 'c' : [':Commits' , 'Find commits'],
		\ 'C' : [':BCommits' , 'Find buffer commits'],
		\ 'w' : [':Windows' , 'Find windows'],
		\ 'l' : [':Lines' , 'Find lines in open buffers'],
		\ 'L' : [':BLines' , 'Find lines in current buffer'],
		\ 'g' : [':GFiles --cached --others --exclude-standard' , 'Find git files'],
		\ }

	" Vimwiki
	let g:which_key_map.W = {
		\ 'name' : '+Vimwiki',
		\ 'w' : ['<plug>VimwikiIndex' , 'Open Vimwiki'],
		\ 'i' : ['<plug>VimwikiDiaryIndex' , 'Open Vimwiki diary'],
		\ 's' : ['<plug>VimwikiUISelect' , 'Select Vimwiki'],
		\ 'd' : ['<plug>VimwikiDeleteFile' , 'Delete current file'],
		\ 'H' : ['<plug>Vimwiki2HTMLBrowse' , 'Convert to HTML and browse'],
		\ 'h' : ['<plug>Vimwiki2HTMl' , 'Convert to HTML'],
		\ 'n' : ['<plug>VimwikiGoto' , 'Goto'],
		\ 'r' : ['<plug>VimwikiRenameFile' , 'Rename current file'],
		\ 'I' : ['<plug>VimwikiDiaryGenerateLinks' , 'Generate links'],
		\ 't' : ['<plug>VimwikiMakeDiaryNote' , 'Todays diary'],
		\ 'y' : ['<plug>VimwikiMakeYesterdayDiaryNote' , 'Yesterdays diary'],
		\ 'm' : ['<plug>VimwikiMakeTomorrowDiaryNote' , 'Tomorrows diary'],
		\}

	" Coc
	"let g:which_key_map.a = {
		"\ 'name' : '+Coc',
		"\ 'a' : ['<plug>(coc-codeaction)' , 'Line action'],
		"\ 'd' : ['<plug>(coc-definition)' , 'Definition'],
		"\ 'r' : ['<plug>(coc-references)' , 'References'],
		"\ 't' : ['<plug>(coc-type-definition)' , 'Type definition'],
		"\ 'm' : ['<plug>(coc-rename)' , 'Rename'],
		"\ 'D' : ['<plug>(coc-declaration)' , 'Declaration'],
		"\ 'i' : ['<plug>(coc-implementation)' , 'Implementation'],
		"\ 'f' : ['<plug>(coc-format)' , 'Format'],
		"\ 'q' : ['<plug>(coc-fix-current)' , 'Quickfix'],
		"\ 'c' : ['<plug>(coc-codelens-action)' , 'Code lens'],
		"\ 'n' : ['<plug>(coc-diagnostic-next)' , 'Next diagnostic'],
		"\ 'N' : ['<plug>(coc-diagnostic-next-error)' , 'Next error'],
		"\ 'I' : [':CocList diagnostics' , 'Diagnostics'],
		"\ 'o' : [':CocList outline' , 'Search outline'],
		"\ 's' : [':CocList -l symbols' , 'References-'],
		"\ 'C' : [':CocConfig' , 'Open config lens'],
		"\ 'u' : [':CocUpdate' , 'Update Coc'],
		"\ 'E' : [':CocDisable' , 'Disable Coc'],
		"\ 'e' : [':CocEnable' , 'Enable Coc'],
		"\}
	
	" Toggle settings
	let g:which_key_map.t = {
		\ 'name' : '+Toggle',
		\ 'c' : [':call ColorColumn()' , 'Toggle color column'],
		\}
