let g:startify_lists = [
	\ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
	\ { 'type': 'files',     'header': ['   MRU Files']            },
	\ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
	\ { 'type': 'sessions',  'header': ['   Sessions']       },
	\ ]

if g:os == "Windows"
let g:startify_bookmarks = [
	\ { 'i': '~/AppData/Local/nvim/init.vim' },
	\ { 'c': '~/AppData/Local/nvim/'},
	\ ]
endif

if g:os == "Linux"
let g:startify_bookmarks = [
	\ { 'i': '~/.config/nvim/init.vim' },
	\ { 'c': '~/.config/nvim/'},
	\ ]
endif
