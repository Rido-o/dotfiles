" Basics
syntax enable						" Enables syntax highlighting
filetype plugin on					" Enables filetypes to be used
set nocompatible					" Required for some other settings
set encoding=utf-8					" The encoding displayed
set fileencoding=utf-8
"set fileencodings=utf-8            " Causes problems with fugitive
set splitbelow						" Split down instead of up
set splitright						" Split right instead of left
set clipboard+=unnamedplus			" Copy and paste between everything
set number relativenumber			" Enables the relative numberline
set cursorline						" Change the cursor in insert mode
set linespace=0						" Set the space between lines
set tabstop=4 softtabstop=4			" Set the width of tabs and space tabs
set shiftwidth=4					" Change the number of space character for indentation
set smartindent						" Makes indenting smart
set nowrap							" Display long lines as just one line
set noswapfile						" Disable swap files
set nobackup						" Disable backup files
set undofile						" Allow undo files
set incsearch						" Allow included search
set ignorecase
set smartcase
set colorcolumn=0					" Set how far the color column should be
set scrolloff=5						" How close the cursor should be before the page scrolls
set timeoutlen=500					" Default is 1000, used for which key
set updatetime=100					" For vim signify
set hidden							" Enables hidden buffers
set autoread						" Enables auto reading of files for open buffers
set signcolumn=yes:1                " Add permanant column for signs

" List settings
set list
set listchars=
set listchars+=trail:­
set listchars+=tab:\ \ 
"set listchars+=extends:»
"set listchars+=precedes:«
"set listchars+=nbsp:⣿
"set listchars+=eol:¬

" Disable auto-commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Undodir
if g:os == "Linux"
	set undodir="$HOME/.cache/nvim/undodir"
elseif g:os == "Windows"
	set undodir="~/AppData/Local/nvim-data/undo"
endif

" Set shell to Windows PowerShell if on windows. Relies on function in init.vim
if g:os == "Windows"
	set shell=powershell shellquote= shellpipe=\| shellxquote=
	set shellcmdflag=-NoLogo\ -NoProfile\ -ExecutionPolicy\ RemoteSigned\ -Command
	set shellredir=\|\ Out-File\ -Encoding\ UTF8
endif

autocmd User Fugitive command! -buffer -bar Gmylog exe 'terminal' FugitivePrepare(['log', '--oneline', '--decorate', '--graph', '--all'])
"let color.ui=always
