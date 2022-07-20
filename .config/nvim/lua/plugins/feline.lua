local components = {
    vi = {
        mode = {
            provider = 'vi_mode',
            hl = function()
                return {
                    name = require('feline.providers.vi_mode').get_mode_highlight_name(),
                    fg = require('feline.providers.vi_mode').get_mode_color(),
                    style = 'bold',
                }
            end,
            right_sep = ' ',
            icon = '',
        }
    },
    file = {
        info = {
            provider = 'file_info',
            hl = {
                fg = 'white',
                bg = 'oceanblue',
                style = 'bold',
            },
            left_sep = { ' ', 'slant_left_2' },
            right_sep = { 'slant_right_2', ' ' },
            -- Uncomment the next line to disable file icons
            -- icon = ''
        },
        encoding = {
            provider = 'file_encoding',
        },
    },
    git = {
        branch = {
            provider = 'git_branch',
            hl = {
                fg = 'white',
                bg = 'black',
                style = 'bold',
            },
            right_sep = {
                str = ' ',
                hl = {
                    fg = 'NONE',
                    bg = 'black',
                },
            },
        },
    },
}

local statusline = {
    active = {{}, {}, {}},
    -- inactive = {},
}

-- Left
table.insert(statusline.active[1], components.vi.mode)
table.insert(statusline.active[1], components.file.info)
-- Middle
-- Right
table.insert(statusline.active[3], components.file.encoding)
table.insert(statusline.active[3], components.git.branch)

require('feline').setup({
    components = statusline,
})
