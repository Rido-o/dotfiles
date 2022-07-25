----------------
-- Options
----------------
require('toggleterm').setup({
    -- size can be a number or function which is passed the current terminal
    size = 15,
    --size = function(term)
    --if term.direction == "horizontal" then
    --return 15
    --elseif term.direction == "vertical" then
    --return vim.o.columns * 0.4
    --end
    --end,
    open_mapping = [[<c-\>]],
    hide_numbers = true, -- hide the number column in toggleterm buffers
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = '1', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
    start_in_insert = false,
    insert_mappings = true, -- whether or not the open mapping applies in insert mode
    persist_size = true,
    direction = 'horizontal', -- 'vertical' | 'horizontal' | 'window' | 'float',
    close_on_exit = false, -- close the terminal window when the process exits
    shell = vim.o.shell, -- change the default shell
    -- This field is only relevant if direction is set to 'float'
    float_opts = {
        -- The border key is *almost* the same as 'nvim_win_open'
        -- see :h nvim_win_open for details on borders however
        -- the 'curved' border is a custom border type
        -- not natively supported but implemented in this plugin.
        border = 'single', -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
        width = '30',
        height = '30',
        winblend = 3,
        highlights = {
            border = 'Normal',
            background = 'Normal',
        },
    },
})

-- Terminal Mappings
function _G.set_terminal_keymaps()
    local map = vim.keymap.set
    local opts = { noremap = true, buffer = 0 }
    map('t', '<esc>', [[<C-\><C-n>]], opts)
end

-- Make mappings only apply to toggleterm
vim.api.nvim_create_autocmd(
    { 'TermOpen' },
    { pattern = 'term://*toggleterm#*', command = 'lua set_terminal_keymaps()' }
)
