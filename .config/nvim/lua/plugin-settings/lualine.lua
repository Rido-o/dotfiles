require('lualine').setup{
    options = {
        -- Lualine colorschemes
        -- theme = 'tokyonight',
        theme = 'auto',

        icons_enabled = true,
        component_separators = {'|', '|'}, -- {'', ''},
        section_separators = {'', ''}, -- {'', ''},
        disabled_filetypes = {}
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {
            'branch',
            {
                'diff',
                color_added = nil,
                color_modified = nil,
                color_removed = nil,
                symbols = {added = '+', modified = '~', removed = '-'}
            }
        },
        lualine_d = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {
        --'chadtree',
        'fugitive',
        --'fzf',
        -- 'nerdtree',
        'nvim-tree',
        --'quickfix',
    }
}
