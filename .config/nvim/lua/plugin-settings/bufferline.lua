require('bufferline').setup({
    options = {
        mode = 'buffers',
        -- numbers = function(opts)
        --     return string.format('[%s]', opts.id)
        -- end,
        separator_style = {'▎', '▎'},
        -- separator_style = 'thin',
        show_buffer_close_icons = false,
        show_buffer_default_icon = true,
        show_close_icon = false,
        offsets = { { filetype = 'NvimTree', text = 'File Explorer', text_align = 'center' } },
    },
    highlights = {
        -- Bar Color
        fill = {
            guibg = {
                attribute = 'bg',
                highlight = 'TabLineFill',
            },
        },
        -- Tab Seperator color
        separator_selected = {
            guifg = {
                attribute = 'fg',
                highlight = 'Special',
            },
        },
        -- Selected buffer indicator color
        indicator_selected = {
            guifg = {
                attribute = 'fg',
                highlight = 'Special',
            },
        },
        -- Selected buffer
        buffer_selected = {
            gui = 'NONE',
        },
        -- Modified icon color for inactive buffers
        modified = {
            guifg = {
                attribute = 'fg',
                highlight = 'Special',
            },
        },
        -- Modified icon color for active buffers
        modified_selected = {
            guifg = {
                attribute = 'fg',
                highlight = 'Special',
            },
        },
        -- Inactive buffer colors
        background = {
            guifg = {
                attribute = 'fg',
                highlight = 'Comment',
            },
            guibg = {
                attribute = 'bg',
                highlight = 'TabLine',
            },
        },
    },
})
