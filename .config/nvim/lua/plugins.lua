-- Packer Bootstrap
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim' -- Packer Install path
if fn.empty(fn.glob(install_path)) > 0 then
    Packer_bootstrap =
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end

-- Packer options
require('packer').init({
    -- Enable floating window for packer
    display = {
        open_fn = function()
            return require('packer.util').float({ border = 'single' })
        end,
    },
})

-- Function for sourcing config files
local function plugin_config(config)
    require(config)
end

--------------------------
-- Plugin Management
--------------------------
return require('packer').startup({
    function(use)
        -- potential plugins {trouble.nvim, nvim-navic, aerial.nvim}
        -----------------------
        -- Packer
        -----------------------
        use('wbthomason/packer.nvim')

        ------------
        -- Git
        ------------
        use('tpope/vim-fugitive')
        use({
            'lewis6991/gitsigns.nvim',
            config = plugin_config('plugin-settings.gitsigns'),
        })

        ---------------------
        -- Colorschemes
        ---------------------
        use({ 'AlphaTechnolog/pywal.nvim', as = 'colors-pywal' })
        use({ 'folke/tokyonight.nvim', as = 'colors-tokyonight' })
        use({ 'rebelot/kanagawa.nvim', as = 'colors-kanagawa' })

        -----------
        -- UI
        -----------
        use({
            'norcalli/nvim-colorizer.lua',
            -- not optimal but require('colorizer').setup() wasn't working check #FFF
            config = vim.api.nvim_create_autocmd({ 'BufEnter' }, { command = 'ColorizerAttachToBuffer' }),
        })
        use({
            'nvim-lualine/lualine.nvim',
            requires = { 'kyazdani42/nvim-web-devicons' },
            config = plugin_config('plugin-settings.lualine'),
        })
        use({
            'lukas-reineke/indent-blankline.nvim',
            config = plugin_config('plugin-settings.indent-blankline'),
        })
        use({
            'folke/which-key.nvim',
            config = plugin_config('plugin-settings.which-key'),
        })
        use({
            'romgrk/barbar.nvim',
            requires = { 'kyazdani42/nvim-web-devicons' },
            config = plugin_config('plugin-settings.barbar'),
        })

        -----------------
        -- Filetype
        -----------------
        use({
            'lervag/vimtex', -- Requres latexmk, pdfviewer(mupdf)
            ft = 'tex',
            config = plugin_config('plugin-settings.vimtex'),
        })

        -------------------------
        -- File Exploration
        -------------------------
        use({
            'kyazdani42/nvim-tree.lua',
            requires = { 'kyazdani42/nvim-web-devicons' },
            config = plugin_config('plugin-settings.nvim-tree'),
        })
        use({
            'mcchrish/nnn.vim',
            config = plugin_config('plugin-settings.nnn'),
        })

        ------------------
        -- Utilities
        ------------------
        use('mbbill/undotree')
        use({
            'vimwiki/vimwiki',
            branch = 'dev',
            config = plugin_config('plugin-settings.vimwiki'),
        })
        use({
            'akinsho/nvim-toggleterm.lua',
            config = plugin_config('plugin-settings.toggleterm'),
        })
        use('airblade/vim-rooter')
        use({
            'jose-elias-alvarez/null-ls.nvim',
            config = plugin_config('plugin-settings.null-ls'),
        })
        use({
            'nvim-telescope/telescope.nvim',
            requires = {
                { 'nvim-lua/popup.nvim' },
                { 'nvim-lua/plenary.nvim' },
            },
            config = plugin_config('plugin-settings.telescope'),
        })
        use({
            'phaazon/hop.nvim',
            config = plugin_config('plugin-settings.hop'),
        })

        ------------
        -- lSP
        ------------
        -- Check lsp-installer requirements
        use({
            'williamboman/nvim-lsp-installer',
            config = plugin_config('plugin-settings.nvim-lspinstall'),
        })
        use({
            'neovim/nvim-lspconfig',
            config = plugin_config('plugin-settings.nvim-lspconfig'),
        })
        use({
            'hrsh7th/nvim-cmp',
            requires = {
                { 'hrsh7th/cmp-nvim-lsp' },
                { 'hrsh7th/cmp-buffer' },
                { 'hrsh7th/cmp-path' },
                { 'hrsh7th/cmp-cmdline' },
                -- Snippets
                { 'L3MON4D3/LuaSnip' },
                { 'saadparwaiz1/cmp_luasnip' },
                { 'rafamadriz/friendly-snippets' },
            },
            config = {
                plugin_config('plugin-settings.nvim-cmp'),
                -- Enable friendly snippets
                require('luasnip.loaders.from_vscode').lazy_load(),
            },
        })
        use({
            'glepnir/lspsaga.nvim',
            config = plugin_config('plugin-settings.lspsaga'),
        })
        use({
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate',
            config = plugin_config('plugin-settings.treesitter'),
        })

        ---------------
        -- Editor
        ---------------
        use({
            'numToStr/Comment.nvim',
            config = plugin_config('plugin-settings.comment-nvim'),
        })
        use({
            'windwp/nvim-autopairs',
            config = plugin_config('plugin-settings.nvim-autopairs'),
        })
        use('tpope/vim-surround')
        use('tpope/vim-repeat')

        -- Run bootstrap if packer isnt' installed
        -- Automatically set up your configuration after cloning packer.nvim
        -- Put this at the end after all plugins
        if Packer_bootstrap then
            require('packer').sync()
        end
    end,
})
