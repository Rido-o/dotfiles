set background=dark					" Tells vim the background color

set termguicolors					" Required for some color schemes. Turn off for autoscript, also turn off colorizer in plugin_settings

" Colorizer
" Attach to all file types
lua require'colorizer'.setup()

" Color Schemes

" Gruvbox
	"let g:airline_theme='gruvbox'
	"colorscheme gruvbox

" Onedark
	"colorscheme onedark
	"let g:airline_theme='onedark'

" Pencil
	"colorscheme pencil
	"let g:airline_theme='pencil'

" Tokyonight
	"let g:tokyonight_style='night'
	"let g:tokyonight_disable_italic_comment = 1
	"colorscheme tokyonight
	"let g:airline_theme='tokyonight'

" Miramare
	let g:miramare_enable_italic = 1
	let g:miramare_disable_italic_comment = 1
	colorscheme miramare
	let g:airline_theme='miramare'

" Horizon
	"colorscheme horizon

" Wal
	"colorscheme wal
