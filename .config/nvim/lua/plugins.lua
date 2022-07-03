-- Packer Bootstrap
local fn = vim.fn
-- Packer Install path
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

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
        'lewis6991/gitsigns.nvim', -- !! I don't think gitsigns requires plenary anymore
        requires = {'nvim-lua/plenary.nvim'},
        config = function()
            require('plugin-settings.gitsigns')
        end
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
    use {'rebelot/kanagawa.nvim', as = 'colors-kanagawa'}

    -----------
    -- UI
    -----------
    use {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup{}
        end
    }
    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons'},
        config = function()
            require('plugin-settings.lualine')
        end
    }
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('plugin-settings.indent-blankline')
        end
    }
    use {
        'folke/which-key.nvim',
        config = function()
            require('plugin-settings.which-key')
        end
    }
    use {
        'romgrk/barbar.nvim',
        requires = {'kyazdani42/nvim-web-devicons'},
        config = function()
            require('plugin-settings.barbar')
        end
    }

    -----------------
    -- Filetype
    -----------------
    use {
        'lervag/vimtex', -- Requres latexmk, pdfviewer(mupdf)
        ft = 'tex',
        config = function()
            require('plugin-settings.vimtex')
        end
    }

    -------------------------
    -- File Exploration
    -------------------------
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {'kyazdani42/nvim-web-devicons'},
        config = function()
            require('plugin-settings.nvim-tree')
        end
    }
    use {
        'mcchrish/nnn.vim',
        config = function()
            require('plugin-settings.nnn')
        end
    }

    ------------------
    -- Utilities
    ------------------
    use 'mbbill/undotree'
    use {
        'vimwiki/vimwiki',
        branch = 'dev',
        config = function()
            require('plugin-settings.vimwiki')
        end
    }
    use {
        'akinsho/nvim-toggleterm.lua',
        config = function()
            require('plugin-settings.toggleterm')
        end
    }
    use 'airblade/vim-rooter'
    use {
        'sbdchd/neoformat', -- Uses black
        config = function()
            require('plugin-settings.neoformat')
        end
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            {'nvim-lua/popup.nvim'},
            {'nvim-lua/plenary.nvim'}
        },
        config = function()
            require('plugin-settings.telescope')
        end
    }
    use {
        'phaazon/hop.nvim',
        config = function()
            require('plugin-settings.hop')
        end
    }

    ------------
    -- lSP
    ------------
    -- Check lsp-installer requirements
    use {
        'williamboman/nvim-lsp-installer',
        config = function()
            require('plugin-settings.nvim-lspinstall')
        end
    }
    use {
        'neovim/nvim-lspconfig',
        config = function()
            require('plugin-settings.nvim-lspconfig')
        end
    }
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'hrsh7th/cmp-cmdline'},
            -- Snippets
            {'hrsh7th/cmp-vsnip'},
            {'hrsh7th/vim-vsnip'},
            {'rafamadriz/friendly-snippets'},
        },
        config = function()
            require('plugin-settings.nvim-cmp')
        end
    }
    -- use {
    --     'hrsh7th/nvim-compe',
    --     requires = {
    --         {'hrsh7th/vim-vsnip'},
    --         {'rafamadriz/friendly-snippets'},
    --     },
    --     config = function()
    --         require('plugin-settings.nvim-compe')
    --     end
    -- }
    use {
        'glepnir/lspsaga.nvim',
        config = function()
            require('plugin-settings.lspsaga')
        end
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        branch = '0.5-compat',
        run = ':TSUpdate',
        config = function()
            require('plugin-settings.treesitter')
        end
    }

    ---------------
    -- Editor
    ---------------
    use {
        'terrortylor/nvim-comment',
        config = function()
            require('plugin-settings.nvim-comment')
        end
    }
    use {
        'windwp/nvim-autopairs',
        config = function()
            require('plugin-settings.nvim-autopairs')
        end
    }
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'

    -----------------
    -- Movement
    -----------------
    --use 'justinmk/vim-sneak'
          -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
