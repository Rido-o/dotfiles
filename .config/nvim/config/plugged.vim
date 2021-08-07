if g:os == "Windows"
	let plugpath = "~/AppData/Local/nvim-data/plugged"
elseif g:os == "Linux"
	let plugpath = "$HOME/.local/share/nvim/plugged"
endif
call plug#begin(g:plugpath)

" Git plugins
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
"Plug 'tpope/vim-git'
"Plug 'tpope/vim-rhubarb'

" Nerdtree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" nnn
Plug 'mcchrish/nnn.vim'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Colorschemes
Plug 'Rido-o/wal.vim', { 'as': 'colors-wal'}
Plug 'lifepillar/vim-colortemplate', { 'as': 'colors-colortemplate'}
Plug 'morhetz/gruvbox', { 'as': 'colors-gruvbox'}
Plug 'joshdick/onedark.vim', { 'as': 'colors-onedark'}
Plug 'reedes/vim-colors-pencil', { 'as': 'colors-pencil'}
Plug 'Rido-o/tokyonight-vim', { 'as': 'colors-tokyonight'}
Plug 'franbach/miramare', { 'as': 'colors-miramare'}
Plug 'ntk148v/vim-horizon', { 'as': 'colors-horizon'}

Plug 'sheerun/vim-polyglot' " Better syntax highlighting
Plug 'jiangmiao/auto-pairs' " Auto Brackets
Plug 'Yggdroot/indentLine'
Plug 'preservim/nerdcommenter'
Plug 'ryanoasis/vim-devicons'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-startify'
Plug 'liuchengxu/vim-which-key'
Plug 'vimwiki/vimwiki'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lervag/vimtex' " Requres latexmk, pdfviewer(mupdf)
"Plug 'dense-analysis/ale'
"Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'moll/vim-bbye'
"Plug 'voldikss/vim-floaterm'

" Snippets
"Plug 'SirVer/ultisnips' " If not using coc
Plug 'honza/vim-snippets'

" Movement
Plug 'unblevable/quick-scope'
Plug 'justinmk/vim-sneak'

" Run programs
"Plug 'thinca/vim-quickrun'
Plug 'skywind3000/asyncrun.vim'

" New toys
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

Plug 'hrsh7th/vim-vsnip'
Plug 'rafamadriz/friendly-snippets'

Plug 'sbdchd/neoformat'
" pip install black

" Debugging
"Plug 'puremourning/vimspector'

call plug#end()

"CocInstall
"let g:coc_global_extensions = [
	"\ 'coc-pyright',
	"\ 'coc-clangd',
	"\ 'coc-html',
	"\ 'coc-css',
	"\ 'coc-prettier',
	"\ 'coc-snippets']
