require('bufferline').setup({
    options = {
        mode = 'buffers',
        numbers = function(opts)
            return string.format('%s', opts.raise(opts.ordinal))
        end,
        indicator_icon = '┃',
        show_buffer_close_icons = false,
        show_buffer_default_icon = true,
        show_close_icon = false,
        offsets = {
            { filetype = 'NvimTree', text = 'File Explorer', text_align = 'center' },
            { filetype = 'undotree', text = 'Undo Tree', text_align = 'center' },
        },
    },
    highlights = {
        -- Selected buffer colors
        buffer_selected = {
            gui = 'NONE',
        },
        -- Visible buffer colors
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
        -- Seperator color
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
        -- Selected buffer modified icon color
        modified_selected = {
            guifg = {
                attribute = 'fg',
                highlight = 'WarningMsg',
            },
        },
        -- Visible buffer modified icon color
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
        -- Inactive buffer modified icon color
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
        -- Selected buffer number color
        numbers_selected = {
            gui = 'NONE',
        },
        -- Visible buffer number color
        numbers_visible = {
            guibg = {
                attribute = 'bg',
                highlight = 'TabLine',
            },
        },
    },
})
