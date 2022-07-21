local function get_col(group, id)
    return vim.fn.synIDattr(vim.fn.hlID(group), id)
end

local colors = {
    fg = '#DCD7BA',
    bg = '#16161D',
    black = '#1F1F28',
    darkgray = '#2A2A37',
    gray = '#363646',
    lightgray = '#54546D',
    skyblue = '#7FB4CA',
    cyan = '#7AA89F',
    green = '#76946A',
    oceanblue = '#7E9CD8',
    magenta = '#938AA9',
    orange = '#FFA066',
    red = '#C34043',
    violet = '#957FB8',
    white = '#C8C093',
    yellow = '#DCA561',
    errors = '#E82424',
    warnings = '#FF9E3B',
    info = '#6A9589',
    hints = '#658594',
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

local icons = {
    os_linux = '',
    os_mac = '',
    os_windows = '',
    diagnostic_errors = ' ',
    diagnostic_warnings = '⚠ ',
    diagnostic_hints = ' ',
    diagnostic_info = ' ',
    git_branch = ' ', -- 
    git_added = '+', -- 
    git_changed = '~', -- 
    git_removed = '-', -- 
    lsp = '⎈ ',
}

local function space_sep(color)
    local sep = {
        str = ' ',
        hl = {
            bg = color,
        },
    }
    return sep
end

local function file_osinfo()
    local os = vim.bo.fileformat:upper()
    local icon
    if os == 'UNIX' then
        icon = icons.os_linux
    elseif os == 'MAC' then
        icon = icons.os_mac
    else
        icon = icons.os_windows
    end
    return icon
end

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
            hl = function()
                if vim.bo.modified then
                    return {
                        fg = 'warnings',
                        bg = 'black',
                    }
                else
                    return {
                        fg = 'fg',
                        bg = 'black',
                    }
                end
            end,
            left_sep = space_sep('black'),
            right_sep = space_sep('black'),
        },
        os = {
            provider = file_osinfo,
            hl = {
                bg = 'gray',
            },
            left_sep = space_sep('gray'),
        },
        encoding = {
            provider = 'file_encoding',
            hl = {
                bg = 'gray',
            },
            left_sep = space_sep('gray'),
            right_sep = space_sep('gray'),
        },
        type = {
            provider = 'file_type',
            hl = {
                bg = 'skyblue',
                fg = 'bg',
                style = 'bold',
            },
            left_sep = space_sep('skyblue'),
            right_sep = space_sep('skyblue'),
        },
    },
    git = {
        branch = {
            provider = 'git_branch',
            hl = {
                bg = 'black',
                style = 'bold',
            },
            left_sep = space_sep('black'),
            right_sep = space_sep('black'),
            icon = icons.git_branch,
        },
        diff_added = {
            provider = 'git_diff_added',
            hl = {
                fg = 'green',
                bg = 'black',
                style = 'bold',
            },
            icon = icons.git_added,
            right_sep = space_sep('black'),
        },
        diff_changed = {
            provider = 'git_diff_changed',
            hl = {
                fg = 'yellow',
                bg = 'black',
                style = 'bold',
            },
            icon = icons.git_changed,
            right_sep = space_sep('black'),
        },
        diff_removed = {
            provider = 'git_diff_removed',
            hl = {
                fg = 'red',
                bg = 'black',
                style = 'bold',
            },
            icon = icons.git_removed,
            right_sep = space_sep('black'),
        },
    },
    cursor = {
        line_percentage = {
            provider = 'line_percentage',
            hl = {
                bg = 'darkgray',
                style = 'bold',
            },
            left_sep = space_sep('darkgray'),
            right_sep = space_sep('darkgray'),
        },
        scroll_bar = {
            provider = 'scroll_bar',
            hl = function()
                return {
                    fg = require('feline.providers.vi_mode').get_mode_color(),
                    bg = 'darkgray',
                    style = 'bold',
                }
            end,
            right_sep = space_sep('darkgray'),
        },
        position = {
            provider = 'position',
        },
    },
    diagnostic = {
        errors = {
            provider = 'diagnostic_errors',
            hl = {
                bg = 'errors',
                fg = 'bg',
            },
            icon = icons.diagnostic_errors,
            left_sep = space_sep('errors'),
            right_sep = space_sep('errors'),
        },
        warnings = {
            provider = 'diagnostic_warnings',
            hl = {
                bg = 'warnings',
                fg = 'bg',
            },
            icon = icons.diagnostic_warnings,
            left_sep = space_sep('warnings'),
            right_sep = space_sep('warnings'),
        },
        hints = {
            provider = 'diagnostic_hints',
            hl = {
                bg = 'hints',
                fg = 'bg',
            },
            icon = icons.diagnostic_hints,
            left_sep = space_sep('hints'),
            right_sep = space_sep('hints'),
        },
        info = {
            provider = 'diagnostic_info',
            hl = {
                bg = 'info',
                fg = 'bg',
            },
            icon = icons.diagnostic_info,
            left_sep = space_sep('info'),
            right_sep = space_sep('info'),
        },
    },
    lsp = {
        names = {
            provider = 'lsp_client_names',
            hl = {
                bg = 'darkgray',
            },
            icon = icons.lsp,
            -- left_sep = ' ',
            -- right_sep = ' ',
            left_sep = space_sep('darkgray'),
            right_sep = space_sep('darkgray'),
        },
    },
    sep = {
        empty = {
            provider = '',
        },
    },
}

local statusline = {
    active = { {}, {} },
    -- inactive = {},
}

-- Left
table.insert(statusline.active[1], components.vi.mode)
table.insert(statusline.active[1], components.file.info)
table.insert(statusline.active[1], components.diagnostic.errors)
table.insert(statusline.active[1], components.diagnostic.warnings)
table.insert(statusline.active[1], components.diagnostic.hints)
table.insert(statusline.active[1], components.diagnostic.info)
table.insert(statusline.active[1], components.sep.empty)
-- Right
table.insert(statusline.active[2], components.git.branch)
table.insert(statusline.active[2], components.git.diff_added)
table.insert(statusline.active[2], components.git.diff_changed)
table.insert(statusline.active[2], components.git.diff_removed)
table.insert(statusline.active[2], components.lsp.names)
table.insert(statusline.active[2], components.file.os)
table.insert(statusline.active[2], components.file.encoding)
table.insert(statusline.active[2], components.file.type)
table.insert(statusline.active[2], components.cursor.line_percentage)
table.insert(statusline.active[2], components.cursor.scroll_bar)
table.insert(statusline.active[2], components.vi.right_indicator)

require('feline').setup({
    theme = colors,
    -- default_bg = bg,
    -- default_fg = fg,
    vi_mode_colors = vi_mode_colors,
    components = statusline,
})
