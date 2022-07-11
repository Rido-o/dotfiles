require('bufferline').setup({
    options = {
        mode = 'buffers',
        numbers = function(opts)
            return string.format('%s', opts.raise(opts.ordinal))
        end,
        -- separator_style = { '▎', '▎' }, -- ┃, ▎,▐
        indicator_icon = '┃',
        show_buffer_close_icons = false,
        show_buffer_default_icon = true,
        show_close_icon = false,
        offsets = {
            { filetype = 'NvimTree', text = 'File Explorer', text_align = 'center' },
            { filetype = 'undotree', text = 'Undo Tree', text_align = 'center' },
        },
    },
    -- Visible might be in the window but not selected
    highlights = {
        -- Selected buffer colors
        buffer_selected = {
            gui = 'NONE',
        },
        -- Inactive visible buffer colors
        buffer_visible = {
            guifg = {
                attribute = 'fg',
                highlight = 'Comment',
            },
            guibg = {
                attribute = 'bg',
                highlight = 'TabLine',
            },
        },
        -- Inactive buffer colors
        buffer = {
            guifg = {
                attribute = 'fg',
                highlight = 'Comment',
            },
            guibg = {
                attribute = 'bg',
                highlight = 'TabLine',
            },
        },
        -- Tab Seperator color
        separator = {
            guifg = {
                attribute = 'bg',
                highlight = 'Tabline',
            },
            guibg = {
                attribute = 'bg',
                highlight = 'Tabline',
            },
        },
        -- Selected buffer indicator color
        indicator_selected = {
            guifg = {
                attribute = 'fg',
                highlight = 'Special',
            },
            guibg = {
                attribute = 'bg',
                highlight = 'Normal',
            },
        },
        -- Visible buffer indicator color
        indicator_visible = {
            guibg = {
                attribute = 'bg',
                highlight = 'TabLine',
            },
        },
        -- Modified icon color for active buffers
        modified_selected = {
            guifg = {
                attribute = 'fg',
                highlight = 'WarningMsg',
            },
        },
        -- Modified icon color for visible buffers
        modified_visible = {
            guifg = {
                attribute = 'fg',
                highlight = 'WarningMsg',
            },
            guibg = {
                attribute = 'bg',
                highlight = 'TabLine',
            },
        },
        -- Modified icon color for inactive buffers
        modified = {
            guifg = {
                attribute = 'fg',
                highlight = 'WarningMsg',
            },
            guibg = {
                attribute = 'bg',
                highlight = 'TabLine',
            },
        },
        -- Color of selected buffer number
        numbers_selected = {
            gui = 'NONE',
        },
        -- Color of visible buffer number
        numbers_visible = {
            guibg = {
                attribute = 'bg',
                highlight = 'TabLine',
            },
        },
    },
})
