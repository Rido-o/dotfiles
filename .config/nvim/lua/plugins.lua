return require('packer').startup(function()
    -- Plugin Manager
    use 'wbthomason/packer.nvim'

    -- Git plugins
    use 'tpope/vim-fugitive'
    use 'mhinz/vim-signify'
    --use 'tpope/vim-git'
    --use 'tpope/vim-rhubarb'

    -- Nerdtree
    use 'preservim/nerdtree'
    use 'Xuyuanp/nerdtree-git-plugin'
    use 'tiagofumo/vim-nerdtree-syntax-highlight'

    -- nnn
    use 'mcchrish/nnn.vim'

    -- Airline
    --use 'vim-airline/vim-airline'
    --use 'vim-airline/vim-airline-themes'

    -- Lualine
    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    -- Colorschemes
    use {'Rido-o/wal.vim', as = 'colors-wal'}
    use {'lifepillar/vim-colortemplate', as = 'colors-colortemplate'}
    use {'morhetz/gruvbox', as = 'colors-gruvbox'}
    use {'joshdick/onedark.vim', as = 'colors-onedark'}
    use {'reedes/vim-colors-pencil', as = 'colors-pencil'}
    --use {'Rido-o/tokyonight-vim', as = 'colors-tokyonight'}
    use {'folke/tokyonight.nvim', as = 'colors-tokyonight'}
    use {'franbach/miramare', as = 'colors-miramare'}
    use {'ntk148v/vim-horizon', as = 'colors-horizon'}

    use 'sheerun/vim-polyglot' -- Better syntax highlighting
    --use 'jiangmiao/auto-pairs' -- Auto Brackets
    use 'windwp/nvim-autopairs'
    --use 'Yggdroot/indentLine'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'preservim/nerdcommenter'
    --use 'ryanoasis/vim-devicons'
    use 'mbbill/undotree'
    use 'mhinz/vim-startify'
    --use 'liuchengxu/vim-which-key'
    use 'folke/which-key.nvim'
    use 'vimwiki/vimwiki'
    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'
    use 'lervag/vimtex' -- Requres latexmk, pdfviewer(mupdf)

    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
    use 'norcalli/nvim-colorizer.lua'
    use 'moll/vim-bbye'
    --use 'voldikss/vim-floaterm'

    -- Snippets
    --use 'SirVer/ultisnips' -- If not using coc
    use 'honza/vim-snippets'

    -- Movement
    use 'unblevable/quick-scope'
    use 'justinmk/vim-sneak'

    -- Run programs
    --use 'thinca/vim-quickrun'
    use 'skywind3000/asyncrun.vim'

    -- New toys
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-compe'

    use 'hrsh7th/vim-vsnip'
    use 'rafamadriz/friendly-snippets'

    use 'sbdchd/neoformat'
    -- pip install black

    -- Debugging
    --use 'puremourning/vimspector'
end)
