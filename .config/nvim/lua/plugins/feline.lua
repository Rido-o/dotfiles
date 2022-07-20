local function get_col(group, id)
    return vim.fn.synIDattr(vim.fn.hlID(group), id)
end

local colors = {
    fg = '#DCD7BA',
    bg = '#16161D',
    black = '#1F1F28',
    darkgray = '#2A2A37',
    skyblue = '#7FB4CA',
    cyan = '#7AA89F',
    green = '#76946A',
    oceanblue = '#7E9CD8',
    magenta = '#938AA9',
    orange = '#FF9E3B',
    red = '#C34043',
    violet = '#957FB8',
    white = '#C8C093',
    yellow = '#C0A36E',
}

local vi_mode_colors = {
    NORMAL = 'oceanblue',
    INSERT = 'green',
    VISUAL = 'violet',
    LINES = 'violet',
    BLOCK = 'violet',
    REPLACE = 'red',
    ['V-REPLACE'] = 'red',
    COMMAND = 'yellow',
}

local components = {
    vi = {
        mode = {
            provider = 'vi_mode',
            hl = function()
                return {
                    name = require('feline.providers.vi_mode').get_mode_highlight_name(),
                    fg = 'bg',
                    bg = require('feline.providers.vi_mode').get_mode_color(),
                    style = 'bold',
                }
            end,
            left_sep = {
                str = ' ',
                hl = function()
                    return {
                        bg = require('feline.providers.vi_mode').get_mode_color(),
                    }
                end,
            },
            right_sep = {
                str = ' ',
                hl = function()
                    return {
                        bg = require('feline.providers.vi_mode').get_mode_color(),
                    }
                end,
            },
            -- Uncomment the next line to disable file icons
            icon = '',
        },
        right_indicator = {
            provider = '█',
            hl = function()
                return {
                    fg = require('feline.providers.vi_mode').get_mode_color(),
                }
            end,
        },
    },
    file = {
        info = {
            provider = 'file_info',
            hl = {
                fg = 'fg',
                bg = 'black',
                -- style = 'bold',
            },
            left_sep = {
                str = ' ',
                hl = {
                    bg = 'black',
                }
            },
            right_sep = {
                {
                    str = ' ',
                    hl = {
                        bg = 'black',
                    }
                },
                {
                    str = '',
                }
            },
        },
        encoding = {
            provider = 'file_encoding',
            left_sep = ' ',
            right_sep = ' ',
        },
    },
    git = {
        branch = {
            provider = 'git_branch',
            hl = {
                style = 'bold',
            },
            right_sep = {
                str = ' ',
            },
        },
    },
    cursor = {
        line_percentage = {
            provider = 'line_percentage',
            hl = {
                style = 'bold',
            },
            left_sep = '',
            right_sep = ' ',
        },
        scroll_bar = {
            provider = 'scroll_bar',
            hl = {
                fg = 'skyblue',
                style = 'bold',
            },
            right_sep = ' ',
        },
    },
}

local statusline = {
    active = { {}, {}, {} },
    -- inactive = {},
}

-- Left
table.insert(statusline.active[1], components.vi.mode)
table.insert(statusline.active[1], components.file.info)
-- Middle
-- Right
table.insert(statusline.active[3], components.file.encoding)
table.insert(statusline.active[3], components.git.branch)
table.insert(statusline.active[3], components.cursor.line_percentage)
table.insert(statusline.active[3], components.cursor.scroll_bar)
table.insert(statusline.active[3], components.vi.right_indicator)

require('feline').setup({
    theme = colors,
    -- default_bg = bg,
    -- default_fg = fg,
    vi_mode_colors = vi_mode_colors,
    components = statusline,
})
