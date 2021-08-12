--------------------------
-- Plugin Management
--------------------------
return require('packer').startup(function()
    -- Plugin Manager
    use 'wbthomason/packer.nvim'

    ------------
    -- Git
    ------------
    use 'tpope/vim-fugitive'
    --use 'mhinz/vim-signify'
    use {
        'lewis6991/gitsigns.nvim',
        requires = {'nvim-lua/plenary.nvim'},
        config = require('plugin-settings.gitsigns')
    }
    --use 'tpope/vim-git'
    --use 'tpope/vim-rhubarb'

    ---------------------
    -- Colorschemes
    ---------------------
    --use {'lifepillar/vim-colortemplate', as = 'colors-colortemplate'}
    use {'Rido-o/wal.vim', as = 'colors-wal'}
    use {'morhetz/gruvbox', as = 'colors-gruvbox'}
    use {'joshdick/onedark.vim', as = 'colors-onedark'}
    use {'reedes/vim-colors-pencil', as = 'colors-pencil'}
    --use {'Rido-o/tokyonight-vim', as = 'colors-tokyonight'}
    use {'folke/tokyonight.nvim', as = 'colors-tokyonight'}
    use {'franbach/miramare', as = 'colors-miramare'}
    use {'ntk148v/vim-horizon', as = 'colors-horizon'}

    -----------
    -- UI
    -----------
    use 'norcalli/nvim-colorizer.lua'
    --use 'unblevable/quick-scope'
    -- Lualine
    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons'},
        config = require('plugin-settings.lualine')
    }
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = require('plugin-settings.indent-blankline')
    }
    use {
        'folke/which-key.nvim',
        config = require('plugin-settings.which-key')
    }
    use {
        'romgrk/barbar.nvim',
        requires = {'kyazdani42/nvim-web-devicons'},
        config = require('plugin-settings.barbar')
    }

    -----------------
    -- Filetype
    -----------------
    use {
        'lervag/vimtex', -- Requres latexmk, pdfviewer(mupdf)
        ft = 'tex'
    }

    -------------------------
    -- File Exploration
    -------------------------
    -- Nvim-tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {'kyazdani42/nvim-web-devicons'},
        config = require('plugin-settings.nvim-tree')
    }
    -- nnn
    use 'mcchrish/nnn.vim'

    ------------------
    -- Utilities
    ------------------
    use 'mbbill/undotree'
    use 'mhinz/vim-startify'
    use 'vimwiki/vimwiki'
    -- Run programs
    --use 'thinca/vim-quickrun'
    --use 'skywind3000/asyncrun.vim'
    use {
        'akinsho/nvim-toggleterm.lua',
        config = require('plugin-settings.toggleterm')
    }
    --use 'voldikss/vim-floaterm'
    use 'airblade/vim-rooter'
    use 'sbdchd/neoformat'
    -- pip install black
    -- Debugging
    --use 'puremourning/vimspector'
    --use 'junegunn/fzf'
    --use 'junegunn/fzf.vim'
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            {'nvim-lua/popup.nvim'},
            {'nvim-lua/plenary.nvim'}
        },
        config = require('plugin-settings.telescope')
    }

    ------------
    -- lSP
    ------------
    use {
        'neovim/nvim-lspconfig',
        config = require('plugin-settings.nvim-lspconfig')
    }
    use {
        'hrsh7th/nvim-compe',
        requires = {
            {'hrsh7th/vim-vsnip'},
            {'rafamadriz/friendly-snippets'},
        },
        config = require('plugin-settings.nvim-compe')
    }
    -- treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        branch = '0.5-compat',
        run = ':TSUpdate',
        config = require('plugin-settings.treesitter')
    }

    ---------------
    -- Editor
    ---------------
    use 'preservim/nerdcommenter'
    use {
        'windwp/nvim-autopairs',
        config = require('plugin-settings.nvim-autopairs')
    }
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
    --use 'moll/vim-bbye'
    -- Movement
    --use 'justinmk/vim-sneak'
end)
