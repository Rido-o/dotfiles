-- Packer Bootstrap
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim' -- Packer Install path
if fn.empty(fn.glob(install_path)) > 0 then
    Packer_bootstrap =
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end

local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    return
end

-- Packer options
packer.init({
    -- Enable floating window for packer
    display = {
        open_fn = function()
            return require('packer.util').float({ border = 'single' })
        end,
    },
})

-- Function for sourcing config files
local function plugin_config(file)
    require('plugins.' .. file)
end

--------------------------
-- Plugin Management
--------------------------
return packer.startup({
    function(use)
        -- potential plugins {trouble.nvim, nvim-navic, aerial.nvim, neogit, impatient.nvim, alpha-nvim, fidget.nvim, neotree, feline, org-mode-clones}
        -- potential move movement plugins {leap, hop, lightspeed}
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
            config = plugin_config('gitsigns'),
        })

        ---------------------
        -- Colorschemes
        ---------------------
        use({ 'AlphaTechnolog/pywal.nvim' })
        use({ 'folke/tokyonight.nvim' })
        use({ 'rebelot/kanagawa.nvim' })

        -------------------------
        -- File Exploration
        -------------------------
        use({
            'nvim-neo-tree/neo-tree.nvim',
            branch = 'v2.x',
            requires = {
                'nvim-lua/plenary.nvim',
                'kyazdani42/nvim-web-devicons',
                'MunifTanjim/nui.nvim',
            },
            config = plugin_config('neo-tree'),
        })

        -----------
        -- UI
        -----------
        use({
            'norcalli/nvim-colorizer.lua',
            config = require('colorizer').setup(),
        })
        use({
            'nvim-lualine/lualine.nvim',
            requires = { 'kyazdani42/nvim-web-devicons' },
            config = plugin_config('lualine'),
        })
        use({
            'lukas-reineke/indent-blankline.nvim',
            config = require('indent_blankline').setup({
                char = '┊',
            }),
        })
        use({
            'folke/which-key.nvim',
            config = plugin_config('which-key'),
        })
        use({
            'noib3/nvim-cokeline',
            requires = {
                'kyazdani42/nvim-web-devicons',
                'famiu/bufdelete.nvim',
            },
            config = plugin_config('cokeline'),
        })

        -----------------
        -- Filetype
        -----------------
        use({
            'lervag/vimtex', -- Requres latexmk, pdfviewer(mupdf)
            ft = 'tex',
            config = plugin_config('vimtex'),
        })

        ------------------
        -- Utilities
        ------------------
        use('mbbill/undotree')
        use({
            'vimwiki/vimwiki',
            branch = 'dev',
            config = plugin_config('vimwiki'),
        })
        use({
            'akinsho/nvim-toggleterm.lua',
            config = plugin_config('toggleterm'),
        })
        use({
            'jose-elias-alvarez/null-ls.nvim',
            config = plugin_config('null-ls'),
        })
        use({
            -- Requires ripgrep for livegrep picker
            'nvim-telescope/telescope.nvim',
            requires = {
                { 'nvim-lua/popup.nvim' },
                { 'nvim-lua/plenary.nvim' },
                {
                    'nvim-telescope/telescope-fzf-native.nvim',
                    -- Won't work with windows
                    run = 'make',
                    cond = vim.fn.executable 'make' == 1
                },
            },
            config = plugin_config('telescope'),
        })
        use({
            'ahmedkhalf/project.nvim',
            config = plugin_config('project'),
            requires = 'nvim-telescope/telescope.nvim',
        })

        ------------
        -- lSP
        ------------
        -- Check lsp-installer requirements
        use({
            'williamboman/nvim-lsp-installer',
            config = plugin_config('lsp-installer'),
        })
        use({
            'neovim/nvim-lspconfig',
            config = plugin_config('lspconfig'),
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
                plugin_config('cmp'),
                -- Enable friendly snippets
                require('luasnip.loaders.from_vscode').lazy_load(),
            },
        })
        use({
            'glepnir/lspsaga.nvim',
            config = plugin_config('lspsaga'),
        })
        use({
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate',
            config = plugin_config('treesitter'),
        })

        ---------------
        -- Editor
        ---------------
        use({
            'numToStr/Comment.nvim',
            config = require('Comment').setup(),
        })
        use({
            'windwp/nvim-autopairs',
            config = plugin_config('autopairs'),
        })
        use({
            'kylechui/nvim-surround',
            config = plugin_config('surround'),
        })
        -- use('tpope/vim-surround')
        use('tpope/vim-repeat')

        -- Run bootstrap if packer isnt' installed
        -- Automatically set up your configuration after cloning packer.nvim
        -- Put this at the end after all plugins
        if Packer_bootstrap then
            require('packer').sync()
        end
    end,
})
