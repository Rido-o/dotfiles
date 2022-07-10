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
        fill = {
            guibg = {
                attribute = 'bg',
                highlight = 'TabLineFill',
            },
        },
        separator = {
            guifg = {
                attribute = 'fg',
                highlight = 'Special',
            },
        },
        indicator_selected = {
            guifg = {
                attribute = 'fg',
                highlight = 'Special',
            },
        },
        buffer_selected = {
            gui = 'NONE',
        },
    },
})
