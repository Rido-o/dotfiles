--------------------------
-- Plugin Management
--------------------------
return require('packer').startup(function(use)
    -----------------------
    -- Packer
    -----------------------
    use 'wbthomason/packer.nvim'

    ------------
    -- Git
    ------------
    use 'tpope/vim-fugitive'
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
    use {'sprockmonty/wal.vim', as = 'colors-wal'}
    use {'morhetz/gruvbox', as = 'colors-gruvbox'}
    use {'joshdick/onedark.vim', as = 'colors-onedark'}
    use {'reedes/vim-colors-pencil', as = 'colors-pencil'}
    use {'folke/tokyonight.nvim', as = 'colors-tokyonight'}
    use {'franbach/miramare', as = 'colors-miramare'}
    use {'ntk148v/vim-horizon', as = 'colors-horizon'}

    -----------
    -- UI
    -----------
    use {
        'norcalli/nvim-colorizer.lua',
        config = require('colorizer').setup()
    }
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
        ft = 'tex',
        config = require('plugin-settings.vimtex'),
    }

    -------------------------
    -- File Exploration
    -------------------------
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {'kyazdani42/nvim-web-devicons'},
        config = require('plugin-settings.nvim-tree')
    }
    use {
        'mcchrish/nnn.vim',
        config = require('plugin-settings.nnn')
    }

    ------------------
    -- Utilities
    ------------------
    use 'mbbill/undotree'
    use {
        'vimwiki/vimwiki',
        config = require('plugin-settings.vimwiki')
    }
    use {
        'akinsho/nvim-toggleterm.lua',
        config = require('plugin-settings.toggleterm')
    }
    use 'airblade/vim-rooter'
    use {
        'sbdchd/neoformat', -- Uses black
        config = require('plugin-settings.neoformat')
    }
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
        'kabouzeid/nvim-lspinstall',
        config = require('plugin-settings.nvim-lspinstall')
    }
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
    use {
        'nvim-treesitter/nvim-treesitter',
        branch = '0.5-compat',
        run = ':TSUpdate',
        config = require('plugin-settings.treesitter')
    }

    ---------------
    -- Editor
    ---------------
    use {
        'terrortylor/nvim-comment',
        config = require('plugin-settings.nvim-comment')
    }
    use {
        'windwp/nvim-autopairs',
        config = require('plugin-settings.nvim-autopairs')
    }
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'

    -----------------
    -- Movement
    -----------------
    --use 'justinmk/vim-sneak'
end)
