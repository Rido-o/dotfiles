local function lsp_name()
    local msg = 'No Active Lsp'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
        return msg
    end
    for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 and client.name ~= 'null-ls' then
            return client.name
        end
    end
    return msg
end

require('lualine').setup({
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { '|', '|' }, -- {'', ''},
        section_separators = { '', '' }, -- {'', ''},
        disabled_filetypes = {},
        always_divide_middle = true,
        globalstatus = true,
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = {
            'branch',
            'diff',
            {
                'diagnostics',
                symbols = { error = ' ', warn = '⚠ ', info = ' ', hint = ' '}, -- {} {❎⚠🌳}
            },
        },
        lualine_c = { 'filename' },
        lualine_x = {
            { lsp_name, icon = '⎈ LSP:', separator = '|' }, -- 
            'encoding',
            'fileformat',
            'filetype',
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    extensions = {
        'fugitive',
        'nvim-tree',
        --'quickfix',
        'toggleterm',
    },
})
