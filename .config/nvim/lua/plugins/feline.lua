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

local icons = {
    linux = '',
    mac = '',
    windows = '',
    diagnostic_errors = '  ',
    diagnostic_warnings = ' ⚠ ',
    diagnostic_hints = '  ',
    diagnostic_info = '  ',
    git_added = '  ',
    git_changed = '  ',
    git_removed = '  ',
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
        icon = icons.linux
    elseif os == 'MAC' then
        icon = icons.mac
    else
        icon = icons.windows
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
                        fg = 'orange',
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
            right_sep = {
                {
                    str = ' ',
                    hl = {
                        bg = 'black',
                    },
                },
                {
                    str = '',
                },
            },
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
        },
    },
    git = {
        branch = {
            provider = 'git_branch',
            hl = {
                bg = 'darkgray',
                style = 'bold',
            },
            left_sep = space_sep('darkgray'),
            right_sep = space_sep('darkgray'),
        },
        diff_added = {
            provider = 'git_diff_added',
            icon = icons.git_added,
        },
        diff_changed = {
            provider = 'git_diff_changed',
            icon = icons.git_changed,
        },
        diff_removed = {
            provider = 'git_diff_removed',
            icon = icons.git_removed,
        },
    },
    cursor = {
        line_percentage = {
            provider = 'line_percentage',
            hl = {
                bg = 'lightgray',
                style = 'bold',
            },
            left_sep = space_sep('lightgray'),
            right_sep = space_sep('lightgray'),
        },
        scroll_bar = {
            provider = 'scroll_bar',
            hl = function()
                return {
                    fg = require('feline.providers.vi_mode').get_mode_color(),
                    bg = 'lightgray',
                    style = 'bold',
                }
            end,
            right_sep = space_sep('lightgray'),
        },
        position = {
            provider = 'position',
        },
    },
    diagnostic = {
        errors = {
            provider = 'diagnostic_errors',
            icon = icons.diagnostic_errors,
        },
        warnings = {
            provider = 'diagnostic_warnings',
            icon = icons.diagnostic_warnings,
        },
        hints = {
            provider = 'diagnostic_hints',
            icon = icons.diagnostic_hints,
        },
        info = {
            provider = 'diagnostic_info',
            icon = icons.diagnostic_info,
        },
    },
    lsp = {
        names = {
            provider = 'lsp_client_names',
            icon = icons.lsp,
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
-- Right
table.insert(statusline.active[2], components.git.branch)
table.insert(statusline.active[2], components.git.diff_added)
table.insert(statusline.active[2], components.git.diff_changed)
table.insert(statusline.active[2], components.git.diff_removed)
table.insert(statusline.active[2], components.lsp.names)
table.insert(statusline.active[2], components.file.os)
table.insert(statusline.active[2], components.file.encoding)
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
